"use client";

import Image from "next/image";
import { useState } from "react";
import type { CatalogItem } from "@/domain/catalog/types";

export function EvolutionCompare({ before, after }: { before: CatalogItem; after: CatalogItem }) {
  const [position, setPosition] = useState(50);
  if (!before.image || !after.image || before.id === after.id) return null;
  return <section className="evolution-compare">
    <header><p>THEN / NOW</p><h2>디자인의 변화를 직접 비교해 보세요.</h2></header>
    <div className="compare-stage" style={{ "--compare": `${position}%` } as React.CSSProperties}>
      <Image src={before.image.src} alt={before.image.alt} fill sizes="(max-width: 900px) 100vw, 70vw" />
      <div className="compare-after"><Image src={after.image.src} alt={after.image.alt} fill sizes="(max-width: 900px) 100vw, 70vw" /></div>
      <span className="compare-line" />
      <b className="compare-before-label">{before.year} · {before.name}</b><b className="compare-after-label">{after.year} · {after.name}</b>
      <input aria-label={`${before.name}과 ${after.name} 이미지 비교`} type="range" min="5" max="95" value={position} onChange={(event) => setPosition(Number(event.target.value))} />
    </div>
  </section>;
}
