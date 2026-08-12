import { notFound } from "next/navigation";
import { CatalogDetail } from "@/components/catalog/catalog-detail";
import { getPublishedCatalogItem, listPublishedCatalog } from "@/domain/catalog/repository";
import { findNextEvolution } from "@/domain/catalog/story";
import type { Metadata } from "next";
import { catalogItemMetadata } from "@/domain/seo";

export async function generateMetadata({ params }: { params: Promise<{ id: string }> }): Promise<Metadata> {
  const { id } = await params;
  const item = await getPublishedCatalogItem(id);
  return item ? catalogItemMetadata(item) : { title: "기억을 찾을 수 없습니다" };
}

export default async function ArchiveDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const [item, catalog] = await Promise.all([getPublishedCatalogItem(id), listPublishedCatalog()]);
  if (!item) notFound();
  return <CatalogDetail item={item} next={findNextEvolution(item, catalog)} />;
}
