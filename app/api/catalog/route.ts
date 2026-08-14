import { and, desc, eq, sql } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import {
  brands,
  contentItems,
  contentMedia,
  contentReviewEvents,
  contentRevisions,
  contentSources,
  contentTags,
  contentYears,
  media,
  tags,
} from "@/db/schema";
import { isSameOriginMutation } from "@/domain/auth/session";
import { listPublishedCatalog } from "@/domain/catalog/repository";
import { adminError, getAdminAccess, type AdminAccess } from "@/infrastructure/auth/admin";

const contentKind = z.enum(["website", "phone", "product", "service", "event", "game", "program"]);
const contentStatus = z.enum(["draft", "review", "published", "archived"]);
const qualityStatus = z.enum(["incomplete", "needs_review", "verified"]);
const sourceType = z.enum(["official", "archive", "reference", "community"]);

const createInput = z.object({
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
  sourceType: sourceType.default("reference"),
  accent: z.string().regex(/^#[0-9a-fA-F]{6}$/).default("#9bcbe2"),
  status: contentStatus.default("draft"),
  mediaId: z.string().uuid().optional(),
});

const updateInput = z.object({
  id: z.string().min(1),
  name: z.string().trim().min(1).max(100).optional(),
  eyebrow: z.string().trim().max(100).optional(),
  summary: z.string().trim().min(20).max(300).optional(),
  body: z.string().trim().min(40).optional(),
  status: contentStatus.optional(),
  qualityStatus: qualityStatus.optional(),
  sourceLabel: z.string().trim().min(1).max(100).optional(),
  sourceUrl: z.url().optional(),
  sourceType: sourceType.optional(),
  mediaId: z.string().uuid().optional(),
  note: z.string().trim().max(300).optional(),
});

export async function GET(request: Request) {
  try {
    const access = await getAdminAccess(request.headers);
    if (!access.allowed) return Response.json({ items: await listPublishedCatalog() });
    const db = getDb();
    const contentId = new URL(request.url).searchParams.get("contentId");
    if (contentId) {
      const [revisions, events] = await Promise.all([
        db.select().from(contentRevisions).where(eq(contentRevisions.contentId, contentId)).orderBy(desc(contentRevisions.createdAt)).limit(30),
        db.select().from(contentReviewEvents).where(eq(contentReviewEvents.contentId, contentId)).orderBy(desc(contentReviewEvents.createdAt)).limit(50),
      ]);
      return Response.json({ revisions, events });
    }

    const [items, sourceRows, mediaLinks, mediaRows] = await Promise.all([
      db.select().from(contentItems).orderBy(desc(contentItems.updatedAt)).limit(500),
      db.select().from(contentSources),
      db.select().from(contentMedia).where(eq(contentMedia.role, "hero")),
      db.select().from(media),
    ]);
    const sourceByContent = new Map(sourceRows.filter((row) => row.isPrimary).map((row) => [row.contentId, row]));
    const mediaById = new Map(mediaRows.map((row) => [row.id, row]));
    const heroByContent = new Map(mediaLinks.map((row) => [row.contentId, mediaById.get(row.mediaId)]));
    const enriched = items.map((item) => {
      const source = sourceByContent.get(item.id);
      const hero = heroByContent.get(item.id);
      const issues = qualityIssues(item, source, hero);
      return { ...item, source, hero, issues, qualityScore: Math.max(0, 100 - issues.length * 20) };
    });
    return Response.json({
      items: enriched,
      quality: {
        total: items.length,
        published: items.filter((item) => item.status === "published").length,
        verified: enriched.filter((item) => item.qualityStatus === "verified" && item.issues.length === 0).length,
        needsReview: enriched.filter((item) => item.qualityStatus !== "verified" || item.issues.length > 0).length,
        missingHero: enriched.filter((item) => !item.hero).length,
        missingSource: enriched.filter((item) => !item.source).length,
      },
      access: { role: access.actor?.role ?? "admin", canPublish: access.canPublish },
    });
  } catch (error) {
    return databaseError(error);
  }
}

export async function POST(request: Request) {
  const access = await getAdminAccess(request.headers);
  if (!access.allowed) return adminError(access);
  if (!isSameOriginMutation(request)) return Response.json({ error: "invalid origin" }, { status: 403 });
  const parsed = createInput.safeParse(await request.json());
  if (!parsed.success) return Response.json({ error: "invalid content", issues: parsed.error.flatten() }, { status: 400 });
  if (parsed.data.status === "published" && !access.canPublish) return Response.json({ error: "publisher role required" }, { status: 403 });

  try {
    const db = getDb();
    const now = new Date();
    const values = parsed.data;
    const id = crypto.randomUUID();
    const brandSlug = slugify(values.brand);
    const brandId = `brand-${brandSlug}`;
    const initialQuality = values.mediaId ? "needs_review" : "incomplete";
    await db.insert(brands).values({ id: brandId, slug: brandSlug, name: values.brand, status: values.status === "published" ? "published" : "draft", createdAt: now, updatedAt: now }).onConflictDoNothing();
    const [item] = await db.insert(contentItems).values({
      id, type: values.type, slug: values.slug, name: values.name, brandId, categoryId: `category-${values.type}`,
      eyebrow: values.eyebrow, summary: values.summary, body: values.body, startYear: values.startYear, endYear: values.endYear,
      accent: values.accent, status: values.status, qualityStatus: initialQuality,
      metadata: { highlights: values.highlights, specs: values.specs },
      publishedAt: values.status === "published" ? now : null, createdAt: now, updatedAt: now,
    }).returning();
    const activeYears = values.activeYears.length ? values.activeYears : [values.startYear];
    await db.insert(contentYears).values(activeYears.map((year, sortOrder) => ({ contentId: id, year, sortOrder }))).onConflictDoNothing();
    for (const tagName of [...new Set(values.tags)]) {
      const tagSlug = slugify(tagName);
      const tagId = `tag-${tagSlug}`;
      await db.insert(tags).values({ id: tagId, slug: tagSlug, name: tagName, createdAt: now, updatedAt: now }).onConflictDoNothing();
      await db.insert(contentTags).values({ contentId: id, tagId }).onConflictDoNothing();
    }
    await db.insert(contentSources).values({ id: crypto.randomUUID(), contentId: id, label: values.sourceLabel, url: values.sourceUrl, sourceType: values.sourceType, isPrimary: true, checkedAt: now, createdAt: now, updatedAt: now });
    if (values.mediaId) await db.insert(contentMedia).values({ contentId: id, mediaId: values.mediaId, role: "hero" }).onConflictDoNothing();
    await db.batch([
      db.insert(contentRevisions).values({ id: crypto.randomUUID(), contentId: id, version: 1, snapshot: { ...values, mediaId: values.mediaId ?? null }, actorId: access.actor?.id, note: "Initial content creation", createdAt: now }),
      db.insert(contentReviewEvents).values({ id: crypto.randomUUID(), contentId: id, actorId: access.actor?.id, action: "created", toStatus: values.status, note: "콘텐츠 생성", createdAt: now }),
    ]);
    return Response.json({ item }, { status: 201 });
  } catch (error) {
    return databaseError(error);
  }
}

export async function PATCH(request: Request) {
  const access = await getAdminAccess(request.headers);
  if (!access.allowed) return adminError(access);
  if (!isSameOriginMutation(request)) return Response.json({ error: "invalid origin" }, { status: 403 });
  const parsed = updateInput.safeParse(await request.json());
  if (!parsed.success) return Response.json({ error: "invalid update", issues: parsed.error.flatten() }, { status: 400 });
  try {
    const db = getDb();
    const values = parsed.data;
    const [current] = await db.select().from(contentItems).where(eq(contentItems.id, values.id)).limit(1);
    if (!current) return Response.json({ error: "content not found" }, { status: 404 });
    if ((values.status === "published" || values.status === "archived" || values.qualityStatus === "verified") && !access.canPublish) return Response.json({ error: "publisher role required" }, { status: 403 });
    if (values.status && !validTransition(current.status, values.status, access)) return Response.json({ error: "invalid workflow transition" }, { status: 409 });
    const now = new Date();
    if (values.sourceLabel && values.sourceUrl) {
      await db.delete(contentSources).where(and(eq(contentSources.contentId, values.id), eq(contentSources.isPrimary, true)));
      await db.insert(contentSources).values({ id: crypto.randomUUID(), contentId: values.id, label: values.sourceLabel, url: values.sourceUrl, sourceType: values.sourceType ?? "reference", isPrimary: true, checkedAt: now, createdAt: now, updatedAt: now });
    }
    if (values.mediaId) {
      await db.delete(contentMedia).where(and(eq(contentMedia.contentId, values.id), eq(contentMedia.role, "hero")));
      await db.insert(contentMedia).values({ contentId: values.id, mediaId: values.mediaId, role: "hero", sortOrder: 0 });
    }
    if (values.qualityStatus === "verified") {
      const [source, hero] = await Promise.all([
        db.select().from(contentSources).where(and(eq(contentSources.contentId, values.id), eq(contentSources.isPrimary, true))).limit(1),
        db.select().from(contentMedia).where(and(eq(contentMedia.contentId, values.id), eq(contentMedia.role, "hero"))).limit(1),
      ]);
      if (!source.length || !hero.length) return Response.json({ error: "source and hero image are required before verification" }, { status: 409 });
    }
    const patch: Partial<typeof contentItems.$inferInsert> = { updatedAt: now, contentVersion: sql`${contentItems.contentVersion} + 1` as never };
    if (values.name !== undefined) patch.name = values.name;
    if (values.eyebrow !== undefined) patch.eyebrow = values.eyebrow;
    if (values.summary !== undefined) patch.summary = values.summary;
    if (values.body !== undefined) patch.body = values.body;
    if (values.status !== undefined) {
      patch.status = values.status;
      if (values.status === "published") patch.publishedAt = now;
    }
    if (values.qualityStatus !== undefined) {
      patch.qualityStatus = values.qualityStatus;
      patch.verifiedAt = values.qualityStatus === "verified" ? now : null;
    } else if (values.name || values.summary || values.body || values.mediaId || values.sourceUrl) {
      patch.qualityStatus = "needs_review";
      patch.verifiedAt = null;
    }
    await db.update(contentItems).set(patch).where(eq(contentItems.id, values.id));
    const [updated] = await db.select().from(contentItems).where(eq(contentItems.id, values.id)).limit(1);
    const action = reviewAction(current.status, values.status, values.qualityStatus, Boolean(values.mediaId));
    await db.batch([
      db.insert(contentRevisions).values({ id: crypto.randomUUID(), contentId: values.id, version: updated.contentVersion, snapshot: updated as unknown as Record<string, unknown>, actorId: access.actor?.id, note: values.note ?? action, createdAt: now }),
      db.insert(contentReviewEvents).values({ id: crypto.randomUUID(), contentId: values.id, actorId: access.actor?.id, action, fromStatus: current.status, toStatus: updated.status, note: values.note, createdAt: now }),
    ]);
    return Response.json({ item: updated });
  } catch (error) {
    return databaseError(error);
  }
}

function qualityIssues(item: typeof contentItems.$inferSelect, source?: typeof contentSources.$inferSelect, hero?: typeof media.$inferSelect) {
  const issues: string[] = [];
  if (item.summary.trim().length < 20) issues.push("한 줄 설명 보강 필요");
  if (item.body.trim().length < 80) issues.push("상세 설명 보강 필요");
  if (!source?.url) issues.push("대표 근거 없음");
  if (!hero) issues.push("대표 이미지 없음");
  else if (!hero.altText || !hero.sourceUrl || !hero.license) issues.push("이미지 권리 정보 미완성");
  return issues;
}

function validTransition(from: string, to: string, access: AdminAccess) {
  if (from === to) return true;
  if (to === "archived") return access.canPublish;
  if (from === "draft" && to === "review") return true;
  if (from === "review" && to === "draft") return true;
  if (from === "review" && to === "published") return access.canPublish;
  if (from === "published" && to === "review") return access.canPublish;
  return false;
}

function reviewAction(from: string, to?: string, quality?: string, mediaReplaced?: boolean) {
  if (mediaReplaced) return "media_replaced" as const;
  if (quality === "verified") return "verified" as const;
  if (to === "review" && from === "draft") return "submitted" as const;
  if (to === "published") return "published" as const;
  if (to === "draft") return "returned" as const;
  if (to === "archived") return "archived" as const;
  return "edited" as const;
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
  console.error(JSON.stringify({ message: "catalog database operation failed", error: error instanceof Error ? error.message : String(error) }));
  return Response.json({ error: "database unavailable" }, { status: 503 });
}
