import { HardLink as Link } from "@/components/site/hard-link";

export default function NotFound() {
  return <section className="error-page page-width" aria-labelledby="not-found-title">
    <p className="eyebrow">404 · LOST MEMORY</p>
    <h1 id="not-found-title">이 기억은<br />아카이브에 없습니다.</h1>
    <p>주소가 바뀌었거나 아직 기록되지 않은 콘텐츠입니다. 1998년의 첫 화면에서 다시 시간여행을 시작해 보세요.</p>
    <div><Link href="/">1998년으로 돌아가기</Link><Link href="/search">아카이브 검색</Link></div>
  </section>;
}
