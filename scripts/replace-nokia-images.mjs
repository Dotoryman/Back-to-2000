import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const outputDir = path.join(root, "public/images/archive/milestones");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
const manifest = JSON.parse(await readFile(manifestPath, "utf8"));
await mkdir(outputDir, { recursive: true });

const targets = [
  ["1998:nokia 5110", "Nokia 5110 (1998).jpg", "1998-nokia-5110-exact.jpg", "Nokia 5110"],
  ["1999:nokia 3210", "Nokia 3210 (9136307576).jpg", "1999-nokia-3210-exact.jpg", "Nokia 3210"],
  ["2001:nokia 5510", "Nokia5510.jpg", "2001-nokia-5510-exact.jpg", "Nokia 5510"],
  ["2002:nokia 7650", "Nokia 7650 01.jpg", "2002-nokia-7650-exact.jpg", "Nokia 7650"],
  ["2003:nokia n-gage", "Nokia-NGage-BTR.jpg", "2003-nokia-n-gage-exact.jpg", "Nokia N-Gage"],
  ["2004:nokia 7610", "Nokia 7610.png", "2004-nokia-7610-exact.png", "Nokia 7610"],
  ["2005:nokia n70", "Nokia N70 2.jpg", "2005-nokia-n70-exact.jpg", "Nokia N70"],
  ["2006:nokia n73", "Nokia-N73.jpg", "2006-nokia-n73-exact.jpg", "Nokia N73"],
  ["2007:nokia n95", "Nokia N95.png", "2007-nokia-n95-exact.png", "Nokia N95", "https://upload.wikimedia.org/wikipedia/commons/b/b1/Nokia_N95.png"],
  ["2008:nokia 5800 xpressmusic", "(49) Nokia-5800-xpressmusic.jpg", "2008-nokia-5800-xpressmusic-exact.jpg", "Nokia 5800 XpressMusic", "https://upload.wikimedia.org/wikipedia/commons/0/01/%2849%29_Nokia-5800-xpressmusic.jpg"],
  ["2012:nokia lumia 920", "Nokia Lumia 920.jpg", "2012-nokia-lumia-920-exact.jpg", "Nokia Lumia 920", "https://upload.wikimedia.org/wikipedia/commons/2/22/Nokia_Lumia_920.jpg"],
];

const stripHtml = (value = "") => value.replace(/<[^>]+>/g, " ").replace(/&[^;]+;/g, " ").replace(/\s+/g, " ").trim();
const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

async function fetchWithRetry(url, accept = "*/*") {
  for (let attempt = 0; attempt < 4; attempt += 1) {
    const response = await fetch(url, { headers: { "user-agent": "BackTo2000Archive/0.1 (exact Nokia image audit)", accept } });
    if (response.ok) return response;
    if (response.status !== 429) throw new Error(`request ${response.status}`);
    await delay(1800 * (attempt + 1));
  }
  throw new Error("request rate limited after retries");
}

async function commonsInfo(fileTitle) {
  const query = new URLSearchParams({ action: "query", format: "json", origin: "*", titles: `File:${fileTitle}`, prop: "imageinfo", iiprop: "url|size|extmetadata", iiurlwidth: "1600" });
  const response = await fetchWithRetry(`https://commons.wikimedia.org/w/api.php?${query}`, "application/json");
  const data = await response.json();
  const page = Object.values(data.query?.pages ?? {})[0];
  if (page?.missing !== undefined || !page?.imageinfo?.[0]) throw new Error(`No exact Commons file: ${fileTitle}`);
  return page.imageinfo[0];
}

function validImage(bytes) {
  return (bytes[0] === 0xff && bytes[1] === 0xd8 && bytes[2] === 0xff) ||
    (bytes[0] === 0x89 && bytes[1] === 0x50 && bytes[2] === 0x4e && bytes[3] === 0x47);
}

for (const [key, fileTitle, filename, model, verifiedUrl] of targets) {
  const filePath = path.join(outputDir, filename);
  const existing = await readFile(filePath).catch(() => undefined);
  const sourceUrl = `https://commons.wikimedia.org/wiki/File:${encodeURIComponent(fileTitle).replaceAll("%20", "_")}`;
  if (existing && validImage(existing) && existing.byteLength >= 5000) {
    manifest[key] = { src: `/images/archive/milestones/${filename}`, alt: `${model} 실제 제품 사진`, credit: "Wikimedia Commons contributor", sourceUrl, license: "See Wikimedia Commons file page", matchedTitle: model };
    await writeFile(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`, "utf8");
    console.log(`REUSE ${model} · ${existing.byteLength} bytes`);
    continue;
  }
  const info = verifiedUrl ? undefined : await commonsInfo(fileTitle);
  const imageUrl = verifiedUrl ?? info.thumburl ?? info.url;
  const response = await fetchWithRetry(imageUrl, "image/png,image/jpeg,*/*");
  const bytes = new Uint8Array(await response.arrayBuffer());
  if (!validImage(bytes) || bytes.byteLength < 5000) throw new Error(`${model} invalid image (${bytes.byteLength} bytes)`);
  await writeFile(filePath, bytes);
  const metadata = info?.extmetadata ?? {};
  manifest[key] = {
    src: `/images/archive/milestones/${filename}`,
    alt: `${model} 실제 제품 사진`,
    credit: stripHtml(metadata.Artist?.value) || "Wikimedia Commons contributor",
    sourceUrl: info?.descriptionurl ?? sourceUrl,
    license: metadata.LicenseShortName?.value || "Wikimedia Commons license",
    matchedTitle: model,
  };
  await writeFile(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`, "utf8");
  console.log(`OK ${model} · ${info ? `${info.width}x${info.height}` : "verified direct file"} · ${bytes.byteLength} bytes`);
  await delay(1200);
}

// The core Nokia 3310 card has its own catalog entry outside the milestone manifest.
const coreResponse = await fetchWithRetry("https://upload.wikimedia.org/wikipedia/commons/6/6a/Nokia3310.jpg", "image/jpeg,*/*");
const coreBytes = new Uint8Array(await coreResponse.arrayBuffer());
if (!coreResponse.ok || !validImage(coreBytes)) throw new Error("Nokia 3310 invalid image");
await mkdir(path.join(root, "public/images/archive/devices"), { recursive: true });
await writeFile(path.join(root, "public/images/archive/devices/nokia-3310.jpg"), coreBytes);
console.log(`OK Nokia 3310 · verified direct file · ${coreBytes.byteLength} bytes`);

const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
console.log(`Replaced ${targets.length + 1} exact Nokia product images.`);
