import { notFound } from "next/navigation";
import { CategoryTimeline, type TimelineKind } from "@/components/timeline/category-timeline";
import { listPublishedCatalog } from "@/domain/catalog/repository";
export const dynamic = "force-dynamic";
export default async function TimelinePage({ params }: { params: Promise<{ kind: string }> }) { const { kind } = await params; if (kind !== "website" && kind !== "phone" && kind !== "game") notFound(); const catalog = await listPublishedCatalog(); return <CategoryTimeline kind={kind as TimelineKind} catalog={catalog} />; }
