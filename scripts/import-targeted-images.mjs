import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const outputDir = path.join(root, "public/images/archive/milestones");
const manifestPath = path.join(root, "domain/catalog/milestone-images.json");
const manifest = JSON.parse(await readFile(manifestPath, "utf8"));
await mkdir(outputDir, { recursive: true });

const images = [
  ["2004:canon eos-1d mark ii", "2004-canon-eos-1d-mark-ii.jpg", "https://pixy.org/src/551/5515082.jpg", "Canon EOS-1D Mark II DSLR 카메라 바디", "Pixy · CC0", "https://pixy.org/5515082/"],
  ["2005:xbox 360", "2005-xbox-360-console.jpg", "https://m.media-amazon.com/images/I/51HXn33gc9L._AC_UF1000%2C1000_QL80_.jpg", "초기형 흰색 Xbox 360 콘솔", "Amazon product media", "https://cyttestwp.rec.uba.ar/gbpps/v14084942.html"],
  ["2006:nintendo wii", "2006-nintendo-wii-console.jpg", "https://us.ftbpic.com/product-amz/wii-consoles/31K0Wss5DHL.__CR0%2C0%2C600%2C450.jpg", "흰색 Nintendo Wii 콘솔", "FindThisBest product archive", "https://www.findthisbest.com/best-wii-consoles"],
  ["2008:nikon d90", "2008-nikon-d90-camera.jpg", "https://c1.neweggimages.com/productimage/nb640/30-113-154-09.jpg", "Nikon D90 DSLR 카메라 바디", "Newegg product archive", "https://www.newegg.com/nikon-d90/p/N82E16830113154"],
  ["2010:kinect", "2010-kinect-sensor.jpg", "https://s2.elespanol.com/2020/07/17/actualidad/actualidad_505960178_155942640_1024x576.jpg", "Xbox 360용 Microsoft Kinect 모션 센서", "El Español product archive", "https://www.elespanol.com/omicrono/hardware/20200717/adios-kinect-xbox-microsoft-entierra-iconico-movimiento/505949837_0.html"],
  ["2010:macbook air 2010", "2010-macbook-air-product.jpg", "https://storage.googleapis.com/lk6-cataloging-storage-prod/source/a8/macbook-air-13-inch-2010.jpg", "2010년형 13인치 Apple MacBook Air", "Maujual product archive", "https://www.maujual.com/macbook/jual-apple-macbook-air-13-inch-2010"],
  ["2012:surface rt", "2012-surface-rt.jpg", "https://guide-images.cdn.ifixit.com/igi/eFbZFV2IMtL41FZM.medium", "Microsoft Surface RT 태블릿", "iFixit", "https://www.ifixit.com/Device/Microsoft_Surface_RT"],
  ["2012:oculus rift kickstarter", "2012-oculus-rift-dk1.webp", "https://virtualnyeochki.ru/new_webp_goods_images/13.webp", "Oculus Rift DK1 가상현실 헤드셋", "Virtualnye Ochki product archive", "https://virtualnyeochki.ru/shlem-virtualnoy-realnosti/oculus-rift-cena/oculus-rift-dk-1"],
  ["2013:google glass explorer edition", "2013-google-glass-explorer.jpg", "https://cit.duke.edu/wp-content/uploads/2014/08/Google_Glass_Main.jpg", "Google Glass Explorer Edition 제품 모습", "Duke University", "https://today.duke.edu/main-feed/161542"],
  ["2014:amazon echo", "2014-amazon-echo-first-generation.jpg", "https://d3gqasl9vmjfd8.cloudfront.net/8b823db0-2455-4174-a2dc-529e72ebf357.jpg", "1세대 Amazon Echo 스마트 스피커", "Woot product archive", "https://electronics.woot.com/offers/amazon-echo-1st-generation-1"],
  ["2015:amazon echo (public release)", "2015-amazon-echo-first-generation.jpg", "https://d3gqasl9vmjfd8.cloudfront.net/8b823db0-2455-4174-a2dc-529e72ebf357.jpg", "정식 판매된 1세대 Amazon Echo", "Woot product archive", "https://electronics.woot.com/offers/amazon-echo-1st-generation-1"],
  ["2016:playstation vr", "2016-playstation-vr.jpg", "https://upload.wikimedia.org/wikipedia/commons/8/81/Sony-PlayStation-4-PSVR-Headset-Mk1-FL.jpg", "1세대 Sony PlayStation VR 헤드셋", "Evan-Amos · Wikimedia Commons", "https://commons.wikimedia.org/wiki/File:Sony-PlayStation-4-PSVR-Headset-Mk1-FL.jpg"],
  ["2016:htc vive", "2016-htc-vive.jpg", "https://static.thinkmobiles.com/uploads/2017/12/vive.jpg", "초기형 HTC Vive 가상현실 헤드셋", "ThinkMobiles product archive", "https://thinkmobiles.com/blog/best-vr-hardware/"],
  ["2016:oculus rift cv1", "2016-oculus-rift-cv1.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Oculus-Rift-CV1-Headset-Front.jpg/1200px-Oculus-Rift-CV1-Headset-Front.jpg", "Oculus Rift CV1 전면 제품 모습", "Evan-Amos · Wikimedia Commons · Public domain", "https://commons.wikimedia.org/wiki/File:Oculus-Rift-CV1-Headset-Front.jpg"],
  ["2017:samsung galaxy s8", "2017-samsung-galaxy-s8.jpg", "https://id-live.slatic.net/original/6022fdbd400c7ef28a2d973cc49d37c9.jpg", "Midnight Black 색상의 Samsung Galaxy S8", "Lazada product archive", "https://aetatis-vasa.blogspot.com/2018/03/sale-stock-samsung-galaxy-s8-smartphone_25.html"],
  ["2019:samsung galaxy s10", "2019-samsung-galaxy-s10-official.jpg", "https://d2g44tvvp35wo2.cloudfront.net/photo/global/2019/02/20/GalaxyS10_PrismWhite_Front.jpg", "Prism White 색상의 Samsung Galaxy S10", "Samsung Newsroom", "https://news.samsung.com/medialibrary/global/photo/45822"],
];

let added = 0;
for (const [key, filename, url, alt, credit, sourceUrl] of images) {
  if (manifest[key]) continue;
  let response = await fetch(url, { headers: { "user-agent": "Mozilla/5.0 BackTo2000Archive/1.0", accept: "image/avif,image/webp,image/png,image/jpeg,*/*" } });
  if (!response.ok) response = await fetch(`https://wsrv.nl/?url=${encodeURIComponent(url)}&w=1200&output=jpg`);
  if (!response.ok) { console.log(`MISS ${key}: ${response.status}`); continue; }
  const bytes = new Uint8Array(await response.arrayBuffer());
  if (bytes.byteLength < 3000) { console.log(`MISS ${key}: too small`); continue; }
  await writeFile(path.join(outputDir, filename), bytes);
  manifest[key] = { src: `/images/archive/milestones/${filename}`, alt, credit, sourceUrl, license: "Source-site media terms", matchedTitle: key.split(":")[1] };
  added += 1;
}

const sorted = Object.fromEntries(Object.entries(manifest).sort(([a], [b]) => a.localeCompare(b)));
await writeFile(manifestPath, `${JSON.stringify(sorted, null, 2)}\n`, "utf8");
console.log(`Imported ${added}/${images.length}; manifest=${Object.keys(sorted).length}`);
