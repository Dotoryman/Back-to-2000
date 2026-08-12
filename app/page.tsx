import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { ArrowDownRight, ArrowRight } from "lucide-react";
import { SearchBox } from "@/components/search/search-box";
import { TimeExplorer } from "@/components/home/time-explorer";

export const metadata: Metadata = { title: "Back to 2000", description: "그때의 인터넷과 휴대폰을 펼쳐보는 디지털 타임머신." };

export default function Home() {
  return <>
    <section className="new-hero">
      <div className="hero-paper" />
      <div className="hero-copy">
        <p className="serial">ARCHIVE 1998—2015 · SEOUL, KOREA</p>
        <h1>Back to<br /><em>2000</em></h1>
        <div className="hero-description"><p>인터넷으로<br />시간여행을 떠나보세요.</p><span>우리가 처음 만났던 웹과<br />손안의 작은 세계를 기록합니다.</span></div>
        <SearchBox compact />
      </div>
      <div className="hero-photo"><Image src="/images/archive-hero.png" alt="베이지색 CRT 모니터와 폴더폰이 놓인 2000년대 분위기의 정물" fill priority sizes="(max-width: 800px) 100vw, 58vw" /><span>GENERATED MOOD IMAGE · NOT AN ARCHIVAL SOURCE</span></div>
      <a href="#explore" className="enter-time">연도를 드래그해 탐험하기 <ArrowDownRight /></a>
    </section>
    <TimeExplorer />
    <section className="archive-note">
      <div><p>ABOUT THE ARCHIVE</p><h2>기억은 이미지에서<br />가장 먼저 시작됩니다.</h2></div>
      <div><p>연도를 고르면 그 시기의 웹사이트와 휴대폰이 한 번에 펼쳐집니다. 익숙한 장면을 골라 크게 보고, 곧 실제 자료와 이야기를 더 깊게 탐색할 수 있습니다.</p><Link href="/collection">내 추억 모아보기 <ArrowRight /></Link></div>
    </section>
  </>;
}

