import { CollectionView } from "@/components/catalog/collection-view";
import { listPublishedCatalog } from "@/domain/catalog/repository";

export const dynamic = "force-dynamic";

export default async function CollectionPage() {
  return <CollectionView catalog={await listPublishedCatalog()} />;
}
