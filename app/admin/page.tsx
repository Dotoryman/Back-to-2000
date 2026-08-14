import type { Metadata } from "next";
import { headers } from "next/headers";
import { ContentForm } from "@/components/admin/content-form";
import { AdminStudio } from "@/components/admin/admin-studio";
import { getAdminAccess } from "@/infrastructure/auth/admin";
export const metadata: Metadata = { title:"콘텐츠 관리", robots:{index:false,follow:false} };
export const dynamic = "force-dynamic";
export default async function AdminPage() {
  const access = await getAdminAccess(await headers());
  return <div className="admin-page page-width">
    <aside>
      <strong>B·2000 Studio</strong>
      <nav aria-label="관리자 메뉴"><a href="#queue" className="active">검수 대기열</a><a href="#create">콘텐츠 추가</a><a href="#operations">운영 기준</a></nav>
      <small>D1 CONTENT STUDIO · 0.4.3</small>
    </aside>
    <section>
      <p className="eyebrow">ARCHIVE OPERATIONS</p>
      <h1>{access.allowed ? "기억을 검수하고 공개합니다." : "접근 제한"}</h1>
      <p className="admin-lead">{access.allowed ? `${access.actor?.displayName ?? "로컬 관리자"} · ${access.canPublish ? "관리자" : "편집자"} 권한으로 접속했습니다.` : access.reason}</p>
      {access.allowed && <><AdminStudio /><section id="create" className="admin-create"><header><small>NEW RECORD</small><h2>새 기록 추가</h2></header><ContentForm canPublish={access.canPublish} /></section></>}
    </section>
  </div>;
}
