import { getAuthSessionFromHeaders, type AuthUser } from "@/domain/auth/session";

type HeaderReader = { get(name: string): string | null };

export type AdminAccess = {
  allowed: boolean;
  canPublish: boolean;
  status: 200 | 401 | 403;
  actor?: AuthUser;
  reason?: string;
};

export async function getAdminAccess(headers: HeaderReader): Promise<AdminAccess> {
  const host = (headers.get("host") ?? "").split(":")[0].toLowerCase();
  const local = host === "localhost" || host === "127.0.0.1" || host === "[::1]";
  const session = await getAuthSessionFromHeaders(headers);
  if (local && !session) return { allowed: true, canPublish: true, status: 200 };
  if (!session) return { allowed: false, canPublish: false, status: 401, reason: "관리자 로그인이 필요합니다." };
  if (session.user.role === "member") return { allowed: false, canPublish: false, status: 403, actor: session.user, reason: "편집자 또는 관리자 권한이 필요합니다." };
  return {
    allowed: true,
    canPublish: session.user.role === "admin",
    status: 200,
    actor: session.user,
  };
}

export function adminError(access: AdminAccess) {
  return Response.json({ error: access.reason ?? "forbidden" }, { status: access.status });
}
