import { and, eq, gt } from "drizzle-orm";
import { getDb } from "@/db";
import { collectionItems, collections, userSessions, users } from "@/db/schema";
import { hashSessionToken, randomSessionToken } from "./crypto";

export const SESSION_COOKIE = "b2000_session";
const SESSION_MAX_AGE = 60 * 60 * 24 * 30;
const DEVICE_PATTERN = /^[A-Za-z0-9-]{20,80}$/;

export type AuthUser = { id: string; username: string; displayName: string; role: "member" | "editor" | "admin" };

type HeaderReader = { get(name: string): string | null };

function cookieValue(headers: HeaderReader, name: string) {
  const cookies = headers.get("cookie") ?? "";
  for (const pair of cookies.split(";")) {
    const [key, ...value] = pair.trim().split("=");
    if (key === name) return decodeURIComponent(value.join("="));
  }
  return null;
}

export function requestDeviceKey(request: Request) {
  const value = request.headers.get("x-b2000-device") ?? "";
  return DEVICE_PATTERN.test(value) ? value : null;
}

export function sessionCookie(token: string) {
  return `${SESSION_COOKIE}=${encodeURIComponent(token)}; Path=/; HttpOnly; Secure; SameSite=Lax; Max-Age=${SESSION_MAX_AGE}`;
}

export function expiredSessionCookie() {
  return `${SESSION_COOKIE}=; Path=/; HttpOnly; Secure; SameSite=Lax; Max-Age=0`;
}

export function isSameOriginMutation(request: Request) {
  const origin = request.headers.get("origin");
  return Boolean(origin && origin === new URL(request.url).origin);
}

export async function getAuthSession(request: Request): Promise<{ user: AuthUser; tokenHash: string } | null> {
  return getAuthSessionFromHeaders(request.headers);
}

export async function getAuthSessionFromHeaders(headers: HeaderReader): Promise<{ user: AuthUser; tokenHash: string } | null> {
  const token = cookieValue(headers, SESSION_COOKIE);
  if (!token) return null;
  const tokenHash = await hashSessionToken(token);
  const now = new Date();
  const [row] = await getDb().select({
    id: users.id,
    username: users.username,
    displayName: users.displayName,
    role: users.role,
  }).from(userSessions).innerJoin(users, eq(userSessions.userId, users.id))
    .where(and(eq(userSessions.tokenHash, tokenHash), gt(userSessions.expiresAt, now))).limit(1);
  if (!row?.username) return null;
  return { user: { ...row, username: row.username }, tokenHash };
}

export async function createSession(userId: string) {
  const token = randomSessionToken();
  const tokenHash = await hashSessionToken(token);
  const now = new Date();
  const expiresAt = new Date(now.getTime() + SESSION_MAX_AGE * 1000);
  await getDb().insert(userSessions).values({ tokenHash, userId, expiresAt, createdAt: now, lastSeenAt: now });
  return token;
}

export async function deleteSession(request: Request) {
  const token = cookieValue(request.headers, SESSION_COOKIE);
  if (token) await getDb().delete(userSessions).where(eq(userSessions.tokenHash, await hashSessionToken(token)));
}

async function userCollectionId(userId: string) {
  const [row] = await getDb().select({ id: collections.id }).from(collections).where(eq(collections.userId, userId)).limit(1);
  return row?.id;
}

export async function ensureUserCollection(userId: string) {
  const existing = await userCollectionId(userId);
  if (existing) return existing;
  const id = crypto.randomUUID();
  const now = new Date();
  await getDb().insert(collections).values({ id, userId, deviceKey: null, createdAt: now, updatedAt: now }).onConflictDoNothing();
  return (await userCollectionId(userId)) ?? id;
}

export async function mergeDeviceCollection(userId: string, deviceKey: string | null) {
  const targetId = await ensureUserCollection(userId);
  if (!deviceKey) return targetId;
  const [source] = await getDb().select({ id: collections.id }).from(collections).where(eq(collections.deviceKey, deviceKey)).limit(1);
  if (!source || source.id === targetId) return targetId;
  const items = await getDb().select().from(collectionItems).where(eq(collectionItems.collectionId, source.id));
  for (const item of items) {
    await getDb().insert(collectionItems).values({ ...item, collectionId: targetId }).onConflictDoNothing();
  }
  await getDb().delete(collections).where(eq(collections.id, source.id));
  return targetId;
}

export async function resolveCollectionId(request: Request, create = false) {
  const auth = await getAuthSession(request);
  if (auth) return create ? ensureUserCollection(auth.user.id) : userCollectionId(auth.user.id);
  const key = requestDeviceKey(request);
  if (!key) return undefined;
  const [row] = await getDb().select({ id: collections.id }).from(collections).where(eq(collections.deviceKey, key)).limit(1);
  if (row || !create) return row?.id;
  const id = crypto.randomUUID();
  const now = new Date();
  await getDb().insert(collections).values({ id, deviceKey: key, createdAt: now, updatedAt: now }).onConflictDoNothing();
  const [created] = await getDb().select({ id: collections.id }).from(collections).where(eq(collections.deviceKey, key)).limit(1);
  return created?.id ?? id;
}
