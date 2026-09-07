-- Full/featured public lists order by year and name without the intervening type column.
CREATE INDEX IF NOT EXISTS idx_content_public_order
  ON content_items (status, start_year, name);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_content_public_featured_order
  ON content_items (status, featured, start_year, name);
--> statement-breakpoint
-- Keep existing type+slug unique, year/content, relation and primary-key indexes.
PRAGMA optimize;
