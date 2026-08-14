import { eq } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import { users } from "@/db/schema";
import { verifyPassword } from "@/domain/auth/crypto";
import { authJson, clearAuthAttempts, consumeAuthAttempt } from "@/domain/auth/http";
import { createSession, isSameOriginMutation, mergeDeviceCollection, requestDeviceKey, sessionCookie } from "@/domain/auth/session";

export const dynamic = "force-dynamic";
const input = z.object({ username: z.string().trim().toLowerCase().min(4).max(24), password: z.string().min(1).max(128) });

export async function POST(request: Request) {
  if (!isSameOriginMutation(request)) return authJson({ error: "잘못된 요청입니다." }, { status: 403 });
  if (!(await consumeAuthAttempt(request, "login", 8, 15))) return authJson({ error: "로그인 시도가 너무 많습니다. 15분 후 다시 시도해 주세요." }, { status: 429 });
  const parsed = input.safeParse(await request.json().catch(() => null));
  if (!parsed.success) return authJson({ error: "아이디 또는 비밀번호가 올바르지 않습니다." }, { status: 401 });
  const [user] = await getDb().select().from(users).where(eq(users.username, parsed.data.username)).limit(1);
  const valid = user?.passwordHash && user.passwordSalt
    ? await verifyPassword(parsed.data.password, user.passwordHash, user.passwordSalt, user.passwordIterations)
    : false;
  if (!user || !valid) return authJson({ error: "아이디 또는 비밀번호가 올바르지 않습니다." }, { status: 401 });
  await clearAuthAttempts(request, "login");
  await mergeDeviceCollection(user.id, requestDeviceKey(request));
  const token = await createSession(user.id);
  return authJson({ authenticated: true, user: { username: user.username, displayName: user.displayName } }, { headers: { "Set-Cookie": sessionCookie(token) } });
}
