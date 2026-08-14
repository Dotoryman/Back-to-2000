import { existsSync, mkdtempSync, readdirSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { basename, join, resolve } from "node:path";
import { DatabaseSync } from "node:sqlite";

const backup = resolve(process.argv[2] || latestBackup());
if (!existsSync(backup)) throw new Error(`Backup not found: ${backup}`);
const sql = readFileSync(backup, "utf8");
for (const table of ["content_items", "users", "collection_items"]) {
  const hasTable = sql.includes(`CREATE TABLE \`${table}\``) || sql.includes(`CREATE TABLE "${table}"`) || sql.includes(`CREATE TABLE ${table}`);
  if (!hasTable) throw new Error(`Backup is incomplete: ${table} is missing`);
}

const state = mkdtempSync(join(tmpdir(), "backto2000-restore-"));
const database = new DatabaseSync(join(state, "restore.sqlite3"));

try {
  database.exec(`PRAGMA foreign_keys=OFF;\n${sql}`);
  const row = database.prepare("SELECT (SELECT COUNT(*) FROM content_items) AS content_count, (SELECT COUNT(*) FROM media) AS media_count, (SELECT COUNT(*) FROM users) AS user_count, (SELECT COUNT(*) FROM collection_items) AS memory_count").get();
  if (!row || Number(row.content_count) < 278 || Number(row.media_count) < 278) throw new Error(`Restored counts are invalid: ${JSON.stringify(row)}`);
  console.log(`Verified ${basename(backup)}: ${row.content_count} content, ${row.media_count} media, ${row.user_count} users, ${row.memory_count} memories.`);
} finally {
  database.close();
  rmSync(state, { recursive: true, force: true });
}

function latestBackup() {
  const directory = resolve(process.env.BACKTO2000_BACKUP_DIR || "backups");
  const files = existsSync(directory) ? readdirSync(directory).filter((file) => /^backto2000-production-.*\.sql$/.test(file)).sort() : [];
  if (!files.length) throw new Error("No D1 backup found. Run npm run cloudflare:backup first or pass a SQL file path.");
  return join(directory, files.at(-1));
}
