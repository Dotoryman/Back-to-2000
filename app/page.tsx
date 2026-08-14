import Link from "next/link";
import { ArrowRight, Gamepad2, Globe2, Smartphone } from "lucide-react";
import { TimeExplorer } from "@/components/home/time-explorer";
import { listPublishedCatalog } from "@/domain/catalog/repository";

export const dynamic = "force-dynamic";

export default async function Home() {
  const catalog = await listPublishedCatalog();
  return <>
    <TimeExplorer catalog={catalog} />
    <section className="category-shortcuts page-width">
      <div className="shortcut-grid">
        <Shortcut href="/timelines/website" icon={<Globe2 />} index="01" label="WEB & SERVICE" title="웹 & 서비스" description="포털과 메신저의 변화" />
        <Shortcut href="/timelines/phone" icon={<Smartphone />} index="02" label="MOBILE" title="휴대전화" description="피처폰에서 스마트폰까지" />
        <Shortcut href="/timelines/game" icon={<Gamepad2 />} index="03" label="GLOBAL GAME" title="게임" description="세계를 움직인 플레이" />
      </div>
    </section>
    <section className="archive-note">
      <div><p>MY DIGITAL MEMORY</p><h2>Archive</h2></div>
      <div><p>써봤던 제품과 기억나는 서비스를 골라 나만의 디지털 연대기를 만들어보세요.</p><Link href="/collection">내 추억 모아보기 <ArrowRight /></Link></div>
    </section>
  </>;
}

function Shortcut({ href, icon, index, label, title, description }: { href: string; icon: React.ReactNode; index: string; label: string; title: string; description: string }) {
  return <Link href={href} className="shortcut-card"><span>{index}</span><div>{icon}<small>{label}</small><strong>{title}</strong><p>{description}</p></div><ArrowRight /></Link>;
}
