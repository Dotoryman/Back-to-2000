-- BACK TO 2000 V0.3.3 DEDUPLICATE YEARLY CATALOG
-- Each archive item is shown once, in the year it first appeared.
DELETE FROM content_years
WHERE content_id IN (
  'web-daum', 'web-google', 'web-naver', 'service-msn', 'service-nateon',
  'service-facebook', 'service-youtube', 'service-kakaotalk', 'service-instagram',
  'service-line', 'service-tiktok', 'service-zoom'
);
--> statement-breakpoint
INSERT INTO content_years (content_id, year, sort_order) VALUES
  ('web-daum', 1998, 0),
  ('web-google', 1998, 0),
  ('web-naver', 1999, 0),
  ('service-msn', 1999, 0),
  ('service-nateon', 2003, 0),
  ('service-facebook', 2004, 0),
  ('service-youtube', 2005, 0),
  ('service-kakaotalk', 2010, 0),
  ('service-instagram', 2010, 0),
  ('service-line', 2011, 0),
  ('service-zoom', 2013, 0),
  ('service-tiktok', 2017, 0);
--> statement-breakpoint
UPDATE content_items
SET status = 'archived', updated_at = 1786579200000
WHERE id = 'milestone-2006-roblox';
--> statement-breakpoint
DELETE FROM content_years WHERE content_id = 'milestone-2006-roblox';
--> statement-breakpoint
PRAGMA optimize;
