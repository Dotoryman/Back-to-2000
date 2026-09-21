import type { Metadata } from "next";
import { HardLink as Link } from "@/components/site/hard-link";

export const metadata: Metadata = {
  title: "프로젝트 소개",
  description: "Back to 2000이 한국의 디지털 문화와 개인의 기억을 기록하는 방법을 소개합니다.",
};

export default function AboutPage() {
  return (
    <article className="about-page page-width">
      <p className="about-eyebrow">ABOUT THE ARCHIVE</p>
      <h1>기억은 함께 모을수록<br />더 선명해집니다.</h1>
      <div className="about-grid">
        <section>
          <h2>Back to 2000</h2>
          <p>
            1998년부터 2020년까지 한국의 인터넷, 휴대전화, 디지털 제품과 게임 문화를
            연도별로 돌아볼 수 있는 공개 아카이브입니다. 흩어진 기록을 한곳에 모아
            당시의 기술뿐 아니라 그 시절을 살았던 사람들의 경험도 함께 보존합니다.
          </p>
        </section>
        <section>
          <h2>함께 만드는 기록</h2>
          <p>
            빠진 항목이나 잘못된 정보는 누구나 제보할 수 있습니다. 프로젝트의 코드와
            개발 과정도 GitHub에 공개되어 있으며, 도움이 되었다면 Star로 저장하거나
            이슈와 코드 기여로 아카이브를 함께 가꿔 주세요.
          </p>
          <div className="about-actions">
            <Link href="https://github.com/Dotoryman/Back-to-2000" target="_blank" rel="noreferrer">
              GitHub에서 프로젝트 보기 ↗
            </Link>
            <Link href="/admin">자료 제보하기</Link>
          </div>
        </section>
      </div>
    </article>
  );
}
