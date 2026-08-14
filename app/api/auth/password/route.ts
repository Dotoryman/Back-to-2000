import { eq } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import { users } from "@/db/schema";
import { hashPassword, verifyPassword } from "@/domain/auth/crypto";
import { authJson, consumeAuthAttempt } from "@/domain/auth/http";
import { getAuthSession, isSameOriginMutation, replaceAllUserSessions, sessionCookie } from "@/domain/auth/session";

export const dynamic = "force-dynamic";

const input = z.object({
  currentPassword: z.string().min(1).max(128),
  newPassword: z.string().min(10).max(128),
}).refine((value) => value.currentPassword !== value.newPassword, { message: "same password", path: ["newPassword"] });

export async function POST(request: Request) {
  if (!isSameOriginMutation(request)) return authJson({ error: "잘못된 요청입니다." }, { status: 403 });
  const auth = await getAuthSession(request);
  if (!auth) return authJson({ error: "로그인이 필요합니다." }, { status: 401 });
  if (!(await consumeAuthAttempt(request, "password-change", 5, 30))) {
    return authJson({ error: "비밀번호 변경 시도가 너무 많습니다. 30분 후 다시 시도해 주세요." }, { status: 429 });
  }
  const parsed = input.safeParse(await request.json().catch(() => null));
  if (!parsed.success) return authJson({ error: "새 비밀번호는 기존과 다르게 10자 이상 입력해 주세요." }, { status: 400 });
  const [user] = await getDb().select().from(users).where(eq(users.id, auth.user.id)).limit(1);
  if (!user?.passwordHash || !user.passwordSalt || !(await verifyPassword(parsed.data.currentPassword, user.passwordHash, user.passwordSalt, user.passwordIterations))) {
    return authJson({ error: "현재 비밀번호가 올바르지 않습니다." }, { status: 401 });
  }
  const password = await hashPassword(parsed.data.newPassword);
  await getDb().update(users).set({ passwordHash: password.hash, passwordSalt: password.salt, passwordIterations: password.iterations, updatedAt: new Date() }).where(eq(users.id, auth.user.id));
  const token = await replaceAllUserSessions(auth.user.id);
  return authJson({ changed: true }, { headers: { "Set-Cookie": sessionCookie(token) } });
}
