-- BACK TO 2000 v0.4.2 · archive quality and editorial operations
CREATE TABLE content_review_events (
  id TEXT PRIMARY KEY NOT NULL,
  content_id TEXT NOT NULL REFERENCES content_items(id) ON DELETE CASCADE,
  actor_id TEXT REFERENCES users(id) ON DELETE SET NULL,
  action TEXT NOT NULL,
  from_status TEXT,
  to_status TEXT,
  note TEXT,
  created_at INTEGER NOT NULL
);
--> statement-breakpoint
CREATE INDEX idx_review_events_content_created ON content_review_events(content_id, created_at);
--> statement-breakpoint
CREATE INDEX idx_review_events_actor_created ON content_review_events(actor_id, created_at);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
--> statement-breakpoint
UPDATE content_items
SET quality_status = CASE
  WHEN length(trim(summary)) < 20 OR length(trim(body)) < 40 THEN 'incomplete'
  WHEN status = 'published' AND (quality_status = 'incomplete' OR length(trim(body)) < 80) THEN 'needs_review'
  ELSE quality_status
END;
--> statement-breakpoint
-- Replace duplicate representative media with item-specific archive assets.
UPDATE media SET public_url='/images/archive/milestones/2003-itunes-store-badge.svg', object_key='static/images/archive/milestones/2003-itunes-store-badge.svg', filename='2003-itunes-store-badge.svg', mime_type='image/svg+xml', alt_text='iTunes Store 서비스 대표 마크', credit='Back to 2000 archival rendering', source_url='https://commons.wikimedia.org/wiki/File:ITunes_Store_logo.svg', license='Original rendering · trademark reference', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2003-itunes-store' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2006-windows-live-messenger-mark.svg', object_key='static/images/archive/milestones/2006-windows-live-messenger-mark.svg', filename='2006-windows-live-messenger-mark.svg', mime_type='image/svg+xml', alt_text='Windows Live Messenger 대표 마크', credit='Back to 2000 archival rendering', source_url='https://commons.wikimedia.org/wiki/File:WLM_logo.svg', license='Original rendering · public-domain reference', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2006-windows-live-messenger' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2010-facetime-badge.svg', object_key='static/images/archive/milestones/2010-facetime-badge.svg', filename='2010-facetime-badge.svg', mime_type='image/svg+xml', alt_text='FaceTime 서비스 대표 마크', credit='Back to 2000 archival rendering', source_url='https://commons.wikimedia.org/wiki/File:FaceTime_iOS.svg', license='Original rendering · trademark reference', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2010-facetime' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2011-google-plus-mark.svg', object_key='static/images/archive/milestones/2011-google-plus-mark.svg', filename='2011-google-plus-mark.svg', mime_type='image/svg+xml', alt_text='Google+ 서비스 대표 마크', credit='Back to 2000 archival rendering', source_url='https://commons.wikimedia.org/wiki/File:Google%2B_logo.svg', license='Original rendering · trademark reference', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2011-google' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2015-amazon-echo-public-release.webp', object_key='static/images/archive/milestones/2015-amazon-echo-public-release.webp', filename='2015-amazon-echo-public-release.webp', mime_type='image/webp', alt_text='정식 판매된 흰색 1세대 Amazon Echo 제품 사진', credit='eBay product archive', source_url='https://www.ebay.co.uk/b/bn_7036960792', license='Source-site media terms', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2015-amazon-echo-public-release' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2017-xbox-one-x.jpg', object_key='static/images/archive/milestones/2017-xbox-one-x.jpg', filename='2017-xbox-one-x.jpg', mime_type='image/jpeg', alt_text='검은색 Xbox One X 본체 실물 제품 사진', credit='PixelSquid product archive', source_url='https://www.pixelsquid.com/png/xbox-one-x-console-2420565726784918756', license='Source-site media terms', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2017-xbox-one-x' AND role='hero');
--> statement-breakpoint
UPDATE media SET alt_text='Apple Watch Series 3 실제 제품 이미지', credit='Apple Newsroom', source_url='https://www.apple.com/uk/newsroom/2017/09/apple-watch-series-3-features-built-in-cellular-and-more/', license='Apple Newsroom media terms', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2017-apple-watch-series-3' AND role='hero');
--> statement-breakpoint
UPDATE media SET alt_text='Apple Watch Series 4 실제 제품 이미지', credit='Walmart product archive', source_url='https://www.walmart.com/ip/149868647', license='Source-site media terms', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2018-apple-watch-series-4' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2019-google-stadia-badge.svg', object_key='static/images/archive/milestones/2019-google-stadia-badge.svg', filename='2019-google-stadia-badge.svg', mime_type='image/svg+xml', alt_text='Google Stadia 서비스 대표 마크', credit='Back to 2000 archival rendering', source_url='https://commons.wikimedia.org/wiki/File:Google_Stadia_logo.svg', license='Original rendering · trademark reference', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2019-google-stadia' AND role='hero');
--> statement-breakpoint
UPDATE media SET public_url='/images/archive/milestones/2020-apple-fitness-badge.svg', object_key='static/images/archive/milestones/2020-apple-fitness-badge.svg', filename='2020-apple-fitness-badge.svg', mime_type='image/svg+xml', alt_text='Apple Fitness+ 서비스 대표 마크', credit='Back to 2000 archival rendering', source_url='https://www.apple.com/apple-fitness-plus/', license='Original rendering · trademark reference', updated_at=unixepoch()*1000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2020-apple-fitness' AND role='hero');
--> statement-breakpoint
PRAGMA optimize;
