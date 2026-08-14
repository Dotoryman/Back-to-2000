import { createHash } from "node:crypto";
import { readFile, stat } from "node:fs/promises";
import { join } from "node:path";
import { catalog } from "../domain/catalog/data";

const root = process.cwd();
const issues: string[] = [];
const hashes = new Map<string, { id: string; path: string }>();
const paths = new Map<string, string>();

for (const item of catalog) {
  if (!item.image) {
    issues.push(`${item.id}: representative image missing`);
    continue;
  }
  const relative = item.image.src.replace(/^\//, "");
  const fullPath = join(root, "public", relative);
  const info = await stat(fullPath).catch(() => null);
  if (!info) {
    issues.push(`${item.id}: file missing (${item.image.src})`);
    continue;
  }
  const minimumBytes = relative.toLowerCase().endsWith(".svg") ? 150 : 300;
  if (info.size < minimumBytes) issues.push(`${item.id}: image file is suspiciously small (${info.size} bytes)`);
  if (!item.image.alt.trim()) issues.push(`${item.id}: alt text missing`);
  if (!item.image.credit.trim() || !item.image.sourceUrl.trim() || !item.image.license?.trim()) issues.push(`${item.id}: internal rights metadata incomplete`);
  const priorPath = paths.get(relative);
  if (priorPath && priorPath !== item.id) issues.push(`${item.id}: image path duplicates ${priorPath}`);
  paths.set(relative, item.id);
  const bytes = await readFile(fullPath);
  const hash = createHash("sha256").update(bytes).digest("hex");
  const priorHash = hashes.get(hash);
  if (priorHash && priorHash.id !== item.id && priorHash.path !== relative) issues.push(`${item.id}: binary image duplicates ${priorHash.id}`);
  else hashes.set(hash, { id: item.id, path: relative });
}

if (issues.length) {
  console.error(issues.join("\n"));
  process.exitCode = 1;
} else {
  console.log(`Image quality passed: ${catalog.length} records have unique, attributed representative images.`);
}
