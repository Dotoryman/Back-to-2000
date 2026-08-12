import type { MetadataRoute } from "next";
import { SITE_URL } from "@/domain/site";
import { listCatalogCategories, listPublishedCatalog, listPublishedEras } from "@/domain/catalog/repository";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const [catalog, categories, eras] = await Promise.all([listPublishedCatalog(), listCatalogCategories(), listPublishedEras()]);
  const paths = [
    "",
    "/search",
    "/collection",
    ...eras.map((era) => `/years/${era.year}`),
    ...categories.map((category) => `/categories/${category.slug}`),
    "/categories/popular",
    "/timelines/website",
    "/timelines/phone",
    ...catalog.map((item) => `/archive/${item.id}`),
  ];
  return paths.map((path) => ({
    url: `${SITE_URL}${path}`,
    changeFrequency: path.startsWith("/archive/") ? "monthly" : "weekly",
    priority: path === "" ? 1 : path.startsWith("/archive/") ? 0.7 : 0.8,
  }));
}
