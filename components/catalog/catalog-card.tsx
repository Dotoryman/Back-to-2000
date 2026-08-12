import { ArrowUpRight, Box, Globe2, MessageCircle, Smartphone } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import type { CatalogItem } from "@/domain/catalog/types";

const icons = { website: Globe2, phone: Smartphone, product: Box, service: MessageCircle, event: Globe2, game: Globe2, program: Globe2 };

export function CatalogCard({ item, large = false }: { item: CatalogItem; large?: boolean }) {
  const Icon = icons[item.kind];
  const href = `/archive/${item.id}`;
  return (
    <Link href={href} className={large ? "catalog-card card-large" : "catalog-card"} style={{ "--card-accent": item.accent } as React.CSSProperties}>
      <div className="card-top"><span className="card-icon"><Icon size={18} /></span><span>{item.year}</span></div>
      <div className={item.image ? "card-visual has-photo" : "card-visual"} aria-hidden="true">
        {item.image
          ? <Image src={item.image.src} alt="" fill sizes="(max-width: 900px) 100vw, 33vw" />
          : <span>{item.name.slice(0, 2)}</span>}
      </div>
      <div className="card-copy"><p>{item.eyebrow}</p><h3>{item.name}</h3><span>{item.summary}</span></div>
      <ArrowUpRight className="card-arrow" size={19} aria-hidden="true" />
    </Link>
  );
}
