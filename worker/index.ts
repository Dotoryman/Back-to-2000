import handler from "vinext/server/app-router-entry";

const PUBLIC_CACHE_NAME = "backto2000-public-v2";
const PUBLIC_CACHE_TTL_SECONDS = 6 * 60 * 60;
const CATALOG_VERSION_QUERY = "SELECT version FROM catalog_cache_version WHERE id = 1";

const worker = {
  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    if (isCatalogMutation(request)) {
      const response = await handler.fetch(request, env, ctx);
      if (response.ok) await bumpCatalogVersion(env);
      return response;
    }

    if (!isPublicDocumentRequest(request) && !isPublicCatalogRequest(request)) {
      const response = await handler.fetch(request, env, ctx);
      if (new URL(request.url).pathname === "/api/catalog") {
        const privateResponse = new Response(response.body, response);
        privateResponse.headers.set("Cache-Control", "private, no-store");
        return privateResponse;
      }
      return response;
    }

    const cache = await caches.open(PUBLIC_CACHE_NAME);
    const version = await getCatalogVersion(env);
    // Never reuse a made-up old cache version when D1 is unavailable.
    if (version === null) return withCacheStatus(await handler.fetch(request, env, ctx), "BYPASS");
    const cacheKey = createPublicCacheKey(request, version);
    const cached = await cache.match(cacheKey);
    if (cached) return withCacheStatus(cached, "HIT");

    const response = await handler.fetch(request, env, ctx);
    if (!isCacheableResponse(response, request)) return withCacheStatus(response, "BYPASS");

    const cacheResponse = new Response(response.body, response);
    cacheResponse.headers.set("Cache-Control", `public, max-age=60, s-maxage=${PUBLIC_CACHE_TTL_SECONDS}`);
    cacheResponse.headers.set("Vary", "Accept-Encoding");
    cacheResponse.headers.set("X-BackTo2000-Cache", "MISS");
    ctx.waitUntil(cache.put(cacheKey, cacheResponse.clone()));
    return cacheResponse;
  },
} satisfies ExportedHandler<Env>;

export default worker;

function isPublicDocumentRequest(request: Request) {
  if (request.method !== "GET") return false;
  if (!request.headers.get("accept")?.includes("text/html")) return false;
  if (request.headers.has("authorization")) return false;
  if (request.headers.get("cookie")?.includes("b2000_session=")) return false;

  const pathname = new URL(request.url).pathname;
  return pathname === "/" || pathname === "/search"
    || /^\/(years|categories|websites|phones|timelines|archive)\/[^/]+\/?$/.test(pathname);
}

function isPublicCatalogRequest(request: Request) {
  const url = new URL(request.url);
  if (request.method !== "GET" || request.headers.has("authorization") || request.headers.has("cookie")) return false;
  // Local development has a separate administrator access policy.
  if (["localhost", "127.0.0.1", "[::1]"].includes(url.hostname)) return false;
  return url.pathname === "/api/catalog" || url.pathname === "/sitemap.xml";
}

function isCatalogMutation(request: Request) {
  if (!new Set(["POST", "PUT", "PATCH", "DELETE"]).has(request.method)) return false;
  const pathname = new URL(request.url).pathname;
  return pathname === "/api/catalog" || pathname === "/api/media";
}

function createPublicCacheKey(request: Request, version: number) {
  const source = new URL(request.url);
  const cacheUrl = new URL(source.origin);
  cacheUrl.pathname = source.pathname;
  if (source.pathname === "/search") {
    const query = source.searchParams.get("q")?.trim();
    if (query) cacheUrl.searchParams.set("q", query);
  }
  cacheUrl.searchParams.set("__catalog", String(version));
  return new Request(cacheUrl, { method: "GET" });
}

async function getCatalogVersion(env: Env) {
  try {
    const row = await env.DB.prepare(CATALOG_VERSION_QUERY).first<{ version: number }>();
    return row?.version ?? null;
  } catch (error) {
    console.warn(JSON.stringify({ message: "catalog cache version unavailable", error: error instanceof Error ? error.message : String(error) }));
    return null;
  }
}

async function bumpCatalogVersion(env: Env) {
  await env.DB.prepare(
    "INSERT INTO catalog_cache_version (id, version, updated_at) VALUES (1, 2, unixepoch()) ON CONFLICT(id) DO UPDATE SET version = version + 1, updated_at = unixepoch()",
  ).run();
}

function isCacheableResponse(response: Response, request: Request) {
  if (!response.ok || response.headers.has("set-cookie")) return false;
  if (/private|no-store/i.test(response.headers.get("cache-control") ?? "")) return false;
  const contentType = response.headers.get("content-type") ?? "";
  const pathname = new URL(request.url).pathname;
  if (pathname === "/api/catalog") return contentType.includes("application/json");
  if (pathname === "/sitemap.xml") return contentType.includes("xml");
  return contentType.includes("text/html");
}

function withCacheStatus(response: Response, status: "HIT" | "BYPASS") {
  const next = new Response(response.body, response);
  next.headers.set("X-BackTo2000-Cache", status);
  return next;
}
