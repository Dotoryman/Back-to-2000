"use client";

import { HardLink as Link } from "@/components/site/hard-link";
import { useEffect, useState } from "react";

export function CollectionAccountBar() {
  const [name, setName] = useState<string | null | undefined>(undefined);
  useEffect(() => { fetch("/api/auth/session", { cache: "no-store" }).then((response) => response.json() as Promise<{ authenticated: boolean; user?: { displayName: string } }>).then((data) => setName(data.authenticated ? data.user?.displayName ?? null : null)).catch(() => setName(null)); }, []);
  if (name === undefined) return null;
  return name
    ? <div className="collection-account-bar"><span><strong>{name}</strong>님의 컬렉션은 계정에 동기화되고 있습니다.</span><Link href="/account">계정 관리</Link></div>
    : <div className="collection-account-bar"><span>회원가입하면 이 컬렉션을 여러 기기에서 이어볼 수 있습니다.</span><Link href="/auth">로그인 · 회원가입</Link></div>;
}
