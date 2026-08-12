import type { Metadata } from "next";
import type { CatalogItem } from "./catalog/types";

export function catalogItemMetadata(item: CatalogItem): Metadata {
  const canonical = `/archive/${item.id}`;
  return {
    title: `${item.name} · ${item.year}`,
    description: item.summary,
    alternates: { canonical },
    openGraph: {
      type: "article",
      url: canonical,
      title: `${item.name} · ${item.year}`,
      description: item.summary,
      images: item.image ? [{ url: item.image.src, alt: item.image.alt }] : [{ url: "/og.png", alt: "Back to 2000" }],
    },
  };
}
