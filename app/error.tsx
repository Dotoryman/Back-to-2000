"use client";

import { useEffect } from "react";
import { HardLink as Link } from "@/components/site/hard-link";

export default function ErrorPage({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error(JSON.stringify({ message: "route render failed", digest: error.digest, error: error.message }));
  }, [error]);
  return <section className="error-page page-width" role="alert" aria-labelledby="error-title">
    <p className="eyebrow">TEMPORARY ERROR</p>
    <h1 id="error-title">기억을 불러오지<br />못했습니다.</h1>
    <p>기록은 안전하게 보관되어 있습니다. 잠시 후 다시 시도하거나 첫 화면으로 돌아가 주세요.</p>
    <div><button onClick={reset}>다시 시도</button><Link href="/">첫 화면으로</Link></div>
  </section>;
}
