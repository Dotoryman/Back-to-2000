import { authJson } from "@/domain/auth/http";
import { deleteSession, expiredSessionCookie, isSameOriginMutation } from "@/domain/auth/session";

export async function POST(request: Request) {
  if (!isSameOriginMutation(request)) return authJson({ error: "잘못된 요청입니다." }, { status: 403 });
  await deleteSession(request);
  return authJson({ authenticated: false }, { headers: { "Set-Cookie": expiredSessionCookie() } });
}
