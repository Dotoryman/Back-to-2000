export type ContentKind = "website" | "phone" | "product" | "service" | "event" | "game" | "program";

export type Era = {
  year: number;
  label: string;
  summary: string;
  accent: string;
};

export type CatalogItem = {
  id: string;
  kind: ContentKind;
  slug: string;
  name: string;
  brand: string;
  year: number;
  endYear?: number;
  activeYears?: number[];
  eyebrow: string;
  summary: string;
  description: string;
  tags: string[];
  accent: string;
  featured?: boolean;
  specs?: Record<string, string>;
  highlights: string[];
  source?: {
    label: string;
    url: string;
  };
  image?: {
    src: string;
    alt: string;
    credit: string;
    sourceUrl: string;
    license?: string;
  };
};
