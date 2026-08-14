import {notFound} from "next/navigation";
import {CatalogDetail} from "@/components/catalog/catalog-detail";
import {getPublishedCatalogItemBySlug,listPublishedCatalog} from "@/domain/catalog/repository";
import {findEvolutionLineage,findNextEvolution} from "@/domain/catalog/story";
export const dynamic="force-dynamic";
export default async function WebsitePage({params}:{params:Promise<{slug:string}>}){const slug=(await params).slug;const [item,catalog]=await Promise.all([getPublishedCatalogItemBySlug("website",slug),listPublishedCatalog()]);if(!item)notFound();return <CatalogDetail item={item} next={findNextEvolution(item,catalog)} lineage={findEvolutionLineage(item,catalog)}/>}
