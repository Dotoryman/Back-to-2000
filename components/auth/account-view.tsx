"use client";

import { useEffect, useState, type FormEvent } from "react";

type Account = { user: { username: string; displayName: string }; isPublic: boolean };

export function AccountView() {
  const [account, setAccount] = useState<Account | null>(null);
  const [message, setMessage] = useState("");
  useEffect(() => {
    fetch("/api/auth/account", { cache: "no-store" }).then(async (response) => {
      if (response.status === 401) return window.location.replace("/auth");
      setAccount(await response.json() as Account);
    }).catch(() => setMessage("계정 정보를 불러오지 못했습니다."));
  }, []);

  async function save(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (!account) return;
    const form = new FormData(event.currentTarget);
    const response = await fetch("/api/auth/account", { method: "PATCH", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ displayName: form.get("displayName"), isPublic: form.get("isPublic") === "on" }) });
    const data = await response.json() as Account & { error?: string };
    if (!response.ok) return setMessage(data.error ?? "저장하지 못했습니다.");
    setAccount({ user: data.user, isPublic: data.isPublic });
    setMessage("프로필을 저장했습니다.");
  }

  async function logout() {
    await fetch("/api/auth/logout", { method: "POST" });
    window.location.assign("/");
  }

  async function changePassword(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = event.currentTarget;
    const data = new FormData(form);
    const newPassword = String(data.get("newPassword") ?? "");
    if (newPassword !== data.get("confirmPassword")) return setMessage("새 비밀번호 확인이 일치하지 않습니다.");
    const response = await fetch("/api/auth/password", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ currentPassword: data.get("currentPassword"), newPassword }) });
    const result = await response.json() as { error?: string };
    if (!response.ok) return setMessage(result.error ?? "비밀번호를 변경하지 못했습니다.");
    form.reset();
    setMessage("비밀번호를 변경하고 다른 기기의 로그인을 종료했습니다.");
  }

  async function remove(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (!confirm("계정과 저장된 컬렉션을 모두 삭제할까요? 이 작업은 되돌릴 수 없습니다.")) return;
    const form = new FormData(event.currentTarget);
    const response = await fetch("/api/auth/account", { method: "DELETE", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ password: form.get("password") }) });
    const data = await response.json() as { error?: string };
    if (!response.ok) return setMessage(data.error ?? "계정을 삭제하지 못했습니다.");
    window.location.assign("/");
  }

  if (!account) return <div className="account-loading">계정 정보를 불러오는 중입니다.</div>;
  return <div className="account-layout">
    <section className="account-card"><p className="eyebrow">MEMBER PROFILE</p><h1>{account.user.displayName}님의 Archive.</h1><p className="account-id">@{account.user.username}</p>
      <form onSubmit={save} className="account-form"><label>표시 이름<input name="displayName" defaultValue={account.user.displayName} minLength={2} maxLength={20} required /></label><label className="privacy-toggle" htmlFor="collection-public"><input id="collection-public" name="isPublic" type="checkbox" defaultChecked={account.isPublic} aria-label="컬렉션 공개 준비" /><span><strong>컬렉션 공개 준비</strong><small>공유 URL 기능이 추가될 때 공개할 수 있도록 설정합니다.</small></span></label><button>변경 저장</button></form>
      <button className="logout-button" onClick={() => void logout()}>로그아웃</button>{message && <p className="account-message" role="status">{message}</p>}
    </section>
    <div className="account-controls">
      <section className="security-card"><p className="eyebrow">ACCOUNT SECURITY</p><h2>비밀번호 변경</h2><p>변경을 완료하면 현재 기기를 제외한 모든 로그인 세션이 종료됩니다.</p><form onSubmit={changePassword}>
        <label>현재 비밀번호<input name="currentPassword" type="password" autoComplete="current-password" required /></label>
        <label>새 비밀번호<input name="newPassword" type="password" autoComplete="new-password" minLength={10} required /></label>
        <label>새 비밀번호 확인<input name="confirmPassword" type="password" autoComplete="new-password" minLength={10} required /></label>
        <button>비밀번호 변경</button>
      </form></section>
      <section className="danger-card"><p className="eyebrow">ACCOUNT CONTROL</p><h2>계정 삭제</h2><p>회원 정보와 서버에 동기화된 추억 컬렉션을 모두 삭제합니다.</p><form onSubmit={remove}><label>현재 비밀번호<input name="password" type="password" autoComplete="current-password" required /></label><button>계정 영구 삭제</button></form></section>
    </div>
  </div>;
}
