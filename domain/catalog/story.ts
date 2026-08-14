import type { CatalogItem } from "./types";

const kindName: Record<CatalogItem["kind"], string> = {
  website: "웹사이트",
  service: "온라인 서비스",
  phone: "휴대전화",
  product: "디지털 제품",
  program: "소프트웨어",
  game: "게임",
  event: "디지털 사건",
};

const lastingForm: Record<CatalogItem["kind"], string> = {
  website: "검색과 콘텐츠를 한 화면에서 발견하는 오늘날의 웹 경험",
  service: "모바일 앱과 플랫폼 안에서 이어지는 연결 방식",
  phone: "지금의 스마트폰 디자인과 사용 방식",
  product: "뒤이은 기기들의 형태와 사용 경험",
  program: "후속 버전과 오늘날의 디지털 작업 방식",
  game: "후속작과 장르 문법, 플레이 문화",
  event: "이후 산업과 이용자 문화의 변화",
};

const kindImpact: Record<CatalogItem["kind"], string> = {
  website: "정보를 찾고 읽는 화면의 구조를 새롭게 정의했습니다",
  service: "사람과 정보가 연결되는 속도와 일상의 습관을 바꾸었습니다",
  phone: "손에 쥐는 형태와 입력 방식, 이동 중의 소통 경험을 확장했습니다",
  product: "새로운 기술을 실제 생활에서 쓰는 구체적인 형태로 만들었습니다",
  program: "컴퓨터로 일하고 만들고 소통하는 방식을 넓혔습니다",
  game: "플레이 방식뿐 아니라 함께 즐기고 이야기하는 문화를 만들었습니다",
  event: "기술 산업과 이용자 문화가 다음 단계로 움직이는 전환점이 됐습니다",
};

export type CatalogStory = {
  identity: string;
  significance: string;
  legacy: string;
};

export function buildCatalogStory(item: CatalogItem, next?: CatalogItem): CatalogStory {
  const features = item.highlights.length > 0
    ? item.highlights.map((feature) => `‘${feature}’`).join(", ")
    : item.tags.slice(0, 3).join(", ");
  const themes = item.tags.slice(0, 3).join("·");

  return {
    identity: `${item.description} ${item.name}은 ${kindName[item.kind]}로서 ${features} 같은 특징을 앞세워 당대 이용자에게 기억됐습니다.`,
    significance: item.story?.significance ?? `${item.name}은 ${kindImpact[item.kind]}. ${item.year}년의 기술과 디자인이 무엇을 중요하게 여겼는지 보여주며, 뒤이은 제품과 서비스가 참고할 기준을 남겼습니다.`,
    legacy: item.story?.legacy ?? (next
      ? `${item.name}에서 보인 ${themes}의 흐름은 ${next.year}년의 ${next.name}으로 이어졌습니다. 형태와 기술은 달라졌지만, 사용자가 더 빠르고 자연스럽게 연결되기를 바랐던 방향은 후속 제품에서도 계속 발전했습니다.`
      : `${item.name} 자체는 사라졌거나 다른 모습으로 바뀌었더라도 ${themes}에 담긴 생각은 ${lastingForm[item.kind]} 속에 남아 있습니다. 그래서 이 항목은 단종·종료 여부와 관계없이 이후의 변화를 설명하는 기준점으로 기억됩니다.`),
  };
}

export function findNextEvolution(item: CatalogItem, catalog: CatalogItem[]) {
  return catalog
    .filter((candidate) => candidate.id !== item.id && candidate.brand === item.brand && candidate.kind === item.kind && candidate.year > item.year)
    .sort((a, b) => a.year - b.year)[0];
}

export function findEvolutionLineage(item: CatalogItem, catalog: CatalogItem[]) {
  const family = catalog
    .filter((candidate) => candidate.brand === item.brand && candidate.kind === item.kind)
    .sort((a, b) => a.year - b.year);
  const currentIndex = family.findIndex((candidate) => candidate.id === item.id);
  return family.filter((_, index) => Math.abs(index - currentIndex) <= 2);
}
