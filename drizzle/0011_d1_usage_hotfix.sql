-- Reduce D1 rows scanned by public catalog traffic and provide a global cache version.
CREATE TABLE IF NOT EXISTS catalog_cache_version (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  version INTEGER NOT NULL DEFAULT 1,
  updated_at INTEGER NOT NULL DEFAULT (unixepoch())
);
--> statement-breakpoint
INSERT OR IGNORE INTO catalog_cache_version (id, version, updated_at) VALUES (1, 1, unixepoch());
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_content_items_public_catalog
  ON content_items (status, type, featured, start_year, name);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_content_years_year_content
  ON content_years (year, content_id);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_content_media_role_content_sort
  ON content_media (role, content_id, sort_order);
--> statement-breakpoint
PRAGMA optimize;
