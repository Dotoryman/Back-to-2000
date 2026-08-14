import type { CatalogItem, ContentKind, Era } from "./types";
import { milestoneCatalog } from "./milestones";
import { gameCatalog } from "./games";

export const timelineYears = Array.from({ length: 23 }, (_, index) => 1998 + index);


export const eras: Era[] = timelineYears.map((year) => ({
  year,
  label: year < 2003 ? "접속의 시대" : year < 2010 ? "관계의 시대" : "모바일의 시대",
  summary: year < 2003
    ? "포털·검색·PC와 새로운 디지털 제품이 인터넷의 입구를 넓히던 시기"
    : year < 2010
      ? "메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기"
      : "스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기",
  accent: year < 2003 ? "#8b735e" : year < 2010 ? "#6f8fa8" : "#17324d",
}));

const coreCatalog: CatalogItem[] = [
  {
    id: "web-daum", kind: "website", slug: "daum", name: "Daum", brand: "다음", year: 1997, activeYears: [1998],
    eyebrow: "한메일에서 카페까지", summary: "메일과 카페 문화로 사람들을 한곳에 모은 1세대 포털",
    description: "한메일과 다음 카페는 온라인에서 편지를 쓰고 취향이 같은 사람을 만나는 가장 친숙한 방법이었습니다.",
    tags: ["포털", "메일", "카페"], accent: "#5b63ff", highlights: ["무료 웹메일 한메일", "주제별 커뮤니티 다음 카페", "뉴스와 검색이 결합된 포털"],
    source: { label: "Kakao 기업 연혁", url: "https://www.kakaocorp.com/page/detail/10810" },
    image: { src: "/images/archive/daum-early.png", alt: "2000년 무렵 다음 홈페이지 전체 화면", credit: "브런치 아카이브", sourceUrl: "https://brunch.co.kr/@830bfa34e0894d6/242", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "web-google", kind: "website", slug: "google", name: "Google", brand: "Google", year: 1998, activeYears: [1998],
    eyebrow: "검색에만 집중한 첫 화면", summary: "단순한 검색창 하나로 웹을 찾는 방법을 바꾼 글로벌 검색 서비스",
    description: "복잡한 포털형 화면과 달리 검색에 집중한 여백 많은 첫 화면은 빠르고 명확한 인터넷 경험의 상징이 되었습니다.",
    tags: ["검색", "글로벌", "검색엔진"], accent: "#4285f4", featured: true, highlights: ["검색에 집중한 미니멀한 첫 화면", "페이지 중요도를 반영한 검색", "전 세계 웹 문서로 이어지는 입구"],
    source: { label: "Google 공식 블로그", url: "https://blog.google/company-news/inside-google/company-announcements/marking-20ish-years-google/" },
    image: { src: "/images/archive/google-2004-clean.png", alt: "2004년 Google 홈페이지 전체 화면", credit: "Kapwing Museum of Websites", sourceUrl: "https://www.kapwing.com/museum-of-websites/google", license: "역사 기록용 · 출처 표기" },
  },
  {
    id: "web-naver", kind: "website", slug: "naver", name: "NAVER", brand: "네이버", year: 1999, activeYears: [1999],
    eyebrow: "초록 검색창의 시작", summary: "지식iN과 통합검색으로 한국 인터넷의 첫 화면이 된 포털",
    description: "디렉터리 중심 검색에서 통합검색으로 이동하던 시기, 네이버는 한글 콘텐츠를 빠르게 모으며 일상의 출발점이 되었습니다.",
    tags: ["포털", "검색", "지식iN"], accent: "#03c75a", featured: true, highlights: ["한눈에 보이는 통합검색", "사용자가 답을 만드는 지식iN", "뉴스·카페·블로그가 연결된 포털"],
    source: { label: "NAVER 회사 소개", url: "https://www.navercorp.com/naver/company" },
    image: { src: "/images/archive/naver-2000-clean.jpg", alt: "2000년 네이버 홈페이지 전체 화면", credit: "네이버 다이어리", sourceUrl: "https://blog.naver.com/naver_diary/150047725151", license: "© NAVER · 출처 표기" },
  },
  {
    id: "service-msn", kind: "service", slug: "msn-messenger", name: "MSN Messenger", brand: "Microsoft", year: 1999, endYear: 2013, activeYears: [1999],
    eyebrow: "온라인이라는 신호", summary: "접속 알림과 대화명으로 친구의 기분을 읽던 글로벌 메신저", description: "친구가 로그인하면 작은 알림이 떴고 대화명과 상태 메시지는 지금의 프로필보다 더 자주 바뀌었습니다.",
    tags: ["메신저", "채팅", "버디"], accent: "#38bdf8", featured: true, highlights: ["실시간 접속 알림", "감정을 담은 대화명", "윈도우와 함께한 글로벌 메신저"],
    source: { label: "Microsoft News", url: "https://news.microsoft.com/1999/07/21/msn-messenger-service-launches-worldwide/" },
    image: { src: "/images/archive/services/msn-messenger-4.6.png", alt: "2001년 MSN Messenger 4.6 친구 목록 화면", credit: "Microsoft / Wikipedia", sourceUrl: "https://en.wikipedia.org/wiki/MSN_Messenger", license: "역사 기록용 · 출처 표기" },
  },
  {
    id: "service-nateon", kind: "service", slug: "nateon", name: "NateOn", brand: "SK Communications", year: 2003, activeYears: [2003],
    eyebrow: "무료 문자와 메신저", summary: "무료 문자·파일 전송·원격제어로 국내 메신저의 중심이 된 서비스", description: "친구뿐 아니라 학교와 직장까지 연결하며 한국형 데스크톱 메신저 경험을 만들었습니다.",
    tags: ["메신저", "무료문자", "파일전송"], accent: "#fb7185", highlights: ["무료 문자", "대용량 파일 전송", "원격제어"],
    source: { label: "NateOn 서비스", url: "https://nateonweb.nate.com/" },
    image: { src: "/images/archive/services/nateon.png", alt: "네이트온 PC 메신저와 모바일 대화 화면", credit: "NATE Communications", sourceUrl: "https://natecorp.com/products_nateon", license: "© NATE Communications · 출처 표기" },
  },
  {
    id: "service-facebook", kind: "service", slug: "facebook", name: "Facebook", brand: "Meta", year: 2004, activeYears: [2004],
    eyebrow: "실명 기반 소셜 네트워크", summary: "프로필과 뉴스피드로 사람과 소식을 연결한 소셜 서비스", description: "2004년 시작해 프로필, 친구, 뉴스피드라는 소셜 웹의 문법을 대중화했습니다.",
    tags: ["SNS", "뉴스피드", "프로필"], accent: "#4267b2", highlights: ["실명 프로필", "친구 네트워크", "뉴스피드"],
    source: { label: "Facebook 10년 연혁", url: "https://time.com/4112/facebook-10-year-anniversary-history/" },
    image: { src: "/images/archive/services/facebook.svg", alt: "Facebook 로고", credit: "Meta / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Facebook_icon_2013.svg", license: "상표 · 출처 표기" },
  },
  {
    id: "service-youtube", kind: "service", slug: "youtube", name: "YouTube", brand: "Google", year: 2005, activeYears: [2005],
    eyebrow: "누구나 올리는 인터넷 영상", summary: "업로드·공유·구독으로 UCC와 크리에이터 시대를 연 동영상 서비스", description: "2005년 첫 영상과 베타 공개를 시작으로 웹에서 영상을 발견하고 공유하는 방식을 바꾸었습니다.",
    tags: ["동영상", "UCC", "스트리밍"], accent: "#ff0033", highlights: ["간편한 영상 업로드", "퍼가기와 공유", "채널 구독"],
    source: { label: "YouTube 공식 블로그", url: "https://blog.youtube/news-and-events/celebrating-10-years-of-youtube/" },
    image: { src: "/images/archive/services/youtube.svg", alt: "YouTube 로고", credit: "YouTube / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:YouTube_full-color_icon_(2017).svg", license: "상표 · 출처 표기" },
  },
  {
    id: "service-kakaotalk", kind: "service", slug: "kakaotalk", name: "KakaoTalk", brand: "Kakao", year: 2010, activeYears: [2010],
    eyebrow: "무료 모바일 메신저", summary: "전화번호 기반 무료 채팅으로 한국의 모바일 소통을 바꾼 메신저", description: "2010년 iOS와 Android에 출시되어 문자 중심이던 휴대폰 대화를 데이터 기반 채팅으로 이동시켰습니다.",
    tags: ["메신저", "모바일", "그룹채팅"], accent: "#fee500", highlights: ["무료 1:1·그룹 채팅", "전화번호 기반 친구", "이모티콘과 선물하기"],
    source: { label: "Kakao 공식 연혁", url: "https://www.kakaocorp.com/page/detail/10810" },
    image: { src: "/images/archive/services/kakaotalk.svg", alt: "KakaoTalk 로고", credit: "Kakao / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:KakaoTalk_logo.svg", license: "PD-textlogo · 상표" },
  },
  {
    id: "service-instagram", kind: "service", slug: "instagram", name: "Instagram", brand: "Meta", year: 2010, activeYears: [2010],
    eyebrow: "사진 한 장의 소셜 피드", summary: "정사각형 사진과 필터로 모바일 사진 문화를 만든 서비스", description: "스마트폰 카메라로 찍고 보정해 곧바로 공유하는 흐름을 하나의 일상으로 만들었습니다.",
    tags: ["SNS", "사진", "필터"], accent: "#d946ef", highlights: ["정사각형 사진", "사진 필터", "모바일 피드"],
    source: { label: "Instagram 공식 발표", url: "https://about.instagram.com/blog/announcements/instagram-turns-10" },
    image: { src: "/images/archive/services/instagram.svg", alt: "Instagram 로고", credit: "Meta / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Instagram_logo_2016.svg", license: "상표 · 출처 표기" },
  },
  {
    id: "service-line", kind: "service", slug: "line", name: "LINE", brand: "LINE", year: 2011, activeYears: [2011],
    eyebrow: "스티커로 말하는 메신저", summary: "통화와 캐릭터 스티커를 앞세워 아시아로 확장한 모바일 메신저", description: "2011년 시작해 풍부한 스티커와 무료 통화로 모바일 대화의 표현 범위를 넓혔습니다.",
    tags: ["메신저", "스티커", "무료통화"], accent: "#06c755", highlights: ["캐릭터 스티커", "무료 음성 통화", "글로벌 친구 연결"],
    source: { label: "LY Corporation 공식 연혁", url: "https://www.lycorp.co.jp/en/company/history/line/" },
    image: { src: "/images/archive/services/line.svg", alt: "LINE 메신저 로고", credit: "LINE / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:LINE_logo.svg", license: "PD-textlogo · 상표" },
  },
  {
    id: "service-tiktok", kind: "service", slug: "tiktok", name: "TikTok", brand: "ByteDance", year: 2017, activeYears: [2017],
    eyebrow: "짧은 영상의 무한 피드", summary: "세로형 숏폼과 추천 피드로 모바일 영상 소비를 바꾼 서비스", description: "짧은 세로 영상과 음악, 알고리즘 추천이 결합되며 영상 유행의 속도를 크게 높였습니다.",
    tags: ["숏폼", "동영상", "추천피드"], accent: "#25f4ee", highlights: ["세로형 짧은 영상", "음악과 챌린지", "개인화 추천 피드"],
    source: { label: "TikTok Newsroom", url: "https://newsroom.tiktok.com/en-us/5-years-of-tiktok" },
    image: { src: "/images/archive/services/tiktok.svg", alt: "TikTok 로고", credit: "TikTok / Simple Icons", sourceUrl: "https://simpleicons.org/?q=tiktok", license: "상표 · 출처 표기" },
  },
  {
    id: "service-zoom", kind: "service", slug: "zoom", name: "Zoom", brand: "Zoom", year: 2013, activeYears: [2013],
    eyebrow: "2020년의 회의실", summary: "비대면 수업과 회의를 일상으로 만든 화상 커뮤니케이션 서비스", description: "2020년에는 집과 학교, 사무실을 화상 화면으로 연결하는 대표적인 도구가 되었습니다.",
    tags: ["화상회의", "비대면", "수업"], accent: "#2d8cff", highlights: ["간편한 회의 링크", "화면 공유", "갤러리 보기"],
    source: { label: "Zoom 공식 회사 소개", url: "https://www.zoom.com/en/about/" },
    image: { src: "/images/archive/services/zoom.svg", alt: "Zoom 로고", credit: "Zoom / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Zoom_Communications_Logo.svg", license: "상표 · 출처 표기" },
  },

  {
    id: "phone-samsung-sch800", kind: "phone", slug: "samsung-sch-800", name: "Anycall SCH-800", brand: "Samsung", year: 1998,
    eyebrow: "한국형 폴더폰의 시작", summary: "작은 폴더 구조로 휴대성을 강조한 초기 애니콜", description: "1998년 출시된 SCH-800은 삼성 휴대전화 디자인이 바 타입에서 폴더형으로 이동하던 장면을 보여줍니다.",
    tags: ["애니콜", "폴더폰", "CDMA"], accent: "#8b735e", specs: { 제조사: "삼성전자", 출시: "1998년", 형태: "폴더" }, highlights: ["컴팩트 폴더 구조", "CDMA 휴대전화", "초기 애니콜 디자인"],
    source: { label: "Samsung Design History", url: "https://design.samsung.com/global/contents/design-history/product.html" },
    story: { significance: "국내 CDMA 시장에서 애니콜의 존재감을 넓힌 초기 폴더형 모델로, 통화 기기였던 휴대전화가 몸에 지니는 디자인 제품으로 바뀌는 과정을 보여줍니다.", legacy: "이후 애니콜은 카메라·MP3·가로 화면 같은 기능을 폴더 구조 안에 결합했고, 그 계보는 Galaxy 시대의 모바일 디자인으로 이어졌습니다." },
    image: { src: "/images/archive/devices/samsung-sch-800-product.webp", alt: "검은색 Samsung Anycall SCH-800 폴더형 휴대전화의 닫힌 제품 모습", credit: "Bunjang 판매자 제공 이미지", sourceUrl: "https://globalbunjang.com/product/338954832", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-motorola-startac-st7760", kind: "phone", slug: "motorola-startac-st7760", name: "Motorola StarTAC ST7760", brand: "Motorola", year: 1998,
    eyebrow: "주머니에 들어간 CDMA 스타택", summary: "88g대 초경량 폴더 구조로 국내 휴대전화의 크기와 디자인 경쟁을 앞당긴 디지털 StarTAC", description: "ST7760은 아날로그 StarTAC의 상징적인 접이식 구조를 CDMA 방식으로 옮긴 국내 정식 출시 모델입니다. 작은 몸체와 긴 대기시간을 내세워 휴대전화를 과시용 장비에서 일상적으로 지니는 물건으로 바꿨습니다.",
    tags: ["Motorola", "StarTAC", "CDMA"], accent: "#504840", featured: true, specs: { 제조사: "Motorola", 국내출시: "1998년 10월", 형태: "폴더", 무게: "약 88~99g" }, highlights: ["CDMA 디지털 방식", "초소형 폴더 구조", "국내 130만 대 이상 판매"],
    story: { significance: "1996년 시작된 StarTAC 디자인을 국내 CDMA 환경에 맞춰 확장해, 1990년대 후반 휴대전화 경량화와 폴더형 경쟁을 촉발한 상징적인 제품입니다.", legacy: "한 손으로 열고 닫는 폴더폰 문법은 2000년대 피처폰의 표준이 되었고, 오늘날 플립형 폴더블 스마트폰에서도 그 기억이 다시 해석되고 있습니다." },
    source: { label: "전자신문 국내 출시 기록", url: "https://www.etnews.com/199809240132" },
    image: { src: "/images/archive/devices/motorola-startac-st7760.jpg", alt: "검은색 Motorola StarTAC 7760을 펼쳐 화면과 숫자 키패드를 보인 제품 사진", credit: "eBay product archive", sourceUrl: "https://www.ebay.fr/itm/256575609548", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-anycall-sch-v500", kind: "phone", slug: "anycall-sch-v500", name: "Anycall SCH-V500", brand: "Samsung", year: 2004,
    eyebrow: "화면을 돌린 가로본능", summary: "세로 화면이라는 상식을 깨고 LCD를 가로로 회전시킨 메가픽셀 VOD 폴더폰", description: "SCH-V500은 폴더를 연 뒤 화면을 90도로 돌려 사진과 VOD를 가로로 볼 수 있게 만든 애니콜입니다. 2.2인치 QVGA 화면, 메가픽셀 카메라, MP3와 3D 게임을 한 기기에 담았습니다.",
    tags: ["애니콜", "가로본능", "카메라폰"], accent: "#94a3b8", featured: true, specs: { 제조사: "삼성전자", 출시: "2004년 8월", 형태: "스위블 폴더", 가격: "70만원대" }, highlights: ["90도 회전 LCD", "메가픽셀 사진·동영상", "MP3·3D 게임"],
    story: { significance: "영상은 가로로 본다는 사용 습관을 휴대전화 폼팩터에 직접 반영해, 기능과 외형이 함께 경험을 설계할 수 있음을 보여준 제품입니다.", legacy: "회전·폴더·듀얼 스크린으로 이어진 실험적 폼팩터의 선례가 되었고, 모바일 영상 감상이 제품 형태를 바꾸는 흐름을 일찍 보여줬습니다." },
    source: { label: "Samsung Newsroom 출시 기록", url: "https://news.samsung.com/kr/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EA%B0%80%EB%A1%9C%ED%99%94%EB%A9%B4-%EB%A9%94%EA%B0%80%ED%94%BD%EC%85%80vod%ED%8F%B0-%EC%B6%9C%EC%8B%9C" },
    image: { src: "/images/archive/devices/samsung-sch-v500.png", alt: "Anycall SCH-V500의 닫힌 모습과 화면을 가로로 돌려 연 모습", credit: "Samsung Electronics / Danawa DPG", sourceUrl: "https://dpg.danawa.com/mobile/news/view?boardSeq=64&listSeq=5329940", license: "역사 기록용 · 출처 표기" },
  },
  {
    id: "phone-curitel-ph-s3500", kind: "phone", slug: "curitel-ph-s3500", name: "Curitel PH-S3500", brand: "Pantech&Curitel", year: 2004,
    eyebrow: "동그란 3D 게임폰", summary: "원형 폴더와 전용 그래픽 칩으로 휴대전화를 손안의 게임기로 해석한 큐리텔", description: "PH-S3500은 원형 상판과 양손 조작용 방향·슈팅 버튼, 별도 3D 그래픽 가속칩을 결합한 피처폰입니다. MP3와 카메라까지 더해 모바일 엔터테인먼트 기기를 지향했습니다.",
    tags: ["큐리텔", "게임폰", "피처폰"], accent: "#b7a48d", specs: { 제조사: "팬택&큐리텔", 출시: "2004년 10월", 형태: "원형 폴더", 화면: "2.1인치 와이드 LCD" }, highlights: ["3D 그래픽 가속칩", "양손 게임 조작 버튼", "듀얼 스피커와 MP3"],
    story: { significance: "통화 중심 설계를 벗어나 특정 취미인 게임에 맞춰 외형과 버튼 배치를 바꾼 국내 피처폰 시대의 대담한 실험입니다.", legacy: "전용 게임폰은 주류가 되지 못했지만, 고성능 모바일 GPU와 게임 전용 액세서리·게이밍폰으로 이어지는 발상을 앞서 보여줬습니다." },
    source: { label: "전자신문 출시 보도", url: "https://www.etnews.com/200409300156" },
    image: { src: "/images/archive/devices/curitel-ph-s3500-device.webp", alt: "원형 외부 화면과 카메라가 보이는 은색 Curitel PH-S3500 실물 제품", credit: "Bunjang 판매자 제공 이미지", sourceUrl: "https://globalbunjang.com/product/352203507", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-ever-ktf-x7000", kind: "phone", slug: "ever-ktf-x7000", name: "EVER KTF-X7000", brand: "KTFT EVER", year: 2005,
    eyebrow: "주머니 속 DJ폰", summary: "128MB 메모리와 중저음 강화 이어폰으로 MP3폰 대중화를 겨냥한 EVER", description: "KTF-X7000은 최대 약 25곡을 담는 128MB 메모리, 1.3메가픽셀 카메라와 중저음 강화 기능을 갖춘 폴더폰입니다. 고가 MP3폰이 많던 시기에 30만원 후반대 가격을 앞세웠습니다.",
    tags: ["EVER", "DJ폰", "MP3폰"], accent: "#9ca3af", specs: { 제조사: "KTFT", 출시: "2005년 1월", 형태: "폴더", 가격: "30만원 후반대" }, highlights: ["128MB 내장 메모리", "중저음 3단계 강화", "1.3메가픽셀 카메라"],
    story: { significance: "휴대전화와 MP3 플레이어가 합쳐지던 시기에 음악 기능을 일부 고급형이 아닌 대중형 가격대로 끌어내린 제품입니다.", legacy: "휴대전화가 별도의 음악 재생기를 흡수한 흐름은 이후 스마트폰의 스트리밍·무선 이어폰 생태계로 확장됐습니다." },
    source: { label: "KTFT 출시 보도", url: "https://www.newswire.co.kr/newsRead.php?no=24920" },
    image: { src: "/images/archive/devices/ever-ktf-x7000.jpg", alt: "은색 EVER DJ KTF-X7000 폴더폰을 펼친 제품 모습", credit: "Bunjang 판매자 제공 이미지", sourceUrl: "https://globalbunjang.com/product/354687640", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-nokia-3310", kind: "phone", slug: "nokia-3310", name: "Nokia 3310", brand: "Nokia", year: 2000,
    eyebrow: "견고함의 아이콘", summary: "교체형 커버와 Snake II로 기억되는 세계적인 바 타입 휴대전화", description: "2000년 공개된 Nokia 3310은 단단한 인상과 긴 배터리, 손쉬운 커버 교체로 대중적인 휴대전화가 되었습니다.",
    tags: ["바폰", "Nokia", "Snake"], accent: "#4b76a5", specs: { 제조사: "Nokia", 출시: "2000년", 형태: "바" }, highlights: ["교체형 Xpress-on 커버", "Snake II", "긴 배터리 사용 시간"],
    source: { label: "Nokia 3310 제품 기록", url: "https://www.nokia.com/phones/en_int/nokia-3310" },
    image: { src: "/images/archive/devices/nokia-3310.jpg", alt: "Nokia 3310 실제 제품 사진", credit: "Rtz / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Nokia3310.jpg", license: "Public domain" },
  },
  {
    id: "phone-samsung-t100", kind: "phone", slug: "samsung-sgh-t100", name: "Samsung SGH-T100", brand: "Samsung", year: 2002,
    eyebrow: "천만 대 판매 모델", summary: "컬러 화면과 컴팩트한 폴더 디자인으로 세계 시장에서 사랑받은 Samsung 휴대전화", description: "2002년 출시된 SGH-T100은 삼성 휴대전화 최초의 천만 대 판매 모델로 기록됐습니다.",
    tags: ["Samsung", "폴더폰", "컬러LCD"], accent: "#8a7d70", specs: { 제조사: "삼성전자", 출시: "2002년", 형태: "폴더" }, highlights: ["TFT 컬러 LCD", "컴팩트 폴더", "글로벌 천만 대 판매"],
    source: { label: "Samsung Design History", url: "https://design.samsung.com/global/contents/design-history/product.html" },
    image: { src: "/images/archive/devices/samsung-sgh-t100.png", alt: "Samsung SGH-T100 전체 제품 이미지", credit: "AnVuong1222004 / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Samsung_SGH-T100_(1).png", license: "CC BY-SA 4.0" },
  },
  {
    id: "phone-motorola-razr", kind: "phone", slug: "motorola-razr", name: "Motorola RAZR V3", brand: "Motorola", year: 2004,
    eyebrow: "얇음이 곧 스타일", summary: "메탈 소재와 극적인 슬림함으로 세계를 사로잡은 폴더폰", description: "RAZR V3는 기술 제품을 패션 액세서리처럼 보이게 만들었습니다. 펼치는 순간의 금속 키패드가 강렬했습니다.",
    tags: ["폴더폰", "모토로라", "레이저"], accent: "#fb7185", featured: true, specs: { 제조사: "Motorola", 출시: "2004년", 형태: "폴더", 두께: "13.9mm" }, highlights: ["알루미늄 바디", "레이저 각인 키패드", "초슬림 실루엣"],
    source: { label: "Motorola 공식 연혁", url: "https://www.motorolasolutions.com/content/dam/msi/docs/about-us/history/motorola-history.pdf" },
    image: { src: "/images/archive/motorola-razr-v3.png", alt: "Motorola RAZR V3 닫힌 모습과 열린 모습 전체 이미지", credit: "Raimond Spekking / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Motorola_Razr_V3_montage_closed_open.png", license: "CC BY-SA 4.0" },
  },
  {
    id: "phone-sky-im-6500", kind: "phone", slug: "sky-im-6500", name: "SKY IM-6500", brand: "SKY", year: 2004,
    eyebrow: "It's different", summary: "휠 키와 감각적인 광고로 갖고 싶은 휴대폰이 된 SKY", description: "기능표보다 디자인과 감성이 먼저 기억나는 제품입니다. SKY는 휴대폰을 취향의 물건으로 바꾸었습니다.",
    tags: ["피처폰", "SKY", "휠키"], accent: "#e2e8f0", specs: { 제조사: "팬택&큐리텔", 출시: "2004년", 형태: "슬라이드" }, highlights: ["휠 내비게이션", "슬라이드 디자인", "감성 광고"],
    source: { label: "Danawa 제품 기록", url: "https://prod.danawa.com/info/?pcode=10122" },
    image: { src: "/images/archive/devices/sky-im-6500.jpg", alt: "SKY IM-6500 전체 제품 이미지", credit: "Danawa 제품 아카이브", sourceUrl: "https://prod.danawa.com/info/?pcode=10122", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-lg-chocolate", kind: "phone", slug: "lg-chocolate-kg800", name: "LG Chocolate KG800", brand: "LG", year: 2006,
    eyebrow: "초콜릿처럼 매끈한 슬라이드폰", summary: "검은 전면과 붉은 터치 키로 LG 디자인폰 시대를 연 제품", description: "2006년 글로벌 시장에 출시된 Chocolate은 기능보다 감성적 이름과 미니멀한 표면을 전면에 내세웠습니다.",
    tags: ["LG", "초콜릿폰", "슬라이드"], accent: "#b91c1c", specs: { 제조사: "LG전자", 출시: "2006년", 형태: "슬라이드" }, highlights: ["숨겨진 터치 키", "검정·빨강 컬러", "글로벌 디자인폰"],
    source: { label: "LG Mobile History", url: "https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/" },
    image: { src: "/images/archive/devices/lg-chocolate-kg800.jpg", alt: "LG Chocolate KG800 실물 사진", credit: "Petar Milošević / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:LG_KG800.jpg", license: "CC BY 4.0" },
  },
  {
    id: "phone-blackberry-pearl", kind: "phone", slug: "blackberry-pearl-8100", name: "BlackBerry Pearl 8100", brand: "BlackBerry", year: 2006,
    eyebrow: "업무용에서 일상용으로", summary: "작은 바디와 트랙볼, 카메라로 소비자 시장을 넓힌 BlackBerry", description: "2006년 출시된 Pearl은 기업용 이메일 기기의 인상을 벗고 음악과 카메라까지 담은 컴팩트한 스마트폰이었습니다.",
    tags: ["BlackBerry", "트랙볼", "스마트폰"], accent: "#475569", specs: { 제조사: "Research In Motion", 출시: "2006년", 형태: "바" }, highlights: ["Pearl 트랙볼", "SureType 키보드", "카메라와 미디어 기능"],
    source: { label: "BlackBerry 기기 연혁", url: "https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/" },
    image: { src: "/images/archive/devices/blackberry-pearl-8100-v032.jpg", alt: "소형 SureType 키보드와 트랙볼이 보이는 BlackBerry Pearl 8100 정면 제품", credit: "Newegg product archive", sourceUrl: "https://www.newegg.com/blackberry-pearl-2-2/p/N82E16875353043", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-anycall-haptic", kind: "phone", slug: "anycall-haptic", name: "Anycall HAPTIC", brand: "Samsung", year: 2008,
    eyebrow: "만지는 즐거움", summary: "위젯과 진동 피드백으로 풀터치폰 시대를 알린 애니콜", description: "손끝에 반응하는 진동과 화면 위 위젯은 스마트폰 직전의 모바일 경험을 대표했습니다.",
    tags: ["풀터치", "애니콜", "햅틱"], accent: "#fbbf24", specs: { 제조사: "삼성전자", 출시: "2008년", 형태: "풀터치 바" }, highlights: ["햅틱 피드백", "위젯 UI", "지상파 DMB"],
    source: { label: "Samsung Newsroom Korea", url: "https://news.samsung.com/kr/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%95%A0%EB%8B%88%EC%BD%9C-%ED%96%85%ED%8B%B1%ED%8F%B0-%EB%A7%88%EC%BC%80%ED%8C%85-%EB%B3%B8%EA%B2%A9-%EA%B0%80%EB%8F%99" },
    image: { src: "/images/archive/devices/samsung-anycall-haptic-device.webp", alt: "Samsung Anycall Haptic SCH-W420의 화면 구성을 보여주는 실물 제품 사진", credit: "The Register product archive", sourceUrl: "https://www.theregister.com/2008/03/26/samsung_anycall_w420/", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-blackberry-bold", kind: "phone", slug: "blackberry-bold-9000", name: "BlackBerry Bold 9000", brand: "BlackBerry", year: 2008,
    eyebrow: "쿼티 키보드의 완성", summary: "가죽 질감 후면과 정교한 키보드로 업무용 스마트폰의 상징이 된 모델", description: "2008년 출시된 Bold 9000은 빠른 이메일과 물리 키보드, 고급스러운 소재를 결합했습니다.",
    tags: ["BlackBerry", "QWERTY", "이메일"], accent: "#334155", specs: { 제조사: "Research In Motion", 출시: "2008년", 형태: "쿼티 바" }, highlights: ["풀 QWERTY 키보드", "트랙볼", "푸시 이메일"],
    source: { label: "BlackBerry 기기 연혁", url: "https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/" },
    image: { src: "/images/archive/devices/blackberry-bold-9000-v032.jpg", alt: "풀 QWERTY 키보드와 중앙 트랙볼이 선명한 BlackBerry Bold 9000 제품", credit: "PhonesData product archive", sourceUrl: "https://phonesdata.com/en/smartphones/blackberry/bold-9000-153/", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-galaxy-s", kind: "phone", slug: "galaxy-s", name: "Samsung Galaxy S", brand: "Samsung", year: 2010,
    eyebrow: "Galaxy S의 시작", summary: "Super AMOLED와 Android로 삼성 스마트폰 계보를 시작한 모델", description: "2010년 6월 출시된 첫 Galaxy S는 선명한 화면과 얇은 바디를 앞세워 글로벌 스마트폰 경쟁에 뛰어들었습니다.",
    tags: ["Samsung", "Galaxy", "Android"], accent: "#2563eb", specs: { 제조사: "삼성전자", 출시: "2010년 6월", 형태: "풀터치 바" }, highlights: ["Super AMOLED", "Android", "Galaxy S 시리즈의 시작"],
    source: { label: "Samsung Galaxy S 연혁", url: "https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s" },
    image: { src: "/images/archive/devices/samsung-galaxy-s.jpg", alt: "Samsung Galaxy S I9000 전체 실물 사진", credit: "Grobert / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Samsung_i9000_galaxy_s.jpeg", license: "CC BY-SA 3.0" },
  },
  {
    id: "phone-blackberry-torch", kind: "phone", slug: "blackberry-torch-9800", name: "BlackBerry Torch 9800", brand: "BlackBerry", year: 2010,
    eyebrow: "터치와 키보드의 공존", summary: "터치 화면 아래에 쿼티 키보드를 숨긴 슬라이드형 BlackBerry", description: "2010년 출시된 Torch는 기존 사용자의 물리 키보드와 새 스마트폰의 터치 경험을 함께 담았습니다.",
    tags: ["BlackBerry", "슬라이드", "터치"], accent: "#334155", specs: { 제조사: "Research In Motion", 출시: "2010년", 형태: "세로 슬라이드" }, highlights: ["터치 디스플레이", "슬라이드 QWERTY", "BlackBerry OS 6"],
    source: { label: "BlackBerry 기기 연혁", url: "https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/" },
    image: { src: "/images/archive/devices/blackberry-torch-9800-v032.jpg", alt: "세로 슬라이드를 열어 QWERTY 키보드를 드러낸 BlackBerry Torch 9800 제품", credit: "GSMOnline product review", sourceUrl: "https://gsmonline.pl/artykuly/blackberry-torch-9800-test-recenzja", license: "원저작자 권리 보유 · 출처 표기" },
  },
  {
    id: "phone-galaxy-s3", kind: "phone", slug: "galaxy-s3", name: "Samsung Galaxy S III", brand: "Samsung", year: 2012,
    eyebrow: "자연에서 가져온 곡선", summary: "큰 화면과 유기적인 디자인으로 Android 스마트폰 대중화를 이끈 모델", description: "2012년 5월 출시된 Galaxy S III는 4.8인치 화면과 둥근 디자인, 동작 인식 기능을 선보였습니다.",
    tags: ["Samsung", "Galaxy", "Android"], accent: "#4f86c6", specs: { 제조사: "삼성전자", 출시: "2012년 5월", 화면: "4.8인치" }, highlights: ["HD Super AMOLED", "Smart Stay", "자연을 닮은 디자인"],
    source: { label: "Samsung Galaxy S 연혁", url: "https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s" },
    image: { src: "/images/archive/devices/samsung-galaxy-s3.png", alt: "Samsung Galaxy S III 제품 이미지", credit: "GadgetsGuy / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S_III.png", license: "CC BY 3.0" },
  },
  {
    id: "phone-lg-optimus-g", kind: "phone", slug: "lg-optimus-g", name: "LG Optimus G", brand: "LG", year: 2012,
    eyebrow: "LG 스마트폰의 전환점", summary: "유리 일체형 디자인과 고성능 AP를 결합한 LG의 플래그십", description: "2012년 출시된 Optimus G는 이후 G 시리즈로 이어지는 LG 플래그십 스마트폰의 출발점이었습니다.",
    tags: ["LG", "Optimus", "Android"], accent: "#a21caf", specs: { 제조사: "LG전자", 출시: "2012년", 형태: "풀터치 바" }, highlights: ["크리스털 리플렉션", "Snapdragon S4 Pro", "G 시리즈의 기반"],
    source: { label: "LG Mobile History", url: "https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/" },
    image: { src: "/images/archive/devices/lg-optimus-g.jpg", alt: "LG Optimus G 실물 사진", credit: "LG전자 / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:LG_Optimus_G_(Black).jpg", license: "CC BY 2.0" },
  },
  {
    id: "phone-galaxy-s6", kind: "phone", slug: "galaxy-s6", name: "Samsung Galaxy S6", brand: "Samsung", year: 2015,
    eyebrow: "메탈과 글라스의 Galaxy", summary: "금속 프레임과 유리 후면으로 디자인 방향을 바꾼 플래그십", description: "2015년 공개된 Galaxy S6는 소재와 카메라, 곡면 화면을 통해 Galaxy 디자인의 큰 전환점을 만들었습니다.",
    tags: ["Samsung", "Galaxy", "메탈"], accent: "#38bdf8", specs: { 제조사: "삼성전자", 출시: "2015년", 형태: "풀터치 바" }, highlights: ["메탈·글라스 바디", "빠른 카메라 실행", "무선 충전"],
    source: { label: "Samsung Galaxy S 연혁", url: "https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s" },
    image: { src: "/images/archive/devices/samsung-galaxy-s6.png", alt: "Samsung Galaxy S6 제품 이미지", credit: "GadgetsGuy, GalaxyOptimus / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S6.png", license: "CC BY-SA 3.0" },
  },
  {
    id: "phone-moto-x-style", kind: "phone", slug: "moto-x-style", name: "Motorola Moto X Style", brand: "Motorola", year: 2015,
    eyebrow: "취향대로 고르는 Moto", summary: "큰 화면과 전면 스피커, 사용자 맞춤 디자인을 강조한 Android폰", description: "2015년 발표된 Moto X Style은 비교적 순정에 가까운 Android와 전면 스피커, Moto Maker 개인화를 앞세웠습니다.",
    tags: ["Motorola", "Moto X", "Android"], accent: "#14b8a6", specs: { 제조사: "Motorola", 출시: "2015년", 화면: "5.7인치" }, highlights: ["Moto Maker", "전면 스테레오 스피커", "순정형 Android"],
    source: { label: "Moto X Style 발표", url: "https://time.com/3975370/motorola-moto-x-style-play/" },
    image: { src: "/images/archive/devices/motorola-moto-x-style-device.webp", alt: "곡면 후면과 카메라 모듈이 선명한 Motorola Moto X Style 실물 제품", credit: "Kārlis Dambrāns / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Motorola_Moto_X_Style_(22033955888).jpg", license: "CC BY 2.0" },
  },
  {
    id: "phone-galaxy-s9", kind: "phone", slug: "galaxy-s9", name: "Samsung Galaxy S9", brand: "Samsung", year: 2018,
    eyebrow: "카메라를 다시 상상하다", summary: "가변 조리개 카메라와 인피니티 디스플레이를 다듬은 Galaxy", description: "2018년 3월 출시된 Galaxy S9은 어두운 환경에 대응하는 가변 조리개와 몰입형 화면을 강조했습니다.",
    tags: ["Samsung", "Galaxy", "카메라"], accent: "#7c3aed", specs: { 제조사: "삼성전자", 출시: "2018년 3월", 형태: "풀터치 바" }, highlights: ["듀얼 조리개", "Super Slow-mo", "Infinity Display"],
    source: { label: "Samsung 공식 출시", url: "https://news.samsung.com/global/samsung-electronics-officially-launches-galaxy-s9-and-s9-plus" },
    image: { src: "/images/archive/devices/samsung-galaxy-s9.png", alt: "Samsung Galaxy S9과 S9 Plus 제품 이미지", credit: "Samsung / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S9_and_S9_Plus.png", license: "CC BY 3.0" },
  },
  {
    id: "phone-blackberry-key2", kind: "phone", slug: "blackberry-key2", name: "BlackBerry KEY2", brand: "BlackBerry", year: 2018,
    eyebrow: "물리 키보드의 마지막 진화", summary: "Android와 쿼티 키보드를 결합한 생산성 중심 스마트폰", description: "2018년 출시된 KEY2는 앱 단축키와 보안 기능을 물리 키보드 경험에 결합했습니다.",
    tags: ["BlackBerry", "QWERTY", "Android"], accent: "#475569", specs: { 제조사: "TCL Communication", 출시: "2018년", 형태: "쿼티 바" }, highlights: ["Speed Key", "물리 QWERTY", "DTEK 보안"],
    source: { label: "BlackBerry KEY2 발표", url: "https://www.blackberry.com/us/en/company/newsroom/press-releases/2018/tcl-communication-introduces-the-all-new-blackberry-key2" },
    image: { src: "/images/archive/devices/blackberry-key2-v032.png", alt: "큰 터치 화면과 4열 물리 키보드가 모두 보이는 BlackBerry KEY2 정면 제품", credit: "KindPNG product image", sourceUrl: "https://www.kindpng.com/imgv/hwhwmhJ_blackberry-key2-hd-png-download/", license: "비상업적 사용 · 출처 표기" },
  },
  {
    id: "phone-galaxy-s20", kind: "phone", slug: "galaxy-s20", name: "Samsung Galaxy S20", brand: "Samsung", year: 2020,
    eyebrow: "5G와 고배율 카메라", summary: "120Hz 화면과 5G, 고화소 카메라로 2020년 플래그십 기준을 제시한 모델", description: "2020년 3월 출시된 Galaxy S20 시리즈는 빠른 화면과 고배율 촬영, 5G 연결을 핵심으로 내세웠습니다.",
    tags: ["Samsung", "Galaxy", "5G"], accent: "#93c5fd", specs: { 제조사: "삼성전자", 출시: "2020년 3월", 네트워크: "5G" }, highlights: ["120Hz 디스플레이", "고화소 카메라", "5G 연결"],
    source: { label: "Samsung 공식 발표", url: "https://news.samsung.com/us/introducing-samsung-galaxy-s20-5g-unpacked2020" },
    image: { src: "/images/archive/devices/samsung-galaxy-s20.jpg", alt: "Samsung Galaxy S20 전체 후면 실물 사진", credit: "Danish971 / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S20.jpg", license: "CC BY-SA 4.0" },
  },
  {
    id: "phone-lg-wing", kind: "phone", slug: "lg-wing", name: "LG WING", brand: "LG", year: 2020,
    eyebrow: "회전하는 두 개의 화면", summary: "메인 화면을 돌려 T자 형태로 사용하는 LG의 실험적인 스마트폰", description: "2020년 출시된 LG WING은 영상을 보며 다른 작업을 하는 스위블 구조로 폼팩터의 가능성을 탐색했습니다.",
    tags: ["LG", "스위블", "듀얼스크린"], accent: "#c084fc", specs: { 제조사: "LG전자", 출시: "2020년", 형태: "스위블" }, highlights: ["90도 회전 화면", "짐벌 모션 카메라", "멀티태스킹"],
    source: { label: "LG Mobile History", url: "https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/" },
    image: { src: "/images/archive/devices/lg-wing.jpg", alt: "LG WING 제품 전체 모습과 회전 화면 사용 예", credit: "LG전자 / Wikimedia Commons", sourceUrl: "https://commons.wikimedia.org/wiki/Category:LG_Wing", license: "CC BY 2.0" },
  },
];

const curatedCatalog = [...coreCatalog, ...gameCatalog];
const coreKeys = new Set(curatedCatalog.map((item) => `${item.year}:${item.name.toLocaleLowerCase()}`));
export const catalog: CatalogItem[] = [
  ...curatedCatalog,
  ...milestoneCatalog.filter((item) => item.kind !== "game" && !coreKeys.has(`${item.year}:${item.name.toLocaleLowerCase()}`)),
];

export const categories: Array<{ slug: ContentKind | "popular"; name: string; description: string }> = [
  { slug: "website", name: "웹사이트", description: "첫 화면을 열면 시대가 보이던 검색엔진과 포털" },
  { slug: "phone", name: "휴대폰", description: "손안의 물건으로 취향을 말하던 피처폰과 스마트폰" },
  { slug: "product", name: "제품", description: "PC·콘솔·웨어러블까지 디지털 생활을 바꾼 기념비적인 제품" },
  { slug: "service", name: "서비스", description: "메신저·동영상·소셜로 사람을 연결한 온라인 서비스" },
  { slug: "game", name: "게임", description: "공개 테스트와 출시를 거쳐 세계적인 놀이 문화가 된 게임" },
  { slug: "popular", name: "인기 콘텐츠", description: "많은 시간여행자가 다시 찾는 기억" },
];

export const getItem = (kind: "website" | "phone", slug: string) =>
  catalog.find((item) => item.kind === kind && item.slug === slug);

export const getEra = (year: number) => eras.find((era) => era.year === year);

export const isItemVisibleInYear = (item: CatalogItem, year: number) =>
  item.activeYears?.includes(year) ?? item.year === year;

export const itemsNearYear = (year: number) => catalog.filter((item) => isItemVisibleInYear(item, year));

export const searchCatalog = (query: string) => {
  const normalized = query.trim().toLocaleLowerCase("ko");
  if (!normalized) return [];
  return catalog.filter((item) =>
    [item.name, item.brand, item.summary, ...item.tags].join(" ").toLocaleLowerCase("ko").includes(normalized),
  );
};
