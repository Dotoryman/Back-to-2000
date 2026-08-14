import { eq } from "drizzle-orm";
import { z } from "zod";
import { getDb } from "@/db";
import { users } from "@/db/schema";
import { hashPassword } from "@/domain/auth/crypto";
import { authJson, consumeAuthAttempt } from "@/domain/auth/http";
import { createSession, isSameOriginMutation, mergeDeviceCollection, requestDeviceKey, sessionCookie } from "@/domain/auth/session";

export const dynamic = "force-dynamic";

const input = z.object({
  username: z.string().trim().toLowerCase().regex(/^[a-z0-9_]{4,24}$/),
  displayName: z.string().trim().min(2).max(20),
  password: z.string().min(10).max(128),
});

export async function POST(request: Request) {
  if (!isSameOriginMutation(request)) return authJson({ error: "잘못된 요청입니다." }, { status: 403 });
  if (!(await consumeAuthAttempt(request, "register", 5, 60))) return authJson({ error: "가입 시도가 너무 많습니다. 잠시 후 다시 시도해 주세요." }, { status: 429 });
  const parsed = input.safeParse(await request.json().catch(() => null));
  if (!parsed.success) return authJson({ error: "아이디, 표시 이름과 비밀번호 형식을 확인해 주세요." }, { status: 400 });
  const db = getDb();
  const [existing] = await db.select({ id: users.id }).from(users).where(eq(users.username, parsed.data.username)).limit(1);
  if (existing) return authJson({ error: "이미 사용 중인 아이디입니다." }, { status: 409 });
  try {
    const id = crypto.randomUUID();
    const password = await hashPassword(parsed.data.password);
    const now = new Date();
    await db.insert(users).values({ id, username: parsed.data.username, displayName: parsed.data.displayName, passwordHash: password.hash, passwordSalt: password.salt, passwordIterations: password.iterations, createdAt: now, updatedAt: now });
    await mergeDeviceCollection(id, requestDeviceKey(request));
    const token = await createSession(id);
    return authJson({ authenticated: true, user: { username: parsed.data.username, displayName: parsed.data.displayName } }, { status: 201, headers: { "Set-Cookie": sessionCookie(token) } });
  } catch (error) {
    console.error("registration failed", error);
    return authJson({ error: "회원가입을 완료하지 못했습니다." }, { status: 503 });
  }
}
