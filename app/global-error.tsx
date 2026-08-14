"use client";

import { HardLink as Link } from "@/components/site/hard-link";

export default function GlobalError({ reset }: { error: Error & { digest?: string }; reset: () => void }) {
  return <html lang="ko"><body><main className="error-page page-width" role="alert"><p className="eyebrow">ARCHIVE RECOVERY</p><h1>화면을 다시<br />준비하고 있습니다.</h1><p>일시적인 오류입니다. 다시 시도해 주세요.</p><div><button onClick={reset}>다시 시도</button><Link href="/">첫 화면으로</Link></div></main></body></html>;
}
