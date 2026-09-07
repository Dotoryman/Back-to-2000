import { notFound } from "next/navigation";
import { CatalogCard } from "@/components/catalog/catalog-card";
import { listCatalogCategories, listPublishedCatalog } from "@/domain/catalog/repository";
import type { ContentKind } from "@/domain/catalog/types";

export const dynamic = "force-dynamic";

export default async function CategoryPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const categories = await listCatalogCategories();
  const category = categories.find((candidate) => candidate.slug === slug);
  if (!category && slug !== "popular") notFound();
  const items = await listPublishedCatalog(slug === "popular" ? { featured: true } : { kind: slug as ContentKind });
  const name = category?.name ?? "인기 콘텐츠";
  const description = category?.description ?? "많은 시간여행자가 다시 찾는 기억";
  return <div className="subpage page-width">
    <div className="subpage-head"><p className="eyebrow">ARCHIVE CATEGORY</p><h1 className="page-title">{name}</h1><p>{description}</p></div>
    <div className="card-grid">{items.map((item) => <CatalogCard key={item.id} item={item} />)}</div>
  </div>;
}
