import type { MetadataRoute } from "next";
import { catalog, categories, timelineYears } from "@/domain/catalog/data";
import { SITE_URL } from "@/domain/site";

export default function sitemap(): MetadataRoute.Sitemap {
  const paths = ["", "/search", "/collection", ...timelineYears.map((year) => `/years/${year}`), ...categories.map((category) => `/categories/${category.slug}`), "/timelines/website", "/timelines/phone", ...catalog.map((item) => `/archive/${item.id}`)];
  return paths.map((path) => ({ url: `${SITE_URL}${path}`, changeFrequency: path.startsWith("/archive/") ? "monthly" : "weekly", priority: path === "" ? 1 : path.startsWith("/archive/") ? 0.7 : 0.8 }));
}
