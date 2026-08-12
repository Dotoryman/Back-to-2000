import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const outputDir = path.join(root, "public/images/archive/milestones");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
const manifest = JSON.parse(await readFile(manifestPath, "utf8"));
await mkdir(outputDir, { recursive: true });

const images = [
  ["2000:trek thumbdrive", "2000-trek-thumbdrive.jpg", "https://www.techno-edge.net/imgs/p/nXpkkgAYtm6KDYo1w7-AdQ2eGJAWlZSTkpGQ/23332.jpg", "2000년 무렵 출시된 Trek ThumbDrive", "TechnoEdge", "https://www.techno-edge.net/article/2025/02/19/4123.html"],
  ["2004:canon eos-1d mark ii", "2004-canon-eos-1d-mark-ii.jpg", "https://www.districtcamera.com/cdn/shop/files/DSC_0010_2e10c66c-2f81-4a58-ae61-083b1e11e9ea.jpg?v=1778513600&width=3264", "Canon EOS-1D Mark II DSLR 카메라 바디", "District Camera product archive", "https://www.districtcamera.com/products/used-canon-eos-1d-mark-ii-dslr-camera-body"],
  ["2010:path", "2010-path-logo.png", "https://brandlogos.net/wp-content/uploads/2014/12/path_social_network-logo_brandlogos.net_aulpi.png", "Path 소셜 네트워크 앱 로고", "Brandlogos.net", "https://brandlogos.net/path-30668.html"],
  ["2013:motorola moto x", "2013-motorola-moto-x.jpg", "https://commons.wikimedia.org/wiki/Special:Redirect/file/Moto_X_(11236439494).jpg?width=1600", "2013년형 Motorola Moto X 1세대", "Anderson N. Leonardo · Wikimedia Commons · CC BY-SA 2.0", "https://commons.wikimedia.org/wiki/File:Moto_X_(11236439494).jpg"],
  ["2014:google cardboard", "2014-google-cardboard.jpg", "https://commons.wikimedia.org/wiki/Special:Redirect/file/Google-Cardboard.jpg?width=1600", "스마트폰을 장착한 Google Cardboard VR 뷰어", "Evan-Amos · Wikimedia Commons · Public domain", "https://commons.wikimedia.org/wiki/File:Google-Cardboard.jpg"],
  ["2016:airpods", "2016-airpods-first-generation.jpg", "https://www.apple.com/newsroom/images/product/airpods/standard/apple-airpods-1_big.jpg.large.jpg", "Apple AirPods 1세대", "Apple Newsroom", "https://www.apple.com/newsroom/2016/12/apple-airpods-are-now-available/"],
  ["2016:pokémon go", "2016-pokemon-go-logo.svg", "https://upload.wikimedia.org/wikipedia/commons/2/23/Pok%C3%A9mon_GO_logo.svg", "Pokémon GO 로고", "Wikimedia Commons · text logo", "https://commons.wikimedia.org/wiki/File:Pok%C3%A9mon_GO_logo.svg"],
  ["2016:htc vive", "2016-htc-vive.jpg", "https://upload.wikimedia.org/wikipedia/commons/a/ad/HTC_Vive_Virtual_Reality_Headset_and_Controllers.jpg", "HTC Vive 헤드셋과 모션 컨트롤러", "PB · Wikimedia Commons · CC BY-SA 4.0", "https://commons.wikimedia.org/wiki/File:HTC_Vive_Virtual_Reality_Headset_and_Controllers.jpg"],
  ["2016:oculus rift cv1", "2016-oculus-rift-cv1.jpg", "https://upload.wikimedia.org/wikipedia/commons/0/09/Oculus-Rift-CV1-Headset-Front.jpg", "Oculus Rift CV1 전면 제품 모습", "Evan-Amos · Wikimedia Commons · Public domain", "https://commons.wikimedia.org/wiki/File:Oculus-Rift-CV1-Headset-Front.jpg"],
  ["2019:korea 5g service", "2019-korea-5g-launch.jpg", "https://static.dw.com/image/48213756_605.jpg", "2019년 대한민국 SK Telecom 5G 상용화 행사", "DW / Reuters", "https://www.dw.com/en/starting-gun-fired-for-south-koreas-5g-network/a-48218685"],
  ["2009:motorola droid", "2009-motorola-droid.jpg", "https://upload.wikimedia.org/wikipedia/commons/3/32/Motorola-milestone-wikipedia.jpg", "Motorola Droid의 국제판인 Motorola Milestone", "Shritwod · Wikimedia Commons · CC BY-SA 3.0", "https://commons.wikimedia.org/wiki/File:Motorola-milestone-wikipedia.jpg"],
];

function isImage(bytes, filename) {
  if (filename.endsWith(".svg")) {
    return new TextDecoder().decode(bytes.slice(0, 512)).includes("<svg");
  }
  const jpeg = bytes[0] === 0xff && bytes[1] === 0xd8 && bytes[2] === 0xff;
  const png = bytes[0] === 0x89 && bytes[1] === 0x50 && bytes[2] === 0x4e && bytes[3] === 0x47;
  const webp = String.fromCharCode(...bytes.slice(0, 4)) === "RIFF" && String.fromCharCode(...bytes.slice(8, 12)) === "WEBP";
  return jpeg || png || webp;
}

let imported = 0;
for (const [key, filename, url, alt, credit, sourceUrl] of images) {
  let response = await fetch(url, { redirect: "follow", headers: { "user-agent": "Mozilla/5.0 BackTo2000Archive/1.0", accept: "image/avif,image/webp,image/png,image/jpeg,image/svg+xml,*/*" } });
  if (!response.ok) response = await fetch(`https://wsrv.nl/?url=${encodeURIComponent(url)}&w=1600&output=jpg`);
  if (!response.ok) { console.log(`MISS ${key}: ${response.status}`); continue; }
  const bytes = new Uint8Array(await response.arrayBuffer());
  if (bytes.byteLength < 1000 || !isImage(bytes, filename)) { console.log(`MISS ${key}: invalid image (${bytes.byteLength} bytes)`); continue; }
  await writeFile(path.join(outputDir, filename), bytes);
  manifest[key] = { src: `/images/archive/milestones/${filename}`, alt, credit, sourceUrl, license: credit.includes("Public domain") ? "Public domain" : "See source", matchedTitle: key.split(":")[1] };
  imported += 1;
  console.log(`OK ${key} (${bytes.byteLength} bytes)`);
}

const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
console.log(`Imported ${imported}/${images.length}; manifest=${Object.keys(sorted).length}`);
