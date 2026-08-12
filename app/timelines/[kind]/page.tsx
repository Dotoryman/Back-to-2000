import { notFound } from "next/navigation";
import { CategoryTimeline, type TimelineKind } from "@/components/timeline/category-timeline";
export default async function TimelinePage({ params }: { params: Promise<{ kind: string }> }) { const { kind } = await params; if (kind !== "website" && kind !== "phone") notFound(); return <CategoryTimeline kind={kind as TimelineKind} />; }
