"use client";

import { AnimatePresence, motion, useReducedMotion } from "framer-motion";
import { Box, ChevronLeft, ChevronRight, Globe2, Maximize2, Smartphone, Volume2, VolumeX, X } from "lucide-react";
import Image from "next/image";
import { HardLink as Link } from "@/components/site/hard-link";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { isItemVisibleInYear, timelineYears } from "@/domain/catalog/data";
import type { CatalogItem } from "@/domain/catalog/types";

type GalleryItem = CatalogItem & { displayYear: number };

export function TimeExplorer({ catalog }: { catalog: CatalogItem[] }) {
  const [year, setYear] = useState<number>(1998);
  const [selected, setSelected] = useState<GalleryItem | null>(null);
  const [soundOn, setSoundOn] = useState(false);
  const [direction, setDirection] = useState(1);
  const explorerRef = useRef<HTMLElement>(null);
  const reduceMotion = useReducedMotion();
  const yearIndex = timelineYears.indexOf(year as (typeof timelineYears)[number]);
  const items = useMemo(() => {
    const kindOrder: Record<string, number> = { phone: 0, product: 1, service: 2, website: 3, program: 4, game: 5, event: 6 };
    return catalog
      .filter((item) => isItemVisibleInYear(item, year))
      .sort((a, b) => Number(Boolean(b.image)) - Number(Boolean(a.image)) || kindOrder[a.kind] - kindOrder[b.kind] || Number(Boolean(b.featured)) - Number(Boolean(a.featured)) || a.name.localeCompare(b.name))
      .map((item) => ({ ...item, displayYear: year }));
  }, [catalog, year]);

  const playTick = useCallback(() => {
    if (!soundOn) return;
    const AudioContextClass = window.AudioContext ?? (window as typeof window & { webkitAudioContext?: typeof AudioContext }).webkitAudioContext;
    if (!AudioContextClass) return;
    const context = new AudioContextClass();
    const oscillator = context.createOscillator();
    const gain = context.createGain();
    oscillator.frequency.value = 330;
    gain.gain.setValueAtTime(.035, context.currentTime);
    gain.gain.exponentialRampToValueAtTime(.001, context.currentTime + .08);
    oscillator.connect(gain).connect(context.destination);
    oscillator.start(); oscillator.stop(context.currentTime + .08);
    oscillator.addEventListener("ended", () => void context.close());
  }, [soundOn]);
  const setIndex = useCallback((value: number) => {
    const next = Math.max(0, Math.min(timelineYears.length - 1, value));
    if (next === yearIndex) return;
    setDirection(next > yearIndex ? 1 : -1);
    setYear(timelineYears[next]);
    playTick();
  }, [playTick, yearIndex]);
  const chooseYear = (value: number) => setIndex(timelineYears.indexOf(value as (typeof timelineYears)[number]));
  const toggleFullscreen = () => explorerRef.current && (document.fullscreenElement ? document.exitFullscreen() : explorerRef.current.requestFullscreen());
  useEffect(() => {
    const handleKey = (event: KeyboardEvent) => {
      if (event.target instanceof HTMLInputElement || event.target instanceof HTMLTextAreaElement) return;
      if (event.key === "ArrowLeft" || event.key === "ArrowDown") setIndex(yearIndex - 1);
      if (event.key === "ArrowRight" || event.key === "ArrowUp") setIndex(yearIndex + 1);
      if (event.key === "Escape") setSelected(null);
    };
    window.addEventListener("keydown", handleKey);
    return () => window.removeEventListener("keydown", handleKey);
  }, [setIndex, yearIndex]);

  return (
    <section className="time-explorer" id="explore" ref={explorerRef}>
      <div className="explorer-masthead">
        <div>
          <p>CURATED DIGITAL CULTURE · 1998—2020</p>
          <h1>Back to 2000</h1>
        </div>
        <div className="explorer-index" aria-label={`아카이브 콘텐츠 ${catalog.length}개`}>
          <span>ARCHIVE INDEX</span><strong>{catalog.length}</strong><small>OBJECTS</small>
        </div>
        <div className="time-tools"><button onClick={() => setSoundOn((value) => !value)} aria-label={soundOn ? "연도 이동 소리 끄기" : "연도 이동 소리 켜기"}>{soundOn ? <Volume2 /> : <VolumeX />}</button><button onClick={toggleFullscreen} aria-label="타임머신 전체화면"><Maximize2 /></button></div>
      </div>
      <aside className="vertical-timeline" aria-label="연도 선택">
        <div className="timeline-caption">
          <span>TIME</span><strong>{year}</strong>
          <div className="mobile-year-stepper">
            <button onClick={() => setIndex(yearIndex - 1)} disabled={yearIndex === 0} aria-label="이전 연도"><ChevronLeft /></button>
            <em>{year}</em>
            <button onClick={() => setIndex(yearIndex + 1)} disabled={yearIndex === timelineYears.length - 1} aria-label="다음 연도"><ChevronRight /></button>
          </div>
        </div>
        <div className="range-wrap">
          <input
            type="range" min="0" max={timelineYears.length - 1} step="1" value={yearIndex}
            onChange={(event) => setIndex(Number(event.target.value))}
            aria-label="연도 드래그"
          />
          <div className="range-years" aria-label="연도 빠른 선택">
            {timelineYears.map((item) => <button key={item} className={item === year ? "active" : ""} onClick={() => chooseYear(item)} aria-current={item === year ? "true" : undefined}>{item}</button>)}
          </div>
        </div>
        <p>막대를 위아래로<br />드래그해 보세요.</p>
      </aside>

      <div className="year-gallery">
        <div className="gallery-heading" aria-live="polite">
          <div><p>SELECTED YEAR</p><strong>{year}</strong><span>{items.length} objects</span></div>
          <p>이미지를 선택하면<br />크게 볼 수 있어요.</p>
        </div>
        <AnimatePresence mode="wait">
          <motion.div className="memory-stream" key={year} initial={{ opacity: 0, x: reduceMotion ? 0 : direction * 36 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: reduceMotion ? 0 : direction * -24 }} transition={{ duration: reduceMotion ? .12 : .42 }}>
            {items.map((item, index) => (
              <button className={`memory-tile tile-${(index % 5) + 1}`} key={item.id} onClick={() => setSelected(item)} style={{ "--accent": item.accent } as React.CSSProperties}>
                <MemoryVisual item={item} index={index} />
                <span className="memory-label"><small>{kindLabel(item.kind)}</small><strong>{item.name}</strong><em>{item.year}</em></span>
              </button>
            ))}
          </motion.div>
        </AnimatePresence>
        <div className="gallery-controls"><button onClick={() => setIndex(yearIndex - 1)} disabled={yearIndex === 0}><ChevronLeft /></button><span>{yearIndex + 1} / {timelineYears.length}</span><button onClick={() => setIndex(yearIndex + 1)} disabled={yearIndex === timelineYears.length - 1}><ChevronRight /></button></div>
      </div>

      <AnimatePresence>{selected && <MemoryViewer item={selected} close={() => setSelected(null)} />}</AnimatePresence>
    </section>
  );
}

function MemoryVisual({ item, index }: { item: GalleryItem; index: number }) {
  return <div className={`memory-visual kind-${item.kind}${item.image ? " has-photo" : ""}`}>{item.image ? <Image src={item.image.src} alt={item.image.alt} fill sizes="(max-width: 900px) 100vw, 40vw" /> : item.kind === "phone" ? <><div className="mini-phone"><div>{item.brand.slice(0, 3)}</div></div><Smartphone /></> : item.kind === "product" ? <div className="mini-product"><Box /><span>{item.brand}</span></div> : <><div className="mini-browser"><div className="mini-bar" /><strong>{item.name}</strong><div className="mini-search" /><div className="mini-lines"><i /><i /><i /></div></div><Globe2 /></>}<span className="visual-number">{String(index + 1).padStart(2, "0")}</span></div>;
}

function kindLabel(kind: CatalogItem["kind"]) {
  return ({ phone: "MOBILE", product: "PRODUCT", website: "WEBSITE", service: "SERVICE", program: "SOFTWARE", game: "GAME", event: "EVENT" } as const)[kind];
}

function MemoryViewer({ item, close }: { item: GalleryItem; close: () => void }) {
  return (
    <motion.div className="viewer-backdrop" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onMouseDown={(event) => event.target === event.currentTarget && close()}>
      <motion.article role="dialog" aria-modal="true" aria-label={`${item.name} 상세 미리보기`} className="memory-viewer" initial={{ opacity: 0, scale: .94, y: 20 }} animate={{ opacity: 1, scale: 1, y: 0 }} exit={{ opacity: 0, scale: .96 }} transition={{ type: "spring", damping: 24, stiffness: 260 }} style={{ "--accent": item.accent } as React.CSSProperties}>
        <button className="viewer-close" onClick={close} aria-label="닫기"><X /></button>
        <div className="viewer-image"><MemoryVisual item={item} index={0} /></div>
        <div className="viewer-copy"><p>{item.kind.toUpperCase()} · {item.kind === "phone" ? "출시" : "시작"} {item.year}</p><h3>{item.name}</h3><strong>{item.eyebrow}</strong><span>{item.description}</span><Link className="viewer-detail-link" href={`/archive/${item.id}`}>{item.kind === "game" ? "게임" : item.kind === "phone" || item.kind === "product" ? "제품" : "콘텐츠"} 이야기 자세히 보기</Link><div>{item.tags.map((tag) => <i key={tag}>{tag}</i>)}</div></div>
      </motion.article>
    </motion.div>
  );
}
