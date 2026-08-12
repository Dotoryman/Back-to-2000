import { ArrowLeft, ArrowRight, Box, Globe2, MessageCircle, Monitor, Smartphone } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { CollectionToggle } from "./collection-toggle";
import { buildCatalogStory } from "@/domain/catalog/story";
import type { CatalogItem } from "@/domain/catalog/types";
import { SITE_URL } from "@/domain/site";

const kindLabels: Record<CatalogItem["kind"], string> = {
  website: "WEBSITE", service: "SERVICE", phone: "MOBILE", product: "PRODUCT",
  program: "SOFTWARE", game: "GAME", event: "MOMENT",
};

const icons = { website: Globe2, service: MessageCircle, phone: Smartphone, product: Box, program: Monitor, game: Monitor, event: Globe2 };

export function CatalogDetail({ item, next }: { item: CatalogItem; next?: CatalogItem }) {
  const story = buildCatalogStory(item, next);
  const Icon = icons[item.kind];
  return <article className="archive-detail page-width">
    <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify({
      "@context": "https://schema.org",
      "@type": item.kind === "phone" || item.kind === "product" ? "Product" : item.kind === "game" ? "VideoGame" : "CreativeWork",
      name: item.name,
      description: item.summary,
      datePublished: String(item.year),
      brand: { "@type": "Brand", name: item.brand },
      image: item.image ? `${SITE_URL}${item.image.src}` : undefined,
      url: `${SITE_URL}/archive/${item.id}`,
    }).replace(/</g, "\\u003c") }} />
    <Link className="detail-back" href="/"><ArrowLeft /> 연표로 돌아가기</Link>
    <section className="detail-hero" style={{ "--detail-accent": item.accent } as React.CSSProperties}>
      <div className="detail-hero-copy">
        <p>{kindLabels[item.kind]} · {item.year}</p>
        <h1>{item.name}</h1>
        <strong>{item.eyebrow}</strong>
        <span>{item.summary}</span>
        <CollectionToggle id={item.id} name={item.name} />
      </div>
      <div className={item.image ? "detail-visual has-photo" : "detail-visual"}>
        {item.image ? <Image src={item.image.src} alt={item.image.alt} fill priority sizes="(max-width: 900px) 100vw, 50vw" /> : <><Icon /><b>{item.brand}</b><small>{item.year}</small></>}
      </div>
    </section>

    <div className="detail-facts">
      <span><small>MAKER</small><strong>{item.brand}</strong></span>
      <span><small>YEAR</small><strong>{item.year}</strong></span>
      {Object.entries(item.specs ?? {}).slice(0, 4).map(([key, value]) => <span key={key}><small>{key}</small><strong>{value}</strong></span>)}
    </div>

    <section className="detail-story">
      <header><p>THE STORY</p><h2>하나의 제품이<br />시대를 바꾸는 방식</h2></header>
      <div className="story-chapters">
        <StoryChapter number="01" title="어떤 제품인가" text={story.identity} />
        <StoryChapter number="02" title="왜 중요했나" text={story.significance} />
        <StoryChapter number="03" title="어떻게 이어졌나" text={story.legacy} />
      </div>
    </section>

    <section className="detail-highlights">
      <p>REMEMBERED FOR</p>
      <div>{item.highlights.map((highlight, index) => <span key={highlight}><small>{String(index + 1).padStart(2, "0")}</small>{highlight}</span>)}</div>
    </section>

    {next && <Link className="detail-next" href={`/archive/${next.id}`}><span><small>NEXT EVOLUTION · {next.year}</small><strong>{next.name}</strong></span><ArrowRight /></Link>}
  </article>;
}

function StoryChapter({ number, title, text }: { number: string; title: string; text: string }) {
  return <section><small>{number}</small><h3>{title}</h3><p>{text}</p></section>;
}
