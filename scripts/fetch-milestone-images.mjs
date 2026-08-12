import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const source = await readFile(path.join(root, "domain/catalog/milestones.ts"), "utf8");
const outputDir = path.join(root, "public/images/archive/milestones");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
await mkdir(outputDir, { recursive: true });

const rows = [];
for (const match of source.matchAll(/^\s{2}(\d{4}): \[(.+)\],$/gm)) {
  const year = Number(match[1]);
  for (const [name, brand, kind] of JSON.parse(`[${match[2]}]`)) rows.push({ year, name, brand, kind });
}

const requestedYears = new Set(process.argv.slice(2).map(Number).filter(Number.isFinite));
const targetRows = requestedYears.size ? rows.filter((row) => requestedYears.has(row.year)) : rows;

const existing = JSON.parse(await readFile(manifestPath, "utf8").catch(() => "{}"));
const manifest = { ...existing };
const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
const slugify = (value) => value.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");
const stripHtml = (value = "") => value.replace(/<[^>]+>/g, " ").replace(/&[^;]+;/g, " ").replace(/\s+/g, " ").trim();
const keyword = { phone: "mobile phone", product: "product", service: "software service", website: "website", program: "software", game: "video game", event: "technology" };
const wikipediaAliases = {
  "aol instant messenger 3.0": ["AIM (software)"],
  "mac os x public beta": ["Mac OS X Public Beta"],
  "blackberry 5810": ["BlackBerry 5810 Wireless Handheld"],
  "blackberry 6210": ["BlackBerry 6210"],
  "macbook air 2010": ["MacBook Air (Intel-based)"],
  "macbook air retina": ["MacBook Air (Intel-based)"],
  "oculus rift kickstarter": ["Oculus Rift"],
  "google glass explorer edition": ["Google Glass"],
  "amazon echo (public release)": ["Amazon Echo"],
  "oculus rift cv1": ["Oculus Rift CV1"],
  "motorola razr 2019": ["Motorola Razr (2020)"],
  "dji mavic 2 pro": ["Mavic 2 Pro"],
  "surface rt": ["Surface (2012 tablet)"],
  "minecraft alpha": ["Minecraft"],
  "minecraft 1.0": ["Minecraft"],
  "hulu public launch": ["Hulu"],
};

async function json(url) {
  const response = await fetch(url, { headers: { "user-agent": "BackTo2000Archive/1.0 (educational archive)", accept: "application/json" } });
  if (!response.ok) throw new Error(`${response.status} ${url}`);
  return response.json();
}

async function findCandidate(row) {
  const titleAliases = [...(wikipediaAliases[row.name.toLowerCase()] ?? []), row.name, row.name.replace(/ \([^)]*\)$/g, ""), row.name.replace(/ (Global|Public Release|Preview)$/g, "")];
  for (const title of [...new Set(titleAliases)]) {
    try {
      const data = await json(`https://en.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title.replaceAll(" ", "_"))}`);
      const source = data.originalimage?.source || data.thumbnail?.source;
      if (source && data.type !== "disambiguation") return { title: data.title, thumbnail: { source }, fullurl: data.content_urls?.desktop?.page };
    } catch {
      // Try the next title alias when Wikipedia has no matching page.
    }
  }
  try {
    const search = await json(`https://en.wikipedia.org/w/rest.php/v1/search/page?q=${encodeURIComponent(`${row.name} ${row.brand}`)}&limit=5`);
    const candidate = search.pages?.find((page) => page.thumbnail?.url) || search.pages?.[0];
    if (candidate?.thumbnail?.url) {
      const source = candidate.thumbnail.url.startsWith("//") ? `https:${candidate.thumbnail.url}` : candidate.thumbnail.url;
      return { title: candidate.title, thumbnail: { source: source.replace(/\/\d+px-/, "/1200px-") }, fullurl: `https://en.wikipedia.org/wiki/${encodeURIComponent(candidate.key)}` };
    }
  } catch {
    // Fall through to the MediaWiki search API.
  }
  const params = new URLSearchParams({ action: "query", format: "json", origin: "*", generator: "search", gsrsearch: `${row.name} ${row.brand} ${keyword[row.kind] ?? ""}`, gsrnamespace: "0", gsrlimit: "5", prop: "pageimages|info", piprop: "name|thumbnail", pithumbsize: "1200", inprop: "url" });
  const data = await json(`https://en.wikipedia.org/w/api.php?${params}`);
  const pages = Object.values(data.query?.pages ?? {}).filter((page) => page.thumbnail?.source && page.pageimage);
  const target = row.name.toLowerCase().replace(/[^a-z0-9]/g, "");
  return pages.sort((a, b) => {
    const at = a.title.toLowerCase().replace(/[^a-z0-9]/g, "");
    const bt = b.title.toLowerCase().replace(/[^a-z0-9]/g, "");
    return Number(bt.includes(target) || target.includes(bt)) - Number(at.includes(target) || target.includes(at));
  })[0];
}

async function metadata(fileName) {
  const params = new URLSearchParams({ action: "query", format: "json", origin: "*", titles: `File:${fileName}`, prop: "imageinfo", iiprop: "url|extmetadata" });
  const data = await json(`https://commons.wikimedia.org/w/api.php?${params}`);
  return Object.values(data.query?.pages ?? {})[0]?.imageinfo?.[0];
}

let added = 0;
let failed = 0;
for (const [index, row] of targetRows.entries()) {
  const key = `${row.year}:${row.name.toLowerCase()}`;
  if (manifest[key]) continue;
  try {
    const page = await findCandidate(row);
    if (!page) throw new Error("no image result");
    const info = page.pageimage ? await metadata(page.pageimage).catch(() => undefined) : undefined;
    const imageUrl = page.thumbnail.source;
    const extension = new URL(imageUrl).pathname.match(/\.(jpe?g|png|webp)(?:\/|$)/i)?.[1]?.toLowerCase().replace("jpeg", "jpg") ?? "jpg";
    const filename = `${row.year}-${slugify(row.name)}.${extension}`;
    let response = await fetch(imageUrl, { headers: { "user-agent": "BackTo2000Archive/1.0 (educational archive)" } });
    let finalFilename = filename;
    if (response.status === 429) {
      response = await fetch(`https://wsrv.nl/?url=${encodeURIComponent(imageUrl)}&w=1200&output=jpg`);
      finalFilename = `${row.year}-${slugify(row.name)}.jpg`;
    }
    if (!response.ok) throw new Error(`image ${response.status}`);
    const bytes = new Uint8Array(await response.arrayBuffer());
    if (bytes.byteLength < 4000) throw new Error("image too small");
    await writeFile(path.join(outputDir, finalFilename), bytes);
    const ext = info?.extmetadata ?? {};
    manifest[key] = { src: `/images/archive/milestones/${finalFilename}`, alt: `${row.year}년 ${row.name} 대표 이미지`, credit: stripHtml(ext.Artist?.value) || `${page.title} contributors`, sourceUrl: info?.descriptionurl || page.fullurl, license: ext.LicenseShortName?.value || "Wikimedia source", matchedTitle: page.title };
    await writeFile(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`, "utf8");
    added += 1;
  } catch {
    failed += 1;
  }
  if ((index + 1) % 10 === 0) process.stdout.write(`PROGRESS ${index + 1}/${targetRows.length} added=${added} failed=${failed}\n`);
  await delay(380);
}

await writeFile(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`, "utf8");
process.stdout.write(`DONE total=${targetRows.length} manifest=${Object.keys(manifest).length} added=${added} failed=${failed}\n`);
