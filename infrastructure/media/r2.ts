import { env } from "cloudflare:workers";
type MediaEnv = { MEDIA?: R2Bucket };
export function getMediaBucket() { const bucket = (env as unknown as MediaEnv).MEDIA; if (!bucket) throw new Error("Cloudflare R2 binding `MEDIA` is unavailable."); return bucket; }
export function createMediaKey(filename: string) { const extension = filename.includes(".") ? filename.split(".").pop()!.toLowerCase() : "bin"; return `media/${new Date().toISOString().slice(0, 10)}/${crypto.randomUUID()}.${extension}`; }

