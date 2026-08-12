import type { CatalogItem, ContentKind } from "./types";
import milestoneImages from "./milestone-images.json";

type MilestoneSeed = [name: string, brand: string, kind: ContentKind];

const milestoneSeeds: Record<number, MilestoneSeed[]> = {
  1998: [["iMac G3","Apple","product"],["Windows 98","Microsoft","program"],["Dreamcast","Sega","product"],["Game Boy Color","Nintendo","product"],["Nokia 5110","Nokia","phone"],["PayPal","PayPal","service"],["MPMan F10","Saehan Information Systems","product"],["Furby","Tiger Electronics","product"],["StarCraft","Blizzard Entertainment","game"],["Mozilla Project","Mozilla Organization","service"]],
  1999: [["BlackBerry 850","Research In Motion","product"],["GeForce 256","NVIDIA","product"],["Nokia 3210","Nokia","phone"],["Napster","Napster","service"],["Blogger","Pyra Labs","service"],["LiveJournal","Danga Interactive","service"],["EverQuest","Sony Online Entertainment","game"],["Adobe InDesign","Adobe","program"],["Sega Dreamcast (Global)","Sega","product"],["AOL Instant Messenger 3.0","AOL","service"]],
  2000: [["PlayStation 2","Sony","product"],["Windows 2000","Microsoft","program"],["Mac OS X Public Beta","Apple","program"],["Google AdWords","Google","service"],["Baidu","Baidu","website"],["DeviantArt","DeviantArt","service"],["Habbo","Sulake","service"],["Trek ThumbDrive","Trek 2000","product"],["Sharp J-SH04","Sharp","phone"],["The Sims","Maxis","game"]],
  2001: [["iPod","Apple","product"],["Windows XP","Microsoft","program"],["Xbox","Microsoft","product"],["Nintendo GameCube","Nintendo","product"],["Wikipedia","Wikimedia Foundation","website"],["BitTorrent","Bram Cohen","service"],["iTunes","Apple","program"],["Mac OS X","Apple","program"],["Nokia 5510","Nokia","phone"],["PowerBook G4","Apple","product"]],
  2002: [["Xbox Live","Microsoft","service"],["BlackBerry 5810","Research In Motion","phone"],["Nokia 7650","Nokia","phone"],["iMac G4","Apple","product"],["Friendster","Friendster","service"],["Google News","Google","service"],["Froogle","Google","service"],["Mozilla 1.0","Mozilla","program"],["OpenOffice.org 1.0","OpenOffice.org","program"],["Kingdom Hearts","Square","game"]],
  2003: [["Skype","Skype Technologies","service"],["LinkedIn","LinkedIn","service"],["Myspace","Intermix Media","service"],["Steam","Valve","service"],["iTunes Store","Apple","service"],["BlackBerry 6210","Research In Motion","phone"],["Nokia N-Gage","Nokia","product"],["Power Mac G5","Apple","product"],["WordPress","WordPress Foundation","service"],["Safari","Apple","program"]],
  2004: [["Gmail","Google","service"],["Flickr","Ludicorp","service"],["Mozilla Firefox","Mozilla","program"],["PlayStation Portable","Sony","product"],["Nintendo DS","Nintendo","product"],["Ubuntu","Canonical","program"],["Digg","Digg","service"],["World of Warcraft","Blizzard Entertainment","game"],["Nokia 7610","Nokia","phone"],["Canon EOS-1D Mark II","Canon","product"]],
  2005: [["Google Maps","Google","service"],["Reddit","Reddit","service"],["Xbox 360","Microsoft","product"],["Google Talk","Google","service"],["Nokia N70","Nokia","phone"],["BlackBerry 8700","Research In Motion","phone"],["Bebo","Bebo","service"],["Etsy","Etsy","service"],["Google Analytics","Google","service"],["Mac mini","Apple","product"]],
  2006: [["Twitter","Twitter","service"],["Nintendo Wii","Nintendo","product"],["PlayStation 3","Sony","product"],["Google Docs","Google","service"],["Roblox","Roblox Corporation","service"],["Amazon S3","Amazon Web Services","service"],["MacBook Pro","Apple","product"],["Nokia N73","Nokia","phone"],["Google Calendar","Google","service"],["Windows Live Messenger","Microsoft","service"]],
  2007: [["iPhone","Apple","phone"],["Kindle","Amazon","product"],["Tumblr","Tumblr","service"],["Netflix Streaming","Netflix","service"],["Ustream","Ustream","service"],["Google Street View","Google","service"],["Hulu","Hulu","service"],["ASUS Eee PC","ASUS","product"],["Nokia N95","Nokia","phone"],["Android","Open Handset Alliance","program"]],
  2008: [["Apple App Store","Apple","service"],["HTC Dream","HTC","phone"],["Spotify","Spotify","service"],["Airbnb","Airbnb","service"],["Google Chrome","Google","program"],["GitHub","GitHub","service"],["Hulu Public Launch","Hulu","service"],["MacBook Air","Apple","product"],["Nokia 5800 XpressMusic","Nokia","phone"],["Nikon D90","Nikon","product"]],
  2009: [["Windows 7","Microsoft","program"],["iPhone 3GS","Apple","phone"],["WhatsApp","WhatsApp","service"],["Uber","Uber","service"],["Kickstarter","Kickstarter","service"],["Bing","Microsoft","service"],["Samsung Omnia II","Samsung","phone"],["Motorola Droid","Motorola","phone"],["Minecraft Alpha","Mojang","game"],["Foursquare","Foursquare","service"]],
  2010: [["iPad","Apple","product"],["Pinterest","Pinterest","service"],["Windows Phone 7","Microsoft","program"],["Kinect","Microsoft","product"],["Flipboard","Flipboard","service"],["Google TV","Google","service"],["MacBook Air 2010","Apple","product"],["FaceTime","Apple","service"],["Viber","Viber Media","service"],["Path","Path","service"]],
  2011: [["Samsung Galaxy S II","Samsung","phone"],["iPhone 4S","Apple","phone"],["Siri","Apple","service"],["Snapchat","Snap Inc.","service"],["Twitch","Twitch Interactive","service"],["Google+","Google","service"],["Chromebook","Google","product"],["Kindle Fire","Amazon","product"],["Minecraft 1.0","Mojang","game"],["PlayStation Vita","Sony","product"]],
  2012: [["iPhone 5","Apple","phone"],["Windows 8","Microsoft","program"],["Surface RT","Microsoft","product"],["Google Drive","Google","service"],["Tinder","Match Group","service"],["Raspberry Pi","Raspberry Pi Foundation","product"],["Oculus Rift Kickstarter","Oculus VR","product"],["Nokia Lumia 920","Nokia","phone"],["Wii U","Nintendo","product"],["Candy Crush Saga","King","game"]],
  2013: [["PlayStation 4","Sony","product"],["Xbox One","Microsoft","product"],["Samsung Galaxy S4","Samsung","phone"],["LG G2","LG","phone"],["Motorola Moto X","Motorola","phone"],["Chromecast","Google","product"],["Slack","Slack Technologies","service"],["Telegram","Telegram","service"],["Vine","Twitter","service"],["Google Glass Explorer Edition","Google","product"]],
  2014: [["iPhone 6","Apple","phone"],["Samsung Galaxy S5","Samsung","phone"],["LG G3","LG","phone"],["OnePlus One","OnePlus","phone"],["Amazon Echo","Amazon","product"],["Android Wear","Google","program"],["Musical.ly","Musical.ly","service"],["Google Cardboard","Google","product"],["Amazon Fire Phone","Amazon","phone"],["PlayStation TV","Sony","product"]],
  2015: [["Apple Watch","Apple","product"],["LG G4","LG","phone"],["Windows 10","Microsoft","program"],["Discord","Discord","service"],["Periscope","Twitter","service"],["Apple Music","Apple","service"],["YouTube Gaming","Google","service"],["Surface Book","Microsoft","product"],["Google Photos","Google","service"],["Amazon Echo (Public Release)","Amazon","product"]],
  2016: [["iPhone 7","Apple","phone"],["Samsung Galaxy S7","Samsung","phone"],["Google Pixel","Google","phone"],["AirPods","Apple","product"],["Douyin","ByteDance","service"],["Pokémon GO","Niantic","game"],["Instagram Stories","Meta","service"],["Google Assistant","Google","service"],["PlayStation VR","Sony","product"],["HTC Vive","HTC","product"],["Oculus Rift CV1","Oculus VR","product"]],
  2017: [["iPhone X","Apple","phone"],["Samsung Galaxy S8","Samsung","phone"],["Nintendo Switch","Nintendo","product"],["Fortnite","Epic Games","game"],["Xbox One X","Microsoft","product"],["Surface Laptop","Microsoft","product"],["Google Home Mini","Google","product"],["Essential Phone","Essential Products","phone"],["Microsoft Teams","Microsoft","service"],["Apple Watch Series 3","Apple","product"]],
  2018: [["iPhone XS","Apple","phone"],["Huawei Mate 20 Pro","Huawei","phone"],["Google Pixel 3","Google","phone"],["IGTV","Meta","service"],["YouTube Music","Google","service"],["Apple Watch Series 4","Apple","product"],["Pocophone F1","Xiaomi","phone"],["Oculus Go","Oculus","product"],["MacBook Air Retina","Apple","product"],["DJI Mavic 2 Pro","DJI","product"]],
  2019: [["Samsung Galaxy Fold","Samsung","phone"],["iPhone 11","Apple","phone"],["Samsung Galaxy S10","Samsung","phone"],["Motorola Razr 2019","Motorola","phone"],["Disney+","Disney","service"],["Apple TV+","Apple","service"],["Apple Arcade","Apple","service"],["Google Stadia","Google","service"],["AirPods Pro","Apple","product"],["Korea 5G Service","Korean Telecoms","service"]],
  2020: [["iPhone 12","Apple","phone"],["PlayStation 5","Sony","product"],["Xbox Series X","Microsoft","product"],["Clubhouse","Alpha Exploration Co.","service"],["Samsung Galaxy Z Flip","Samsung","phone"],["MacBook Air M1","Apple","product"],["AirPods Max","Apple","product"],["GeForce RTX 3080","NVIDIA","product"],["Apple Fitness+","Apple","service"],["HBO Max","WarnerMedia","service"]],
};

const kindCopy: Record<ContentKind, { eyebrow: string; tag: string }> = {
  website: { eyebrow: "웹의 새로운 입구", tag: "웹사이트" },
  service: { eyebrow: "새롭게 시작된 서비스", tag: "서비스" },
  phone: { eyebrow: "그해 출시된 휴대전화", tag: "휴대전화" },
  product: { eyebrow: "시대를 바꾼 신제품", tag: "제품" },
  program: { eyebrow: "새로운 디지털 도구", tag: "소프트웨어" },
  game: { eyebrow: "새롭게 등장한 플레이", tag: "게임" },
  event: { eyebrow: "기억할 디지털 사건", tag: "사건" },
};

const accents: Record<ContentKind, string> = {
  website: "#315b76", service: "#6f8fa8", phone: "#7b6554", product: "#9a7657",
  program: "#526b70", game: "#856858", event: "#5d6d7e",
};

const slugify = (value: string) => value.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");

function milestoneRole(name: string, kind: ContentKind) {
  const normalized = name.toLowerCase();

  if (kind === "phone") return "휴대전화";
  if (kind === "game") return "비디오 게임";
  if (kind === "website") return /baidu|google|froogle/i.test(name) ? "검색 웹사이트" : "정보를 탐색하고 공유하는 웹사이트";
  if (kind === "program") {
    if (/windows|mac os|android|ubuntu/i.test(name)) return "운영체제";
    if (/firefox|safari|chrome/i.test(name)) return "웹 브라우저";
    return "PC와 모바일에서 사용하는 소프트웨어";
  }
  if (kind === "service") {
    if (/messenger|talk|skype|viber|telegram|teams|discord|aim/i.test(normalized)) return "온라인 메신저·커뮤니케이션 서비스";
    if (/youtube|netflix|hulu|spotify|music|twitch|ustream|periscope|igtv|hbo max|disney\+|tv\+/i.test(name)) return "디지털 콘텐츠·스트리밍 서비스";
    if (/maps|street view|drive|s3|analytics|calendar|docs|photos/i.test(name)) return "웹 기반 정보·클라우드 서비스";
    if (/paypal|uber|airbnb|etsy|kickstarter|adwords/i.test(name)) return "온라인 거래·플랫폼 서비스";
    if (/facebook|twitter|linkedin|myspace|reddit|snapchat|tumblr|pinterest|clubhouse|vine|bebo|livejournal/i.test(name)) return "소셜 네트워크·커뮤니티 서비스";
    return "인터넷을 통해 제공된 온라인 서비스";
  }
  if (kind === "product") {
    if (/playstation|xbox|dreamcast|game boy|gamecube|nintendo|wii|switch|vita/i.test(name)) return "가정용·휴대용 게임기";
    if (/imac|macbook|powerbook|power mac|surface|chromebook|eee pc|raspberry pi/i.test(name)) return "개인용 컴퓨터";
    if (/ipod|airpods|walkman/i.test(name)) return "휴대용 오디오 기기";
    if (/kindle/i.test(name)) return "전자책 단말기";
    if (/geforce/i.test(name)) return "PC 그래픽 처리 장치";
    if (/canon|nikon|dji/i.test(name)) return "디지털 촬영 기기";
    if (/oculus|vive|playstation vr|google glass|cardboard/i.test(name)) return "가상·증강현실 기기";
    if (/apple watch|watch series/i.test(name)) return "스마트워치";
    return "소비자용 디지털 기기";
  }
  return kindCopy[kind].tag;
}

function milestoneDescription(name: string, brand: string, kind: ContentKind, year: number) {
  const role = milestoneRole(name, kind);
  const action = kind === "phone" || kind === "product" ? "출시한" : "공개한";
  const context = kind === "phone"
    ? "통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다."
    : kind === "product"
      ? "당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다."
      : kind === "program"
        ? "사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다."
        : kind === "game"
          ? "당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다."
          : kind === "website"
            ? "브라우저에서 정보와 콘텐츠를 찾고 이용할 수 있도록 만든 인터넷 공간입니다."
            : "인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.";

  return `${name}: ${brand}가 ${year}년에 ${action} ${role}입니다. ${context}`;
}

export const milestoneCatalog: CatalogItem[] = Object.entries(milestoneSeeds).flatMap(([yearText, seeds]) => {
  const year = Number(yearText);
  return seeds.map(([name, brand, kind], index) => {
    const image = milestoneImages[`${year}:${name.toLowerCase()}` as keyof typeof milestoneImages];
    return ({
    id: `milestone-${year}-${slugify(name) || index}`,
    kind,
    slug: slugify(name) || `${year}-${index + 1}`,
    name,
    brand,
    year,
    activeYears: [year],
    eyebrow: kindCopy[kind].eyebrow,
    summary: `${brand}가 ${year}년에 선보인 ${milestoneRole(name, kind)}`,
    description: milestoneDescription(name, brand, kind, year),
    tags: [kindCopy[kind].tag, String(year), brand],
    accent: accents[kind],
    highlights: [`${year}년 공개·출시`, brand, kindCopy[kind].tag],
    source: {
      label: "Wikipedia 출시 기록",
      url: `https://en.wikipedia.org/wiki/Special:Search?search=${encodeURIComponent(name)}`,
    },
    image,
  } satisfies CatalogItem);
  });
});

export const milestoneCounts = Object.fromEntries(
  Object.entries(milestoneSeeds).map(([year, items]) => [Number(year), items.length]),
);
