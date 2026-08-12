import { desc } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import { contentItems } from "@/db/schema";
const input = z.object({ type: z.enum(["website", "phone", "service", "event", "game", "program"]), name: z.string().trim().min(1).max(100), slug: z.string().trim().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/), summary: z.string().trim().max(300).default(""), body: z.string().trim().default(""), startYear: z.number().int().min(1980).max(2030), accent: z.string().regex(/^#[0-9a-fA-F]{6}$/).default("#9bcbe2"), status: z.enum(["draft", "review", "published", "archived"]).default("draft") });
export async function GET() { try { return Response.json({ items: await getDb().select().from(contentItems).orderBy(desc(contentItems.updatedAt)).limit(100) }); } catch (error) { return Response.json({ error: error instanceof Error ? error.message : "database unavailable" }, { status: 503 }); } }
export async function POST(request: Request) { const parsed = input.safeParse(await request.json()); if (!parsed.success) return Response.json({ error: "invalid content", issues: parsed.error.flatten() }, { status: 400 }); try { const now = new Date(); const [item] = await getDb().insert(contentItems).values({ id: crypto.randomUUID(), ...parsed.data, metadata: {}, publishedAt: parsed.data.status === "published" ? now : null, createdAt: now, updatedAt: now }).returning(); return Response.json({ item }, { status: 201 }); } catch (error) { return Response.json({ error: error instanceof Error ? error.message : "database unavailable" }, { status: 503 }); } }

