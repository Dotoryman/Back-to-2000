import { desc } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import {
  brands,
  contentItems,
  contentMedia,
  contentRevisions,
  contentSources,
  contentTags,
  contentYears,
  tags,
} from "@/db/schema";
import { listPublishedCatalog } from "@/domain/catalog/repository";
import { adminError, getAdminAccess } from "@/infrastructure/auth/admin";

const contentKind = z.enum(["website", "phone", "product", "service", "event", "game", "program"]);
const input = z.object({
  type: contentKind,
  name: z.string().trim().min(1).max(100),
  slug: z.string().trim().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/),
  brand: z.string().trim().min(1).max(100),
  eyebrow: z.string().trim().max(100).default(""),
  summary: z.string().trim().min(20).max(300),
  body: z.string().trim().min(40),
  startYear: z.number().int().min(1980).max(2030),
  endYear: z.number().int().min(1980).max(2030).optional(),
  activeYears: z.array(z.number().int().min(1980).max(2030)).default([]),
  tags: z.array(z.string().trim().min(1).max(40)).max(20).default([]),
  highlights: z.array(z.string().trim().min(1).max(120)).max(10).default([]),
  specs: z.record(z.string(), z.string()).default({}),
  sourceLabel: z.string().trim().min(1).max(100),
  sourceUrl: z.url(),
  sourceType: z.enum(["official", "archive", "reference", "community"]).default("reference"),
  accent: z.string().regex(/^#[0-9a-fA-F]{6}$/).default("#9bcbe2"),
  status: z.enum(["draft", "review", "published", "archived"]).default("draft"),
  mediaId: z.string().uuid().optional(),
});

export async function GET(request: Request) {
  try {
    const access = getAdminAccess(request.headers);
    if (!access.allowed) return Response.json({ items: await listPublishedCatalog() });
    const items = await getDb().select().from(contentItems).orderBy(desc(contentItems.updatedAt)).limit(500);
    const quality = {
      total: items.length,
      published: items.filter((item) => item.status === "published").length,
      verified: items.filter((item) => item.qualityStatus === "verified").length,
      needsReview: items.filter((item) => item.qualityStatus !== "verified").length,
    };
    return Response.json({ items, quality });
  } catch (error) {
    return databaseError(error);
  }
}

export async function POST(request: Request) {
  const access = getAdminAccess(request.headers);
  if (!access.allowed) return adminError(access);
  const parsed = input.safeParse(await request.json());
  if (!parsed.success) return Response.json({ error: "invalid content", issues: parsed.error.flatten() }, { status: 400 });

  try {
    const db = getDb();
    const now = new Date();
    const values = parsed.data;
    const id = crypto.randomUUID();
    const brandSlug = slugify(values.brand);
    const brandId = `brand-${brandSlug}`;
    const qualityStatus = values.status === "published" && values.mediaId ? "needs_review" : "incomplete";

    await db.insert(brands).values({
      id: brandId,
      slug: brandSlug,
      name: values.brand,
      status: values.status === "published" ? "published" : "draft",
      createdAt: now,
      updatedAt: now,
    }).onConflictDoNothing();

    const [item] = await db.insert(contentItems).values({
      id,
      type: values.type,
      slug: values.slug,
      name: values.name,
      brandId,
      categoryId: `category-${values.type}`,
      eyebrow: values.eyebrow,
      summary: values.summary,
      body: values.body,
      startYear: values.startYear,
      endYear: values.endYear,
      accent: values.accent,
      status: values.status,
      qualityStatus,
      metadata: { highlights: values.highlights, specs: values.specs },
      publishedAt: values.status === "published" ? now : null,
      createdAt: now,
      updatedAt: now,
    }).returning();

    const activeYears = values.activeYears.length ? values.activeYears : [values.startYear];
    await db.insert(contentYears).values(activeYears.map((year, sortOrder) => ({ contentId: id, year, sortOrder }))).onConflictDoNothing();

    for (const tagName of [...new Set(values.tags)]) {
      const tagSlug = slugify(tagName);
      const tagId = `tag-${tagSlug}`;
      await db.insert(tags).values({ id: tagId, slug: tagSlug, name: tagName, createdAt: now, updatedAt: now }).onConflictDoNothing();
      await db.insert(contentTags).values({ contentId: id, tagId }).onConflictDoNothing();
    }

    await db.insert(contentSources).values({
      id: crypto.randomUUID(),
      contentId: id,
      label: values.sourceLabel,
      url: values.sourceUrl,
      sourceType: values.sourceType,
      isPrimary: true,
      checkedAt: now,
      createdAt: now,
      updatedAt: now,
    });

    if (values.mediaId) {
      await db.insert(contentMedia).values({ contentId: id, mediaId: values.mediaId, role: "hero" }).onConflictDoNothing();
    }

    await db.insert(contentRevisions).values({
      id: crypto.randomUUID(),
      contentId: id,
      version: 1,
      snapshot: { ...values, mediaId: values.mediaId ?? null },
      note: "Initial content creation",
      createdAt: now,
    });

    return Response.json({ item }, { status: 201 });
  } catch (error) {
    return databaseError(error);
  }
}

function slugify(value: string) {
  const ascii = value.toLocaleLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");
  return ascii || `brand-${simpleHash(value)}`;
}

function simpleHash(value: string) {
  let hash = 0;
  for (const character of value) hash = (hash * 31 + character.charCodeAt(0)) >>> 0;
  return hash.toString(36);
}

function databaseError(error: unknown) {
  return Response.json({ error: error instanceof Error ? error.message : "database unavailable" }, { status: 503 });
}
