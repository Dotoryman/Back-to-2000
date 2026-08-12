import type { CatalogItem, ContentKind, Era } from "./types";

export const timelineYears = [1998, 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2015] as const;

export const eras: Era[] = timelineYears.map((year, index) => ({
  year,
  label: index < 3 ? "접속의 시대" : index < 6 ? "관계의 시대" : "모바일의 시대",
  summary: [
    "모뎀 소리 끝에 새로운 세계가 열리던 때",
    "포털과 커뮤니티가 일상의 입구가 되던 해",
    "월드컵과 메신저로 모두가 연결되던 순간",
    "미니홈피와 카메라폰이 나를 표현하던 해",
    "검색과 UCC, 슬림폰이 빠르게 번지던 시절",
    "풀터치폰과 모바일 인터넷의 예고편",
    "스마트폰이 생활의 중심으로 이동하던 해",
    "모바일 메신저와 앱이 당연해진 시간",
    "과거의 인터넷이 하나의 문화가 된 시점",
  ][index],
  accent: ["#7dd3fc", "#a78bfa", "#f0abfc", "#fb7185", "#fbbf24", "#34d399", "#22d3ee", "#60a5fa", "#c084fc"][index],
}));

export const catalog: CatalogItem[] = [
  {
    id: "web-naver", kind: "website", slug: "naver", name: "NAVER", brand: "네이버", year: 1999,
    eyebrow: "초록 검색창의 시작", summary: "지식iN과 통합검색으로 한국 인터넷의 첫 화면이 된 포털",
    description: "디렉터리 중심 검색에서 통합검색으로 이동하던 시기, 네이버는 한글 콘텐츠를 빠르게 모으며 일상의 출발점이 되었습니다.",
    tags: ["포털", "검색", "지식iN"], accent: "#03c75a", featured: true,
    highlights: ["한눈에 보이는 통합검색", "사용자가 답을 만드는 지식iN", "뉴스·카페·블로그가 연결된 포털"],
  },
  {
    id: "web-cyworld", kind: "website", slug: "cyworld", name: "Cyworld", brand: "싸이월드", year: 1999,
    eyebrow: "우리 사이 좋은 사이", summary: "도토리, 미니홈피, 일촌으로 기억되는 한국형 소셜 네트워크",
    description: "작은 방을 꾸미고 배경음악으로 마음을 전했습니다. 방문자 수와 일촌평은 온라인 관계의 온도를 보여주었습니다.",
    tags: ["SNS", "미니홈피", "도토리"], accent: "#f97316", featured: true,
    highlights: ["개성을 담은 미니룸", "도토리로 구매한 스킨과 BGM", "사진첩과 방명록 중심의 관계"],
  },
  {
    id: "web-daum", kind: "website", slug: "daum", name: "Daum", brand: "다음", year: 1997,
    eyebrow: "한메일에서 카페까지", summary: "메일과 카페 문화로 사람들을 한곳에 모은 1세대 포털",
    description: "한메일과 다음 카페는 온라인에서 편지를 쓰고 취향이 같은 사람을 만나는 가장 친숙한 방법이었습니다.",
    tags: ["포털", "메일", "카페"], accent: "#5b63ff",
    highlights: ["무료 웹메일 한메일", "주제별 커뮤니티 다음 카페", "뉴스와 검색이 결합된 포털"],
  },
  {
    id: "web-msn", kind: "service", slug: "msn-messenger", name: "MSN Messenger", brand: "Microsoft", year: 1999, endYear: 2013,
    eyebrow: "온라인이라는 신호", summary: "접속음과 대화명만으로도 친구의 기분을 알 수 있던 메신저",
    description: "친구가 로그인하면 작은 알림이 떴고, 대화명과 상태 메시지는 지금의 프로필보다 더 자주 바뀌었습니다.",
    tags: ["메신저", "채팅", "버디"], accent: "#38bdf8", featured: true,
    highlights: ["실시간 접속 알림", "감정을 담은 대화명", "윈도우와 함께한 글로벌 메신저"],
  },
  {
    id: "phone-sky-im-6500", kind: "phone", slug: "sky-im-6500", name: "SKY IM-6500", brand: "SKY", year: 2004,
    eyebrow: "It's different", summary: "휠 키와 감각적인 광고로 갖고 싶은 휴대폰이 된 SKY",
    description: "기능표보다 디자인과 감성이 먼저 기억나는 제품입니다. SKY는 휴대폰을 취향의 물건으로 바꾸었습니다.",
    tags: ["피처폰", "SKY", "휠키"], accent: "#e2e8f0", featured: true,
    specs: { 제조사: "팬택&큐리텔", 출시: "2004년", 형태: "슬라이드", 통신사: "SK텔레콤" },
    highlights: ["상징적인 휠 내비게이션", "미니멀한 슬라이드 디자인", "브랜드 감성을 만든 광고 캠페인"],
  },
  {
    id: "phone-anycall-haptic", kind: "phone", slug: "anycall-haptic", name: "Anycall HAPTIC", brand: "Samsung", year: 2008,
    eyebrow: "만지는 즐거움", summary: "위젯과 진동 피드백으로 풀터치폰 시대를 알린 애니콜",
    description: "손끝에 반응하는 진동과 화면 위 위젯은 스마트폰 직전의 모바일 경험을 대표했습니다.",
    tags: ["풀터치", "애니콜", "햅틱"], accent: "#fbbf24", featured: true,
    specs: { 제조사: "삼성전자", 출시: "2008년", 형태: "풀터치 바", 화면: "3.2인치" },
    highlights: ["터치에 반응하는 햅틱 피드백", "화면을 꾸미는 위젯 UI", "지상파 DMB와 200만 화소 카메라"],
  },
  {
    id: "phone-motorola-razr", kind: "phone", slug: "motorola-razr", name: "Motorola RAZR", brand: "Motorola", year: 2004,
    eyebrow: "얇음이 곧 스타일", summary: "메탈 소재와 극적인 슬림함으로 세계를 사로잡은 폴더폰",
    description: "RAZR는 기술 제품을 패션 액세서리처럼 보이게 만들었습니다. 펼치는 순간의 금속 키패드가 강렬했습니다.",
    tags: ["폴더폰", "모토로라", "레이저"], accent: "#fb7185",
    specs: { 제조사: "Motorola", 출시: "2004년", 형태: "폴더", 두께: "13.9mm" },
    highlights: ["항공기급 알루미늄 바디", "레이저 각인 키패드", "시대를 앞선 초슬림 실루엣"],
  },
  {
    id: "phone-iphone-3gs", kind: "phone", slug: "iphone-3gs", name: "iPhone 3GS", brand: "Apple", year: 2009,
    eyebrow: "한국의 스마트폰 전환점", summary: "앱스토어와 멀티터치 경험을 대중에게 각인시킨 아이폰",
    description: "손가락으로 웹을 확대하고 필요한 기능을 앱으로 내려받는 경험은 휴대폰의 기준을 완전히 바꾸었습니다.",
    tags: ["스마트폰", "Apple", "앱스토어"], accent: "#a78bfa", featured: true,
    specs: { 제조사: "Apple", 국내출시: "2009년", 저장공간: "8/16/32GB", 통신사: "KT" },
    highlights: ["정전식 멀티터치", "앱스토어 생태계", "데스크톱에 가까운 모바일 웹"],
  },
  {
    id: "service-nateon", kind: "service", slug: "nateon", name: "NateOn", brand: "SK Communications", year: 2003,
    eyebrow: "한국인의 업무 메신저", summary: "무료 문자와 원격제어로 MSN의 자리를 이어받은 메신저",
    description: "싸이월드 연동과 무료 문자, 파일 전송은 친구뿐 아니라 학교와 직장까지 연결했습니다.",
    tags: ["메신저", "무료문자", "싸이월드"], accent: "#fb7185",
    highlights: ["월 100건 무료 문자", "싸이월드 일촌 연동", "대용량 파일 전송과 원격제어"],
  },
];

export const categories: Array<{ slug: ContentKind | "popular"; name: string; description: string }> = [
  { slug: "website", name: "웹사이트", description: "첫 화면을 열면 시대가 보이던 포털과 커뮤니티" },
  { slug: "phone", name: "휴대폰", description: "손안의 물건으로 취향을 말하던 피처폰과 스마트폰" },
  { slug: "service", name: "서비스", description: "친구와 연결되고 나를 표현하던 온라인 서비스" },
  { slug: "popular", name: "인기 콘텐츠", description: "많은 시간여행자가 다시 찾는 기억" },
];

export const getItem = (kind: "website" | "phone", slug: string) =>
  catalog.find((item) => item.kind === kind && item.slug === slug);

export const getEra = (year: number) => eras.find((era) => era.year === year);

export const itemsNearYear = (year: number) =>
  catalog.filter((item) => Math.abs(item.year - year) <= 2);

export const searchCatalog = (query: string) => {
  const normalized = query.trim().toLocaleLowerCase("ko");
  if (!normalized) return [];
  return catalog.filter((item) =>
    [item.name, item.brand, item.summary, ...item.tags].join(" ").toLocaleLowerCase("ko").includes(normalized),
  );
};

