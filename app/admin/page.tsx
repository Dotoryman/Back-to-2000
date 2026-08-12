import type { Metadata } from "next";
import { ContentForm } from "@/components/admin/content-form";
export const metadata: Metadata = { title:"콘텐츠 관리", robots:{index:false,follow:false} };
export default function AdminPage(){return <div className="admin-page page-width"><aside><strong>B·2000 Studio</strong><nav><a className="active">콘텐츠</a><a>미디어</a><a>브랜드</a><a>태그</a></nav><small>LOCAL ADMIN</small></aside><section><p className="eyebrow">CONTENT STUDIO</p><h1>새 기억 추가</h1><p className="admin-lead">웹사이트와 휴대폰 자료를 같은 규칙으로 관리합니다.</p><ContentForm /></section></div>}

