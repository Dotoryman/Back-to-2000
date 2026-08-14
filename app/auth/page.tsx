import { AuthForm } from "@/components/auth/auth-form";

export const metadata = { title: "로그인 · 회원가입" };

export default function AuthPage() {
  return <main className="auth-page page-width"><div className="auth-aside"><p>MEMORY, CONTINUED.</p><strong>기억은<br />기기를 넘어<br />이어집니다.</strong><span>외부 소셜 계정 없이 Back to 2000만의 계정을 만듭니다.</span></div><AuthForm /></main>;
}
