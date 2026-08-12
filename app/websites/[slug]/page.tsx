import {notFound} from "next/navigation";
import {CatalogDetail} from "@/components/catalog/catalog-detail";
import {catalog,getItem} from "@/domain/catalog/data";
import {findNextEvolution} from "@/domain/catalog/story";
export default async function WebsitePage({params}:{params:Promise<{slug:string}>}){const item=getItem("website",(await params).slug);if(!item)notFound();return <CatalogDetail item={item} next={findNextEvolution(item,catalog)}/>}
