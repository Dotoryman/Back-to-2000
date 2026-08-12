import { createMediaKey, getMediaBucket } from "@/infrastructure/media/r2";
import { getDb } from "@/db";
import { media } from "@/db/schema";
import { adminError, getAdminAccess } from "@/infrastructure/auth/admin";
const MAX_BYTES = 10 * 1024 * 1024;
const TYPES = new Set(["image/jpeg", "image/png", "image/webp", "image/avif", "image/gif"]);

export async function POST(request: Request) {
  const access = getAdminAccess(request.headers);
  if (!access.allowed) return adminError(access);

  const form = await request.formData();
  const file = form.get("file");
  if (!(file instanceof File)) return Response.json({ error: "file is required" }, { status: 400 });
  if (!TYPES.has(file.type)) return Response.json({ error: "unsupported media type" }, { status: 415 });
  if (file.size > MAX_BYTES) return Response.json({ error: "file exceeds 10 MB" }, { status: 413 });

  const key = createMediaKey(file.name);
  let bucket: R2Bucket | undefined;
  let uploaded = false;

  try {
    bucket = getMediaBucket();
    await bucket.put(key, file.stream(), {
      httpMetadata: { contentType: file.type },
      customMetadata: { originalName: file.name },
    });
    uploaded = true;

    const id = crypto.randomUUID();
    await getDb().insert(media).values({
      id,
      objectKey: key,
      filename: file.name,
      mimeType: file.type,
      byteSize: file.size,
    });

    return Response.json({
      id,
      key,
      url: `/api/media?key=${encodeURIComponent(key)}`,
      filename: file.name,
      mimeType: file.type,
      byteSize: file.size,
    }, { status: 201 });
  } catch (error) {
    if (uploaded && bucket) await bucket.delete(key).catch(() => undefined);
    return Response.json({
      error: error instanceof Error ? error.message : "upload failed",
    }, { status: 503 });
  }
}

export async function GET(request: Request) {
  const key = new URL(request.url).searchParams.get("key");
  if (!key?.startsWith("media/")) {
    return Response.json({ error: "invalid media key" }, { status: 400 });
  }

  const object = await getMediaBucket().get(key);
  if (!object) return Response.json({ error: "media not found" }, { status: 404 });

  const headers = new Headers();
  object.writeHttpMetadata(headers);
  headers.set("etag", object.httpEtag);
  headers.set("cache-control", "public, max-age=86400, stale-while-revalidate=604800");
  return new Response(object.body, { headers });
}
