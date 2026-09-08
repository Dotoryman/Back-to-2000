import { and, asc, eq, inArray, sql, type SQL } from "drizzle-orm";
import { cache } from "react";
import { getDb } from "@/db";
import { brands, categories, contentItems, contentMedia, contentSources, contentTags, contentYears, eras, media, publishedCatalogItems, tags } from "@/db/schema";
import type { CatalogItem, ContentKind, Era } from "./types";

type CatalogOptions = { kind?: ContentKind | ContentKind[]; year?: number; featured?: boolean };

/** Public reads use one denormalised row per item instead of eight source tables. */
export async function listPublishedCatalog(options: CatalogOptions = {}): Promise<CatalogItem[]> {
  const predicates: SQL[] = [];
  if (options.kind) predicates.push(Array.isArray(options.kind) ? inArray(publishedCatalogItems.type, options.kind) : eq(publishedCatalogItems.type, options.kind));
  if (options.featured !== undefined) predicates.push(eq(publishedCatalogItems.featured, options.featured));
  if (options.year !== undefined) predicates.push(inArray(publishedCatalogItems.contentId,
    getDb().select({ id: contentYears.contentId }).from(contentYears).where(eq(contentYears.year, options.year))));
  return selectProjection(predicates.length ? and(...predicates) : undefined);
}

async function selectProjection(predicate?: SQL, limit?: number): Promise<CatalogItem[]> {
  const query = getDb().select().from(publishedCatalogItems).where(predicate)
    .orderBy(asc(publishedCatalogItems.startYear), asc(publishedCatalogItems.name));
  const rows = await (limit === undefined ? query : query.limit(limit));
  return rows.map(projectionToCatalogItem);
}

function projectionToCatalogItem(row: typeof publishedCatalogItems.$inferSelect): CatalogItem {
  const hasImage = Boolean(row.imagePublicUrl || row.imageObjectKey);
  return {
    id: row.contentId, kind: row.type, slug: row.slug, name: row.name, brand: row.brand,
    year: row.startYear, endYear: row.endYear ?? undefined, activeYears: row.activeYears,
    eyebrow: row.eyebrow, summary: row.summary, description: row.description, tags: row.tags,
    accent: row.accent, featured: row.featured, specs: row.specs ?? undefined,
    highlights: row.highlights, story: row.story ?? undefined,
    source: row.sourceLabel && row.sourceUrl ? { label: row.sourceLabel, url: row.sourceUrl } : undefined,
    image: hasImage ? {
      src: row.imagePublicUrl ?? `/api/media?key=${encodeURIComponent(row.imageObjectKey ?? "")}`,
      alt: row.imageAlt ?? "", credit: row.imageCredit ?? "", sourceUrl: row.imageSourceUrl ?? "",
      license: row.imageLicense ?? undefined,
    } : undefined,
  };
}

export const getPublishedCatalogItem = cache(async (id: string) => {
  const [item] = await selectProjection(eq(publishedCatalogItems.contentId, id), 1);
  return item;
});

export async function getPublishedCatalogItemBySlug(kind: "website" | "phone", slug: string) {
  const [item] = await selectProjection(and(eq(publishedCatalogItems.type, kind), eq(publishedCatalogItems.slug, slug)), 1);
  return item;
}

export async function searchPublishedCatalog(query: string) {
  const normalized = query.trim().toLocaleLowerCase("ko");
  if (!normalized) return listPublishedCatalog();
  const needle = Array.from(normalized, (char) => char.toUpperCase() !== char.toLowerCase() && char.charCodeAt(0) > 127
    ? " " : char).join("").split(/\s+/).sort((a, b) => b.length - a.length)[0];
  const items = await selectProjection(needle ? sql`instr(lower(${publishedCatalogItems.searchText}), ${needle}) > 0` : undefined);
  return items.filter((item) => [item.name, item.brand, item.summary, item.description, ...item.tags]
    .join(" ").toLocaleLowerCase("ko").includes(normalized));
}

/** Refresh the projection after an editorial write; unpublished rows disappear. */
export async function refreshPublishedCatalogProjection(contentId: string) {
  const db = getDb();
  const [source] = await selectSourceCatalog(and(eq(contentItems.status, "published"), eq(contentItems.id, contentId)), 1);
  if (!source) {
    await db.delete(publishedCatalogItems).where(eq(publishedCatalogItems.contentId, contentId));
    return;
  }
  const values = catalogItemToProjection(source, new Date());
  const { contentId: _contentId, ...updates } = values;
  void _contentId;
  await db.insert(publishedCatalogItems).values(values).onConflictDoUpdate({ target: publishedCatalogItems.contentId, set: updates });
}

function catalogItemToProjection(item: CatalogItem, updatedAt: Date): typeof publishedCatalogItems.$inferInsert {
  const r2Prefix = "/api/media?key=";
  return {
    contentId: item.id, type: item.kind, slug: item.slug, name: item.name, brand: item.brand,
    startYear: item.year, endYear: item.endYear, activeYears: item.activeYears?.length ? item.activeYears : [item.year],
    eyebrow: item.eyebrow, summary: item.summary, description: item.description, tags: item.tags,
    accent: item.accent, featured: item.featured ?? false, specs: item.specs, highlights: item.highlights, story: item.story,
    sourceLabel: item.source?.label, sourceUrl: item.source?.url,
    imagePublicUrl: item.image?.src.startsWith(r2Prefix) ? undefined : item.image?.src,
    imageObjectKey: item.image?.src.startsWith(r2Prefix) ? decodeURIComponent(item.image.src.slice(r2Prefix.length)) : undefined,
    imageAlt: item.image?.alt, imageCredit: item.image?.credit, imageSourceUrl: item.image?.sourceUrl,
    imageLicense: item.image?.license,
    searchText: [item.name, item.brand, item.summary, item.description, ...item.tags].join(" "), updatedAt,
  };
}

async function selectSourceCatalog(predicate: SQL | undefined, limit?: number): Promise<CatalogItem[]> {
  const query = getDb().select().from(contentItems).where(predicate).orderBy(asc(contentItems.startYear), asc(contentItems.name));
  const rows = await (limit === undefined ? query : query.limit(limit));
  const result: CatalogItem[] = [];
  for (let offset = 0; offset < rows.length; offset += 90) result.push(...await hydrateSourceItems(rows.slice(offset, offset + 90)));
  return result;
}

async function hydrateSourceItems(itemRows: (typeof contentItems.$inferSelect)[]): Promise<CatalogItem[]> {
  if (!itemRows.length) return [];
  const db = getDb();
  const ids = itemRows.map((row) => row.id);
  const brandIds = [...new Set(itemRows.flatMap((row) => row.brandId ? [row.brandId] : []))];
  const [brandRows, yearRows, tagRows, heroRows, sourceRows] = await Promise.all([
    brandIds.length ? db.select({ id: brands.id, name: brands.name }).from(brands).where(inArray(brands.id, brandIds)) : [],
    db.select().from(contentYears).where(inArray(contentYears.contentId, ids)).orderBy(asc(contentYears.year), asc(contentYears.sortOrder)),
    db.select({ contentId: contentTags.contentId, name: tags.name }).from(contentTags).innerJoin(tags, eq(tags.id, contentTags.tagId))
      .where(inArray(contentTags.contentId, ids)).orderBy(sql`${contentTags}.rowid`),
    db.select({ contentId: contentMedia.contentId, image: media }).from(contentMedia).leftJoin(media, eq(media.id, contentMedia.mediaId))
      .where(and(inArray(contentMedia.contentId, ids), eq(contentMedia.role, "hero"))).orderBy(asc(contentMedia.sortOrder), sql`${contentMedia}.rowid`),
    db.select().from(contentSources).where(inArray(contentSources.contentId, ids)).orderBy(asc(contentSources.isPrimary), sql`${contentSources}.rowid`),
  ]);
  const brandById = new Map(brandRows.map((row) => [row.id, row.name]));
  return itemRows.map((row) => {
    const hero = heroRows.find((candidate) => candidate.contentId === row.id)?.image;
    const source = sourceRows.find((candidate) => candidate.contentId === row.id && candidate.isPrimary) ?? sourceRows.find((candidate) => candidate.contentId === row.id);
    const metadata = row.metadata ?? {};
    const itemYears = yearRows.filter((candidate) => candidate.contentId === row.id).map((candidate) => candidate.year);
    return {
      id: row.id, kind: row.type, slug: row.slug, name: row.name,
      brand: row.brandId ? brandById.get(row.brandId) ?? "Unknown" : "Unknown",
      year: row.startYear, endYear: row.endYear ?? undefined, activeYears: itemYears.length ? itemYears : [row.startYear],
      eyebrow: row.eyebrow, summary: row.summary, description: row.body,
      tags: tagRows.filter((candidate) => candidate.contentId === row.id).map((candidate) => candidate.name),
      accent: row.accent, featured: row.featured,
      specs: isStringRecord(metadata.specs) ? metadata.specs : undefined,
      highlights: Array.isArray(metadata.highlights) ? metadata.highlights.filter((value): value is string => typeof value === "string") : [],
      story: isStory(metadata.story) ? metadata.story : undefined,
      source: source ? { label: source.label, url: source.url } : undefined,
      image: hero ? { src: hero.publicUrl ?? `/api/media?key=${encodeURIComponent(hero.objectKey)}`, alt: hero.altText, credit: hero.credit ?? "", sourceUrl: hero.sourceUrl ?? "", license: hero.license ?? undefined } : undefined,
    } satisfies CatalogItem;
  });
}

export async function listEvolutionCatalog(item: CatalogItem): Promise<CatalogItem[]> {
  const family = await selectProjection(and(eq(publishedCatalogItems.type, item.kind), eq(publishedCatalogItems.brand, item.brand)));
  const position = family.findIndex((row) => row.id === item.id);
  const neighbours = family.filter((_, index) => Math.abs(index - position) <= 2);
  const next = family.find((row) => row.year > item.year);
  const ids = new Set([...neighbours.map((row) => row.id), ...(next ? [next.id] : [])]);
  return family.filter((row) => ids.has(row.id));
}

export async function listPublishedCatalogIds() {
  return getDb().select({ id: publishedCatalogItems.contentId }).from(publishedCatalogItems)
    .orderBy(asc(publishedCatalogItems.startYear), asc(publishedCatalogItems.name));
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
