import type { Metadata } from "next";
import { headers } from "next/headers";
import { ContentForm } from "@/components/admin/content-form";
import { getAdminAccess } from "@/infrastructure/auth/admin";
export const metadata: Metadata = { title:"콘텐츠 관리", robots:{index:false,follow:false} };
export const dynamic = "force-dynamic";
export default async function AdminPage(){const access=getAdminAccess(await headers());return <div className="admin-page page-width"><aside><strong>B·2000 Studio</strong><nav aria-label="관리자 메뉴"><a href="/admin" className="active" aria-current="page">콘텐츠</a><span aria-disabled="true">미디어 · 준비 중</span><span aria-disabled="true">브랜드 · 준비 중</span><span aria-disabled="true">태그 · 준비 중</span></nav><small>LOCAL ADMIN · 0.1</small></aside><section><p className="eyebrow">CONTENT STUDIO</p><h1>{access.allowed?"새 기억 추가":"접근 제한"}</h1><p className="admin-lead">{access.allowed?"웹사이트·서비스·휴대폰·제품 자료를 같은 규칙으로 관리합니다.":access.reason}</p>{access.allowed&&<ContentForm />}</section></div>}
