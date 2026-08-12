import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const developmentPreviewMeta =
  /<meta(?=[^>]*\bname=["']codex-preview["'])(?=[^>]*\bcontent=["']development["'])[^>]*>/i;
async function render(pathname = "/") {
  const workerUrl = new URL("../dist/server/index.js", import.meta.url);
  workerUrl.searchParams.set("test", `${process.pid}-${Date.now()}`);
  const { default: worker } = await import(workerUrl.href);

  return worker.fetch(
    new Request(`http://localhost${pathname}`, {
      headers: { accept: "text/html" },
    }),
    {
      ASSETS: {
        fetch: async () => new Response("Not found", { status: 404 }),
      },
    },
    {
      waitUntil() {},
      passThroughOnException() {},
    },
  );
}

test("server-renders the Back to 2000 experience", async () => {
  const response = await render();
  assert.equal(response.status, 200);
  assert.match(response.headers.get("content-type") ?? "", /^text\/html\b/i);

  const html = await response.text();
  assert.doesNotMatch(html, developmentPreviewMeta);
  assert.match(html, /Back to/);
  assert.match(html, /2000/);
  assert.match(html, /타임머신/);
  assert.match(html, /Back to 2000/);
  assert.match(html, /홈페이지/);
  assert.match(html, /휴대전화/);
  assert.match(html, /2020/);
});

test("removes starter preview markers", async () => {
  const [page, layout, packageJson, css] = await Promise.all([
    readFile(new URL("../app/page.tsx", import.meta.url), "utf8"),
    readFile(new URL("../app/layout.tsx", import.meta.url), "utf8"),
    readFile(new URL("../package.json", import.meta.url), "utf8"),
    readFile(new URL("../app/globals.css", import.meta.url), "utf8"),
  ]);
  assert.doesNotMatch(page, /SkeletonPreview|codex-preview/);
  assert.doesNotMatch(layout, /Starter Project|codex-preview/);
  assert.doesNotMatch(packageJson, /react-loading-skeleton/);
  assert.match(css, /--cream:/);
});

test("renders editorial product stories without source labels", async () => {
  const response = await render("/archive/milestone-2020-macbook-air-m1");
  assert.equal(response.status, 200);
  const html = await response.text();
  assert.match(html, /어떤 제품인가/);
  assert.match(html, /왜 중요했나/);
  assert.match(html, /어떻게 이어졌나/);
  assert.match(html, /MacBook Air M1/);
  assert.match(html, /개인용 컴퓨터/);
  assert.doesNotMatch(html, /그해 새롭게 등장한 기술과 서비스의 흐름을 보여주는 기록으로 선정했습니다/);
  assert.doesNotMatch(html, /연도 근거|이미지 출처|이미지 ·/);
});
