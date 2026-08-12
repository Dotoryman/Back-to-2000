import {notFound} from "next/navigation";
import {CatalogCard} from "@/components/catalog/catalog-card";
import {catalog,categories} from "@/domain/catalog/data";
export default async function CategoryPage({params}:{params:Promise<{slug:string}>}){const{slug}=await params;const category=categories.find(c=>c.slug===slug);if(!category)notFound();const items=slug==="popular"?catalog.filter(i=>i.featured):catalog.filter(i=>i.kind===slug);return <div className="subpage page-width"><div className="subpage-head"><p className="eyebrow">ARCHIVE CATEGORY</p><h1 className="page-title">{category.name}</h1><p>{category.description}</p></div><div className="card-grid">{items.map(item=><CatalogCard key={item.id} item={item}/>)}</div></div>}
