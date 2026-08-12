import { and, asc, eq } from "drizzle-orm";
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
  kind?: ContentKind;
  year?: number;
  featured?: boolean;
};

export async function listPublishedCatalog(options: CatalogOptions = {}): Promise<CatalogItem[]> {
  const db = getDb();
  const predicates = [eq(contentItems.status, "published")];
  if (options.kind) predicates.push(eq(contentItems.type, options.kind));
  if (options.featured !== undefined) predicates.push(eq(contentItems.featured, options.featured));

  const [itemRows, brandRows, yearRows, tagRows, contentTagRows, mediaRows, contentMediaRows, sourceRows] = await Promise.all([
    db.select().from(contentItems).where(and(...predicates)).orderBy(asc(contentItems.startYear), asc(contentItems.name)),
    db.select().from(brands),
    db.select().from(contentYears).orderBy(asc(contentYears.year), asc(contentYears.sortOrder)),
    db.select().from(tags),
    db.select().from(contentTags),
    db.select().from(media),
    db.select().from(contentMedia).orderBy(asc(contentMedia.sortOrder)),
    db.select().from(contentSources).orderBy(asc(contentSources.isPrimary)),
  ]);

  const visibleIds = options.year
    ? new Set(yearRows.filter((row) => row.year === options.year).map((row) => row.contentId))
    : null;
  const brandById = new Map(brandRows.map((row) => [row.id, row]));
  const tagById = new Map(tagRows.map((row) => [row.id, row.name]));
  const mediaById = new Map(mediaRows.map((row) => [row.id, row]));

  return itemRows
    .filter((row) => !visibleIds || visibleIds.has(row.id))
    .map((row) => {
      const itemYears = yearRows.filter((candidate) => candidate.contentId === row.id).map((candidate) => candidate.year);
      const itemTags = contentTagRows
        .filter((candidate) => candidate.contentId === row.id)
        .map((candidate) => tagById.get(candidate.tagId))
        .filter((value): value is string => Boolean(value));
      const heroLink = contentMediaRows.find((candidate) => candidate.contentId === row.id && candidate.role === "hero");
      const hero = heroLink ? mediaById.get(heroLink.mediaId) : undefined;
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

export async function getPublishedCatalogItem(id: string) {
  const items = await listPublishedCatalog();
  return items.find((item) => item.id === id);
}

export async function getPublishedCatalogItemBySlug(kind: "website" | "phone", slug: string) {
  const items = await listPublishedCatalog({ kind });
  return items.find((item) => item.slug === slug);
}

export async function searchPublishedCatalog(query: string) {
  const normalized = query.trim().toLocaleLowerCase("ko");
  const items = await listPublishedCatalog();
  if (!normalized) return items;
  return items.filter((item) =>
    [item.name, item.brand, item.summary, item.description, ...item.tags]
      .join(" ")
      .toLocaleLowerCase("ko")
      .includes(normalized),
  );
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
