-- LG WING IMAGE MAINTENANCE (NO VERSION RELEASE)
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-08c008a457ae', '/images/archive/devices/lg-wing-device.webp', '/images/archive/devices/lg-wing-device.webp', 'static', 'lg-wing-device.webp', 'image/webp', 63950, '스위블 화면을 펼친 LG WING과 전후면 제품 모습', 'LG전자 공식 뉴스룸', 'https://www.lg.com/global/newsroom/news/corporate/lg-wing-represents-a-new-definition-of-usability-never-seen-before-in-a-smartphone/', 'LG전자 공식 보도 이미지 · 원저작자 권리 보유', 'review', 1, NULL, 1786665600000, 1786665600000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, object_key=excluded.object_key, filename=excluded.filename, mime_type=excluded.mime_type, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, updated_at=excluded.updated_at;
--> statement-breakpoint
DELETE FROM content_media WHERE content_id='phone-lg-wing' AND role='hero';
--> statement-breakpoint
INSERT INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-lg-wing', 'media-08c008a457ae', 'hero', 0);
--> statement-breakpoint
PRAGMA optimize;
