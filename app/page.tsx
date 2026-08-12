import Image from "next/image";
import Link from "next/link";
import { ArrowRight, Globe2, Smartphone } from "lucide-react";
import { TimeExplorer } from "@/components/home/time-explorer";

export default function Home() {
  return <>
    <TimeExplorer />
    <section className="category-showcase">
      <div className="showcase-intro">
        <p>COLLECTIONS</p>
        <h2>무엇을<br />다시 만나볼까요?</h2>
        <span>종류를 고르면 시간의 흐름을 따라<br />대표적인 장면들이 이어집니다.</span>
      </div>
      <Link href="/timelines/website" className="showcase-panel website-panel">
        <div className="showcase-copy">
          <Globe2 /><p>WEB &amp; SERVICE ARCHIVE</p><h3>웹 &amp; 서비스</h3>
          <span>네이버, 구글, 다음부터<br />메신저와 동영상 서비스까지.</span>
          <b>타임라인 보기 <ArrowRight /></b>
        </div>
        <div className="showcase-browser-stack real-archive-stack" aria-hidden="true">
          <div><Image src="/images/archive/naver-2000-clean.jpg" fill sizes="45vw" alt="2000년 네이버 홈페이지" /></div>
          <div><Image src="/images/archive/google-2004-clean.png" fill sizes="45vw" alt="2004년 Google 홈페이지" /></div>
          <div><Image src="/images/archive/daum-early.png" fill sizes="45vw" alt="2000년 무렵 다음 홈페이지" /></div>
        </div>
      </Link>
      <Link href="/timelines/phone" className="showcase-panel phone-panel">
        <div className="showcase-copy">
          <Smartphone /><p>MOBILE ARCHIVE</p><h3>휴대전화</h3>
          <span>Samsung, LG, Motorola, BlackBerry.<br />출시 연도로 이어지는 디바이스의 변화.</span>
          <b>타임라인 보기 <ArrowRight /></b>
        </div>
        <div className="showcase-photo real-phone-photo">
          <Image src="/images/archive/motorola-razr-v3.png" fill sizes="(max-width: 900px) 100vw, 55vw" alt="Motorola RAZR V3 닫힌 모습과 열린 모습" />
          <small>Raimond Spekking · CC BY-SA 4.0</small>
        </div>
      </Link>
    </section>
    <section className="archive-note">
      <div><p>ABOUT THE ARCHIVE</p><h2>기억은 이미지에서<br />가장 먼저 시작됩니다.</h2></div>
      <div><p>각 시대의 화면과 기기를 기록하고, 출처가 확인된 자료와 개인의 기억을 함께 보존합니다.</p><Link href="/collection">내 추억 모아보기 <ArrowRight /></Link></div>
    </section>
  </>;
}
