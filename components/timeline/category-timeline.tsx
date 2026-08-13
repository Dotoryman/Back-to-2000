"use client";
import { AnimatePresence, motion } from "framer-motion";
import { ChevronLeft, ChevronRight, Gamepad2, Globe2, Smartphone } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useMemo, useState } from "react";
import { isItemVisibleInYear, timelineYears } from "@/domain/catalog/data";
import type { CatalogItem } from "@/domain/catalog/types";
export type TimelineKind = "website" | "phone" | "game";
export function CategoryTimeline({ kind, catalog }: { kind: TimelineKind; catalog: CatalogItem[] }) {
  const [year, setYear] = useState<number>(kind === "website" ? 2000 : kind === "phone" ? 2004 : 1998);
  const index = timelineYears.indexOf(year as (typeof timelineYears)[number]);
  const items = useMemo(() => catalog
    .filter((item) => kind === "website" ? item.kind === "website" || item.kind === "service" : item.kind === kind)
    .filter((item) => isItemVisibleInYear(item, year))
    .sort((a, b) => a.kind.localeCompare(b.kind) || Math.abs(a.year - year) - Math.abs(b.year - year)), [catalog, kind, year]);
  const selectIndex = (next: number) => setYear(timelineYears[Math.max(0, Math.min(timelineYears.length - 1, next))]);
  return <section className={`category-timeline category-${kind}`}>
    <aside className="category-year-rail"><span>{kind === "website" ? "WEB" : kind === "phone" ? "MOBILE" : "GLOBAL GAME"} HISTORY</span><strong>{year}</strong><div className="category-mobile-stepper"><button onClick={() => selectIndex(index - 1)} disabled={index === 0} aria-label="이전 연도"><ChevronLeft /></button><em>{year}</em><button onClick={() => selectIndex(index + 1)} disabled={index === timelineYears.length - 1} aria-label="다음 연도"><ChevronRight /></button></div><input type="range" min="0" max={timelineYears.length - 1} value={index} onChange={(event) => selectIndex(Number(event.target.value))} aria-label={`${kind === "website" ? "웹사이트" : kind === "phone" ? "휴대전화" : "게임"} 연도 선택`} /><div className="category-year-list" aria-label="연도 빠른 선택">{timelineYears.map((item) => <button key={item} className={item === year ? "active" : ""} onClick={() => setYear(item)} aria-current={item === year ? "true" : undefined}>{item}</button>)}</div></aside>
    <div className="category-timeline-content"><div className="category-timeline-heading"><div>{kind === "website" ? <Globe2 /> : kind === "phone" ? <Smartphone /> : <Gamepad2 />}<p>{kind === "website" ? "검색·메신저·동영상으로 이어진 웹" : kind === "phone" ? "출시 연도로 살펴보는 시대의 디바이스" : "공개 테스트와 출시로 시작된 세계적인 플레이"}</p></div><h1>{kind === "website" ? "웹 & 서비스" : kind === "phone" ? "휴대전화" : "글로벌 게임"}<br />타임라인</h1></div><AnimatePresence mode="wait"><motion.div className="timeline-story" key={year} initial={{ opacity: 0, x: 28 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -18 }}>{items.map((item, itemIndex) => <TimelineStoryCard key={item.id} item={item} number={itemIndex + 1} />)}</motion.div></AnimatePresence><div className="category-controls"><button onClick={() => selectIndex(index - 1)} disabled={index === 0}><ChevronLeft /></button><span>{year}</span><button onClick={() => selectIndex(index + 1)} disabled={index === timelineYears.length - 1}><ChevronRight /></button></div></div>
  </section>;
}
function TimelineStoryCard({ item, number }: { item: CatalogItem; number: number }) { return <article className="timeline-story-card near"><div className={item.image ? "timeline-story-image has-photo" : "timeline-story-image"} style={{ "--accent": item.accent } as React.CSSProperties}>{item.image ? <Image src={item.image.src} alt={item.image.alt} fill sizes="(max-width: 900px) 100vw, 40vw" /> : item.kind === "phone" ? <div className="timeline-phone"><div>{item.name.slice(0, 3)}</div></div> : <div className="timeline-browser"><i /><strong>{item.name}</strong><span /><span /></div>}<small>0{number}</small></div><div><p>{item.kind === "phone" ? "출시" : "시작"} {item.year} · {item.brand}</p><h2>{item.name}</h2><span>{item.summary}</span><Link className="timeline-detail-link" href={`/archive/${item.id}`}>이야기 자세히 보기</Link></div></article>; }
