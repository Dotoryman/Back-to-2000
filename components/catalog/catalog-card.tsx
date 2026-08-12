import { ArrowUpRight, Globe2, MessageCircle, Smartphone } from "lucide-react";
import Link from "next/link";
import type { CatalogItem } from "@/domain/catalog/types";

const icons = { website: Globe2, phone: Smartphone, service: MessageCircle, event: Globe2, game: Globe2, program: Globe2 };

export function CatalogCard({ item, large = false }: { item: CatalogItem; large?: boolean }) {
  const Icon = icons[item.kind];
  const href = item.kind === "phone" ? `/phones/${item.slug}` : item.kind === "website" ? `/websites/${item.slug}` : `/search?q=${encodeURIComponent(item.name)}`;
  return (
    <Link href={href} className={large ? "catalog-card card-large" : "catalog-card"} style={{ "--card-accent": item.accent } as React.CSSProperties}>
      <div className="card-top"><span className="card-icon"><Icon size={18} /></span><span>{item.year}</span></div>
      <div className="card-visual" aria-hidden="true"><span>{item.name.slice(0, 2)}</span></div>
      <div className="card-copy"><p>{item.eyebrow}</p><h3>{item.name}</h3><span>{item.summary}</span></div>
      <ArrowUpRight className="card-arrow" size={19} aria-hidden="true" />
    </Link>
  );
}

