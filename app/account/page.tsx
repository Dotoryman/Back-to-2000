import { AccountView } from "@/components/auth/account-view";

export const metadata = { title: "내 계정" };
export const dynamic = "force-dynamic";

export default function AccountPage() {
  return <main className="account-page page-width"><div className="subpage-head"><p className="eyebrow">MY ACCOUNT</p><h1 className="page-title">나의 계정.</h1><p>프로필과 컬렉션 동기화 설정을 관리합니다.</p></div><AccountView /></main>;
}
