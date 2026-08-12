import { createHash } from "node:crypto";
import { existsSync, statSync, writeFileSync } from "node:fs";
import { extname, join } from "node:path";
import { gameCatalog } from "../domain/catalog/games";

const output = join(process.cwd(), "drizzle", "0002_v03_games.sql");
const now = Date.UTC(2026, 7, 12);
const statements: string[] = ["-- BACK TO 2000 V0.3 GLOBAL GAME ARCHIVE"];
const q = (value: unknown) => value === null || value === undefined ? "NULL" : `'${String(value).replaceAll("'", "''")}'`;
const json = (value: unknown) => q(JSON.stringify(value));
const stableId = (prefix: string, value: string) => `${prefix}-${createHash("sha1").update(value).digest("hex").slice(0, 12)}`;

statements.push(`INSERT INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-game', 'game', '게임', '공개 테스트와 출시를 거쳐 세계적인 놀이 문화가 된 게임', 4, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET name=excluded.name, description=excluded.description, sort_order=excluded.sort_order, updated_at=excluded.updated_at;`);
const supersededGameIds = [
  "milestone-2000-the-sims", "milestone-2002-kingdom-hearts", "milestone-2009-minecraft-alpha",
  "milestone-2011-minecraft-1-0", "milestone-2012-candy-crush-saga", "milestone-2016-pok-mon-go",
  "milestone-2017-fortnite",
];
statements.push(`UPDATE content_items SET status='archived', updated_at=${now} WHERE id IN (${supersededGameIds.map(q).join(", ")});`);

for (const item of gameCatalog) {
  const brandId = stableId("brand", item.brand);
  statements.push(`INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES (${q(brandId)}, ${q(brandId)}, ${q(item.brand)}, '', 'published', ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;`);
  statements.push(`INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES (${q(item.id)}, 'game', ${q(item.slug)}, ${q(item.name)}, ${q(item.eyebrow)}, ${q(item.summary)}, ${q(item.description)}, ${item.year}, NULL, ${q(brandId)}, 'category-game', ${q(item.accent)}, 'published', 'verified', ${item.featured ? 1 : 0}, ${json({ highlights: item.highlights, specs: item.specs ?? {}, story: item.story })}, 2, ${now}, ${now}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;`);
  statements.push(`INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES (${q(item.id)}, ${item.year}, 0);`);

  for (const tagName of item.tags) {
    const tagId = stableId("tag", tagName);
    statements.push(`INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES (${q(tagId)}, ${q(tagId)}, ${q(tagName)}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;`);
    statements.push(`INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES (${q(item.id)}, ${q(tagId)});`);
  }

  if (item.source) {
    const sourceId = stableId("source-v03", item.id);
    statements.push(`INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES (${q(sourceId)}, ${q(item.id)}, ${q(item.source.label)}, ${q(item.source.url)}, 'official', 1, ${now}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;`);
  }

  if (item.image) {
    const mediaId = stableId("media", item.image.src);
    const localPath = join(process.cwd(), "public", item.image.src.replace(/^\//, ""));
    const byteSize = existsSync(localPath) ? statSync(localPath).size : 0;
    const extension = extname(item.image.src).toLowerCase();
    const mimeType = ({ ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png", ".webp": "image/webp", ".svg": "image/svg+xml" } as Record<string, string>)[extension] ?? "application/octet-stream";
    statements.push(`INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES (${q(mediaId)}, ${q(item.image.src)}, ${q(item.image.src)}, 'static', ${q(item.image.src.split('/').at(-1))}, ${q(mimeType)}, ${byteSize}, ${q(item.image.alt)}, ${q(item.image.credit)}, ${q(item.image.sourceUrl)}, ${q(item.image.license)}, 'cleared', 1, ${now}, ${now}, ${now}) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;`);
    statements.push(`INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES (${q(item.id)}, ${q(mediaId)}, 'hero', 0);`);
  }

  statements.push(`INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES (${q(stableId("revision-v03", item.id))}, ${q(item.id)}, 2, ${json({ name: item.name, summary: item.summary, description: item.description, specs: item.specs, story: item.story, source: item.source, image: item.image })}, 'v0.3 global game archive', ${now});`);
}

const iphoneImage = "/images/archive/milestones/2007-iphone.webp";
const iphoneImagePath = join(process.cwd(), "public", iphoneImage.replace(/^\//, ""));
const iphoneImageSize = existsSync(iphoneImagePath) ? statSync(iphoneImagePath).size : 0;
statements.push(`UPDATE media SET object_key=${q(iphoneImage)}, public_url=${q(iphoneImage)}, filename='2007-iphone.webp', mime_type='image/webp', byte_size=${iphoneImageSize}, alt_text='2007년 Apple iPhone 전면과 후면 제품 이미지', credit='사용자 제공 이미지', source_url='', license='원저작자 권리 보유', rights_status='review', verified_at=NULL, updated_at=${now} WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2007-iphone' AND role='hero');`);

statements.push("PRAGMA optimize;");
writeFileSync(output, `${statements.join("\n--> statement-breakpoint\n")}\n`, "utf8");
console.log(`Generated ${output} with ${gameCatalog.length} games`);
