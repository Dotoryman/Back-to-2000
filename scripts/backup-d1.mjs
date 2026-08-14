import { mkdirSync } from "node:fs";
import { resolve } from "node:path";
import { spawnSync } from "node:child_process";
import { createRequire } from "node:module";

const timestamp = new Date().toISOString().replaceAll(":", "-").replace(/\.\d{3}Z$/, "Z");
const outputDir = resolve(process.env.BACKTO2000_BACKUP_DIR || "backups");
mkdirSync(outputDir, { recursive: true });
const output = resolve(outputDir, `backto2000-production-${timestamp}.sql`);
const wrangler = createRequire(import.meta.url).resolve("wrangler");
const result = spawnSync(process.execPath, [wrangler, "d1", "export", "backto2000-production", "--remote", "--config", "wrangler.production.jsonc", "--output", output], { stdio: "inherit" });
if (result.error) throw result.error;
if (result.status !== 0) process.exit(result.status ?? 1);
console.log(`D1 backup saved: ${output}`);
