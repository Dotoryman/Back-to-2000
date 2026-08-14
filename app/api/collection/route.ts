import { and, eq, sql } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import { collectionItems, collections, contentItems } from "@/db/schema";
import { getAuthSession, requestDeviceKey, resolveCollectionId } from "@/domain/auth/session";

export const dynamic = "force-dynamic";

const reaction = z.enum(["used", "remembered", "wanted"]);
const mutation = z.object({ contentId: z.string().min(3).max(120), reaction });
type Reaction = z.infer<typeof reaction>;
type Counts = Record<string, { total: number; used: number; remembered: number; wanted: number }>;

function json(value: unknown, init?: ResponseInit) {
  const headers = new Headers(init?.headers);
  headers.set("Cache-Control", "private, no-store");
  return Response.json(value, { ...init, headers });
}

async function payload(collectionId?: string) {
  const db = getDb();
  const items = collectionId
    ? await db.select({ contentId: collectionItems.contentId, reaction: collectionItems.reaction }).from(collectionItems).where(eq(collectionItems.collectionId, collectionId))
    : [];
  const totals = await db.select({ contentId: collectionItems.contentId, reaction: collectionItems.reaction, count: sql<number>`count(*)` })
    .from(collectionItems).groupBy(collectionItems.contentId, collectionItems.reaction);
  const counts: Counts = {};
  for (const row of totals) {
    const current = counts[row.contentId] ?? { total: 0, used: 0, remembered: 0, wanted: 0 };
    const count = Number(row.count);
    current[row.reaction as Reaction] = count;
    current.total += count;
    counts[row.contentId] = current;
  }
  return { items, counts };
}

export async function GET(request: Request) {
  if (!(await getAuthSession(request)) && !requestDeviceKey(request)) return json({ error: "invalid device key" }, { status: 400 });
  try {
    return json(await payload(await resolveCollectionId(request)));
  } catch (error) {
    console.error("collection GET failed", error);
    return json({ error: "collection unavailable" }, { status: 503 });
  }
}

export async function POST(request: Request) {
  if (!(await getAuthSession(request)) && !requestDeviceKey(request)) return json({ error: "invalid device key" }, { status: 400 });
  const parsed = mutation.safeParse(await request.json().catch(() => null));
  if (!parsed.success) return json({ error: "invalid reaction" }, { status: 400 });
  try {
    const db = getDb();
    const [content] = await db.select({ id: contentItems.id }).from(contentItems).where(and(eq(contentItems.id, parsed.data.contentId), eq(contentItems.status, "published"))).limit(1);
    if (!content) return json({ error: "content not found" }, { status: 404 });
    const collectionId = await resolveCollectionId(request, true);
    if (!collectionId) return json({ error: "collection unavailable" }, { status: 503 });
    const now = new Date();
    await db.insert(collectionItems).values({ collectionId, contentId: content.id, reaction: parsed.data.reaction, createdAt: now, updatedAt: now }).onConflictDoUpdate({
      target: [collectionItems.collectionId, collectionItems.contentId],
      set: { reaction: parsed.data.reaction, updatedAt: now },
    });
    await db.update(collections).set({ updatedAt: now }).where(eq(collections.id, collectionId));
    return json(await payload(collectionId));
  } catch (error) {
    console.error("collection POST failed", error);
    return json({ error: "collection unavailable" }, { status: 503 });
  }
}

export async function DELETE(request: Request) {
  const contentId = new URL(request.url).searchParams.get("contentId");
  if (!(await getAuthSession(request)) && !requestDeviceKey(request)) return json({ error: "invalid request" }, { status: 400 });
  if (!contentId) return json({ error: "invalid request" }, { status: 400 });
  try {
    const collectionId = await resolveCollectionId(request);
    if (collectionId) await getDb().delete(collectionItems).where(and(eq(collectionItems.collectionId, collectionId), eq(collectionItems.contentId, contentId)));
    return json(await payload(collectionId));
  } catch (error) {
    console.error("collection DELETE failed", error);
    return json({ error: "collection unavailable" }, { status: 503 });
  }
}
