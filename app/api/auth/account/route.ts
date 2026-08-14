import { eq } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import { collections, users } from "@/db/schema";
import { verifyPassword } from "@/domain/auth/crypto";
import { authJson } from "@/domain/auth/http";
import { expiredSessionCookie, getAuthSession, isSameOriginMutation } from "@/domain/auth/session";

const profile = z.object({ displayName: z.string().trim().min(2).max(20), isPublic: z.boolean() });
const deletion = z.object({ password: z.string().min(1).max(128) });

export async function GET(request: Request) {
  const auth = await getAuthSession(request);
  if (!auth) return authJson({ error: "로그인이 필요합니다." }, { status: 401 });
  const [collection] = await getDb().select({ isPublic: collections.isPublic }).from(collections).where(eq(collections.userId, auth.user.id)).limit(1);
  return authJson({ user: auth.user, isPublic: collection?.isPublic ?? false });
}

export async function PATCH(request: Request) {
  if (!isSameOriginMutation(request)) return authJson({ error: "잘못된 요청입니다." }, { status: 403 });
  const auth = await getAuthSession(request);
  if (!auth) return authJson({ error: "로그인이 필요합니다." }, { status: 401 });
  const parsed = profile.safeParse(await request.json().catch(() => null));
  if (!parsed.success) return authJson({ error: "프로필 정보를 확인해 주세요." }, { status: 400 });
  const now = new Date();
  await getDb().update(users).set({ displayName: parsed.data.displayName, updatedAt: now }).where(eq(users.id, auth.user.id));
  await getDb().update(collections).set({ isPublic: parsed.data.isPublic, updatedAt: now }).where(eq(collections.userId, auth.user.id));
  return authJson({ saved: true, user: { ...auth.user, displayName: parsed.data.displayName }, isPublic: parsed.data.isPublic });
}

export async function DELETE(request: Request) {
  if (!isSameOriginMutation(request)) return authJson({ error: "잘못된 요청입니다." }, { status: 403 });
  const auth = await getAuthSession(request);
  if (!auth) return authJson({ error: "로그인이 필요합니다." }, { status: 401 });
  const parsed = deletion.safeParse(await request.json().catch(() => null));
  if (!parsed.success) return authJson({ error: "비밀번호를 입력해 주세요." }, { status: 400 });
  const [user] = await getDb().select().from(users).where(eq(users.id, auth.user.id)).limit(1);
  if (!user?.passwordHash || !user.passwordSalt || !(await verifyPassword(parsed.data.password, user.passwordHash, user.passwordSalt, user.passwordIterations))) {
    return authJson({ error: "비밀번호가 올바르지 않습니다." }, { status: 401 });
  }
  await getDb().delete(users).where(eq(users.id, auth.user.id));
  return authJson({ deleted: true }, { headers: { "Set-Cookie": expiredSessionCookie() } });
}
