import { readFile, stat } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const catalogSource = await readFile(path.join(root, "domain/catalog/milestones.ts"), "utf8");
const manifest = JSON.parse(await readFile(path.join(root, "domain/catalog/milestone-images.json"), "utf8"));
const items = [];

for (const line of catalogSource.split(/\r?\n/)) {
  const yearMatch = line.match(/^\s*(\d{4}): \[(.*)\],$/);
  if (!yearMatch) continue;
  const year = Number(yearMatch[1]);
  for (const match of yearMatch[2].matchAll(/\["([^"]+)","([^"]+)","([^"]+)"\]/g)) {
    items.push({ year, name: match[1], brand: match[2], kind: match[3], key: `${year}:${match[1].toLowerCase()}` });
  }
}

const missing = items.filter(({ key }) => !manifest[key]);
const orphaned = Object.keys(manifest).filter((key) => !items.some((item) => item.key === key));
const invalid = [];
const suspicious = [];

for (const item of items) {
  const image = manifest[item.key];
  if (!image) continue;
  const filePath = path.join(root, "public", image.src.replace(/^\//, ""));
  try {
    const info = await stat(filePath);
    const bytes = new Uint8Array(await readFile(filePath));
    const textStart = new TextDecoder().decode(bytes.slice(0, 512));
    const valid =
      (bytes[0] === 0xff && bytes[1] === 0xd8 && bytes[2] === 0xff) ||
      (bytes[0] === 0x89 && bytes[1] === 0x50 && bytes[2] === 0x4e && bytes[3] === 0x47) ||
      (String.fromCharCode(...bytes.slice(0, 4)) === "RIFF" && String.fromCharCode(...bytes.slice(8, 12)) === "WEBP") ||
      textStart.includes("<svg");
    const minimumSize = textStart.includes("<svg") ? 150 : 300;
    if (!valid || info.size < minimumSize) invalid.push(`${item.key} -> ${image.src} (${info.size} bytes)`);
    if (["phone", "product"].includes(item.kind) && (/logo|wordmark|brand mark/i.test(`${image.matchedTitle ?? ""} ${image.alt ?? ""}`) || image.src.endsWith(".svg"))) {
      suspicious.push(`${item.key} -> ${image.matchedTitle ?? image.alt}`);
    }
  } catch {
    invalid.push(`${item.key} -> missing file ${image.src}`);
  }
}

console.log(JSON.stringify({ catalogItems: items.length, manifestItems: Object.keys(manifest).length, missing, orphaned, invalid, suspicious }, null, 2));
if (missing.length || orphaned.length || invalid.length) process.exitCode = 1;
