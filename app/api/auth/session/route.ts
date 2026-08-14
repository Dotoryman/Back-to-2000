import { authJson } from "@/domain/auth/http";
import { getAuthSession } from "@/domain/auth/session";

export const dynamic = "force-dynamic";

export async function GET(request: Request) {
  const auth = await getAuthSession(request);
  return authJson(auth ? { authenticated: true, user: auth.user } : { authenticated: false, user: null });
}
