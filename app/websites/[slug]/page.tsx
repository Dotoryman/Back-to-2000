import {notFound} from "next/navigation";
import {CollectionToggle} from "@/components/catalog/collection-toggle";
import {getItem} from "@/domain/catalog/data";
export default async function WebsitePage({params}:{params:Promise<{slug:string}>}){const item=getItem("website",(await params).slug);if(!item)notFound();return <div className="subpage page-width"><div className="subpage-head"><p className="eyebrow">WEBSITE · {item.year}</p><h1 className="page-title">{item.name}</h1><p>{item.description}</p><CollectionToggle id={item.id} name={item.name}/></div><div className="empty-state"><strong>화면 아카이브 준비 중</strong><p>관리자에서 연도별 원본 이미지와 출처를 등록할 수 있습니다.</p></div></div>}
