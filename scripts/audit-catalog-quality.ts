import { existsSync } from "node:fs";
import { join } from "node:path";
import { catalog, timelineYears } from "../domain/catalog/data";

const issues: string[] = [];
const duplicateIds = duplicates(catalog.map((item) => item.id));
const duplicateSlugs = duplicates(catalog.map((item) => `${item.kind}:${item.slug}`));
if (duplicateIds.length) issues.push(`duplicate ids: ${duplicateIds.join(", ")}`);
if (duplicateSlugs.length) issues.push(`duplicate kind/slug: ${duplicateSlugs.join(", ")}`);

for (const year of timelineYears) {
  const count = catalog.filter((item) => item.year === year).length;
  if (count < 10) issues.push(`${year}: only ${count} new items`);
  const games = catalog.filter((item) => item.kind === "game" && item.year === year);
  if (!games.length) issues.push(`${year}: missing global game`);
}

for (const item of catalog) {
  if (item.summary.length < 20) issues.push(`${item.id}: short summary`);
  if (item.description.length < 40) issues.push(`${item.id}: short description`);
  if (/그해 새롭게 등장한 기술과 서비스의 흐름/.test(item.description)) issues.push(`${item.id}: generic description`);
  if (!item.source?.label || !URL.canParse(item.source.url)) issues.push(`${item.id}: invalid content source`);
  if (!item.image) issues.push(`${item.id}: missing image metadata`);
  if (item.image) {
    if (!item.image.alt || !item.image.credit || !item.image.sourceUrl || !item.image.license) issues.push(`${item.id}: incomplete image rights metadata`);
    if (!existsSync(join(process.cwd(), "public", item.image.src.replace(/^\//, "")))) issues.push(`${item.id}: missing local image`);
  }
  if (item.kind === "game") {
    if (!item.specs?.장르 || !item.specs?.플랫폼 || !item.specs?.["공개 단계"]) issues.push(`${item.id}: incomplete game facts`);
    if (!item.story?.significance || !item.story?.legacy) issues.push(`${item.id}: incomplete game story`);
  }
}

if (issues.length) {
  console.error(issues.join("\n"));
  process.exitCode = 1;
} else {
  console.log(`Catalog quality passed: ${catalog.length} items, ${timelineYears.length} years, no gaps.`);
}

function duplicates(values: string[]) {
  const seen = new Set<string>();
  const duplicate = new Set<string>();
  for (const value of values) {
    if (seen.has(value)) duplicate.add(value);
    else seen.add(value);
  }
  return [...duplicate];
}
