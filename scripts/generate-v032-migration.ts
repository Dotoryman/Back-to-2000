import { createHash } from "node:crypto";
import { existsSync, statSync, writeFileSync } from "node:fs";
import { extname, join } from "node:path";
import { catalog } from "../domain/catalog/data";
import milestoneImages from "../domain/catalog/milestone-images.json";

const output = join(process.cwd(), "drizzle", "0003_v032_feature_phones_and_images.sql");
const now = Date.UTC(2026, 7, 13);
const ids = ["phone-motorola-startac-st7760", "phone-anycall-sch-v500", "phone-curitel-ph-s3500", "phone-ever-ktf-x7000"];
const items = catalog.filter((item) => ids.includes(item.id));
const q = (value: unknown) => value === null || value === undefined ? "NULL" : `'${String(value).replaceAll("'", "''")}'`;
const json = (value: unknown) => q(JSON.stringify(value));
const stableId = (prefix: string, value: string) => `${prefix}-${createHash("sha1").update(value).digest("hex").slice(0, 12)}`;
const statements: string[] = ["-- BACK TO 2000 V0.3.2 KOREAN FEATURE PHONES AND IMAGE AUDIT"];

const mediaSql = (contentId: string, image: NonNullable<(typeof catalog)[number]["image"]>, rightsStatus = "review") => {
  const mediaId = stableId("media", image.src);
  const localPath = join(process.cwd(), "public", image.src.replace(/^\//, ""));
  const byteSize = existsSync(localPath) ? statSync(localPath).size : 0;
  const extension = extname(image.src).toLowerCase();
  const mimeType = ({ ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png", ".webp": "image/webp", ".svg": "image/svg+xml" } as Record<string, string>)[extension] ?? "application/octet-stream";
  statements.push(`INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES (${q(mediaId)}, ${q(image.src)}, ${q(image.src)}, 'static', ${q(image.src.split('/').at(-1))}, ${q(mimeType)}, ${byteSize}, ${q(image.alt)}, ${q(image.credit)}, ${q(image.sourceUrl)}, ${q(image.license)}, ${q(rightsStatus)}, 1, NULL, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, object_key=excluded.object_key, filename=excluded.filename, mime_type=excluded.mime_type, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status=excluded.rights_status, updated_at=excluded.updated_at;`);
  statements.push(`DELETE FROM content_media WHERE content_id=${q(contentId)} AND role='hero';`);
  statements.push(`INSERT INTO content_media (content_id, media_id, role, sort_order) VALUES (${q(contentId)}, ${q(mediaId)}, 'hero', 0);`);
};

for (const item of items) {
  const brandId = stableId("brand", item.brand);
  statements.push(`INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES (${q(brandId)}, ${q(item.brand.toLocaleLowerCase().replaceAll(/[^a-z0-9가-힣]+/g, '-'))}, ${q(item.brand)}, '', 'published', ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;`);
  statements.push(`INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES (${q(item.id)}, 'phone', ${q(item.slug)}, ${q(item.name)}, ${q(item.eyebrow)}, ${q(item.summary)}, ${q(item.description)}, ${item.year}, NULL, ${q(brandId)}, 'category-phone', ${q(item.accent)}, 'published', 'verified', ${item.featured ? 1 : 0}, ${json({ highlights: item.highlights, specs: item.specs ?? {}, story: item.story })}, 3, ${now}, ${now}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-phone', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=3, verified_at=excluded.verified_at, updated_at=excluded.updated_at;`);
  statements.push(`INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES (${q(item.id)}, ${item.year}, 0);`);
  for (const tagName of item.tags) {
    const tagId = stableId("tag", tagName);
    statements.push(`INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES (${q(tagId)}, ${q(tagId)}, ${q(tagName)}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;`);
    statements.push(`INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES (${q(item.id)}, ${q(tagId)});`);
  }
  if (item.source) {
    const sourceId = stableId("source-v032", item.id);
    statements.push(`INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES (${q(sourceId)}, ${q(item.id)}, ${q(item.source.label)}, ${q(item.source.url)}, 'editorial', 1, ${now}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;`);
  }
  if (item.image) mediaSql(item.id, item.image);
  statements.push(`INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES (${q(stableId("revision-v032", item.id))}, ${q(item.id)}, 3, ${json({ name: item.name, summary: item.summary, description: item.description, specs: item.specs, story: item.story, source: item.source, image: item.image })}, 'v0.3.2 Korean feature phone archive', ${now});`);
}

for (const id of ["phone-samsung-sch800", "phone-blackberry-pearl", "phone-blackberry-bold", "phone-blackberry-torch", "phone-blackberry-key2"]) {
  const item = catalog.find((entry) => entry.id === id);
  if (item?.image) mediaSql(id, item.image);
  if (id === "phone-samsung-sch800") {
    statements.push(`UPDATE content_items SET body=${q(item?.description)}, metadata=${json({ highlights: item?.highlights, specs: item?.specs ?? {}, story: item?.story })}, content_version=3, updated_at=${now} WHERE id=${q(id)};`);
  }
}

for (const [key, contentId] of [["1998:paypal", "milestone-1998-paypal"], ["2000:baidu", "milestone-2000-baidu"], ["2013:vine", "milestone-2013-vine"]] as const) {
  const image = milestoneImages[key];
  if (image) mediaSql(contentId, image);
}

statements.push("PRAGMA optimize;");
writeFileSync(output, `${statements.join("\n--> statement-breakpoint\n")}\n`, "utf8");
console.log(`Generated ${output} with ${items.length} new feature phones`);
