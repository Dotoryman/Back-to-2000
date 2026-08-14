import { HardLink as Link } from "@/components/site/hard-link";

export function Footer() {
  return (
    <footer className="footer">
      <div><strong>Back to 2000</strong><p>인터넷과 휴대폰 문화의 기억을 함께 보존합니다.</p></div>
      <div className="footer-links"><Link href="/about">프로젝트 소개</Link><Link href="/admin">자료 제보</Link><span>© 2026</span></div>
    </footer>
  );
}

