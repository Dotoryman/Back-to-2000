"use client";

import { getDeviceKey } from "@/components/catalog/collection-store";
import { useState, type FormEvent } from "react";

type Mode = "login" | "register";

export function AuthForm() {
  const [mode, setMode] = useState<Mode>("login");
  const [error, setError] = useState("");
  const [busy, setBusy] = useState(false);

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = new FormData(event.currentTarget);
    const password = String(form.get("password") ?? "");
    if (mode === "register" && password !== String(form.get("passwordConfirm") ?? "")) {
      setError("비밀번호 확인이 일치하지 않습니다.");
      return;
    }
    setBusy(true);
    setError("");
    const body: Record<string, string> = { username: String(form.get("username") ?? ""), password };
    if (mode === "register") body.displayName = String(form.get("displayName") ?? "");
    try {
      const response = await fetch(`/api/auth/${mode}`, { method: "POST", headers: { "Content-Type": "application/json", "x-b2000-device": getDeviceKey() }, body: JSON.stringify(body) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error ?? "요청을 완료하지 못했습니다.");
      window.location.assign("/collection");
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "요청을 완료하지 못했습니다.");
      setBusy(false);
    }
  }

  return <div className="auth-panel">
    <div className="auth-tabs" role="tablist" aria-label="계정 메뉴">
      <button className={mode === "login" ? "active" : ""} onClick={() => { setMode("login"); setError(""); }} type="button">로그인</button>
      <button className={mode === "register" ? "active" : ""} onClick={() => { setMode("register"); setError(""); }} type="button">회원가입</button>
    </div>
    <form onSubmit={submit}>
      <p className="eyebrow">{mode === "login" ? "WELCOME BACK" : "CREATE YOUR ARCHIVE"}</p>
      <h1>{mode === "login" ? "기억을 이어보세요." : "나만의 기억을 시작하세요."}</h1>
      <p className="auth-intro">외부 계정 없이 Back to 2000 전용 아이디로 컬렉션을 안전하게 동기화합니다.</p>
      <label>아이디<input name="username" autoComplete="username" minLength={4} maxLength={24} pattern="[a-zA-Z0-9_]+" placeholder="영문, 숫자, 밑줄 4~24자" required /></label>
      {mode === "register" && <label>표시 이름<input name="displayName" autoComplete="nickname" minLength={2} maxLength={20} placeholder="컬렉션에 표시할 이름" required /></label>}
      <label>비밀번호<input name="password" type="password" autoComplete={mode === "login" ? "current-password" : "new-password"} minLength={mode === "login" ? 1 : 10} maxLength={128} placeholder={mode === "login" ? "비밀번호" : "10자 이상"} required /></label>
      {mode === "register" && <label>비밀번호 확인<input name="passwordConfirm" type="password" autoComplete="new-password" minLength={10} maxLength={128} placeholder="비밀번호를 한 번 더 입력" required /></label>}
      {error && <p className="auth-error" role="alert">{error}</p>}
      <button className="auth-submit" disabled={busy}>{busy ? "처리 중…" : mode === "login" ? "로그인" : "회원가입"}</button>
      {mode === "register" && <small>이메일을 수집하지 않으므로 아이디와 비밀번호를 잊으면 계정을 복구할 수 없습니다.</small>}
    </form>
  </div>;
}
