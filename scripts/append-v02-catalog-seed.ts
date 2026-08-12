import { createHash } from "node:crypto";
import { existsSync, readFileSync, readdirSync, statSync, writeFileSync } from "node:fs";
import { extname, join } from "node:path";
import { catalog, categories, eras } from "../domain/catalog/data";

const marker = "-- BACK TO 2000 V0.2 CATALOG SEED";
const migrationDir = join(process.cwd(), "drizzle");
const migrationName = readdirSync(migrationDir).filter((name) => /^\d+_.+\.sql$/.test(name)).sort().at(-1);
if (!migrationName) throw new Error("No Drizzle migration found");
const migrationPath = join(migrationDir, migrationName);
const original = readFileSync(migrationPath, "utf8").split(marker)[0].trimEnd();
const now = Date.UTC(2026, 7, 12);
const statements: string[] = [marker];

const q = (value: unknown) => value === null || value === undefined ? "NULL" : `'${String(value).replaceAll("'", "''")}'`;
const json = (value: unknown) => q(JSON.stringify(value));
const bool = (value: boolean | undefined) => value ? 1 : 0;
const stableId = (prefix: string, value: string) => `${prefix}-${createHash("sha1").update(value).digest("hex").slice(0, 12)}`;

for (const era of eras) {
  statements.push(`INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES (${q(`era-${era.year}`)}, ${era.year}, ${q(era.label)}, ${q(era.summary)}, ${q(era.accent)}, 'published', ${now}, ${now});`);
}

const categoryRows = [
  ...categories.filter((category) => category.slug !== "popular"),
  { slug: "program", name: "소프트웨어", description: "운영체제와 프로그램으로 달라진 디지털 사용 경험" },
  { slug: "game", name: "게임", description: "새로운 플레이 방식과 문화를 만든 게임" },
  { slug: "event", name: "사건", description: "디지털 문화의 흐름을 바꾼 중요한 순간" },
];
for (const [sortOrder, category] of categoryRows.entries()) {
  statements.push(`INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES (${q(`category-${category.slug}`)}, ${q(category.slug)}, ${q(category.name)}, ${q(category.description)}, ${sortOrder}, ${now}, ${now});`);
}

const brandNames = [...new Set(catalog.map((item) => item.brand))].sort((a, b) => a.localeCompare(b));
const brandIds = new Map(brandNames.map((name) => [name, stableId("brand", name)]));
for (const name of brandNames) {
  statements.push(`INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES (${q(brandIds.get(name))}, ${q(stableId("brand", name))}, ${q(name)}, '', 'published', ${now}, ${now});`);
}

const tagNames = [...new Set(catalog.flatMap((item) => item.tags))].sort((a, b) => a.localeCompare(b));
const tagIds = new Map(tagNames.map((name) => [name, stableId("tag", name)]));
for (const name of tagNames) {
  statements.push(`INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES (${q(tagIds.get(name))}, ${q(stableId("tag", name))}, ${q(name)}, ${now}, ${now});`);
}

for (const item of catalog) {
  const qualityStatus = item.source && item.image?.sourceUrl && item.image?.license ? "verified" : "needs_review";
  statements.push(`INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES (${q(item.id)}, ${q(item.kind)}, ${q(item.slug)}, ${q(item.name)}, ${q(item.eyebrow)}, ${q(item.summary)}, ${q(item.description)}, ${item.year}, ${item.endYear ?? "NULL"}, ${q(brandIds.get(item.brand))}, ${q(`category-${item.kind}`)}, ${q(item.accent)}, 'published', ${q(qualityStatus)}, ${bool(item.featured)}, ${json({ highlights: item.highlights, specs: item.specs ?? {} })}, 1, ${qualityStatus === "verified" ? now : "NULL"}, ${now}, ${now}, ${now});`);

  for (const [sortOrder, year] of [...new Set(item.activeYears?.length ? item.activeYears : [item.year])].entries()) {
    statements.push(`INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES (${q(item.id)}, ${year}, ${sortOrder});`);
  }
  for (const tagName of item.tags) {
    statements.push(`INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES (${q(item.id)}, ${q(tagIds.get(tagName))});`);
  }
  if (item.source) {
    statements.push(`INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES (${q(stableId("source", item.id))}, ${q(item.id)}, ${q(item.source.label)}, ${q(item.source.url)}, ${q(/공식|official/i.test(item.source.label) ? "official" : "reference")}, 1, ${now}, ${now}, ${now});`);
  }
  if (item.image) {
    // Several timeline entries intentionally reuse the same curated asset. The
    // media table enforces a unique object key, so those entries must also share
    // one deterministic media id.
    const mediaId = stableId("media", item.image.src);
    const localPath = join(process.cwd(), "public", item.image.src.replace(/^\//, ""));
    const byteSize = existsSync(localPath) ? statSync(localPath).size : 0;
    const extension = extname(item.image.src).toLowerCase();
    const mimeType = ({ ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png", ".webp": "image/webp", ".svg": "image/svg+xml" } as Record<string, string>)[extension] ?? "application/octet-stream";
    statements.push(`INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES (${q(mediaId)}, ${q(item.image.src)}, ${q(item.image.src)}, 'static', ${q(item.image.src.split("/").at(-1))}, ${q(mimeType)}, ${byteSize}, ${q(item.image.alt)}, ${q(item.image.credit)}, ${q(item.image.sourceUrl)}, ${q(item.image.license)}, ${q(item.image.license ? "cleared" : "review")}, 1, ${item.image.license ? now : "NULL"}, ${now}, ${now});`);
    statements.push(`INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES (${q(item.id)}, ${q(mediaId)}, 'hero', 0);`);
  }
  statements.push(`INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES (${q(stableId("revision", item.id))}, ${q(item.id)}, 1, ${json({ name: item.name, summary: item.summary, description: item.description, source: item.source, image: item.image })}, 'v0.2 catalog import', ${now});`);
}

statements.push("PRAGMA optimize;");
writeFileSync(migrationPath, `${original}\n\n${statements.join("\n--> statement-breakpoint\n")}\n`);
console.log(`Appended ${catalog.length} catalog items to ${migrationName}`);
