import { createMediaKey, getMediaBucket } from "@/infrastructure/media/r2";
const MAX_BYTES = 10 * 1024 * 1024;
const TYPES = new Set(["image/jpeg", "image/png", "image/webp", "image/avif", "image/gif"]);
export async function POST(request: Request) {
  const form = await request.formData(); const file = form.get("file");
  if (!(file instanceof File)) return Response.json({ error: "file is required" }, { status: 400 });
  if (!TYPES.has(file.type)) return Response.json({ error: "unsupported media type" }, { status: 415 });
  if (file.size > MAX_BYTES) return Response.json({ error: "file exceeds 10 MB" }, { status: 413 });
  try { const key = createMediaKey(file.name); await getMediaBucket().put(key, file.stream(), { httpMetadata: { contentType: file.type }, customMetadata: { originalName: file.name } }); return Response.json({ key, filename: file.name, mimeType: file.type, byteSize: file.size }, { status: 201 }); }
  catch (error) { return Response.json({ error: error instanceof Error ? error.message : "upload failed" }, { status: 503 }); }
}

