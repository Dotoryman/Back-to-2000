import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const source = await readFile(path.join(root, "domain/catalog/milestones.ts"), "utf8");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
const outputDir = path.join(root, "public/images/archive/milestones");
const manifest = JSON.parse(await readFile(manifestPath, "utf8"));
await mkdir(outputDir, { recursive: true });

const rows = [];
for (const match of source.matchAll(/^\s{2}(\d{4}): \[(.+)\],$/gm)) {
  for (const [name, brand, kind] of JSON.parse(`[${match[2]}]`)) {
    rows.push({ year: Number(match[1]), name, brand, kind });
  }
}

const eligibleKinds = new Set(["website", "service", "program", "game"]);
const slug = (value) => value.toLowerCase().normalize("NFKD").replace(/[^a-z0-9]+/g, "");
const aliases = {
  "mozilla project": ["mozilla"],
  "aol instant messenger 3.0": ["aol"],
  "mac os x public beta": ["apple"],
  "google adwords": ["googleads"],
  "mozilla 1.0": ["mozilla"],
  "openoffice.org 1.0": ["apacheopenoffice"],
  "itunes store": ["itunes"],
  "windows live messenger": ["microsoft"],
  "netflix streaming": ["netflix"],
  "apple app store": ["appstore"],
  "hulu public launch": ["hulu"],
  "oculus rift kickstarter": ["oculus"],
  "google glass explorer edition": ["googleglass"],
  "amazon echo (public release)": ["amazonalexa"],
  "instagram stories": ["instagram"],
  "apple tv+": ["appletvplus", "apple"],
  "disney+": ["disneyplus"],
  "apple fitness+": ["applefitnessplus", "apple"],
  "habbo": ["habbo"],
  "amazon s3": ["amazons3"],
  "ustream": ["ustream"],
  "hulu": ["hulu"],
  "bing": ["bing"],
  "minecraft alpha": ["minecraft"],
  "windows phone 7": ["windows"],
  "path": ["path"],
  "minecraft 1.0": ["minecraft"],
  "windows 8": ["windows"],
  "slack": ["slack"],
  "pokémon go": ["pokemongo"],
};

async function fetchLogo(candidates) {
  for (const candidate of [...new Set(candidates.filter(Boolean))]) {
    const response = await fetch(`https://cdn.simpleicons.org/${candidate}`, {
      headers: { "user-agent": "BackTo2000Archive/1.0" },
    });
    if (!response.ok) continue;
    const svg = await response.text();
    if (svg.includes("<svg") && svg.length > 100) return { candidate, svg };
  }
}

let added = 0;
for (const row of rows) {
  const key = `${row.year}:${row.name.toLowerCase()}`;
  if (manifest[key] || !eligibleKinds.has(row.kind)) continue;

  const candidates = [
    ...(aliases[row.name.toLowerCase()] ?? []),
    slug(row.name.replace(/\s*\([^)]*\)\s*$/g, "")),
    row.kind !== "game" ? slug(row.brand) : undefined,
  ];
  const result = await fetchLogo(candidates);
  if (!result) continue;

  const fileSlug = row.name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");
  const filename = `${row.year}-${fileSlug}-mark.svg`;
  await writeFile(path.join(outputDir, filename), result.svg, "utf8");
  manifest[key] = {
    src: `/images/archive/milestones/${filename}`,
    alt: `${row.name} 당시 서비스 마크`,
    credit: "Simple Icons contributors",
    sourceUrl: `https://simpleicons.org/?q=${encodeURIComponent(row.name)}`,
    license: "CC0 1.0 · trademark",
    matchedTitle: `${result.candidate} brand mark`,
  };
  added += 1;
}

const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
console.log(`Added ${added} service marks; manifest now has ${Object.keys(sorted).length} images.`);
