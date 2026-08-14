"use client";

import { CatalogCard } from "@/components/catalog/catalog-card";
import { refreshCollection, useCollection, type MemoryReaction } from "@/components/catalog/collection-store";
import type { CatalogItem } from "@/domain/catalog/types";
import { CollectionAccountBar } from "@/components/auth/collection-account-bar";

const reactionLabels: Record<MemoryReaction, string> = { used: "써봤어요", remembered: "기억나요", wanted: "갖고 싶었어요" };

export function CollectionView({ catalog }: { catalog: CatalogItem[] }) {
  const collection = useCollection();
  const items = catalog.filter((item) => collection.items[item.id]);
  const years = rank(items.map((item) => String(item.year)));
  const brands = rank(items.map((item) => item.brand));
  const reactions = Object.values(collection.items).reduce<Record<string, number>>((result, item) => ({ ...result, [item]: (result[item] ?? 0) + 1 }), {});
  const primeYear = years[0]?.[0];
  return <div className="subpage page-width">
    <div className="subpage-head collection-head"><p className="eyebrow">MY DIGITAL MEMORY</p><h1 className="page-title">나의 디지털 기억.</h1><p>제품과 서비스에 남긴 반응을 한곳에 모았습니다.</p></div>
    <CollectionAccountBar />
    {collection.loading && <div className="collection-loading">D1에서 나의 기억을 불러오는 중입니다.</div>}
    {collection.error && <button className="collection-retry" onClick={() => void refreshCollection()}>{collection.error} 다시 시도</button>}
    {!collection.loading && items.length > 0 && <>
      <section className="memory-profile">
        <div className="memory-result-card"><small>MY DIGITAL PRIME</small><strong>{primeYear ? `당신의 인터넷 전성기는 ${primeYear}년입니다.` : "당신의 디지털 전성기를 찾고 있습니다."}</strong><p>{brands[0] ? `${brands[0][0]}의 기억을 가장 많이 모았어요.` : "기억을 더 모으면 취향이 선명해집니다."}</p></div>
        <div className="memory-stat-grid">
          <span><small>COLLECTION</small><strong>{items.length}</strong><em>개의 기억</em></span>
          <span><small>TOP YEAR</small><strong>{primeYear ?? "—"}</strong><em>{years[0]?.[1] ?? 0}개의 선택</em></span>
          <span><small>TOP BRAND</small><strong>{brands[0]?.[0] ?? "—"}</strong><em>{brands[0]?.[1] ?? 0}개의 선택</em></span>
        </div>
        <div className="reaction-summary">{Object.entries(reactions).map(([key, count]) => <span key={key}><b>{reactionLabels[key as MemoryReaction]}</b>{count}</span>)}</div>
      </section>
      <div className="collection-grid">{items.map((item) => <div key={item.id} className="collection-card-wrap"><span>{reactionLabels[collection.items[item.id]]}</span><CatalogCard item={item} /></div>)}</div>
    </>}
    {!collection.loading && !items.length && <div className="empty-state"><strong>아직 모아둔 기억이 없습니다.</strong><p>제품과 서비스를 열고 ‘써봤어요’, ‘기억나요’, ‘갖고 싶었어요’ 중 하나를 남겨보세요.</p></div>}
  </div>;
}

function rank(values: string[]) {
  return Object.entries(values.reduce<Record<string, number>>((result, value) => ({ ...result, [value]: (result[value] ?? 0) + 1 }), {})).sort((a, b) => b[1] - a[1]);
}
