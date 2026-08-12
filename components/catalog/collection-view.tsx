"use client";

import { CatalogCard } from "@/components/catalog/catalog-card";
import { useCollectionIds } from "@/components/catalog/collection-store";
import type { CatalogItem } from "@/domain/catalog/types";

export function CollectionView({ catalog }: { catalog: CatalogItem[] }) {
  const ids = useCollectionIds();
  const items = catalog.filter((item) => ids.includes(item.id));
  return <div className="subpage page-width">
    <div className="subpage-head"><p className="eyebrow">YOUR MEMORY COLLECTION</p><h1 className="page-title">내가 써봤어요.</h1><p>선택한 웹사이트와 휴대폰을 한곳에 모았습니다.</p></div>
    {items.length
      ? <div className="card-grid">{items.map((item) => <CatalogCard key={item.id} item={item} />)}</div>
      : <div className="empty-state"><strong>아직 모아둔 기억이 없습니다.</strong><p>이미지를 탐색하고 마음에 드는 기억을 열어보세요.</p></div>}
  </div>;
}
