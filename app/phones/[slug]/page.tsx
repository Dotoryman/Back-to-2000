import {notFound} from "next/navigation";
import {CollectionToggle} from "@/components/catalog/collection-toggle";
import {getItem} from "@/domain/catalog/data";
export default async function PhonePage({params}:{params:Promise<{slug:string}>}){const item=getItem("phone",(await params).slug);if(!item)notFound();return <div className="subpage page-width"><div className="subpage-head"><p className="eyebrow">MOBILE · {item.year}</p><h1 className="page-title">{item.name}</h1><p>{item.description}</p><CollectionToggle id={item.id} name={item.name}/></div><div className="result-meta">{Object.entries(item.specs??{}).map(([key,value])=><span key={key}>{key} · <strong>{value}</strong></span>)}</div></div>}
