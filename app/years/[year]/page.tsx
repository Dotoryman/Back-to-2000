import {notFound} from "next/navigation";
import {CatalogCard} from "@/components/catalog/catalog-card";
import {getEra,itemsNearYear} from "@/domain/catalog/data";
export default async function YearPage({params}:{params:Promise<{year:string}>}){const year=Number((await params).year),era=getEra(year);if(!era)notFound();const items=itemsNearYear(year);return <div className="subpage page-width"><div className="subpage-head"><p className="eyebrow">{era.label}</p><h1 className="page-title">{year}</h1><p>{era.summary}</p></div><div className="card-grid">{items.map(item=><CatalogCard key={item.id} item={item}/>)}</div></div>}
