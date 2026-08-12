import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const outputDir = path.join(root, "public/images/archive/milestones");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
await mkdir(outputDir, { recursive: true });

const images = [
  {
    key: "2011:playstation vita",
    filename: "2011-playstation-vita.jpg",
    url: "https://farosh.pk/front/images/products/super-traders-34/1-sony-wi-fi-play-station-vita-6-hours-game-play-7-hours-film-time-1g-489218.jpeg",
    alt: "Sony PlayStation Vita 제품 전체 모습",
    credit: "Farosh product archive",
    sourceUrl: "https://www.renewit.in/?n=96739409001390",
  },
  {
    key: "2014:lg g3",
    filename: "2014-lg-g3-product.jpg",
    url: "https://cdn.mos.cms.futurecdn.net/hw2aziRQz8XQdq4Dxdgbfd.jpg",
    alt: "LG G3 전면과 후면 제품 모습",
    credit: "TechRadar",
    sourceUrl: "https://www.techradar.com/news/a-history-of-every-lg-flagship-android-phone",
  },
  {
    key: "2017:iphone x",
    filename: "2017-iphone-x.webp",
    url: "https://www.mobiledokan.com/media/apple-iphone-x-silver-image.webp",
    alt: "Apple iPhone X 전면과 후면 제품 모습",
    credit: "MobileDokan product gallery",
    sourceUrl: "https://www.mobiledokan.com/mobile/apple-iphone-x/gallery",
  },
  {
    key: "2020:iphone 12",
    filename: "2020-iphone-12.jpg",
    url: "https://www.apple.com/newsroom/images/product/iphone/standard/apple_iphone-12_2-up_10132020_inline.jpg.large.jpg",
    alt: "Apple iPhone 12와 iPhone 12 mini 블루 제품 모습",
    credit: "Apple Newsroom",
    sourceUrl: "https://www.apple.com/newsroom/2020/10/apple-announces-iphone-12-and-iphone-12-mini-a-new-era-for-iphone-with-5g/",
  },
  {
    key: "2020:macbook air m1",
    filename: "2020-macbook-air-m1.jpg",
    url: "https://www.apple.com/newsroom/images/product/mac/standard/Apple_new-macbookair-wallpaper-screen_11102020_big.jpg.large.jpg",
    alt: "M1 칩을 탑재한 로즈 골드 MacBook Air 제품 모습",
    credit: "Apple Newsroom",
    sourceUrl: "https://www.apple.com/newsroom/2020/11/introducing-the-next-generation-of-mac/",
  },
  {
    key: "2020:airpods max",
    filename: "2020-airpods-max.jpg",
    url: "https://www.apple.com/newsroom/images/product/airpods/standard/apple_airpods-max_hero_12082020_big.jpg.large.jpg",
    alt: "실버 색상의 Apple AirPods Max 제품 모습",
    credit: "Apple Newsroom",
    sourceUrl: "https://www.apple.com/uk/newsroom/2020/12/apple-introduces-airpods-max-the-magic-of-airpods-in-a-stunning-over-ear-design/",
  },
  {
    key: "2020:xbox series x",
    filename: "2020-xbox-series-x.png",
    url: "https://cms-assets.xboxservices.com/assets/bc/40/bc40fdf3-85a6-4c36-af92-dca2d36fc7e5.png?n=642227_Hero-Gallery-0_A1_857x676.png",
    alt: "Xbox Series X 콘솔과 무선 컨트롤러 제품 모습",
    credit: "Xbox",
    sourceUrl: "https://www.xbox.com/en-US/consoles/xbox-series-x",
  },
  {
    key: "2020:samsung galaxy z flip",
    filename: "2020-samsung-galaxy-z-flip.jpg",
    url: "https://images.samsung.com/levant/smartphones/galaxy-s20/images/galaxy-s20_banner_bloom_m.jpg",
    alt: "Mirror Purple 색상의 Samsung Galaxy Z Flip 제품 모습",
    credit: "Samsung",
    sourceUrl: "https://news.samsung.com/us/galaxy-z-flip-unpacked2020-future-changes-shape",
  },
  {
    key: "2020:playstation 5",
    filename: "2020-playstation-5.png",
    url: "https://toppng.com/uploads/preview/ps5-official-console-and-controller-11642917902bt1yyuuzlx.png",
    alt: "Sony PlayStation 5 콘솔과 DualSense 컨트롤러 제품 모습",
    credit: "TOPpng product archive",
    sourceUrl: "https://toppng.com/free-image/ps5-official-console-and-controller-PNG-free-PNG-Images_475439",
  },
];

const manifest = JSON.parse(await readFile(manifestPath, "utf8"));
let imported = 0;
for (const image of images) {
  let response = await fetch(image.url, {
    headers: { "user-agent": "Mozilla/5.0 BackTo2000Archive/1.0", accept: "image/avif,image/webp,image/png,image/jpeg,*/*" },
  });
  if (!response.ok) {
    response = await fetch(`https://wsrv.nl/?url=${encodeURIComponent(image.url)}&w=1200&output=jpg`);
  }
  if (!response.ok) {
    console.warn(`SKIP ${image.key}: ${response.status}`);
    continue;
  }
  const bytes = new Uint8Array(await response.arrayBuffer());
  if (bytes.byteLength < 4000) {
    console.warn(`SKIP ${image.key}: image too small`);
    continue;
  }
  await writeFile(path.join(outputDir, image.filename), bytes);
  manifest[image.key] = {
    src: `/images/archive/milestones/${image.filename}`,
    alt: image.alt,
    credit: image.credit,
    sourceUrl: image.sourceUrl,
    license: "Source-site media terms",
    matchedTitle: image.key.split(":")[1],
  };
  imported += 1;
}

const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
console.log(`Imported ${imported}/${images.length} curated images; manifest now has ${Object.keys(sorted).length}.`);
