"use client";

import { FormEvent, useCallback, useEffect, useMemo, useState } from "react";
import { Archive, CheckCircle2, FileSearch, ImagePlus, LoaderCircle, RotateCcw, Send, ShieldCheck } from "lucide-react";

type Status = "draft" | "review" | "published" | "archived";
type Quality = "incomplete" | "needs_review" | "verified";
type AdminItem = {
  id: string;
  name: string;
  type: string;
  startYear: number;
  summary: string;
  body: string;
  status: Status;
  qualityStatus: Quality;
  contentVersion: number;
  qualityScore: number;
  issues: string[];
  source?: { label: string; url: string; sourceType: string };
  hero?: { id: string; publicUrl?: string; objectKey: string; altText: string; rightsStatus: string };
};
type Payload = {
  items: AdminItem[];
  quality: { total: number; published: number; verified: number; needsReview: number; missingHero: number; missingSource: number };
  access: { role: string; canPublish: boolean };
};
type HistoryPayload = { revisions: Array<{ id: string; version: number; note?: string; createdAt: string }>; events: Array<{ id: string; action: string; fromStatus?: string; toStatus?: string; note?: string; createdAt: string }> };

const statusLabel: Record<Status, string> = { draft: "초안", review: "검수", published: "공개", archived: "보관" };
const qualityLabel: Record<Quality, string> = { incomplete: "미완성", needs_review: "재검토", verified: "검증됨" };

export function AdminStudio() {
  const [data, setData] = useState<Payload | null>(null);
  const [filter, setFilter] = useState<"all" | Status | "issues">("issues");
  const [query, setQuery] = useState("");
  const [selected, setSelected] = useState<AdminItem | null>(null);
  const [history, setHistory] = useState<HistoryPayload | null>(null);
  const [busy, setBusy] = useState<string | null>(null);
  const [message, setMessage] = useState("");

  const load = useCallback(async () => {
    const response = await fetch("/api/catalog?scope=admin", { cache: "no-store" });
    if (!response.ok) return setMessage("관리 목록을 불러오지 못했습니다.");
    const payload = await response.json() as Payload;
    setData(payload);
    setSelected((current) => current ? payload.items.find((item) => item.id === current.id) ?? null : null);
  }, []);

  useEffect(() => {
    const initialLoad = window.setTimeout(() => void load(), 0);
    const refresh = () => void load();
    window.addEventListener("b2000:catalog-changed", refresh);
    return () => { window.clearTimeout(initialLoad); window.removeEventListener("b2000:catalog-changed", refresh); };
  }, [load]);

  const items = useMemo(() => (data?.items ?? []).filter((item) => {
    if (filter === "issues" && !item.issues.length) return false;
    if (filter !== "all" && filter !== "issues" && item.status !== filter) return false;
    return `${item.name} ${item.startYear} ${item.type}`.toLocaleLowerCase("ko").includes(query.toLocaleLowerCase("ko"));
  }), [data, filter, query]);

  async function mutate(id: string, patch: Record<string, unknown>) {
    setBusy(id);
    setMessage("");
    const response = await fetch("/api/catalog", { method: "PATCH", headers: { "content-type": "application/json" }, body: JSON.stringify({ id, ...patch }) });
    const result = await response.json() as { error?: string };
    setBusy(null);
    if (!response.ok) return setMessage(result.error ?? "변경을 저장하지 못했습니다.");
    setMessage("변경과 검수 이력을 저장했습니다.");
    await load();
  }

  async function open(item: AdminItem) {
    setSelected(item);
    const response = await fetch(`/api/catalog?contentId=${encodeURIComponent(item.id)}`, { cache: "no-store" });
    setHistory(response.ok ? await response.json() as HistoryPayload : null);
  }

  if (!data) return <div className="admin-loading"><LoaderCircle className="spin" /> D1 검수 대기열을 불러오는 중입니다.</div>;

  return <section id="queue" className="admin-studio">
    <div className="admin-metrics" aria-label="아카이브 품질 현황">
      <Metric label="전체 기록" value={data.quality.total} />
      <Metric label="공개" value={data.quality.published} />
      <Metric label="검증 완료" value={data.quality.verified} />
      <Metric label="재검토" value={data.quality.needsReview} alert />
      <Metric label="이미지 없음" value={data.quality.missingHero} alert />
      <Metric label="근거 없음" value={data.quality.missingSource} alert />
    </div>
    <div className="admin-toolbar">
      <div>{(["issues", "review", "draft", "published", "archived", "all"] as const).map((value) => <button key={value} className={filter === value ? "active" : ""} onClick={() => setFilter(value)}>{value === "issues" ? "정비 필요" : value === "all" ? "전체" : statusLabel[value]}</button>)}</div>
      <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="이름·연도·유형 검색" aria-label="관리 콘텐츠 검색" />
    </div>
    {message && <p className="admin-message" role="status">{message}</p>}
    <div className="admin-workspace">
      <div className="admin-queue">
        {items.map((item) => <article key={item.id} className={selected?.id === item.id ? "selected" : ""}>
          <button className="admin-item-main" onClick={() => void open(item)}>
            <span><small>{item.startYear} · {item.type}</small><strong>{item.name}</strong></span>
            <em>{item.qualityScore}</em>
          </button>
          <div className="admin-item-state"><span data-state={item.status}>{statusLabel[item.status]}</span><span data-quality={item.qualityStatus}>{qualityLabel[item.qualityStatus]}</span><small>v{item.contentVersion}</small></div>
          {item.issues.length > 0 && <p>{item.issues.join(" · ")}</p>}
        </article>)}
        {!items.length && <div className="admin-empty"><ShieldCheck />현재 조건에 해당하는 기록이 없습니다.</div>}
      </div>
      <div className="admin-inspector">
        {selected ? <Inspector item={selected} history={history} busy={busy === selected.id} canPublish={data.access.canPublish} mutate={mutate} /> : <div className="admin-empty"><FileSearch />왼쪽에서 기록을 선택하면 설명·출처·이미지·변경 이력을 검수할 수 있습니다.</div>}
      </div>
    </div>
    <div id="operations" className="admin-operations">
      <div><small>WORKFLOW</small><strong>초안 → 검수 → 공개</strong><p>편집자는 작성과 검수 요청을, 관리자는 공개·검증·보관을 담당합니다.</p></div>
      <div><small>RECOVERY</small><strong>모든 변경을 버전으로 보존</strong><p>설명·출처·이미지 교체 기록을 D1 개정 이력과 검수 로그에 함께 남깁니다.</p></div>
      <div><small>BACKUP</small><strong>배포 전 D1 내보내기</strong><p><code>npm run cloudflare:backup</code>으로 운영 데이터 사본을 만든 뒤 마이그레이션합니다.</p></div>
    </div>
  </section>;
}

function Inspector({ item, history, busy, canPublish, mutate }: { item: AdminItem; history: HistoryPayload | null; busy: boolean; canPublish: boolean; mutate: (id: string, patch: Record<string, unknown>) => Promise<void> }) {
  async function save(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = event.currentTarget;
    const data = new FormData(form);
    let mediaId: string | undefined;
    const file = data.get("media");
    if (file instanceof File && file.size) {
      const upload = new FormData();
      upload.set("file", file);
      upload.set("altText", String(data.get("imageAlt") ?? ""));
      upload.set("credit", String(data.get("imageCredit") ?? ""));
      upload.set("sourceUrl", String(data.get("imageSourceUrl") ?? ""));
      upload.set("license", String(data.get("imageLicense") ?? ""));
      const response = await fetch("/api/media", { method: "POST", body: upload });
      if (!response.ok) return;
      mediaId = (await response.json() as { id: string }).id;
    }
    await mutate(item.id, {
      name: data.get("name"), summary: data.get("summary"), body: data.get("body"),
      sourceLabel: data.get("sourceLabel"), sourceUrl: data.get("sourceUrl"), sourceType: data.get("sourceType"),
      mediaId, note: data.get("note") || "설명·근거 정비",
    });
  }

  return <div>
    <header><span><small>{item.id}</small><h2>{item.name}</h2></span><strong>{item.qualityScore}<small>/100</small></strong></header>
    <form onSubmit={save} className="admin-edit-form">
      <label>이름<input name="name" defaultValue={item.name} required /></label>
      <label>한 줄 설명<textarea name="summary" defaultValue={item.summary} minLength={20} rows={3} required /></label>
      <label>상세 설명<textarea name="body" defaultValue={item.body} minLength={40} rows={7} required /></label>
      <div className="form-grid"><label>내부 근거 이름<input name="sourceLabel" defaultValue={item.source?.label ?? ""} required /></label><label>근거 유형<select name="sourceType" defaultValue={item.source?.sourceType ?? "reference"}><option value="official">공식</option><option value="archive">아카이브</option><option value="reference">참고 자료</option><option value="community">커뮤니티</option></select></label></div>
      <label>내부 근거 URL<input type="url" name="sourceUrl" defaultValue={item.source?.url ?? ""} required /></label>
      <details><summary><ImagePlus /> 대표 이미지 교체</summary><label>이미지 파일<input name="media" type="file" accept="image/jpeg,image/png,image/webp,image/avif" /></label><label>대체 텍스트<input name="imageAlt" defaultValue={item.hero?.altText ?? ""} /></label><div className="form-grid"><label>제공자<input name="imageCredit" /></label><label>라이선스<input name="imageLicense" /></label></div><label>이미지 출처 URL<input name="imageSourceUrl" type="url" /></label></details>
      <label>변경 메모<input name="note" placeholder="무엇을 확인하고 바꿨는지 기록" /></label>
      <button className="admin-save" disabled={busy}>{busy ? <LoaderCircle className="spin" /> : <CheckCircle2 />}정비 내용 저장</button>
    </form>
    <div className="admin-actions">
      {item.status === "draft" && <button onClick={() => void mutate(item.id, { status: "review", note: "검수 요청" })}><Send />검수 요청</button>}
      {item.status === "review" && <button onClick={() => void mutate(item.id, { status: "draft", note: "내용 보강 요청" })}><RotateCcw />초안으로 반려</button>}
      {canPublish && item.status === "review" && <button onClick={() => void mutate(item.id, { status: "published", note: "관리자 공개 승인" })}><CheckCircle2 />공개 승인</button>}
      {canPublish && item.qualityStatus !== "verified" && <button onClick={() => void mutate(item.id, { qualityStatus: "verified", note: "설명·근거·이미지 검증 완료" })}><ShieldCheck />품질 검증</button>}
      {canPublish && item.status !== "archived" && <button className="muted" onClick={() => void mutate(item.id, { status: "archived", note: "관리자 보관 처리" })}><Archive />보관</button>}
    </div>
    <section className="admin-history"><h3>변경 이력</h3>{history?.events.map((event) => <p key={event.id}><small>{formatDate(event.createdAt)}</small><strong>{event.action}</strong><span>{event.note ?? `${event.fromStatus ?? "—"} → ${event.toStatus ?? "—"}`}</span></p>) ?? <span>이력을 불러오는 중입니다.</span>}</section>
  </div>;
}

function Metric({ label, value, alert = false }: { label: string; value: number; alert?: boolean }) {
  return <span className={alert && value ? "alert" : ""}><small>{label}</small><strong>{value}</strong></span>;
}

function formatDate(value: string) {
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? "—" : new Intl.DateTimeFormat("ko-KR", { dateStyle: "short", timeStyle: "short" }).format(date);
}
