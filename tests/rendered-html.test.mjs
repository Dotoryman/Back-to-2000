import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import { readdir } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import test from "node:test";
import { Miniflare } from "miniflare";

const developmentPreviewMeta =
  /<meta(?=[^>]*\bname=["']codex-preview["'])(?=[^>]*\bcontent=["']development["'])[^>]*>/i;
const repositoryRoot = fileURLToPath(new URL("..", import.meta.url));
const serverRoot = path.join(repositoryRoot, "dist", "server");
const serverModules = await collectServerModules(serverRoot);
const miniflare = new Miniflare({
  compatibilityDate: "2026-05-15",
  compatibilityFlags: ["nodejs_compat"],
  modulesRoot: repositoryRoot,
  modules: serverModules,
  d1Databases: ["DB"],
  serviceBindings: {
    ASSETS: async () => new Response("Not found", { status: 404 }),
  },
});
const databasePromise = createDatabase();

async function collectServerModules(directory) {
  const entries = await readdir(directory, { withFileTypes: true });
  const modules = [];
  for (const entry of entries) {
    const absolutePath = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      modules.push(...(await collectServerModules(absolutePath)));
    } else if (entry.name.endsWith(".js")) {
      modules.push({
        type: "ESModule",
        path: path.relative(repositoryRoot, absolutePath).replaceAll("\\", "/"),
      });
    }
  }
  return modules.sort((left, right) => {
    if (left.path === "dist/server/index.js") return -1;
    if (right.path === "dist/server/index.js") return 1;
    return left.path.localeCompare(right.path);
  });
}

async function createDatabase() {
  const database = await miniflare.getD1Database("DB");
  const migrationUrl = new URL("../drizzle/", import.meta.url);
  const files = (await readdir(migrationUrl)).filter((name) => /^\d+_.+\.sql$/.test(name)).sort();
  for (const file of files) {
    const sql = await readFile(new URL(file, migrationUrl), "utf8");
    for (const [index, statement] of sql.split("--> statement-breakpoint").entries()) {
      const executable = statement.replace(/^--.*$/gm, "").trim();
      if (!executable) continue;
      try {
        await database.prepare(executable).run();
      } catch (error) {
        throw new Error(`Migration ${file} statement ${index + 1} failed: ${executable.slice(0, 180)}`, {
          cause: error,
        });
      }
    }
  }
  return database;
}

async function render(pathname = "/") {
  await databasePromise;
  return miniflare.dispatchFetch(`http://localhost${pathname}`, { headers: { accept: "text/html" } });
}

test.after(async () => miniflare.dispose());

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
  assert.match(html, /GLOBAL GAME/);
  assert.match(html, /category-shortcuts/);
  assert.match(html, /보는 아카이브에서, 나의 기억을 모으는 아카이브로/);
  assert.match(html, /2020/);
  assert.match(html, /mobile-year-stepper/);
  assert.match(html, /연도 빠른 선택/);
});

test("persists an anonymous D1 memory collection with structured reactions", async () => {
  await databasePromise;
  const headers = { "content-type": "application/json", "x-b2000-device": "00000000-0000-4000-8000-000000000040" };
  const saved = await miniflare.dispatchFetch("http://localhost/api/collection", {
    method: "POST",
    headers,
    body: JSON.stringify({ contentId: "phone-nokia-3310", reaction: "remembered" }),
  });
  assert.equal(saved.status, 200);
  const savedPayload = await saved.json();
  assert.deepEqual(savedPayload.items, [{ contentId: "phone-nokia-3310", reaction: "remembered" }]);
  assert.equal(savedPayload.counts["phone-nokia-3310"].remembered, 1);

  const removed = await miniflare.dispatchFetch("http://localhost/api/collection?contentId=phone-nokia-3310", { method: "DELETE", headers });
  assert.equal(removed.status, 200);
  assert.deepEqual((await removed.json()).items, []);
});

test("renders a game for every year and exposes the global game timeline", async () => {
  const database = await databasePromise;
  const gameStats = await database.prepare("SELECT COUNT(*) AS total, COUNT(DISTINCT start_year) AS years FROM content_items WHERE type = 'game' AND status = 'published'").first();
  assert.equal(Number(gameStats.total), 23);
  assert.equal(Number(gameStats.years), 23);

  const timeline = await render("/timelines/game");
  assert.equal(timeline.status, 200);
  const timelineHtml = await timeline.text();
  assert.match(timelineHtml, /글로벌 게임/);
  assert.match(timelineHtml, /StarCraft/);
  assert.match(timelineHtml, /category-mobile-stepper/);

  const detail = await render("/archive/game-2020-valorant");
  assert.equal(detail.status, 200);
  const detailHtml = await detail.text();
  assert.match(detailHtml, /어떤 게임인가/);
  assert.match(detailHtml, /왜 세계적으로 흥행했나/);
  assert.match(detailHtml, /클로즈드 베타·글로벌 출시/);
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

test("serves the public archive from the seeded D1 catalog", async () => {
  const response = await render("/years/2020");
  assert.equal(response.status, 200);
  const html = await response.text();
  assert.match(html, /iPhone 12/);
  assert.match(html, /MacBook Air M1/);
  assert.match(html, /Galaxy Z Flip/);
});
