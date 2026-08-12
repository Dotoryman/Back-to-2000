"use client";

import { FormEvent, useState } from "react";
import { LoaderCircle, Save } from "lucide-react";

export function ContentForm() {
  const [state, setState] = useState<"idle" | "saving" | "saved" | "error">("idle");

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setState("saving");
    const form = event.currentTarget;
    const data = new FormData(form);
    const file = data.get("media");
    let mediaId: string | undefined;

    if (file instanceof File && file.size) {
      const upload = new FormData();
      upload.set("file", file);
      upload.set("altText", String(data.get("imageAlt") ?? ""));
      upload.set("credit", String(data.get("imageCredit") ?? ""));
      upload.set("sourceUrl", String(data.get("imageSourceUrl") ?? ""));
      upload.set("license", String(data.get("imageLicense") ?? ""));
      const uploaded = await fetch("/api/media", { method: "POST", body: upload });
      if (!uploaded.ok) return setState("error");
      mediaId = (await uploaded.json()).id;
    }

    const response = await fetch("/api/catalog", {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({
        type: data.get("type"), name: data.get("name"), slug: data.get("slug"), brand: data.get("brand"),
        eyebrow: data.get("eyebrow"), startYear: Number(data.get("startYear")), summary: data.get("summary"),
        body: data.get("body") ?? "", accent: data.get("accent"), status: data.get("status"),
        tags: splitList(data.get("tags")), highlights: splitLines(data.get("highlights")),
        sourceLabel: data.get("sourceLabel"), sourceUrl: data.get("sourceUrl"), sourceType: data.get("sourceType"), mediaId,
      }),
    });
    setState(response.ok ? "saved" : "error");
    if (response.ok) form.reset();
  }

  return <form className="admin-form" onSubmit={submit}>
    <div className="form-grid"><label>유형<select name="type"><option value="website">웹사이트</option><option value="phone">휴대폰</option><option value="product">제품</option><option value="service">서비스</option><option value="program">소프트웨어</option><option value="game">게임</option><option value="event">사건</option></select></label><label>상태<select name="status"><option value="draft">초안</option><option value="review">검토</option><option value="published">공개</option></select></label></div>
    <div className="form-grid"><label>이름<input name="name" required placeholder="Nokia 3210" /></label><label>브랜드<input name="brand" required placeholder="Nokia" /></label></div>
    <div className="form-grid"><label>고유 주소<input name="slug" required pattern="[a-z0-9-]+" placeholder="nokia-3210" /></label><label>연도<input name="startYear" type="number" required defaultValue="2000" /></label></div>
    <div className="form-grid"><label>짧은 표제<input name="eyebrow" maxLength={100} /></label><label>포인트 색<input name="accent" type="color" defaultValue="#9bcbe2" /></label></div>
    <label>한 줄 설명<input name="summary" required minLength={20} maxLength={300} /></label>
    <label>상세 설명<textarea name="body" required minLength={40} rows={6} /></label>
    <label>태그<input name="tags" placeholder="Nokia, 휴대전화, 1999" /><small>쉼표로 구분</small></label>
    <label>대표 특징<textarea name="highlights" rows={3} placeholder={"내장 안테나\n교체형 커버\nT9 문자 입력"} /><small>한 줄에 하나씩 입력</small></label>
    <div className="form-grid"><label>근거 이름<input name="sourceLabel" required /></label><label>근거 유형<select name="sourceType"><option value="official">공식</option><option value="archive">아카이브</option><option value="reference">참고 자료</option><option value="community">커뮤니티</option></select></label></div>
    <label>근거 URL<input name="sourceUrl" type="url" required /></label>
    <label>이미지<input name="media" type="file" accept="image/jpeg,image/png,image/webp,image/avif" /><small>R2 · 최대 10MB</small></label>
    <label>이미지 대체 텍스트<input name="imageAlt" placeholder="제품 형태가 드러나는 설명" /></label>
    <div className="form-grid"><label>이미지 제공자<input name="imageCredit" /></label><label>라이선스<input name="imageLicense" placeholder="CC BY-SA 4.0" /></label></div>
    <label>이미지 출처 URL<input name="imageSourceUrl" type="url" /></label>
    <button className="admin-save" disabled={state === "saving"}>{state === "saving" ? <LoaderCircle className="spin" /> : <Save />}저장하기</button>
    {state === "saved" && <p className="success">저장했습니다. 검수 상태에서 출처와 이미지 권리를 확인해 주세요.</p>}
    {state === "error" && <p className="error">D1/R2 연결, 필수 설명, 출처 정보를 확인하세요.</p>}
  </form>;
}

function splitList(value: FormDataEntryValue | null) { return String(value ?? "").split(",").map((item) => item.trim()).filter(Boolean); }
function splitLines(value: FormDataEntryValue | null) { return String(value ?? "").split(/\r?\n/).map((item) => item.trim()).filter(Boolean); }
