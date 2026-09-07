import assert from "node:assert/strict";
import { readFile, readdir, mkdir, writeFile } from "node:fs/promises";
import { DatabaseSync } from "node:sqlite";
import test from "node:test";
import { build } from "esbuild";
import { drizzle } from "drizzle-orm/d1";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("..", import.meta.url));
const sqlite = new DatabaseSync(":memory:");
for (const file of (await readdir(new URL("../drizzle/", import.meta.url))).filter((name) => /^\d+_.+\.sql$/.test(name)).sort()) {
  sqlite.exec(await readFile(new URL(`../drizzle/${file}`, import.meta.url), "utf8"));
}
let calls = [];
const adapter = {
  prepare(sql) {
    return {
      bind(...params) {
        assert.ok(params.length <= 100, "D1 bound parameter limit");
        return {
          async raw() {
            const statement = sqlite.prepare(sql);
            statement.setReturnArrays(true);
            const rows = statement.all(...params);
            calls.push({ sql, params, returned: rows.length });
            return rows;
          },
        };
      },
    };
  },
};
globalThis[Symbol.for("catalog-query-test-db")] = drizzle(adapter);
async function loadModule(relativePath) {
  const output = await build({
    entryPoints: [fileURLToPath(new URL(relativePath, import.meta.url))],
    bundle: true, write: false, format: "esm", platform: "node",
    alias: { "@": root },
    plugins: [{ name: "test-database", setup(builder) {
      builder.onResolve({ filter: /^@\/db$/ }, () => ({ path: "db", namespace: "test" }));
      builder.onLoad({ filter: /.*/, namespace: "test" }, () => ({ contents: 'export const getDb = () => globalThis[Symbol.for("catalog-query-test-db")];' }));
    } }],
  });
  return import(`data:text/javascript;base64,${Buffer.from(output.outputFiles[0].text).toString("base64")}`);
}
const before = await loadModule("./fixtures/catalog-before.ts");
const after = await loadModule("../domain/catalog/repository.ts");
const story = await loadModule("../domain/catalog/story.ts");
const baseline = await before.listPublishedCatalog();
const benchmarks = {};
async function measure(name, oldQuery, newQuery) {
  calls = [];
  const expected = await oldQuery();
  const oldCalls = calls;
  calls = [];
  const actual = await newQuery();
  assert.deepEqual(actual, expected, name);
  benchmarks[name] = { before: [...oldCalls], after: [...calls] };
}

test.after(async () => {
  await mkdir(new URL("../outputs/", import.meta.url), { recursive: true });
  await writeFile(new URL("../outputs/d1-query-cases.json", import.meta.url), JSON.stringify(benchmarks, null, 2));
  console.table(Object.entries(benchmarks).map(([name, value]) => ({
    case: name, queriesBefore: value.before.length, queriesAfter: value.after.length,
    returnedBefore: value.before.reduce((sum, row) => sum + row.returned, 0),
    returnedAfter: value.after.reduce((sum, row) => sum + row.returned, 0),
  })));
  sqlite.close();
  delete globalThis[Symbol.for("catalog-query-test-db")];
});

test("preserves every catalog field and uses fixed-size batch queries", { concurrency: false }, async () => {
  await measure("home", () => before.listPublishedCatalog(), () => after.listPublishedCatalog());
  assert.ok(benchmarks.home.after.length <= 24);
  for (let year = 1998; year <= 2020; year++) {
    assert.deepEqual(await after.listPublishedCatalog({ year }), baseline.filter((item) => item.activeYears.includes(year)));
  }
  await measure("year-2020", () => before.listPublishedCatalog({ year: 2020 }), () => after.listPublishedCatalog({ year: 2020 }));
  for (const kind of ["website", "phone", "product", "service", "game", "event", "program"]) {
    for (const featured of [undefined, true, false]) {
      assert.deepEqual(await after.listPublishedCatalog({ kind, featured }), await before.listPublishedCatalog({ kind, featured }));
    }
  }
  assert.deepEqual(await after.listPublishedCatalog({ kind: ["website", "service"] }), baseline.filter((item) => ["website", "service"].includes(item.kind)));
});

test("details use ID/slug lookups and hydrate only linked relations", { concurrency: false }, async () => {
  for (const item of baseline) {
    assert.deepEqual(await after.getPublishedCatalogItem(item.id), item);
    if (["phone", "website"].includes(item.kind)) assert.deepEqual(await after.getPublishedCatalogItemBySlug(item.kind, item.slug), item);
  }
  await measure("detail", () => before.getPublishedCatalogItem("phone-nokia-3310"), () => after.getPublishedCatalogItem("phone-nokia-3310"));
  assert.ok(benchmarks.detail.after.reduce((sum, row) => sum + row.returned, 0) < 30);
  calls = [];
  assert.equal(await after.getPublishedCatalogItem("missing-item"), undefined);
  assert.equal(calls.length, 1);
  calls = [];
  assert.deepEqual(await after.listPublishedCatalog({ year: 1800 }), []);
  assert.equal(calls.length, 1);
});

test("keeps all evolution neighbours and next-year choices identical", { concurrency: false }, async () => {
  for (const item of baseline) {
    const family = await after.listEvolutionCatalog(item);
    assert.deepEqual(story.findEvolutionLineage(item, family), story.findEvolutionLineage(item, baseline), item.id);
    assert.deepEqual(story.findNextEvolution(item, family), story.findNextEvolution(item, baseline), item.id);
  }
});

test("search preserves substrings, field boundaries, Unicode and literal wildcards", { concurrency: false }, async () => {
  const queries = ["", " ", "iPhone", "아이폰", "NOKIA", "삼성", "%", "_", "'", "\\", "é", "Σ", "İ", "없는검색결과", "가".repeat(110)];
  for (const item of baseline.slice(0, 20)) queries.push(`${item.name} ${item.brand}`);
  for (const query of queries) assert.deepEqual(await after.searchPublishedCatalog(query), await before.searchPublishedCatalog(query), query);
  await measure("search-iphone", () => before.searchPublishedCatalog("iphone"), () => after.searchPublishedCatalog("iphone"));
  calls = [];
  assert.deepEqual(await after.searchPublishedCatalog("not-found-unique-phrase"), []);
  assert.equal(calls.length, 1);
});

test("query plans use targeted indexes and sitemap skips relationships", { concurrency: false }, async () => {
  const plans = benchmarks.detail.after.map(({ sql, params }) => sqlite.prepare(`EXPLAIN QUERY PLAN ${sql}`).all(...params).map((row) => row.detail).join("\n"));
  assert.match(plans[0], /SEARCH content_items USING INDEX/);
  for (const plan of plans.slice(1)) assert.doesNotMatch(plan, /SCAN (brands|content_years|content_tags|content_media|content_sources|media)(?:\s|$)/);
  calls = [];
  assert.deepEqual(await after.listPublishedCatalogIds(), baseline.map(({ id }) => ({ id })));
  assert.equal(calls.length, 1);
  for (const query of ["SELECT * FROM content_items WHERE status='published' ORDER BY start_year,name", "SELECT * FROM content_items WHERE status='published' AND featured=1 ORDER BY start_year,name"]) {
    assert.match(sqlite.prepare(`EXPLAIN QUERY PLAN ${query}`).all().map((row) => row.detail).join("\n"), /USING INDEX idx_content_public/);
  }
});
