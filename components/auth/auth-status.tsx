"use client";

import { UserRound } from "lucide-react";
import { HardLink as Link } from "@/components/site/hard-link";
import { useEffect, useState } from "react";

export function AuthStatus() {
  const [name, setName] = useState<string | null>(null);
  const [loaded, setLoaded] = useState(false);
  useEffect(() => {
    let active = true;
    fetch("/api/auth/session", { cache: "no-store" }).then((response) => response.json()).then((data) => {
      if (active) setName(data.authenticated ? data.user.displayName : null);
    }).catch(() => {}).finally(() => { if (active) setLoaded(true); });
    return () => { active = false; };
  }, []);
  return <Link href={name ? "/account" : "/auth"} className="account-link" aria-label={name ? `${name} 계정` : "로그인 및 회원가입"}>
    <UserRound size={16} /><span>{loaded ? (name ?? "로그인") : "계정"}</span>
  </Link>;
}
