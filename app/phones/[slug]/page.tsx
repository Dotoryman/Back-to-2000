import {notFound} from "next/navigation";
import {CatalogDetail} from "@/components/catalog/catalog-detail";
import {getPublishedCatalogItemBySlug,listEvolutionCatalog} from "@/domain/catalog/repository";
import {findEvolutionLineage,findNextEvolution} from "@/domain/catalog/story";
export const dynamic="force-dynamic";
export default async function PhonePage({params}:{params:Promise<{slug:string}>}){const slug=(await params).slug;const item=await getPublishedCatalogItemBySlug("phone",slug);if(!item)notFound();const catalog=await listEvolutionCatalog(item);return <CatalogDetail item={item} next={findNextEvolution(item,catalog)} lineage={findEvolutionLineage(item,catalog)}/>}
