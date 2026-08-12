import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const source = await readFile(path.join(root, "domain/catalog/games.ts"), "utf8");
const outputDir = path.join(root, "public/images/archive/games");
const manifestPath = path.join(root, "domain/catalog/game-images.json");
await mkdir(outputDir, { recursive: true });

const games = [...source.matchAll(/\{ year: (\d{4}), name: "([^"]+)"/g)].map((match) => ({ year: Number(match[1]), name: match[2] }));
const existing = JSON.parse(await readFile(manifestPath, "utf8").catch(() => "{}"));
const manifest = { ...existing };
const steamApps = new Map([
  ["EverQuest", 205710], ["RuneScape", 1343400], ["MapleStory", 216150], ["Guild Wars", 29720],
  ["Team Fortress 2", 440], ["Left 4 Dead", 500], ["World of Tanks", 1407200], ["Dota 2", 570],
  ["Rocket League", 252950], ["Among Us", 945360], ["Apex Legends", 1172470],
]);
const reused = new Map([
  ["StarCraft", "/images/archive/milestones/1998-starcraft-user.jpg"],
  ["World of Warcraft", "/images/archive/milestones/2004-world-of-warcraft.png"],
  ["Minecraft", "/images/archive/milestones/2011-minecraft-1-0-commons.png"],
  ["Fortnite Battle Royale", "/images/archive/milestones/2017-fortnite-mark.svg"],
]);
const wikipediaAliases = new Map([
  ["Diablo II", "Diablo II"], ["Battlefield 1942", "Battlefield 1942"], ["Roblox", "Roblox"],
  ["League of Legends", "League of Legends"], ["Diablo III", "Diablo III"], ["Hearthstone", "Hearthstone"],
  ["Overwatch", "Overwatch (video game)"], ["VALORANT", "Valorant"],
]);
const directFallbacks = new Map([
  ["Roblox", { url: "https://i.pinimg.com/736x/fd/08/73/fd0873431b725296906c71c983111936.jpg", sourceUrl: "https://www.pinterest.com/pin/roblox-logo-png-20062009--333547916165324131/", extension: "jpg" }],
  ["Diablo III", { url: "https://wsrv.nl/?url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2F8%2F80%2FDiablo_III_cover.png&w=1200&output=png", sourceUrl: "https://en.wikipedia.org/wiki/Diablo_III", extension: "png" }],
  ["Hearthstone", { url: "https://wsrv.nl/?url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2Ff%2Ff2%2FHearthstone_2016_logo.png&w=1200&output=png", sourceUrl: "https://en.wikipedia.org/wiki/Hearthstone", extension: "png" }],
  ["Overwatch", { url: "https://clipartcraft.com/images/overwatch-logo-transparent-high-resolution-4.png", sourceUrl: "https://clipartcraft.com/explore/overwatch-logo-transparent-high-resolution/", extension: "png" }],
]);

const slugify = (value) => value.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");
const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

async function fetchJson(url) {
  const response = await fetch(url, { headers: { "user-agent": "BackTo2000Archive/1.0 (historical catalog)", accept: "application/json" } });
  if (!response.ok) throw new Error(`${response.status} ${url}`);
  return response.json();
}

async function download(url, target) {
  const response = await fetch(url, { headers: { "user-agent": "BackTo2000Archive/1.0 (historical catalog)" } });
  if (!response.ok) throw new Error(`${response.status} ${url}`);
  const bytes = new Uint8Array(await response.arrayBuffer());
  if (bytes.byteLength < 4000) throw new Error(`image too small: ${bytes.byteLength}`);
  await writeFile(target, bytes);
}

for (const game of games) {
  const key = `${game.year}:${game.name.toLowerCase()}`;
  if (manifest[key]) continue;
  const reusedPath = reused.get(game.name);
  if (reusedPath) {
    manifest[key] = { src: reusedPath, alt: `${game.name} 대표 이미지`, credit: `${game.name} publisher`, sourceUrl: reusedPath, license: "역사 기록용 · 원저작자 권리 보유" };
    continue;
  }

  try {
    const fallback = directFallbacks.get(game.name);
    if (fallback) {
      const filename = `${game.year}-${slugify(game.name)}.${fallback.extension}`;
      await download(fallback.url, path.join(outputDir, filename));
      manifest[key] = { src: `/images/archive/games/${filename}`, alt: `${game.name} 대표 이미지`, credit: `${game.name} publisher`, sourceUrl: fallback.sourceUrl, license: "상표·게임 아트 · 원저작자 권리 보유" };
      continue;
    }

    const appId = steamApps.get(game.name);
    if (appId) {
      const filename = `${game.year}-${slugify(game.name)}.jpg`;
      const imageUrl = `https://cdn.akamai.steamstatic.com/steam/apps/${appId}/header.jpg`;
      await download(imageUrl, path.join(outputDir, filename));
      manifest[key] = { src: `/images/archive/games/${filename}`, alt: `${game.name} 공식 Steam 대표 이미지`, credit: `${game.name} publisher / Steam`, sourceUrl: `https://store.steampowered.com/app/${appId}/`, license: "상표·게임 아트 · 원저작자 권리 보유" };
      continue;
    }

    const title = wikipediaAliases.get(game.name) ?? game.name;
    const page = await fetchJson(`https://en.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title.replaceAll(" ", "_"))}`);
    const imageUrl = page.originalimage?.source ?? page.thumbnail?.source;
    if (!imageUrl) throw new Error("missing Wikipedia image");
    const extension = new URL(imageUrl).pathname.match(/\.(svg|png|jpe?g|webp)$/i)?.[1]?.toLowerCase().replace("jpeg", "jpg") ?? "png";
    const filename = `${game.year}-${slugify(game.name)}.${extension}`;
    await download(imageUrl, path.join(outputDir, filename));
    manifest[key] = { src: `/images/archive/games/${filename}`, alt: `${game.name} 대표 이미지`, credit: `${game.name} contributors`, sourceUrl: page.content_urls?.desktop?.page ?? `https://en.wikipedia.org/wiki/${encodeURIComponent(title)}`, license: "역사 기록용 · 이미지별 원저작자 권리 보유" };
  } catch (error) {
    console.error(`FAILED ${game.year} ${game.name}:`, error instanceof Error ? error.message : error);
  }
  await delay(250);
}

await writeFile(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`, "utf8");
console.log(`Game images: ${Object.keys(manifest).length}/${games.length}`);
