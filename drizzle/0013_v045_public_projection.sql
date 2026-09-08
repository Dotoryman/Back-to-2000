CREATE TABLE IF NOT EXISTS published_catalog_items (
  content_id TEXT PRIMARY KEY NOT NULL REFERENCES content_items(id) ON DELETE CASCADE,
  type TEXT NOT NULL,
  slug TEXT NOT NULL,
  name TEXT NOT NULL,
  brand TEXT NOT NULL,
  start_year INTEGER NOT NULL,
  end_year INTEGER,
  active_years TEXT NOT NULL,
  eyebrow TEXT NOT NULL,
  summary TEXT NOT NULL,
  description TEXT NOT NULL,
  tags TEXT NOT NULL,
  accent TEXT NOT NULL,
  featured INTEGER NOT NULL DEFAULT 0,
  specs TEXT,
  highlights TEXT NOT NULL,
  story TEXT,
  source_label TEXT,
  source_url TEXT,
  image_public_url TEXT,
  image_object_key TEXT,
  image_alt TEXT,
  image_credit TEXT,
  image_source_url TEXT,
  image_license TEXT,
  search_text TEXT NOT NULL,
  updated_at INTEGER NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS uq_published_catalog_type_slug ON published_catalog_items(type, slug);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_published_catalog_order ON published_catalog_items(start_year, name);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_published_catalog_type_order ON published_catalog_items(type, start_year, name);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_published_catalog_featured_order ON published_catalog_items(featured, start_year, name);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_published_catalog_lineage ON published_catalog_items(type, brand, start_year, name);
--> statement-breakpoint
INSERT OR REPLACE INTO published_catalog_items (
  content_id, type, slug, name, brand, start_year, end_year, active_years,
  eyebrow, summary, description, tags, accent, featured, specs, highlights,
  story, source_label, source_url, image_public_url, image_object_key,
  image_alt, image_credit, image_source_url, image_license, search_text, updated_at
)
SELECT
  ci.id, ci.type, ci.slug, ci.name, COALESCE(b.name, 'Unknown'), ci.start_year, ci.end_year,
  COALESCE((SELECT json_group_array(y.year) FROM (SELECT cy.year FROM content_years cy WHERE cy.content_id = ci.id ORDER BY cy.year, cy.sort_order) y), json_array(ci.start_year)),
  ci.eyebrow, ci.summary, ci.body,
  COALESCE((SELECT json_group_array(tn.name) FROM (SELECT t.name FROM content_tags ct JOIN tags t ON t.id = ct.tag_id WHERE ct.content_id = ci.id ORDER BY ct.rowid) tn), '[]'),
  ci.accent, ci.featured,
  CASE WHEN json_type(ci.metadata, '$.specs') = 'object' THEN json_extract(ci.metadata, '$.specs') END,
  CASE WHEN json_type(ci.metadata, '$.highlights') = 'array' THEN json_extract(ci.metadata, '$.highlights') ELSE '[]' END,
  CASE WHEN json_type(ci.metadata, '$.story.significance') = 'text' AND json_type(ci.metadata, '$.story.legacy') = 'text' THEN json_extract(ci.metadata, '$.story') END,
  (SELECT cs.label FROM content_sources cs WHERE cs.content_id = ci.id ORDER BY cs.is_primary DESC, cs.rowid LIMIT 1),
  (SELECT cs.url FROM content_sources cs WHERE cs.content_id = ci.id ORDER BY cs.is_primary DESC, cs.rowid LIMIT 1),
  (SELECT m.public_url FROM content_media cm JOIN media m ON m.id = cm.media_id WHERE cm.content_id = ci.id AND cm.role = 'hero' ORDER BY cm.sort_order, cm.rowid LIMIT 1),
  (SELECT m.object_key FROM content_media cm JOIN media m ON m.id = cm.media_id WHERE cm.content_id = ci.id AND cm.role = 'hero' ORDER BY cm.sort_order, cm.rowid LIMIT 1),
  (SELECT m.alt_text FROM content_media cm JOIN media m ON m.id = cm.media_id WHERE cm.content_id = ci.id AND cm.role = 'hero' ORDER BY cm.sort_order, cm.rowid LIMIT 1),
  (SELECT m.credit FROM content_media cm JOIN media m ON m.id = cm.media_id WHERE cm.content_id = ci.id AND cm.role = 'hero' ORDER BY cm.sort_order, cm.rowid LIMIT 1),
  (SELECT m.source_url FROM content_media cm JOIN media m ON m.id = cm.media_id WHERE cm.content_id = ci.id AND cm.role = 'hero' ORDER BY cm.sort_order, cm.rowid LIMIT 1),
  (SELECT m.license FROM content_media cm JOIN media m ON m.id = cm.media_id WHERE cm.content_id = ci.id AND cm.role = 'hero' ORDER BY cm.sort_order, cm.rowid LIMIT 1),
  ci.name || ' ' || COALESCE(b.name, 'Unknown') || ' ' || ci.summary || ' ' || ci.body || ' ' || COALESCE((SELECT group_concat(tn.name, ' ') FROM (SELECT t.name FROM content_tags ct JOIN tags t ON t.id = ct.tag_id WHERE ct.content_id = ci.id ORDER BY ct.rowid) tn), ''),
  ci.updated_at
FROM content_items ci
LEFT JOIN brands b ON b.id = ci.brand_id
WHERE ci.status = 'published';
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS content_reaction_counts (
  content_id TEXT PRIMARY KEY NOT NULL REFERENCES content_items(id) ON DELETE CASCADE,
  used INTEGER NOT NULL DEFAULT 0,
  remembered INTEGER NOT NULL DEFAULT 0,
  wanted INTEGER NOT NULL DEFAULT 0,
  total INTEGER NOT NULL DEFAULT 0,
  updated_at INTEGER NOT NULL
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_reaction_counts_total ON content_reaction_counts(total);
--> statement-breakpoint
INSERT OR REPLACE INTO content_reaction_counts (content_id, used, remembered, wanted, total, updated_at)
SELECT content_id,
  SUM(CASE WHEN reaction = 'used' THEN 1 ELSE 0 END),
  SUM(CASE WHEN reaction = 'remembered' THEN 1 ELSE 0 END),
  SUM(CASE WHEN reaction = 'wanted' THEN 1 ELSE 0 END),
  COUNT(*), unixepoch('subsec') * 1000
FROM collection_items GROUP BY content_id;
--> statement-breakpoint
CREATE TRIGGER IF NOT EXISTS collection_items_count_insert AFTER INSERT ON collection_items BEGIN
  INSERT INTO content_reaction_counts(content_id, used, remembered, wanted, total, updated_at)
  VALUES (NEW.content_id, NEW.reaction = 'used', NEW.reaction = 'remembered', NEW.reaction = 'wanted', 1, unixepoch('subsec') * 1000)
  ON CONFLICT(content_id) DO UPDATE SET
    used = used + (NEW.reaction = 'used'), remembered = remembered + (NEW.reaction = 'remembered'),
    wanted = wanted + (NEW.reaction = 'wanted'), total = total + 1, updated_at = unixepoch('subsec') * 1000;
END;
--> statement-breakpoint
CREATE TRIGGER IF NOT EXISTS collection_items_count_delete AFTER DELETE ON collection_items BEGIN
  UPDATE content_reaction_counts SET
    used = MAX(0, used - (OLD.reaction = 'used')), remembered = MAX(0, remembered - (OLD.reaction = 'remembered')),
    wanted = MAX(0, wanted - (OLD.reaction = 'wanted')), total = MAX(0, total - 1), updated_at = unixepoch('subsec') * 1000
  WHERE content_id = OLD.content_id;
END;
--> statement-breakpoint
CREATE TRIGGER IF NOT EXISTS collection_items_count_update AFTER UPDATE OF reaction ON collection_items WHEN OLD.reaction <> NEW.reaction BEGIN
  UPDATE content_reaction_counts SET
    used = MAX(0, used - (OLD.reaction = 'used')) + (NEW.reaction = 'used'),
    remembered = MAX(0, remembered - (OLD.reaction = 'remembered')) + (NEW.reaction = 'remembered'),
    wanted = MAX(0, wanted - (OLD.reaction = 'wanted')) + (NEW.reaction = 'wanted'),
    updated_at = unixepoch('subsec') * 1000
  WHERE content_id = NEW.content_id;
END;
--> statement-breakpoint
PRAGMA optimize;
