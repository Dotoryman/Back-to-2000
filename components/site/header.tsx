"use client";

import { Menu, Search, X } from "lucide-react";
import Link from "next/link";
import { useState } from "react";

const nav = [
  ["연도", "/years/2004"],
  ["웹사이트", "/categories/website"],
  ["휴대폰", "/categories/phone"],
  ["컬렉션", "/collection"],
];

export function Header() {
  const [open, setOpen] = useState(false);
  return (
    <header className="site-header">
      <div className="nav-shell">
        <Link href="/" className="wordmark" aria-label="Back to 2000 홈">B<span>·</span>2000</Link>
        <nav className={open ? "nav-links is-open" : "nav-links"} aria-label="주요 메뉴">
          {nav.map(([label, href]) => <Link key={href} href={href} onClick={() => setOpen(false)}>{label}</Link>)}
          <Link href="/admin" className="admin-link" onClick={() => setOpen(false)}>관리</Link>
        </nav>
        <div className="nav-actions">
          <Link href="/search" className="icon-button" aria-label="검색"><Search size={18} /></Link>
          <button className="icon-button menu-button" onClick={() => setOpen((value) => !value)} aria-label="메뉴 열기" aria-expanded={open}>
            {open ? <X size={19} /> : <Menu size={19} />}
          </button>
        </div>
      </div>
    </header>
  );
}

