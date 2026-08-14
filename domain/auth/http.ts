import { eq } from "drizzle-orm";
import { getDb } from "@/db";
import { authRateLimits } from "@/db/schema";

export function authJson(value: unknown, init?: ResponseInit) {
  const headers = new Headers(init?.headers);
  headers.set("Cache-Control", "private, no-store");
  return Response.json(value, { ...init, headers });
}

function clientAddress(request: Request) {
  return request.headers.get("cf-connecting-ip") ?? request.headers.get("x-forwarded-for")?.split(",")[0]?.trim() ?? "unknown";
}

async function rateKey(request: Request, action: string) {
  const input = new TextEncoder().encode(`${action}:${clientAddress(request)}`);
  const digest = new Uint8Array(await crypto.subtle.digest("SHA-256", input));
  return `${action}:${Array.from(digest, (byte) => byte.toString(16).padStart(2, "0")).join("")}`;
}

export async function consumeAuthAttempt(request: Request, action: string, limit = 8, windowMinutes = 15) {
  const key = await rateKey(request, action);
  const now = new Date();
  const [row] = await getDb().select().from(authRateLimits).where(eq(authRateLimits.key, key)).limit(1);
  const expired = !row || now.getTime() - row.windowStartedAt.getTime() >= windowMinutes * 60_000;
  if (expired) {
    await getDb().insert(authRateLimits).values({ key, attempts: 1, windowStartedAt: now, updatedAt: now }).onConflictDoUpdate({ target: authRateLimits.key, set: { attempts: 1, windowStartedAt: now, updatedAt: now } });
    return true;
  }
  if (row.attempts >= limit) return false;
  await getDb().update(authRateLimits).set({ attempts: row.attempts + 1, updatedAt: now }).where(eq(authRateLimits.key, key));
  return true;
}

export async function clearAuthAttempts(request: Request, action: string) {
  const key = await rateKey(request, action);
  await getDb().delete(authRateLimits).where(eq(authRateLimits.key, key));
}
