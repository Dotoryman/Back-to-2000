import { and, asc, eq, inArray, sql, type SQL } from "drizzle-orm";
import { cache } from "react";
import { getDb } from "@/db";
import {
  brands,
  categories,
  contentItems,
  contentMedia,
  contentSources,
  contentTags,
  contentYears,
  eras,
  media,
  tags,
} from "@/db/schema";
import type { CatalogItem, ContentKind, Era } from "./types";

type CatalogOptions = {
  kind?: ContentKind | ContentKind[];
  year?: number;
  featured?: boolean;
};

export async function listPublishedCatalog(options: CatalogOptions = {}): Promise<CatalogItem[]> {
  const predicates = [eq(contentItems.status, "published")];
  if (options.kind) predicates.push(Array.isArray(options.kind) ? inArray(contentItems.type, options.kind) : eq(contentItems.type, options.kind));
  if (options.featured !== undefined) predicates.push(eq(contentItems.featured, options.featured));
  if (options.year !== undefined) predicates.push(inArray(contentItems.id,
    getDb().select({ id: contentYears.contentId }).from(contentYears).where(eq(contentYears.year, options.year))));
  return selectCatalog(and(...predicates), undefined, Object.keys(options).length === 0);
}

async function selectCatalog(predicate: SQL | undefined, limit?: number, fullPublicCatalog = false): Promise<CatalogItem[]> {
  const query = getDb().select().from(contentItems).where(predicate)
    .orderBy(asc(contentItems.startYear), asc(contentItems.name));
  const rows = await (limit === undefined ? query : query.limit(limit));
  if (fullPublicCatalog) return hydrateCatalogItems(rows, true);
  const result: CatalogItem[] = [];
  // D1 accepts at most 100 bound parameters. Relation reads stay indexed by
  // content_id and are issued in bounded batches rather than scanning JSON rows.
  for (let offset = 0; offset < rows.length; offset += 90) {
    result.push(...await hydrateCatalogItems(rows.slice(offset, offset + 90)));
  }
  return result;
}

async function hydrateCatalogItems(itemRows: (typeof contentItems.$inferSelect)[], fullPublicCatalog = false): Promise<CatalogItem[]> {
  if (!itemRows.length) return [];
  const ids = itemRows.map((row) => row.id);
  const brandIds = [...new Set(itemRows.flatMap((row) => row.brandId ? [row.brandId] : []))];
  const relations = fullPublicCatalog
    ? await loadFullPublicRelations()
    : await loadTargetedRelations(ids, brandIds);
  const { brandRows, yearRows, tagRows, heroRows, sourceRows } = relations;
  const brandById = new Map(brandRows.map((row) => [row.id, row]));

  return itemRows
    .map((row) => {
      const itemYears = yearRows.filter((candidate) => candidate.contentId === row.id).map((candidate) => candidate.year);
      const itemTags = tagRows
        .filter((candidate) => candidate.contentId === row.id)
        .map((candidate) => candidate.name)
        .filter((value): value is string => Boolean(value));
      const hero = heroRows.find((candidate) => candidate.contentId === row.id)?.image;
      const source = sourceRows.find((candidate) => candidate.contentId === row.id && candidate.isPrimary)
        ?? sourceRows.find((candidate) => candidate.contentId === row.id);
      const metadata = row.metadata ?? {};

      return {
        id: row.id,
        kind: row.type,
        slug: row.slug,
        name: row.name,
        brand: row.brandId ? brandById.get(row.brandId)?.name ?? "Unknown" : "Unknown",
        year: row.startYear,
        endYear: row.endYear ?? undefined,
        activeYears: itemYears.length ? itemYears : [row.startYear],
        eyebrow: row.eyebrow,
        summary: row.summary,
        description: row.body,
        tags: itemTags,
        accent: row.accent,
        featured: row.featured,
        specs: isStringRecord(metadata.specs) ? metadata.specs : undefined,
        highlights: Array.isArray(metadata.highlights)
          ? metadata.highlights.filter((value): value is string => typeof value === "string")
          : [],
        story: isStory(metadata.story) ? metadata.story : undefined,
        source: source ? { label: source.label, url: source.url } : undefined,
        image: hero ? {
          src: hero.publicUrl ?? `/api/media?key=${encodeURIComponent(hero.objectKey)}`,
          alt: hero.altText,
          credit: hero.credit ?? "",
          sourceUrl: hero.sourceUrl ?? "",
          license: hero.license ?? undefined,
        } : undefined,
      } satisfies CatalogItem;
    });
}

export const getPublishedCatalogItem = cache(async (id: string) => {
  const [item] = await selectCatalog(and(eq(contentItems.status, "published"), eq(contentItems.id, id)), 1);
  return item;
});

export async function getPublishedCatalogItemBySlug(kind: "website" | "phone", slug: string) {
  const [item] = await selectCatalog(and(eq(contentItems.status, "published"), eq(contentItems.type, kind), eq(contentItems.slug, slug)), 1);
  return item;
}

export async function searchPublishedCatalog(query: string) {
  const normalized = query.trim().toLocaleLowerCase("ko");
  if (!normalized) return listPublishedCatalog();
  const db = getDb();
  // Match the same concatenated fields and tag insertion order as the existing search.
  // SQLite lower() is ASCII-only: broaden non-ASCII cased characters to a single
  // separator, then apply the original Unicode comparison to the candidate results.
  // instr() also avoids LIKE's pattern-length limit and treats %/_ literally.
  const needle = Array.from(normalized, (char) => char.toUpperCase() !== char.toLowerCase() && char.charCodeAt(0) > 127
    ? " " : char).join("").split(/\s+/).sort((a, b) => b.length - a.length)[0];
  const itemText = sql`lower(${contentItems.name} || ' ' || ${contentItems.summary} || ' ' || ${contentItems.body})`;
  const brandMatches = db.select({ id: brands.id }).from(brands).where(sql`instr(lower(${brands.name}), ${needle}) > 0`);
  const tagMatches = db.select({ id: contentTags.contentId }).from(contentTags)
    .innerJoin(tags, eq(tags.id, contentTags.tagId)).where(sql`instr(lower(${tags.name}), ${needle}) > 0`);
  const items = await selectCatalog(and(eq(contentItems.status, "published"), sql`(
    instr(${itemText}, ${needle}) > 0 or ${contentItems.brandId} in ${brandMatches} or ${contentItems.id} in ${tagMatches}
  )`));
  return items.filter((item) =>
    [item.name, item.brand, item.summary, item.description, ...item.tags]
      .join(" ")
      .toLocaleLowerCase("ko")
      .includes(normalized),
  );
}

async function loadTargetedRelations(ids: string[], brandIds: string[]) {
  const db = getDb();
  const [brandRows, yearRows, tagRows, heroRows, sourceRows] = await Promise.all([
    brandIds.length ? db.select({ id: brands.id, name: brands.name }).from(brands).where(inArray(brands.id, brandIds)) : [],
    db.select().from(contentYears).where(inArray(contentYears.contentId, ids)).orderBy(asc(contentYears.year), asc(contentYears.sortOrder)),
    db.select({ contentId: contentTags.contentId, name: tags.name }).from(contentTags)
      .innerJoin(tags, eq(tags.id, contentTags.tagId)).where(inArray(contentTags.contentId, ids)).orderBy(sql`${contentTags}.rowid`),
    db.select({ contentId: contentMedia.contentId, image: media }).from(contentMedia)
      .leftJoin(media, eq(media.id, contentMedia.mediaId))
      .where(and(inArray(contentMedia.contentId, ids), eq(contentMedia.role, "hero")))
      .orderBy(asc(contentMedia.sortOrder), sql`${contentMedia}.rowid`),
    db.select().from(contentSources).where(inArray(contentSources.contentId, ids))
      .orderBy(asc(contentSources.isPrimary), sql`${contentSources}.rowid`),
  ]);
  return { brandRows, yearRows, tagRows, heroRows, sourceRows };
}

async function loadFullPublicRelations() {
  const db = getDb();
  // Every one of these rows participates in the full public archive. Separate
  // table reads are cheaper in D1 than repeating tag/media rows through joins.
  const [brandRows, yearRows, allTags, tagLinks, allMedia, mediaLinks, sourceRows] = await Promise.all([
    db.select({ id: brands.id, name: brands.name }).from(brands),
    db.select().from(contentYears).orderBy(asc(contentYears.year), asc(contentYears.sortOrder)),
    db.select({ id: tags.id, name: tags.name }).from(tags),
    db.select().from(contentTags),
    db.select().from(media),
    db.select().from(contentMedia).orderBy(asc(contentMedia.sortOrder)),
    db.select().from(contentSources).orderBy(asc(contentSources.isPrimary)),
  ]);
  const tagById = new Map(allTags.map((row) => [row.id, row.name]));
  const mediaById = new Map(allMedia.map((row) => [row.id, row]));
  const tagRows = tagLinks.flatMap((row) => {
    const name = tagById.get(row.tagId);
    return name ? [{ contentId: row.contentId, name }] : [];
  });
  const heroRows = mediaLinks.flatMap((row) => {
    const image = row.role === "hero" ? mediaById.get(row.mediaId) : undefined;
    return image ? [{ contentId: row.contentId, image }] : [];
  });
  return { brandRows, yearRows, tagRows, heroRows, sourceRows };
}

/** Only hydrate the neighbours used by the existing detail view, not the entire archive. */
export async function listEvolutionCatalog(item: CatalogItem): Promise<CatalogItem[]> {
  const family = await getDb().select({ id: contentItems.id, year: contentItems.startYear }).from(contentItems)
    .leftJoin(brands, eq(brands.id, contentItems.brandId))
    .where(and(eq(contentItems.status, "published"), eq(contentItems.type, item.kind), sql`coalesce(${brands.name}, 'Unknown') = ${item.brand}`))
    .orderBy(asc(contentItems.startYear), asc(contentItems.name));
  const position = family.findIndex((row) => row.id === item.id);
  const neighbours = family.filter((_, index) => Math.abs(index - position) <= 2);
  const next = family.find((row) => row.year > item.year);
  const ids = [...new Set([...neighbours.map((row) => row.id), ...(next ? [next.id] : [])])];
  return ids.length ? selectCatalog(and(eq(contentItems.status, "published"), inArray(contentItems.id, ids))) : [];
}

export async function listPublishedCatalogIds() {
  return getDb().select({ id: contentItems.id }).from(contentItems).where(eq(contentItems.status, "published"))
    .orderBy(asc(contentItems.startYear), asc(contentItems.name));
}

export async function listPublishedEras(): Promise<Era[]> {
  const rows = await getDb().select().from(eras).where(eq(eras.status, "published")).orderBy(asc(eras.year));
  return rows.map((row) => ({ year: row.year, label: row.title, summary: row.summary, accent: row.accent }));
}

export async function getPublishedEra(year: number) {
  const [era] = await getDb().select().from(eras).where(and(eq(eras.status, "published"), eq(eras.year, year))).limit(1);
  return era ? { year: era.year, label: era.title, summary: era.summary, accent: era.accent } satisfies Era : undefined;
}

export async function listCatalogCategories() {
  return getDb().select().from(categories).orderBy(asc(categories.sortOrder), asc(categories.name));
}

function isStringRecord(value: unknown): value is Record<string, string> {
  return Boolean(value) && typeof value === "object" && !Array.isArray(value)
    && Object.values(value as Record<string, unknown>).every((entry) => typeof entry === "string");
}

function isStory(value: unknown): value is NonNullable<CatalogItem["story"]> {
  if (!value || typeof value !== "object" || Array.isArray(value)) return false;
  const story = value as Record<string, unknown>;
  return typeof story.significance === "string" && typeof story.legacy === "string";
}
