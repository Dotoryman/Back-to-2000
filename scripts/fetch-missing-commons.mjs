import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const source = await readFile(path.join(root, "domain/catalog/milestones.ts"), "utf8");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
const outputDir = path.join(root, "public/images/archive/milestones");
const manifest = JSON.parse(await readFile(manifestPath, "utf8"));
const dryRun = process.argv.includes("--dry-run");
await mkdir(outputDir, { recursive: true });

const queryAliases = {
  "AOL Instant Messenger 3.0": "AIM AOL Instant Messenger logo",
  "Trek ThumbDrive": "Trek ThumbDrive USB flash drive",
  Habbo: "Habbo logo",
  "Nintendo GameCube": "Nintendo GameCube console",
  "Kingdom Hearts": "Kingdom Hearts logo",
  "iMac G4": "iMac G4 computer",
  Friendster: "Friendster logo",
  "Xbox Live": "Xbox Live logo",
  LinkedIn: "LinkedIn logo",
  Skype: "Skype logo",
  "Canon EOS-1D Mark II": "Canon EOS-1D Mark II camera",
  "Xbox 360": "Xbox 360 console",
  "Nintendo Wii": "Nintendo Wii console",
  "Amazon S3": "Amazon S3 logo",
  "ASUS Eee PC": "ASUS Eee PC laptop",
  Hulu: "Hulu logo",
  Ustream: "Ustream logo",
  "Nikon D90": "Nikon D90 camera",
  "Minecraft Alpha": "Minecraft logo",
  "Motorola Droid": "Motorola Droid phone",
  Bing: "Bing logo",
  Kinect: "Microsoft Kinect sensor",
  "MacBook Air 2010": "MacBook Air 2010 laptop",
  "Windows Phone 7": "Windows Phone 7 logo",
  Path: "Path social network logo",
  "Minecraft 1.0": "Minecraft logo",
  Chromebook: "Google Chromebook laptop",
  "PlayStation Vita": "PlayStation Vita handheld console",
  "iPhone 5": "Apple iPhone 5 phone",
  "Oculus Rift Kickstarter": "Oculus Rift development kit headset",
  "Surface RT": "Microsoft Surface RT tablet",
  "Windows 8": "Windows 8 logo",
  "Motorola Moto X": "Motorola Moto X phone",
  Chromecast: "Google Chromecast first generation",
  "Google Glass Explorer Edition": "Google Glass Explorer Edition",
  Slack: "Slack logo",
  "Amazon Echo": "Amazon Echo first generation speaker",
  "Google Cardboard": "Google Cardboard headset",
  "Amazon Echo (Public Release)": "Amazon Echo first generation speaker",
  "Pokémon GO": "Pokémon GO logo",
  AirPods: "Apple AirPods first generation",
  "HTC Vive": "HTC Vive headset",
  "Oculus Rift CV1": "Oculus Rift CV1 headset",
  "PlayStation VR": "PlayStation VR headset",
  "Samsung Galaxy S8": "Samsung Galaxy S8 phone",
  "Samsung Galaxy S10": "Samsung Galaxy S10 phone",
  "Korea 5G Service": "5G mobile network icon",
};

const rows = [];
for (const match of source.matchAll(/^\s{2}(\d{4}): \[(.+)\],$/gm)) {
  for (const [name, brand, kind] of JSON.parse(`[${match[2]}]`)) {
    const key = `${match[1]}:${name.toLowerCase()}`;
    if (!manifest[key]) rows.push({ key, year: Number(match[1]), name, brand, kind });
  }
}

const normalize = (value) => value.toLowerCase().normalize("NFKD").replace(/[^a-z0-9]+/g, " ").trim();
const slugify = (value) => normalize(value).replaceAll(" ", "-");
const hardwareKinds = new Set(["phone", "product"]);
const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

async function commonsSearch(row) {
  const query = queryAliases[row.name] ?? `${row.name} ${row.brand}`;
  const params = new URLSearchParams({
    action: "query", format: "json", origin: "*", generator: "search",
    gsrsearch: query, gsrnamespace: "6", gsrlimit: "10", prop: "imageinfo",
    iiprop: "url|extmetadata", iiurlwidth: "1200",
  });
  const response = await fetch(`https://commons.wikimedia.org/w/api.php?${params}`, {
    headers: { "user-agent": "BackTo2000Archive/1.0 (educational archive)", accept: "application/json" },
  });
  if (!response.ok) throw new Error(`search ${response.status}`);
  const data = await response.json();
  const tokens = normalize(row.name).split(" ").filter((token) => token.length > 1 && !/^\d{4}$/.test(token));
  const pages = Object.values(data.query?.pages ?? {}).filter((page) => page.imageinfo?.[0]?.thumburl || page.imageinfo?.[0]?.url);
  return pages.map((page) => {
    const title = normalize(page.title.replace(/^File:/i, ""));
    let score = tokens.reduce((sum, token) => sum + (title.includes(token) ? 12 : -3), 0);
    if (title.includes(normalize(row.name))) score += 80;
    if (hardwareKinds.has(row.kind) && /logo|icon|wordmark|diagram|manual|box|packaging/.test(title)) score -= 55;
    if (!hardwareKinds.has(row.kind) && /logo|icon|wordmark/.test(title)) score += 25;
    if (/front|back|console|camera|phone|laptop|headset|tablet|speaker|device/.test(title)) score += hardwareKinds.has(row.kind) ? 8 : 0;
    return { page, info: page.imageinfo[0], title: page.title.replace(/^File:/i, ""), score };
  }).sort((a, b) => b.score - a.score)[0];
}

let added = 0;
for (const row of rows) {
  try {
    const candidate = await commonsSearch(row);
    if (!candidate || candidate.score < 0) throw new Error("no reliable candidate");
    console.log(`${dryRun ? "CANDIDATE" : "ADD"}\t${row.key}\t${candidate.score}\t${candidate.title}`);
    if (dryRun) { await delay(180); continue; }

    const imageUrl = candidate.info.thumburl || candidate.info.url;
    let response = await fetch(imageUrl, { headers: { "user-agent": "BackTo2000Archive/1.0" } });
    if (!response.ok) response = await fetch(`https://wsrv.nl/?url=${encodeURIComponent(imageUrl)}&w=1200&output=jpg`);
    if (!response.ok) throw new Error(`image ${response.status}`);
    const bytes = new Uint8Array(await response.arrayBuffer());
    if (bytes.byteLength < (hardwareKinds.has(row.kind) ? 4000 : 300)) throw new Error("image too small");
    const ext = new URL(imageUrl).pathname.match(/\.(jpe?g|png|webp)(?:\/|$)/i)?.[1]?.toLowerCase().replace("jpeg", "jpg") ?? "jpg";
    const filename = `${row.year}-${slugify(row.name)}-commons.${ext}`;
    await writeFile(path.join(outputDir, filename), bytes);
    const meta = candidate.info.extmetadata ?? {};
    manifest[row.key] = {
      src: `/images/archive/milestones/${filename}`,
      alt: `${row.name} ${hardwareKinds.has(row.kind) ? "제품" : "대표"} 이미지`,
      credit: (meta.Artist?.value ?? "Wikimedia Commons contributors").replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim(),
      sourceUrl: candidate.info.descriptionurl,
      license: meta.LicenseShortName?.value ?? "Wikimedia source",
      matchedTitle: candidate.title,
    };
    const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
    await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
    added += 1;
  } catch (error) {
    console.log(`MISS\t${row.key}\t${error.message}`);
  }
  await delay(260);
}

console.log(`DONE missing=${rows.length} added=${added} manifest=${Object.keys(manifest).length}`);
