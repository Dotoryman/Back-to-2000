import {notFound} from "next/navigation";
import {CatalogDetail} from "@/components/catalog/catalog-detail";
import {getPublishedCatalogItemBySlug,listPublishedCatalog} from "@/domain/catalog/repository";
import {findNextEvolution} from "@/domain/catalog/story";
export const dynamic="force-dynamic";
export default async function PhonePage({params}:{params:Promise<{slug:string}>}){const slug=(await params).slug;const [item,catalog]=await Promise.all([getPublishedCatalogItemBySlug("phone",slug),listPublishedCatalog()]);if(!item)notFound();return <CatalogDetail item={item} next={findNextEvolution(item,catalog)}/>}
