import { createHash } from "node:crypto";
import { existsSync, statSync, writeFileSync } from "node:fs";
import { extname, join } from "node:path";
import { catalog } from "../domain/catalog/data";

const output = join(process.cwd(), "drizzle", "0005_image_maintenance.sql");
const now = Date.UTC(2026, 7, 14);
const ids = [
  "phone-curitel-ph-s3500",
  "phone-anycall-haptic",
  "phone-moto-x-style",
  "milestone-2002-blackberry-5810",
  "milestone-2003-blackberry-6210",
  "milestone-2005-blackberry-8700",
  "milestone-2009-bing",
  "milestone-2009-iphone-3gs",
  "milestone-2013-lg-g2",
  "milestone-2013-samsung-galaxy-s4",
  "milestone-2014-samsung-galaxy-s5",
  "milestone-2016-google-pixel",
];
const q = (value: unknown) => value == null ? "NULL" : `'${String(value).replaceAll("'", "''")}'`;
const stableId = (prefix: string, value: string) => `${prefix}-${createHash("sha1").update(value).digest("hex").slice(0, 12)}`;
const statements = ["-- BACK TO 2000 IMAGE MAINTENANCE (NO VERSION RELEASE)"];

for (const id of ids) {
  const item = catalog.find((entry) => entry.id === id);
  if (!item?.image) throw new Error(`Missing catalog image for ${id}`);
  const image = item.image;
  const mediaId = stableId("media", image.src);
  const localPath = join(process.cwd(), "public", image.src.replace(/^\//, ""));
  if (!existsSync(localPath)) throw new Error(`Missing image asset: ${localPath}`);
  const extension = extname(image.src).toLowerCase();
  const mimeType = ({ ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png", ".webp": "image/webp", ".svg": "image/svg+xml" } as Record<string, string>)[extension];
  statements.push(`INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES (${q(mediaId)}, ${q(image.src)}, ${q(image.src)}, 'static', ${q(image.src.split('/').at(-1))}, ${q(mimeType)}, ${statSync(localPath).size}, ${q(image.alt)}, ${q(image.credit)}, ${q(image.sourceUrl)}, ${q(image.license)}, 'review', 1, NULL, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, object_key=excluded.object_key, filename=excluded.filename, mime_type=excluded.mime_type, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, updated_at=excluded.updated_at;`);
  statements.push(`DELETE FROM content_media WHERE content_id=${q(id)} AND role='hero';`);
  statements.push(`INSERT INTO content_media (content_id, media_id, role, sort_order) VALUES (${q(id)}, ${q(mediaId)}, 'hero', 0);`);
}

statements.push("PRAGMA optimize;");
writeFileSync(output, `${statements.join("\n--> statement-breakpoint\n")}\n`, "utf8");
console.log(`Generated ${output} for ${ids.length} audited images.`);
