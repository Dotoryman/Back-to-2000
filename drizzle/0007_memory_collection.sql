-- BACK TO 2000 v0.4.0 · D1 anonymous memory collections
ALTER TABLE collection_items ADD COLUMN reaction TEXT NOT NULL DEFAULT 'used';
--> statement-breakpoint
ALTER TABLE collection_items ADD COLUMN updated_at INTEGER NOT NULL DEFAULT 0;
--> statement-breakpoint
UPDATE collection_items SET updated_at = created_at WHERE updated_at = 0;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS uq_collections_device_key ON collections(device_key) WHERE device_key IS NOT NULL;
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_collection_items_content_reaction ON collection_items(content_id, reaction);
--> statement-breakpoint
PRAGMA optimize;
