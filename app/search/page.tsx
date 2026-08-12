import { CatalogCard } from "@/components/catalog/catalog-card";
import { SearchBox } from "@/components/search/search-box";
import { catalog, searchCatalog } from "@/domain/catalog/data";
export default async function SearchPage({searchParams}:{searchParams:Promise<{q?:string}>}){const {q=""}=await searchParams;const items=q?searchCatalog(q):catalog;return <div className="subpage page-width"><div className="subpage-head"><p className="eyebrow">SEARCH THE ARCHIVE</p><h1 className="page-title">기억을 검색하세요.</h1><SearchBox compact initialValue={q}/></div><div className="result-meta"><strong>{q?`“${q}”`:"전체 콘텐츠"}</strong><span>{items.length}개의 기억</span></div><div className="card-grid">{items.map(item=><CatalogCard key={item.id} item={item}/>)}</div></div>}
