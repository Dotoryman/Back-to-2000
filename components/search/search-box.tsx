"use client";

import { ArrowRight, Search } from "lucide-react";
import { useRouter } from "next/navigation";
import { FormEvent, useState } from "react";

export function SearchBox({ compact = false, initialValue = "" }: { compact?: boolean; initialValue?: string }) {
  const [query, setQuery] = useState(initialValue);
  const router = useRouter();
  const submit = (event: FormEvent) => { event.preventDefault(); if (query.trim()) router.push(`/search?q=${encodeURIComponent(query.trim())}`); };
  return (
    <form className={compact ? "search-box compact" : "search-box"} onSubmit={submit} role="search">
      <Search size={compact ? 18 : 21} />
      <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="네이버, 싸이월드, SKY…" aria-label="추억 검색" />
      <button type="submit" aria-label="검색 실행"><ArrowRight size={19} /></button>
    </form>
  );
}

