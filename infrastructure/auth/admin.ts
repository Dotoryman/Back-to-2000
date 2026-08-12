import { env } from "cloudflare:workers";

type AdminEnv = { ADMIN_EMAILS?: string };
type HeaderReader = { get(name: string): string | null };

export type AdminAccess = { allowed: boolean; status: 200 | 401 | 403; reason?: string };

export function getAdminAccess(headers: HeaderReader): AdminAccess {
  const host = (headers.get("host") ?? "").split(":")[0].toLowerCase();
  if (host === "localhost" || host === "127.0.0.1" || host === "[::1]") return { allowed: true, status: 200 };

  const email = headers.get("oai-authenticated-user-email")?.trim().toLowerCase();
  if (!email) return { allowed: false, status: 401, reason: "관리자 로그인이 필요합니다." };

  const configured = ((env as unknown as AdminEnv).ADMIN_EMAILS ?? "")
    .split(",")
    .map((value) => value.trim().toLowerCase())
    .filter(Boolean);
  if (!configured.length || !configured.includes(email)) return { allowed: false, status: 403, reason: "관리자 권한이 없습니다." };
  return { allowed: true, status: 200 };
}

export function adminError(access: AdminAccess) {
  return Response.json({ error: access.reason ?? "forbidden" }, { status: access.status });
}
