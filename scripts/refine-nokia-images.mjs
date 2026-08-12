import { readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const outputDir = path.join(root, "public/images/archive/milestones");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
const manifest = JSON.parse(await readFile(manifestPath, "utf8"));

const targets = [
  {
    key: "2001:nokia 5510",
    model: "Nokia 5510",
    filename: "2001-nokia-5510-exact.jpg",
    imageUrl: "https://images2.mobilissimo.ro/9yX/572f6ef9094b2.jpg",
    sourceUrl: "https://www.mobilissimo.ro/telefoane/nokia/5510/",
    credit: "Mobilissimo",
    license: "Source-site editorial image",
  },
  {
    key: "2002:nokia 7650",
    model: "Nokia 7650",
    filename: "2002-nokia-7650-exact.jpg",
    imageUrl: "https://expusimages.blob.core.windows.net/assets/products/01160_w.jpg",
    sourceUrl: "https://www.expus.gr/products/Mobile_Phones/Nokia/01160",
    credit: "Expus",
    license: "Source-site product image",
  },
  {
    key: "2003:nokia n-gage",
    model: "Nokia N-Gage",
    filename: "2003-nokia-n-gage-exact.png",
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/9/91/Nokia_N-Gage.png",
    sourceUrl: "https://commons.wikimedia.org/wiki/File:Nokia_N-Gage.png",
    credit: "J-P Kärnä / Wikimedia Commons",
    license: "CC BY-SA 3.0",
  },
];

function validImage(bytes) {
  return (
    (bytes[0] === 0xff && bytes[1] === 0xd8 && bytes[2] === 0xff) ||
    (bytes[0] === 0x89 && bytes[1] === 0x50 && bytes[2] === 0x4e && bytes[3] === 0x47)
  );
}

for (const target of targets) {
  const response = await fetch(target.imageUrl, {
    headers: { "user-agent": "BackTo2000Archive/0.1 (Nokia image quality pass)" },
  });
  if (!response.ok) throw new Error(`${target.model}: download failed (${response.status})`);

  const bytes = new Uint8Array(await response.arrayBuffer());
  if (!validImage(bytes) || bytes.byteLength < 5_000) {
    throw new Error(`${target.model}: invalid image (${bytes.byteLength} bytes)`);
  }

  await writeFile(path.join(outputDir, target.filename), bytes);
  manifest[target.key] = {
    src: `/images/archive/milestones/${target.filename}`,
    alt: `${target.model} 실제 제품 전면 사진`,
    credit: target.credit,
    sourceUrl: target.sourceUrl,
    license: target.license,
    matchedTitle: target.model,
  };
  console.log(`OK ${target.model} · ${bytes.byteLength} bytes`);
}

const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
