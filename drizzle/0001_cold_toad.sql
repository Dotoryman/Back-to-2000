CREATE TABLE `content_media` (
	`content_id` text NOT NULL,
	`media_id` text NOT NULL,
	`role` text DEFAULT 'gallery' NOT NULL,
	`sort_order` integer DEFAULT 0 NOT NULL,
	`caption` text,
	PRIMARY KEY(`content_id`, `media_id`, `role`),
	FOREIGN KEY (`content_id`) REFERENCES `content_items`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `idx_content_media_content_role` ON `content_media` (`content_id`,`role`,`sort_order`);--> statement-breakpoint
CREATE TABLE `content_revisions` (
	`id` text PRIMARY KEY NOT NULL,
	`content_id` text NOT NULL,
	`version` integer NOT NULL,
	`snapshot` text NOT NULL,
	`actor_id` text,
	`note` text,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`content_id`) REFERENCES `content_items`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `uq_content_revision_version` ON `content_revisions` (`content_id`,`version`);--> statement-breakpoint
CREATE INDEX `idx_content_revisions_content_created` ON `content_revisions` (`content_id`,`created_at`);--> statement-breakpoint
CREATE TABLE `content_sources` (
	`id` text PRIMARY KEY NOT NULL,
	`content_id` text NOT NULL,
	`label` text NOT NULL,
	`url` text NOT NULL,
	`source_type` text DEFAULT 'reference' NOT NULL,
	`is_primary` integer DEFAULT false NOT NULL,
	`checked_at` integer,
	`created_at` integer NOT NULL,
	`updated_at` integer NOT NULL,
	FOREIGN KEY (`content_id`) REFERENCES `content_items`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `idx_content_sources_content_primary` ON `content_sources` (`content_id`,`is_primary`);--> statement-breakpoint
CREATE TABLE `content_years` (
	`content_id` text NOT NULL,
	`year` integer NOT NULL,
	`sort_order` integer DEFAULT 0 NOT NULL,
	PRIMARY KEY(`content_id`, `year`),
	FOREIGN KEY (`content_id`) REFERENCES `content_items`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `idx_content_years_year` ON `content_years` (`year`,`sort_order`);--> statement-breakpoint
ALTER TABLE `brands` ADD `website_url` text;--> statement-breakpoint
ALTER TABLE `brands` ADD `country_code` text;--> statement-breakpoint
ALTER TABLE `brands` ADD `status` text DEFAULT 'draft' NOT NULL;--> statement-breakpoint
CREATE INDEX `idx_brands_status_name` ON `brands` (`status`,`name`);--> statement-breakpoint
ALTER TABLE `categories` ADD `sort_order` integer DEFAULT 0 NOT NULL;--> statement-breakpoint
ALTER TABLE `content_items` ADD `eyebrow` text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE `content_items` ADD `quality_status` text DEFAULT 'incomplete' NOT NULL;--> statement-breakpoint
ALTER TABLE `content_items` ADD `content_version` integer DEFAULT 1 NOT NULL;--> statement-breakpoint
ALTER TABLE `content_items` ADD `verified_at` integer;--> statement-breakpoint
CREATE INDEX `idx_content_type_status_year` ON `content_items` (`type`,`status`,`start_year`);--> statement-breakpoint
CREATE INDEX `idx_content_quality_status` ON `content_items` (`quality_status`,`status`);--> statement-breakpoint
ALTER TABLE `eras` ADD `accent` text DEFAULT '#9bcbe2' NOT NULL;--> statement-breakpoint
CREATE INDEX `idx_eras_status_year` ON `eras` (`status`,`year`);--> statement-breakpoint
ALTER TABLE `media` ADD `public_url` text;--> statement-breakpoint
ALTER TABLE `media` ADD `storage_provider` text DEFAULT 'r2' NOT NULL;--> statement-breakpoint
ALTER TABLE `media` ADD `license` text;--> statement-breakpoint
ALTER TABLE `media` ADD `rights_status` text DEFAULT 'review' NOT NULL;--> statement-breakpoint
ALTER TABLE `media` ADD `attribution_required` integer DEFAULT true NOT NULL;--> statement-breakpoint
ALTER TABLE `media` ADD `verified_at` integer;--> statement-breakpoint
CREATE INDEX `idx_media_rights_status` ON `media` (`rights_status`);--> statement-breakpoint
CREATE INDEX `idx_content_tags_tag_id` ON `content_tags` (`tag_id`);

-- BACK TO 2000 V0.2 CATALOG SEED
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-1998', 1998, '접속의 시대', '포털·검색·PC와 새로운 디지털 제품이 인터넷의 입구를 넓히던 시기', '#8b735e', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-1999', 1999, '접속의 시대', '포털·검색·PC와 새로운 디지털 제품이 인터넷의 입구를 넓히던 시기', '#8b735e', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2000', 2000, '접속의 시대', '포털·검색·PC와 새로운 디지털 제품이 인터넷의 입구를 넓히던 시기', '#8b735e', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2001', 2001, '접속의 시대', '포털·검색·PC와 새로운 디지털 제품이 인터넷의 입구를 넓히던 시기', '#8b735e', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2002', 2002, '접속의 시대', '포털·검색·PC와 새로운 디지털 제품이 인터넷의 입구를 넓히던 시기', '#8b735e', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2003', 2003, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2004', 2004, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2005', 2005, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2006', 2006, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2007', 2007, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2008', 2008, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2009', 2009, '관계의 시대', '메신저·소셜·동영상 서비스와 모바일 기기가 관계의 방식을 바꾸던 시기', '#6f8fa8', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2010', 2010, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2011', 2011, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2012', 2012, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2013', 2013, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2014', 2014, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2015', 2015, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2016', 2016, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2017', 2017, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2018', 2018, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2019', 2019, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO eras (id, year, title, summary, accent, status, created_at, updated_at) VALUES ('era-2020', 2020, '모바일의 시대', '스마트폰·앱·스트리밍이 일상 전체를 다시 설계한 시기', '#17324d', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-website', 'website', '웹사이트', '첫 화면을 열면 시대가 보이던 검색엔진과 포털', 0, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-phone', 'phone', '휴대폰', '손안의 물건으로 취향을 말하던 피처폰과 스마트폰', 1, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-product', 'product', '제품', 'PC·콘솔·웨어러블까지 디지털 생활을 바꾼 기념비적인 제품', 2, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-service', 'service', '서비스', '메신저·동영상·소셜로 사람을 연결한 온라인 서비스', 3, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-program', 'program', '소프트웨어', '운영체제와 프로그램으로 달라진 디지털 사용 경험', 4, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-game', 'game', '게임', '새로운 플레이 방식과 문화를 만든 게임', 5, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-event', 'event', '사건', '디지털 문화의 흐름을 바꾼 중요한 순간', 6, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-4c2122fb6ed3', 'brand-4c2122fb6ed3', '네이버', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-854c76f3bcc6', 'brand-854c76f3bcc6', '다음', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-7bc25d25f16d', 'brand-7bc25d25f16d', 'Adobe', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-6d785501e2b5', 'brand-6d785501e2b5', 'Airbnb', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-d7b64e325ed7', 'brand-d7b64e325ed7', 'Alpha Exploration Co.', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-74c0fda1054b', 'brand-74c0fda1054b', 'Amazon', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-d3e00d24b349', 'brand-d3e00d24b349', 'Amazon Web Services', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-a583e0bb899c', 'brand-a583e0bb899c', 'AOL', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-476432a3e85a', 'brand-476432a3e85a', 'Apple', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-45f853acc01a', 'brand-45f853acc01a', 'ASUS', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-12d6f299af44', 'brand-12d6f299af44', 'Baidu', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-db1bab8efefb', 'brand-db1bab8efefb', 'Bebo', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-d765ee7e84f4', 'brand-d765ee7e84f4', 'BlackBerry', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-62a1ee25c03b', 'brand-62a1ee25c03b', 'Blizzard Entertainment', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b8c890ca9277', 'brand-b8c890ca9277', 'Bram Cohen', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-f4b8cf281981', 'brand-f4b8cf281981', 'ByteDance', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-f2d8526a8109', 'brand-f2d8526a8109', 'Canon', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-52e10d5a13da', 'brand-52e10d5a13da', 'Canonical', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-a9b8c7fdbc05', 'brand-a9b8c7fdbc05', 'Danga Interactive', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-2394cbc21fa1', 'brand-2394cbc21fa1', 'DeviantArt', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-68f235b2bb31', 'brand-68f235b2bb31', 'Digg', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-bccc14ee7da1', 'brand-bccc14ee7da1', 'Discord', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-3feb1ce9764b', 'brand-3feb1ce9764b', 'Disney', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-2c702b7f705f', 'brand-2c702b7f705f', 'DJI', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-78bfbf99825a', 'brand-78bfbf99825a', 'Epic Games', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-83303faa0eda', 'brand-83303faa0eda', 'Essential Products', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-181d9489c30a', 'brand-181d9489c30a', 'Etsy', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-3b713b2bde03', 'brand-3b713b2bde03', 'Flipboard', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-fb75a35db897', 'brand-fb75a35db897', 'Foursquare', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-c847a70d6bda', 'brand-c847a70d6bda', 'Friendster', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-5442e2b64fa0', 'brand-5442e2b64fa0', 'GitHub', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-2b681c0a24ba', 'brand-2b681c0a24ba', 'Google', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-2f5371407d06', 'brand-2f5371407d06', 'HTC', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-82069bb9dfb3', 'brand-82069bb9dfb3', 'Huawei', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-3bf0b3699bbd', 'brand-3bf0b3699bbd', 'Hulu', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-39d03f32a468', 'brand-39d03f32a468', 'Intermix Media', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-69769f875bec', 'brand-69769f875bec', 'Kakao', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-893e5d1b0f98', 'brand-893e5d1b0f98', 'Kickstarter', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-364d37be779d', 'brand-364d37be779d', 'King', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-8e40f123d531', 'brand-8e40f123d531', 'Korean Telecoms', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b4301e4bc1ae', 'brand-b4301e4bc1ae', 'LG', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-528a45acf629', 'brand-528a45acf629', 'LINE', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-6b6390a44161', 'brand-6b6390a44161', 'LinkedIn', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-28b3d10ccc21', 'brand-28b3d10ccc21', 'Ludicorp', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-1481bb38548f', 'brand-1481bb38548f', 'Match Group', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-4a4d708531cc', 'brand-4a4d708531cc', 'Maxis', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-8d546a6dea9f', 'brand-8d546a6dea9f', 'Meta', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-11f3242118ff', 'brand-11f3242118ff', 'Microsoft', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-723ba985328e', 'brand-723ba985328e', 'Mojang', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-399f01e13e37', 'brand-399f01e13e37', 'Motorola', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-d83016dd56e9', 'brand-d83016dd56e9', 'Mozilla', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-d5b35353dfa8', 'brand-d5b35353dfa8', 'Mozilla Organization', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-f03787494805', 'brand-f03787494805', 'Musical.ly', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-833e63c4e94b', 'brand-833e63c4e94b', 'Napster', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-ca024fd6b411', 'brand-ca024fd6b411', 'Netflix', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-0caaa759b075', 'brand-0caaa759b075', 'Niantic', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-7a43bf56a86c', 'brand-7a43bf56a86c', 'Nikon', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-0cac146e40c7', 'brand-0cac146e40c7', 'Nintendo', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-ec307432a3d7', 'brand-ec307432a3d7', 'Nokia', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-088472395b26', 'brand-088472395b26', 'NVIDIA', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-51984f4c8a58', 'brand-51984f4c8a58', 'Oculus', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b5d7a11bec4a', 'brand-b5d7a11bec4a', 'Oculus VR', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-abf8a47ffd27', 'brand-abf8a47ffd27', 'OnePlus', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-6f1dc81033db', 'brand-6f1dc81033db', 'Open Handset Alliance', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-7e0ab390e4f8', 'brand-7e0ab390e4f8', 'OpenOffice.org', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-519e39132bb9', 'brand-519e39132bb9', 'Path', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-559ef5544c82', 'brand-559ef5544c82', 'PayPal', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-a45a7994973a', 'brand-a45a7994973a', 'Pinterest', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-e66cf50cfdc8', 'brand-e66cf50cfdc8', 'Pyra Labs', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-5f08937928a3', 'brand-5f08937928a3', 'Raspberry Pi Foundation', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-4af26436ae9d', 'brand-4af26436ae9d', 'Reddit', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b16b1db72bde', 'brand-b16b1db72bde', 'Research In Motion', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b36783b63a3d', 'brand-b36783b63a3d', 'Roblox Corporation', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-18329e56255c', 'brand-18329e56255c', 'Saehan Information Systems', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-90e01d646458', 'brand-90e01d646458', 'Samsung', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-54dd4c71cae8', 'brand-54dd4c71cae8', 'Sega', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-cf3e9a41dee8', 'brand-cf3e9a41dee8', 'Sharp', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-808e5cc92dd8', 'brand-808e5cc92dd8', 'SK Communications', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-65b5966c269d', 'brand-65b5966c269d', 'SKY', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-26535aa23010', 'brand-26535aa23010', 'Skype Technologies', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-ce981920830e', 'brand-ce981920830e', 'Slack Technologies', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-9ecb0ed7d23e', 'brand-9ecb0ed7d23e', 'Snap Inc.', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b8d5ce12f432', 'brand-b8d5ce12f432', 'Sony', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b87db20f2ac9', 'brand-b87db20f2ac9', 'Sony Online Entertainment', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-2a0cb6b42add', 'brand-2a0cb6b42add', 'Spotify', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-82810cb97184', 'brand-82810cb97184', 'Square', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-ffa26e1057b5', 'brand-ffa26e1057b5', 'Sulake', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-edbea9ff1a78', 'brand-edbea9ff1a78', 'Telegram', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-834673647e69', 'brand-834673647e69', 'Tiger Electronics', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-30566b25fb58', 'brand-30566b25fb58', 'Trek 2000', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-af069f8fc07d', 'brand-af069f8fc07d', 'Tumblr', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-e43cc2d6a3d2', 'brand-e43cc2d6a3d2', 'Twitch Interactive', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-5392c950bdde', 'brand-5392c950bdde', 'Twitter', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-f1905b7e8dd9', 'brand-f1905b7e8dd9', 'Uber', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-f17ae7fa5dcf', 'brand-f17ae7fa5dcf', 'Ustream', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-986d2de2ea6d', 'brand-986d2de2ea6d', 'Valve', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-82915d30229c', 'brand-82915d30229c', 'Viber Media', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-cc9180581594', 'brand-cc9180581594', 'WarnerMedia', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b336fc558722', 'brand-b336fc558722', 'WhatsApp', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-52f2ffa198ad', 'brand-52f2ffa198ad', 'Wikimedia Foundation', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-5880fc6231df', 'brand-5880fc6231df', 'WordPress Foundation', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-4f5f69c7b9d2', 'brand-4f5f69c7b9d2', 'Xiaomi', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-9b3cbed5c490', 'brand-9b3cbed5c490', 'Zoom', '', 'published', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3c4a80dbdfac', 'tag-3c4a80dbdfac', '1998', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-fbc7843acd86', 'tag-fbc7843acd86', '1999', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a4ac914c09d7', 'tag-a4ac914c09d7', '2000', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9195f873d171', 'tag-9195f873d171', '2001', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2e8c0277e396', 'tag-2e8c0277e396', '2002', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ab165cb90d19', 'tag-ab165cb90d19', '2003', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-667e624fb374', 'tag-667e624fb374', '2004', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-23a0538f53cc', 'tag-23a0538f53cc', '2005', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-1938b79762f0', 'tag-1938b79762f0', '2006', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-aca6d6e0ac7c', 'tag-aca6d6e0ac7c', '2007', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-527dc687fa58', 'tag-527dc687fa58', '2008', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7263d678abae', 'tag-7263d678abae', '2009', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e22cd461c068', 'tag-e22cd461c068', '2010', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-32a70a32da27', 'tag-32a70a32da27', '2011', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-084b3af47af3', 'tag-084b3af47af3', '2012', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d08b10a32612', 'tag-d08b10a32612', '2013', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-39e21432a7dc', 'tag-39e21432a7dc', '2014', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9cdda67ded3f', 'tag-9cdda67ded3f', '2015', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ab39c5423911', 'tag-ab39c5423911', '2016', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-04e8696e6424', 'tag-04e8696e6424', '2017', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-66efd9eefecf', 'tag-66efd9eefecf', '2018', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-0c422ba64421', 'tag-0c422ba64421', '2019', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-85568b20c331', 'tag-85568b20c331', '2020', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-8a85fe387e2c', 'tag-8a85fe387e2c', '5G', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4f5a3f69b780', 'tag-4f5a3f69b780', '검색', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-eafe39a5e0e0', 'tag-eafe39a5e0e0', '검색엔진', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-73c34fa8719b', 'tag-73c34fa8719b', '그룹채팅', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d52f95ce200c', 'tag-d52f95ce200c', '글로벌', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a621219e3778', 'tag-a621219e3778', '뉴스피드', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6f2757b65058', 'tag-6f2757b65058', '동영상', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-94d38cc243d4', 'tag-94d38cc243d4', '듀얼스크린', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3aa96c9ea693', 'tag-3aa96c9ea693', '레이저', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9ec8e6d436fc', 'tag-9ec8e6d436fc', '메신저', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-06d0fd03ad3e', 'tag-06d0fd03ad3e', '메일', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-55440dab6a37', 'tag-55440dab6a37', '메탈', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e8d02e2a0db8', 'tag-e8d02e2a0db8', '모바일', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-1110b1b4ae35', 'tag-1110b1b4ae35', '모토로라', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-27872608a59b', 'tag-27872608a59b', '무료문자', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-46388e447c09', 'tag-46388e447c09', '무료통화', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e0115429f96f', 'tag-e0115429f96f', '바폰', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e13f1dc99a0f', 'tag-e13f1dc99a0f', '버디', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-0aaf6d1cc020', 'tag-0aaf6d1cc020', '비대면', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2f826f3ee651', 'tag-2f826f3ee651', '사진', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-45c901dcec1b', 'tag-45c901dcec1b', '서비스', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-baad6b46db2e', 'tag-baad6b46db2e', '소프트웨어', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-91aa30ed3a3e', 'tag-91aa30ed3a3e', '숏폼', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5503506ed35c', 'tag-5503506ed35c', '수업', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4aa08aab8d19', 'tag-4aa08aab8d19', '스마트폰', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2b5224439e04', 'tag-2b5224439e04', '스위블', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-74940418b5a9', 'tag-74940418b5a9', '스트리밍', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2b5cf381893e', 'tag-2b5cf381893e', '스티커', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-85df59670655', 'tag-85df59670655', '슬라이드', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6cd8f39f8360', 'tag-6cd8f39f8360', '애니콜', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d8d66e82c2b8', 'tag-d8d66e82c2b8', '웹사이트', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3c37764a2b97', 'tag-3c37764a2b97', '이메일', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5ab9da942628', 'tag-5ab9da942628', '제품', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3347b6d706c4', 'tag-3347b6d706c4', '지식iN', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7d8c760fb731', 'tag-7d8c760fb731', '채팅', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4adb8e4af045', 'tag-4adb8e4af045', '초콜릿폰', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5c8c471160cc', 'tag-5c8c471160cc', '추천피드', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e0d8b86ab8c7', 'tag-e0d8b86ab8c7', '카메라', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6daadb891eff', 'tag-6daadb891eff', '카페', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-faf117bbc31f', 'tag-faf117bbc31f', '컬러LCD', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f6ce87680390', 'tag-f6ce87680390', '터치', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-424f4d75c4df', 'tag-424f4d75c4df', '트랙볼', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-82318e002350', 'tag-82318e002350', '파일전송', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-322f3783e2c7', 'tag-322f3783e2c7', '포털', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3c9fb26ae54f', 'tag-3c9fb26ae54f', '폴더폰', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-166a7988e726', 'tag-166a7988e726', '풀터치', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-14fab11f869a', 'tag-14fab11f869a', '프로필', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3a1805781ddb', 'tag-3a1805781ddb', '피처폰', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f53a6e999db0', 'tag-f53a6e999db0', '필터', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2a78f366de89', 'tag-2a78f366de89', '햅틱', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-47f252317aff', 'tag-47f252317aff', '화상회의', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-29e0b27ac389', 'tag-29e0b27ac389', '휠키', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f9d4f7f5f6ca', 'tag-f9d4f7f5f6ca', '휴대전화', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7bc25d25f16d', 'tag-7bc25d25f16d', 'Adobe', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6d785501e2b5', 'tag-6d785501e2b5', 'Airbnb', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7b64e325ed7', 'tag-d7b64e325ed7', 'Alpha Exploration Co.', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-74c0fda1054b', 'tag-74c0fda1054b', 'Amazon', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d3e00d24b349', 'tag-d3e00d24b349', 'Amazon Web Services', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-1928f95c598b', 'tag-1928f95c598b', 'Android', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a583e0bb899c', 'tag-a583e0bb899c', 'AOL', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-476432a3e85a', 'tag-476432a3e85a', 'Apple', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-45f853acc01a', 'tag-45f853acc01a', 'ASUS', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-12d6f299af44', 'tag-12d6f299af44', 'Baidu', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-db1bab8efefb', 'tag-db1bab8efefb', 'Bebo', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d765ee7e84f4', 'tag-d765ee7e84f4', 'BlackBerry', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-62a1ee25c03b', 'tag-62a1ee25c03b', 'Blizzard Entertainment', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b8c890ca9277', 'tag-b8c890ca9277', 'Bram Cohen', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f4b8cf281981', 'tag-f4b8cf281981', 'ByteDance', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f2d8526a8109', 'tag-f2d8526a8109', 'Canon', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-52e10d5a13da', 'tag-52e10d5a13da', 'Canonical', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-00b4c3addae4', 'tag-00b4c3addae4', 'CDMA', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a9b8c7fdbc05', 'tag-a9b8c7fdbc05', 'Danga Interactive', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2394cbc21fa1', 'tag-2394cbc21fa1', 'DeviantArt', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-68f235b2bb31', 'tag-68f235b2bb31', 'Digg', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-bccc14ee7da1', 'tag-bccc14ee7da1', 'Discord', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3feb1ce9764b', 'tag-3feb1ce9764b', 'Disney', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2c702b7f705f', 'tag-2c702b7f705f', 'DJI', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-78bfbf99825a', 'tag-78bfbf99825a', 'Epic Games', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-83303faa0eda', 'tag-83303faa0eda', 'Essential Products', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-181d9489c30a', 'tag-181d9489c30a', 'Etsy', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3b713b2bde03', 'tag-3b713b2bde03', 'Flipboard', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-fb75a35db897', 'tag-fb75a35db897', 'Foursquare', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-c847a70d6bda', 'tag-c847a70d6bda', 'Friendster', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f69ff6e8d889', 'tag-f69ff6e8d889', 'Galaxy', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5442e2b64fa0', 'tag-5442e2b64fa0', 'GitHub', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2b681c0a24ba', 'tag-2b681c0a24ba', 'Google', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2f5371407d06', 'tag-2f5371407d06', 'HTC', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-82069bb9dfb3', 'tag-82069bb9dfb3', 'Huawei', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3bf0b3699bbd', 'tag-3bf0b3699bbd', 'Hulu', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-39d03f32a468', 'tag-39d03f32a468', 'Intermix Media', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-893e5d1b0f98', 'tag-893e5d1b0f98', 'Kickstarter', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-364d37be779d', 'tag-364d37be779d', 'King', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-8e40f123d531', 'tag-8e40f123d531', 'Korean Telecoms', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b4301e4bc1ae', 'tag-b4301e4bc1ae', 'LG', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6b6390a44161', 'tag-6b6390a44161', 'LinkedIn', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-28b3d10ccc21', 'tag-28b3d10ccc21', 'Ludicorp', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-1481bb38548f', 'tag-1481bb38548f', 'Match Group', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4a4d708531cc', 'tag-4a4d708531cc', 'Maxis', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-8d546a6dea9f', 'tag-8d546a6dea9f', 'Meta', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-11f3242118ff', 'tag-11f3242118ff', 'Microsoft', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-723ba985328e', 'tag-723ba985328e', 'Mojang', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9e6ed37766a8', 'tag-9e6ed37766a8', 'Moto X', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-399f01e13e37', 'tag-399f01e13e37', 'Motorola', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d83016dd56e9', 'tag-d83016dd56e9', 'Mozilla', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d5b35353dfa8', 'tag-d5b35353dfa8', 'Mozilla Organization', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f03787494805', 'tag-f03787494805', 'Musical.ly', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-833e63c4e94b', 'tag-833e63c4e94b', 'Napster', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ca024fd6b411', 'tag-ca024fd6b411', 'Netflix', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-0caaa759b075', 'tag-0caaa759b075', 'Niantic', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7a43bf56a86c', 'tag-7a43bf56a86c', 'Nikon', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-0cac146e40c7', 'tag-0cac146e40c7', 'Nintendo', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ec307432a3d7', 'tag-ec307432a3d7', 'Nokia', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-088472395b26', 'tag-088472395b26', 'NVIDIA', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-51984f4c8a58', 'tag-51984f4c8a58', 'Oculus', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b5d7a11bec4a', 'tag-b5d7a11bec4a', 'Oculus VR', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-abf8a47ffd27', 'tag-abf8a47ffd27', 'OnePlus', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6f1dc81033db', 'tag-6f1dc81033db', 'Open Handset Alliance', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7e0ab390e4f8', 'tag-7e0ab390e4f8', 'OpenOffice.org', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e426ddc63482', 'tag-e426ddc63482', 'Optimus', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-519e39132bb9', 'tag-519e39132bb9', 'Path', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-559ef5544c82', 'tag-559ef5544c82', 'PayPal', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a45a7994973a', 'tag-a45a7994973a', 'Pinterest', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e66cf50cfdc8', 'tag-e66cf50cfdc8', 'Pyra Labs', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-65e21ea0de88', 'tag-65e21ea0de88', 'QWERTY', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5f08937928a3', 'tag-5f08937928a3', 'Raspberry Pi Foundation', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4af26436ae9d', 'tag-4af26436ae9d', 'Reddit', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b16b1db72bde', 'tag-b16b1db72bde', 'Research In Motion', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b36783b63a3d', 'tag-b36783b63a3d', 'Roblox Corporation', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-18329e56255c', 'tag-18329e56255c', 'Saehan Information Systems', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-90e01d646458', 'tag-90e01d646458', 'Samsung', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-54dd4c71cae8', 'tag-54dd4c71cae8', 'Sega', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-cf3e9a41dee8', 'tag-cf3e9a41dee8', 'Sharp', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-65b5966c269d', 'tag-65b5966c269d', 'SKY', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-26535aa23010', 'tag-26535aa23010', 'Skype Technologies', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ce981920830e', 'tag-ce981920830e', 'Slack Technologies', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-90ec00c2b9ab', 'tag-90ec00c2b9ab', 'Snake', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9ecb0ed7d23e', 'tag-9ecb0ed7d23e', 'Snap Inc.', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e14d3b1405ad', 'tag-e14d3b1405ad', 'SNS', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b8d5ce12f432', 'tag-b8d5ce12f432', 'Sony', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b87db20f2ac9', 'tag-b87db20f2ac9', 'Sony Online Entertainment', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2a0cb6b42add', 'tag-2a0cb6b42add', 'Spotify', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-82810cb97184', 'tag-82810cb97184', 'Square', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ffa26e1057b5', 'tag-ffa26e1057b5', 'Sulake', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-edbea9ff1a78', 'tag-edbea9ff1a78', 'Telegram', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-834673647e69', 'tag-834673647e69', 'Tiger Electronics', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-30566b25fb58', 'tag-30566b25fb58', 'Trek 2000', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-af069f8fc07d', 'tag-af069f8fc07d', 'Tumblr', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e43cc2d6a3d2', 'tag-e43cc2d6a3d2', 'Twitch Interactive', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5392c950bdde', 'tag-5392c950bdde', 'Twitter', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f1905b7e8dd9', 'tag-f1905b7e8dd9', 'Uber', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4ce58815175c', 'tag-4ce58815175c', 'UCC', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f17ae7fa5dcf', 'tag-f17ae7fa5dcf', 'Ustream', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-986d2de2ea6d', 'tag-986d2de2ea6d', 'Valve', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-82915d30229c', 'tag-82915d30229c', 'Viber Media', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-cc9180581594', 'tag-cc9180581594', 'WarnerMedia', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b336fc558722', 'tag-b336fc558722', 'WhatsApp', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-52f2ffa198ad', 'tag-52f2ffa198ad', 'Wikimedia Foundation', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5880fc6231df', 'tag-5880fc6231df', 'WordPress Foundation', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4f5f69c7b9d2', 'tag-4f5f69c7b9d2', 'Xiaomi', 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('web-daum', 'website', 'daum', 'Daum', '한메일에서 카페까지', '메일과 카페 문화로 사람들을 한곳에 모은 1세대 포털', '한메일과 다음 카페는 온라인에서 편지를 쓰고 취향이 같은 사람을 만나는 가장 친숙한 방법이었습니다.', 1997, NULL, 'brand-854c76f3bcc6', 'category-website', '#5b63ff', 'published', 'verified', 0, '{"highlights":["무료 웹메일 한메일","주제별 커뮤니티 다음 카페","뉴스와 검색이 결합된 포털"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 1999, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2000, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2001, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2002, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2003, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2004, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2005, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2006, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2007, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2008, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2009, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2010, 12);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2011, 13);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2012, 14);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2013, 15);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2014, 16);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2015, 17);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2016, 18);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2017, 19);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2018, 20);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2019, 21);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-daum', 2020, 22);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-daum', 'tag-322f3783e2c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-daum', 'tag-06d0fd03ad3e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-daum', 'tag-6daadb891eff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-056f7cd04847', 'web-daum', 'Kakao 기업 연혁', 'https://www.kakaocorp.com/page/detail/10810', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-7f328f2d33c9', '/images/archive/daum-early.png', '/images/archive/daum-early.png', 'static', 'daum-early.png', 'image/png', 216374, '2000년 무렵 다음 홈페이지 전체 화면', '브런치 아카이브', 'https://brunch.co.kr/@830bfa34e0894d6/242', '원저작자 권리 보유 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('web-daum', 'media-7f328f2d33c9', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-056f7cd04847', 'web-daum', 1, '{"name":"Daum","summary":"메일과 카페 문화로 사람들을 한곳에 모은 1세대 포털","description":"한메일과 다음 카페는 온라인에서 편지를 쓰고 취향이 같은 사람을 만나는 가장 친숙한 방법이었습니다.","source":{"label":"Kakao 기업 연혁","url":"https://www.kakaocorp.com/page/detail/10810"},"image":{"src":"/images/archive/daum-early.png","alt":"2000년 무렵 다음 홈페이지 전체 화면","credit":"브런치 아카이브","sourceUrl":"https://brunch.co.kr/@830bfa34e0894d6/242","license":"원저작자 권리 보유 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('web-google', 'website', 'google', 'Google', '검색에만 집중한 첫 화면', '단순한 검색창 하나로 웹을 찾는 방법을 바꾼 글로벌 검색 서비스', '복잡한 포털형 화면과 달리 검색에 집중한 여백 많은 첫 화면은 빠르고 명확한 인터넷 경험의 상징이 되었습니다.', 1998, NULL, 'brand-2b681c0a24ba', 'category-website', '#4285f4', 'published', 'verified', 1, '{"highlights":["검색에 집중한 미니멀한 첫 화면","페이지 중요도를 반영한 검색","전 세계 웹 문서로 이어지는 입구"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 1999, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2000, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2001, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2002, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2003, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2004, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2005, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2006, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2007, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2008, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2009, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2010, 12);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2011, 13);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2012, 14);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2013, 15);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2014, 16);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2015, 17);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2016, 18);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2017, 19);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2018, 20);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2019, 21);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-google', 2020, 22);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-google', 'tag-4f5a3f69b780');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-google', 'tag-d52f95ce200c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-google', 'tag-eafe39a5e0e0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-bb501e74d2e5', 'web-google', 'Google 공식 블로그', 'https://blog.google/company-news/inside-google/company-announcements/marking-20ish-years-google/', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e21031e8d2da', '/images/archive/google-2004-clean.png', '/images/archive/google-2004-clean.png', 'static', 'google-2004-clean.png', 'image/png', 188949, '2004년 Google 홈페이지 전체 화면', 'Kapwing Museum of Websites', 'https://www.kapwing.com/museum-of-websites/google', '역사 기록용 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('web-google', 'media-e21031e8d2da', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-bb501e74d2e5', 'web-google', 1, '{"name":"Google","summary":"단순한 검색창 하나로 웹을 찾는 방법을 바꾼 글로벌 검색 서비스","description":"복잡한 포털형 화면과 달리 검색에 집중한 여백 많은 첫 화면은 빠르고 명확한 인터넷 경험의 상징이 되었습니다.","source":{"label":"Google 공식 블로그","url":"https://blog.google/company-news/inside-google/company-announcements/marking-20ish-years-google/"},"image":{"src":"/images/archive/google-2004-clean.png","alt":"2004년 Google 홈페이지 전체 화면","credit":"Kapwing Museum of Websites","sourceUrl":"https://www.kapwing.com/museum-of-websites/google","license":"역사 기록용 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('web-naver', 'website', 'naver', 'NAVER', '초록 검색창의 시작', '지식iN과 통합검색으로 한국 인터넷의 첫 화면이 된 포털', '디렉터리 중심 검색에서 통합검색으로 이동하던 시기, 네이버는 한글 콘텐츠를 빠르게 모으며 일상의 출발점이 되었습니다.', 1999, NULL, 'brand-4c2122fb6ed3', 'category-website', '#03c75a', 'published', 'verified', 1, '{"highlights":["한눈에 보이는 통합검색","사용자가 답을 만드는 지식iN","뉴스·카페·블로그가 연결된 포털"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2001, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2002, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2003, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2004, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2005, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2006, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2007, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2008, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2009, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2010, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2011, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2012, 12);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2013, 13);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2014, 14);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2015, 15);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2016, 16);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2017, 17);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2018, 18);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2019, 19);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('web-naver', 2020, 20);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-naver', 'tag-322f3783e2c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-naver', 'tag-4f5a3f69b780');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('web-naver', 'tag-3347b6d706c4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f10d74563bb7', 'web-naver', 'NAVER 회사 소개', 'https://www.navercorp.com/naver/company', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5568137bce40', '/images/archive/naver-2000-clean.jpg', '/images/archive/naver-2000-clean.jpg', 'static', 'naver-2000-clean.jpg', 'image/jpeg', 79929, '2000년 네이버 홈페이지 전체 화면', '네이버 다이어리', 'https://blog.naver.com/naver_diary/150047725151', '© NAVER · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('web-naver', 'media-5568137bce40', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f10d74563bb7', 'web-naver', 1, '{"name":"NAVER","summary":"지식iN과 통합검색으로 한국 인터넷의 첫 화면이 된 포털","description":"디렉터리 중심 검색에서 통합검색으로 이동하던 시기, 네이버는 한글 콘텐츠를 빠르게 모으며 일상의 출발점이 되었습니다.","source":{"label":"NAVER 회사 소개","url":"https://www.navercorp.com/naver/company"},"image":{"src":"/images/archive/naver-2000-clean.jpg","alt":"2000년 네이버 홈페이지 전체 화면","credit":"네이버 다이어리","sourceUrl":"https://blog.naver.com/naver_diary/150047725151","license":"© NAVER · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-msn', 'service', 'msn-messenger', 'MSN Messenger', '온라인이라는 신호', '접속 알림과 대화명으로 친구의 기분을 읽던 글로벌 메신저', '친구가 로그인하면 작은 알림이 떴고 대화명과 상태 메시지는 지금의 프로필보다 더 자주 바뀌었습니다.', 1999, 2013, 'brand-11f3242118ff', 'category-service', '#38bdf8', 'published', 'verified', 1, '{"highlights":["실시간 접속 알림","감정을 담은 대화명","윈도우와 함께한 글로벌 메신저"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2001, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2002, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2003, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2004, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2005, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2006, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2007, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2008, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2009, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2010, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2011, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-msn', 2012, 12);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-msn', 'tag-9ec8e6d436fc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-msn', 'tag-7d8c760fb731');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-msn', 'tag-e13f1dc99a0f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-dc4dafef33c6', 'service-msn', 'Microsoft News', 'https://news.microsoft.com/1999/07/21/msn-messenger-service-launches-worldwide/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5d5808d3b8cc', '/images/archive/services/msn-messenger-4.6.png', '/images/archive/services/msn-messenger-4.6.png', 'static', 'msn-messenger-4.6.png', 'image/png', 69926, '2001년 MSN Messenger 4.6 친구 목록 화면', 'Microsoft / Wikipedia', 'https://en.wikipedia.org/wiki/MSN_Messenger', '역사 기록용 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-msn', 'media-5d5808d3b8cc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-dc4dafef33c6', 'service-msn', 1, '{"name":"MSN Messenger","summary":"접속 알림과 대화명으로 친구의 기분을 읽던 글로벌 메신저","description":"친구가 로그인하면 작은 알림이 떴고 대화명과 상태 메시지는 지금의 프로필보다 더 자주 바뀌었습니다.","source":{"label":"Microsoft News","url":"https://news.microsoft.com/1999/07/21/msn-messenger-service-launches-worldwide/"},"image":{"src":"/images/archive/services/msn-messenger-4.6.png","alt":"2001년 MSN Messenger 4.6 친구 목록 화면","credit":"Microsoft / Wikipedia","sourceUrl":"https://en.wikipedia.org/wiki/MSN_Messenger","license":"역사 기록용 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-nateon', 'service', 'nateon', 'NateOn', '무료 문자와 메신저', '무료 문자·파일 전송·원격제어로 국내 메신저의 중심이 된 서비스', '친구뿐 아니라 학교와 직장까지 연결하며 한국형 데스크톱 메신저 경험을 만들었습니다.', 2003, NULL, 'brand-808e5cc92dd8', 'category-service', '#fb7185', 'published', 'verified', 0, '{"highlights":["무료 문자","대용량 파일 전송","원격제어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2005, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2006, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2007, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2008, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2009, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2010, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2011, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2012, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2013, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2014, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-nateon', 2015, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-nateon', 'tag-9ec8e6d436fc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-nateon', 'tag-27872608a59b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-nateon', 'tag-82318e002350');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4940ccd5f9bb', 'service-nateon', 'NateOn 서비스', 'https://nateonweb.nate.com/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-94a0cb80300e', '/images/archive/services/nateon.png', '/images/archive/services/nateon.png', 'static', 'nateon.png', 'image/png', 162730, '네이트온 PC 메신저와 모바일 대화 화면', 'NATE Communications', 'https://natecorp.com/products_nateon', '© NATE Communications · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-nateon', 'media-94a0cb80300e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4940ccd5f9bb', 'service-nateon', 1, '{"name":"NateOn","summary":"무료 문자·파일 전송·원격제어로 국내 메신저의 중심이 된 서비스","description":"친구뿐 아니라 학교와 직장까지 연결하며 한국형 데스크톱 메신저 경험을 만들었습니다.","source":{"label":"NateOn 서비스","url":"https://nateonweb.nate.com/"},"image":{"src":"/images/archive/services/nateon.png","alt":"네이트온 PC 메신저와 모바일 대화 화면","credit":"NATE Communications","sourceUrl":"https://natecorp.com/products_nateon","license":"© NATE Communications · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-facebook', 'service', 'facebook', 'Facebook', '실명 기반 소셜 네트워크', '프로필과 뉴스피드로 사람과 소식을 연결한 소셜 서비스', '2004년 시작해 프로필, 친구, 뉴스피드라는 소셜 웹의 문법을 대중화했습니다.', 2004, NULL, 'brand-8d546a6dea9f', 'category-service', '#4267b2', 'published', 'verified', 0, '{"highlights":["실명 프로필","친구 네트워크","뉴스피드"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2005, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2006, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2007, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2008, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2009, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2010, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2011, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2012, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2013, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2014, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2015, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2016, 12);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2017, 13);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2018, 14);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2019, 15);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-facebook', 2020, 16);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-facebook', 'tag-e14d3b1405ad');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-facebook', 'tag-a621219e3778');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-facebook', 'tag-14fab11f869a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-754679096298', 'service-facebook', 'Facebook 10년 연혁', 'https://time.com/4112/facebook-10-year-anniversary-history/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a12d9e085fa3', '/images/archive/services/facebook.svg', '/images/archive/services/facebook.svg', 'static', 'facebook.svg', 'image/svg+xml', 2549, 'Facebook 로고', 'Meta / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Facebook_icon_2013.svg', '상표 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-facebook', 'media-a12d9e085fa3', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-754679096298', 'service-facebook', 1, '{"name":"Facebook","summary":"프로필과 뉴스피드로 사람과 소식을 연결한 소셜 서비스","description":"2004년 시작해 프로필, 친구, 뉴스피드라는 소셜 웹의 문법을 대중화했습니다.","source":{"label":"Facebook 10년 연혁","url":"https://time.com/4112/facebook-10-year-anniversary-history/"},"image":{"src":"/images/archive/services/facebook.svg","alt":"Facebook 로고","credit":"Meta / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Facebook_icon_2013.svg","license":"상표 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-youtube', 'service', 'youtube', 'YouTube', '누구나 올리는 인터넷 영상', '업로드·공유·구독으로 UCC와 크리에이터 시대를 연 동영상 서비스', '2005년 첫 영상과 베타 공개를 시작으로 웹에서 영상을 발견하고 공유하는 방식을 바꾸었습니다.', 2005, NULL, 'brand-2b681c0a24ba', 'category-service', '#ff0033', 'published', 'verified', 0, '{"highlights":["간편한 영상 업로드","퍼가기와 공유","채널 구독"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2007, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2008, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2009, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2010, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2011, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2012, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2013, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2014, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2015, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2016, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2017, 11);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2018, 12);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2019, 13);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-youtube', 2020, 14);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-youtube', 'tag-6f2757b65058');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-youtube', 'tag-4ce58815175c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-youtube', 'tag-74940418b5a9');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-19e57e650cd3', 'service-youtube', 'YouTube 공식 블로그', 'https://blog.youtube/news-and-events/celebrating-10-years-of-youtube/', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-4a9842bd65bf', '/images/archive/services/youtube.svg', '/images/archive/services/youtube.svg', 'static', 'youtube.svg', 'image/svg+xml', 974, 'YouTube 로고', 'YouTube / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:YouTube_full-color_icon_(2017).svg', '상표 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-youtube', 'media-4a9842bd65bf', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-19e57e650cd3', 'service-youtube', 1, '{"name":"YouTube","summary":"업로드·공유·구독으로 UCC와 크리에이터 시대를 연 동영상 서비스","description":"2005년 첫 영상과 베타 공개를 시작으로 웹에서 영상을 발견하고 공유하는 방식을 바꾸었습니다.","source":{"label":"YouTube 공식 블로그","url":"https://blog.youtube/news-and-events/celebrating-10-years-of-youtube/"},"image":{"src":"/images/archive/services/youtube.svg","alt":"YouTube 로고","credit":"YouTube / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:YouTube_full-color_icon_(2017).svg","license":"상표 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-kakaotalk', 'service', 'kakaotalk', 'KakaoTalk', '무료 모바일 메신저', '전화번호 기반 무료 채팅으로 한국의 모바일 소통을 바꾼 메신저', '2010년 iOS와 Android에 출시되어 문자 중심이던 휴대폰 대화를 데이터 기반 채팅으로 이동시켰습니다.', 2010, NULL, 'brand-69769f875bec', 'category-service', '#fee500', 'published', 'verified', 0, '{"highlights":["무료 1:1·그룹 채팅","전화번호 기반 친구","이모티콘과 선물하기"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2011, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2012, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2013, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2014, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2015, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2016, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2017, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2018, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2019, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-kakaotalk', 2020, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-kakaotalk', 'tag-9ec8e6d436fc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-kakaotalk', 'tag-e8d02e2a0db8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-kakaotalk', 'tag-73c34fa8719b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-37f0d9ae8ba6', 'service-kakaotalk', 'Kakao 공식 연혁', 'https://www.kakaocorp.com/page/detail/10810', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b5aac583bf62', '/images/archive/services/kakaotalk.svg', '/images/archive/services/kakaotalk.svg', 'static', 'kakaotalk.svg', 'image/svg+xml', 1763, 'KakaoTalk 로고', 'Kakao / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:KakaoTalk_logo.svg', 'PD-textlogo · 상표', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-kakaotalk', 'media-b5aac583bf62', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-37f0d9ae8ba6', 'service-kakaotalk', 1, '{"name":"KakaoTalk","summary":"전화번호 기반 무료 채팅으로 한국의 모바일 소통을 바꾼 메신저","description":"2010년 iOS와 Android에 출시되어 문자 중심이던 휴대폰 대화를 데이터 기반 채팅으로 이동시켰습니다.","source":{"label":"Kakao 공식 연혁","url":"https://www.kakaocorp.com/page/detail/10810"},"image":{"src":"/images/archive/services/kakaotalk.svg","alt":"KakaoTalk 로고","credit":"Kakao / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:KakaoTalk_logo.svg","license":"PD-textlogo · 상표"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-instagram', 'service', 'instagram', 'Instagram', '사진 한 장의 소셜 피드', '정사각형 사진과 필터로 모바일 사진 문화를 만든 서비스', '스마트폰 카메라로 찍고 보정해 곧바로 공유하는 흐름을 하나의 일상으로 만들었습니다.', 2010, NULL, 'brand-8d546a6dea9f', 'category-service', '#d946ef', 'published', 'verified', 0, '{"highlights":["정사각형 사진","사진 필터","모바일 피드"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2011, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2012, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2013, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2014, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2015, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2016, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2017, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2018, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2019, 9);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-instagram', 2020, 10);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-instagram', 'tag-e14d3b1405ad');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-instagram', 'tag-2f826f3ee651');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-instagram', 'tag-f53a6e999db0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-81b992ef9614', 'service-instagram', 'Instagram 공식 발표', 'https://about.instagram.com/blog/announcements/instagram-turns-10', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0f18a7e964df', '/images/archive/services/instagram.svg', '/images/archive/services/instagram.svg', 'static', 'instagram.svg', 'image/svg+xml', 4354, 'Instagram 로고', 'Meta / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Instagram_logo_2016.svg', '상표 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-instagram', 'media-0f18a7e964df', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-81b992ef9614', 'service-instagram', 1, '{"name":"Instagram","summary":"정사각형 사진과 필터로 모바일 사진 문화를 만든 서비스","description":"스마트폰 카메라로 찍고 보정해 곧바로 공유하는 흐름을 하나의 일상으로 만들었습니다.","source":{"label":"Instagram 공식 발표","url":"https://about.instagram.com/blog/announcements/instagram-turns-10"},"image":{"src":"/images/archive/services/instagram.svg","alt":"Instagram 로고","credit":"Meta / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Instagram_logo_2016.svg","license":"상표 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-line', 'service', 'line', 'LINE', '스티커로 말하는 메신저', '통화와 캐릭터 스티커를 앞세워 아시아로 확장한 모바일 메신저', '2011년 시작해 풍부한 스티커와 무료 통화로 모바일 대화의 표현 범위를 넓혔습니다.', 2011, NULL, 'brand-528a45acf629', 'category-service', '#06c755', 'published', 'verified', 0, '{"highlights":["캐릭터 스티커","무료 음성 통화","글로벌 친구 연결"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2013, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2014, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2015, 3);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2016, 4);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2017, 5);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2018, 6);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2019, 7);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-line', 2020, 8);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-line', 'tag-9ec8e6d436fc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-line', 'tag-2b5cf381893e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-line', 'tag-46388e447c09');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4f73d0126e14', 'service-line', 'LY Corporation 공식 연혁', 'https://www.lycorp.co.jp/en/company/history/line/', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d52d3b95a970', '/images/archive/services/line.svg', '/images/archive/services/line.svg', 'static', 'line.svg', 'image/svg+xml', 1466, 'LINE 메신저 로고', 'LINE / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:LINE_logo.svg', 'PD-textlogo · 상표', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-line', 'media-d52d3b95a970', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4f73d0126e14', 'service-line', 1, '{"name":"LINE","summary":"통화와 캐릭터 스티커를 앞세워 아시아로 확장한 모바일 메신저","description":"2011년 시작해 풍부한 스티커와 무료 통화로 모바일 대화의 표현 범위를 넓혔습니다.","source":{"label":"LY Corporation 공식 연혁","url":"https://www.lycorp.co.jp/en/company/history/line/"},"image":{"src":"/images/archive/services/line.svg","alt":"LINE 메신저 로고","credit":"LINE / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:LINE_logo.svg","license":"PD-textlogo · 상표"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-tiktok', 'service', 'tiktok', 'TikTok', '짧은 영상의 무한 피드', '세로형 숏폼과 추천 피드로 모바일 영상 소비를 바꾼 서비스', '짧은 세로 영상과 음악, 알고리즘 추천이 결합되며 영상 유행의 속도를 크게 높였습니다.', 2017, NULL, 'brand-f4b8cf281981', 'category-service', '#25f4ee', 'published', 'verified', 0, '{"highlights":["세로형 짧은 영상","음악과 챌린지","개인화 추천 피드"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-tiktok', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-tiktok', 2019, 1);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-tiktok', 2020, 2);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-tiktok', 'tag-91aa30ed3a3e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-tiktok', 'tag-6f2757b65058');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-tiktok', 'tag-5c8c471160cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-c71ec70f9006', 'service-tiktok', 'TikTok Newsroom', 'https://newsroom.tiktok.com/en-us/5-years-of-tiktok', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-eea7833f91fe', '/images/archive/services/tiktok.svg', '/images/archive/services/tiktok.svg', 'static', 'tiktok.svg', 'image/svg+xml', 722, 'TikTok 로고', 'TikTok / Simple Icons', 'https://simpleicons.org/?q=tiktok', '상표 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-tiktok', 'media-eea7833f91fe', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-c71ec70f9006', 'service-tiktok', 1, '{"name":"TikTok","summary":"세로형 숏폼과 추천 피드로 모바일 영상 소비를 바꾼 서비스","description":"짧은 세로 영상과 음악, 알고리즘 추천이 결합되며 영상 유행의 속도를 크게 높였습니다.","source":{"label":"TikTok Newsroom","url":"https://newsroom.tiktok.com/en-us/5-years-of-tiktok"},"image":{"src":"/images/archive/services/tiktok.svg","alt":"TikTok 로고","credit":"TikTok / Simple Icons","sourceUrl":"https://simpleicons.org/?q=tiktok","license":"상표 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('service-zoom', 'service', 'zoom', 'Zoom', '2020년의 회의실', '비대면 수업과 회의를 일상으로 만든 화상 커뮤니케이션 서비스', '2020년에는 집과 학교, 사무실을 화상 화면으로 연결하는 대표적인 도구가 되었습니다.', 2013, NULL, 'brand-9b3cbed5c490', 'category-service', '#2d8cff', 'published', 'verified', 0, '{"highlights":["간편한 회의 링크","화면 공유","갤러리 보기"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('service-zoom', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-zoom', 'tag-47f252317aff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-zoom', 'tag-0aaf6d1cc020');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('service-zoom', 'tag-5503506ed35c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-7ada6667b27b', 'service-zoom', 'Zoom 공식 회사 소개', 'https://www.zoom.com/en/about/', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b3dedeaae904', '/images/archive/services/zoom.svg', '/images/archive/services/zoom.svg', 'static', 'zoom.svg', 'image/svg+xml', 4293, 'Zoom 로고', 'Zoom / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Zoom_Communications_Logo.svg', '상표 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('service-zoom', 'media-b3dedeaae904', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-7ada6667b27b', 'service-zoom', 1, '{"name":"Zoom","summary":"비대면 수업과 회의를 일상으로 만든 화상 커뮤니케이션 서비스","description":"2020년에는 집과 학교, 사무실을 화상 화면으로 연결하는 대표적인 도구가 되었습니다.","source":{"label":"Zoom 공식 회사 소개","url":"https://www.zoom.com/en/about/"},"image":{"src":"/images/archive/services/zoom.svg","alt":"Zoom 로고","credit":"Zoom / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Zoom_Communications_Logo.svg","license":"상표 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-samsung-sch800', 'phone', 'samsung-sch-800', 'Anycall SCH-800', '한국형 폴더폰의 시작', '작은 폴더 구조로 휴대성을 강조한 초기 애니콜', '1998년 출시된 SCH-800은 삼성 휴대전화 디자인이 바 타입에서 폴더형으로 이동하던 장면을 보여줍니다.', 1998, NULL, 'brand-90e01d646458', 'category-phone', '#8b735e', 'published', 'verified', 0, '{"highlights":["컴팩트 폴더 구조","CDMA 휴대전화","초기 애니콜 디자인"],"specs":{"제조사":"삼성전자","출시":"1998년","형태":"폴더"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-samsung-sch800', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-samsung-sch800', 'tag-6cd8f39f8360');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-samsung-sch800', 'tag-3c9fb26ae54f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-samsung-sch800', 'tag-00b4c3addae4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-57e11ec226d4', 'phone-samsung-sch800', 'Samsung Design History', 'https://design.samsung.com/global/contents/design-history/product.html', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-25e00568aba1', '/images/archive/devices/samsung-sch-800.jpg', '/images/archive/devices/samsung-sch-800.jpg', 'static', 'samsung-sch-800.jpg', 'image/jpeg', 259233, 'Samsung Anycall SCH-800의 닫힌 모습, 내부 기판과 열린 모습', 'Versace / Ppomppu', 'https://www.ppomppu.co.kr/zboard/view.php?id=phone&no=286581', '원저작자 권리 보유 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-samsung-sch800', 'media-25e00568aba1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-57e11ec226d4', 'phone-samsung-sch800', 1, '{"name":"Anycall SCH-800","summary":"작은 폴더 구조로 휴대성을 강조한 초기 애니콜","description":"1998년 출시된 SCH-800은 삼성 휴대전화 디자인이 바 타입에서 폴더형으로 이동하던 장면을 보여줍니다.","source":{"label":"Samsung Design History","url":"https://design.samsung.com/global/contents/design-history/product.html"},"image":{"src":"/images/archive/devices/samsung-sch-800.jpg","alt":"Samsung Anycall SCH-800의 닫힌 모습, 내부 기판과 열린 모습","credit":"Versace / Ppomppu","sourceUrl":"https://www.ppomppu.co.kr/zboard/view.php?id=phone&no=286581","license":"원저작자 권리 보유 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-nokia-3310', 'phone', 'nokia-3310', 'Nokia 3310', '견고함의 아이콘', '교체형 커버와 Snake II로 기억되는 세계적인 바 타입 휴대전화', '2000년 공개된 Nokia 3310은 단단한 인상과 긴 배터리, 손쉬운 커버 교체로 대중적인 휴대전화가 되었습니다.', 2000, NULL, 'brand-ec307432a3d7', 'category-phone', '#4b76a5', 'published', 'verified', 0, '{"highlights":["교체형 Xpress-on 커버","Snake II","긴 배터리 사용 시간"],"specs":{"제조사":"Nokia","출시":"2000년","형태":"바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-nokia-3310', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-nokia-3310', 'tag-e0115429f96f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-nokia-3310', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-nokia-3310', 'tag-90ec00c2b9ab');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-fa9ace5f59fb', 'phone-nokia-3310', 'Nokia 3310 제품 기록', 'https://www.nokia.com/phones/en_int/nokia-3310', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ccc4d8ae0a3b', '/images/archive/devices/nokia-3310.jpg', '/images/archive/devices/nokia-3310.jpg', 'static', 'nokia-3310.jpg', 'image/jpeg', 588508, 'Nokia 3310 실제 제품 사진', 'Rtz / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Nokia3310.jpg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-nokia-3310', 'media-ccc4d8ae0a3b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-fa9ace5f59fb', 'phone-nokia-3310', 1, '{"name":"Nokia 3310","summary":"교체형 커버와 Snake II로 기억되는 세계적인 바 타입 휴대전화","description":"2000년 공개된 Nokia 3310은 단단한 인상과 긴 배터리, 손쉬운 커버 교체로 대중적인 휴대전화가 되었습니다.","source":{"label":"Nokia 3310 제품 기록","url":"https://www.nokia.com/phones/en_int/nokia-3310"},"image":{"src":"/images/archive/devices/nokia-3310.jpg","alt":"Nokia 3310 실제 제품 사진","credit":"Rtz / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia3310.jpg","license":"Public domain"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-samsung-t100', 'phone', 'samsung-sgh-t100', 'Samsung SGH-T100', '천만 대 판매 모델', '컬러 화면과 컴팩트한 폴더 디자인으로 세계 시장에서 사랑받은 Samsung 휴대전화', '2002년 출시된 SGH-T100은 삼성 휴대전화 최초의 천만 대 판매 모델로 기록됐습니다.', 2002, NULL, 'brand-90e01d646458', 'category-phone', '#8a7d70', 'published', 'verified', 0, '{"highlights":["TFT 컬러 LCD","컴팩트 폴더","글로벌 천만 대 판매"],"specs":{"제조사":"삼성전자","출시":"2002년","형태":"폴더"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-samsung-t100', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-samsung-t100', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-samsung-t100', 'tag-3c9fb26ae54f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-samsung-t100', 'tag-faf117bbc31f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-240e38128aae', 'phone-samsung-t100', 'Samsung Design History', 'https://design.samsung.com/global/contents/design-history/product.html', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d809d6175793', '/images/archive/devices/samsung-sgh-t100.png', '/images/archive/devices/samsung-sgh-t100.png', 'static', 'samsung-sgh-t100.png', 'image/png', 832565, 'Samsung SGH-T100 전체 제품 이미지', 'AnVuong1222004 / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Samsung_SGH-T100_(1).png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-samsung-t100', 'media-d809d6175793', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-240e38128aae', 'phone-samsung-t100', 1, '{"name":"Samsung SGH-T100","summary":"컬러 화면과 컴팩트한 폴더 디자인으로 세계 시장에서 사랑받은 Samsung 휴대전화","description":"2002년 출시된 SGH-T100은 삼성 휴대전화 최초의 천만 대 판매 모델로 기록됐습니다.","source":{"label":"Samsung Design History","url":"https://design.samsung.com/global/contents/design-history/product.html"},"image":{"src":"/images/archive/devices/samsung-sgh-t100.png","alt":"Samsung SGH-T100 전체 제품 이미지","credit":"AnVuong1222004 / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Samsung_SGH-T100_(1).png","license":"CC BY-SA 4.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-motorola-razr', 'phone', 'motorola-razr', 'Motorola RAZR V3', '얇음이 곧 스타일', '메탈 소재와 극적인 슬림함으로 세계를 사로잡은 폴더폰', 'RAZR V3는 기술 제품을 패션 액세서리처럼 보이게 만들었습니다. 펼치는 순간의 금속 키패드가 강렬했습니다.', 2004, NULL, 'brand-399f01e13e37', 'category-phone', '#fb7185', 'published', 'verified', 1, '{"highlights":["알루미늄 바디","레이저 각인 키패드","초슬림 실루엣"],"specs":{"제조사":"Motorola","출시":"2004년","형태":"폴더","두께":"13.9mm"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-motorola-razr', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-motorola-razr', 'tag-3c9fb26ae54f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-motorola-razr', 'tag-1110b1b4ae35');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-motorola-razr', 'tag-3aa96c9ea693');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-373327a0b3b9', 'phone-motorola-razr', 'Motorola 공식 연혁', 'https://www.motorolasolutions.com/content/dam/msi/docs/about-us/history/motorola-history.pdf', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-9dcc574308a1', '/images/archive/motorola-razr-v3.png', '/images/archive/motorola-razr-v3.png', 'static', 'motorola-razr-v3.png', 'image/png', 792362, 'Motorola RAZR V3 닫힌 모습과 열린 모습 전체 이미지', 'Raimond Spekking / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Motorola_Razr_V3_montage_closed_open.png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-motorola-razr', 'media-9dcc574308a1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-373327a0b3b9', 'phone-motorola-razr', 1, '{"name":"Motorola RAZR V3","summary":"메탈 소재와 극적인 슬림함으로 세계를 사로잡은 폴더폰","description":"RAZR V3는 기술 제품을 패션 액세서리처럼 보이게 만들었습니다. 펼치는 순간의 금속 키패드가 강렬했습니다.","source":{"label":"Motorola 공식 연혁","url":"https://www.motorolasolutions.com/content/dam/msi/docs/about-us/history/motorola-history.pdf"},"image":{"src":"/images/archive/motorola-razr-v3.png","alt":"Motorola RAZR V3 닫힌 모습과 열린 모습 전체 이미지","credit":"Raimond Spekking / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Motorola_Razr_V3_montage_closed_open.png","license":"CC BY-SA 4.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-sky-im-6500', 'phone', 'sky-im-6500', 'SKY IM-6500', 'It''s different', '휠 키와 감각적인 광고로 갖고 싶은 휴대폰이 된 SKY', '기능표보다 디자인과 감성이 먼저 기억나는 제품입니다. SKY는 휴대폰을 취향의 물건으로 바꾸었습니다.', 2004, NULL, 'brand-65b5966c269d', 'category-phone', '#e2e8f0', 'published', 'verified', 0, '{"highlights":["휠 내비게이션","슬라이드 디자인","감성 광고"],"specs":{"제조사":"팬택&큐리텔","출시":"2004년","형태":"슬라이드"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-sky-im-6500', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-sky-im-6500', 'tag-3a1805781ddb');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-sky-im-6500', 'tag-65b5966c269d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-sky-im-6500', 'tag-29e0b27ac389');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-84ab39590eba', 'phone-sky-im-6500', 'Danawa 제품 기록', 'https://prod.danawa.com/info/?pcode=10122', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-dc625f32dfc5', '/images/archive/devices/sky-im-6500.jpg', '/images/archive/devices/sky-im-6500.jpg', 'static', 'sky-im-6500.jpg', 'image/jpeg', 32087, 'SKY IM-6500 전체 제품 이미지', 'Danawa 제품 아카이브', 'https://prod.danawa.com/info/?pcode=10122', '원저작자 권리 보유 · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-sky-im-6500', 'media-dc625f32dfc5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-84ab39590eba', 'phone-sky-im-6500', 1, '{"name":"SKY IM-6500","summary":"휠 키와 감각적인 광고로 갖고 싶은 휴대폰이 된 SKY","description":"기능표보다 디자인과 감성이 먼저 기억나는 제품입니다. SKY는 휴대폰을 취향의 물건으로 바꾸었습니다.","source":{"label":"Danawa 제품 기록","url":"https://prod.danawa.com/info/?pcode=10122"},"image":{"src":"/images/archive/devices/sky-im-6500.jpg","alt":"SKY IM-6500 전체 제품 이미지","credit":"Danawa 제품 아카이브","sourceUrl":"https://prod.danawa.com/info/?pcode=10122","license":"원저작자 권리 보유 · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-lg-chocolate', 'phone', 'lg-chocolate-kg800', 'LG Chocolate KG800', '초콜릿처럼 매끈한 슬라이드폰', '검은 전면과 붉은 터치 키로 LG 디자인폰 시대를 연 제품', '2006년 글로벌 시장에 출시된 Chocolate은 기능보다 감성적 이름과 미니멀한 표면을 전면에 내세웠습니다.', 2006, NULL, 'brand-b4301e4bc1ae', 'category-phone', '#b91c1c', 'published', 'verified', 0, '{"highlights":["숨겨진 터치 키","검정·빨강 컬러","글로벌 디자인폰"],"specs":{"제조사":"LG전자","출시":"2006년","형태":"슬라이드"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-lg-chocolate', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-chocolate', 'tag-b4301e4bc1ae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-chocolate', 'tag-4adb8e4af045');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-chocolate', 'tag-85df59670655');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a648ba437dae', 'phone-lg-chocolate', 'LG Mobile History', 'https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-9267a1e5d491', '/images/archive/devices/lg-chocolate-kg800.jpg', '/images/archive/devices/lg-chocolate-kg800.jpg', 'static', 'lg-chocolate-kg800.jpg', 'image/jpeg', 160252, 'LG Chocolate KG800 실물 사진', 'Petar Milošević / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:LG_KG800.jpg', 'CC BY 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-lg-chocolate', 'media-9267a1e5d491', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a648ba437dae', 'phone-lg-chocolate', 1, '{"name":"LG Chocolate KG800","summary":"검은 전면과 붉은 터치 키로 LG 디자인폰 시대를 연 제품","description":"2006년 글로벌 시장에 출시된 Chocolate은 기능보다 감성적 이름과 미니멀한 표면을 전면에 내세웠습니다.","source":{"label":"LG Mobile History","url":"https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/"},"image":{"src":"/images/archive/devices/lg-chocolate-kg800.jpg","alt":"LG Chocolate KG800 실물 사진","credit":"Petar Milošević / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:LG_KG800.jpg","license":"CC BY 4.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-blackberry-pearl', 'phone', 'blackberry-pearl-8100', 'BlackBerry Pearl 8100', '업무용에서 일상용으로', '작은 바디와 트랙볼, 카메라로 소비자 시장을 넓힌 BlackBerry', '2006년 출시된 Pearl은 기업용 이메일 기기의 인상을 벗고 음악과 카메라까지 담은 컴팩트한 스마트폰이었습니다.', 2006, NULL, 'brand-d765ee7e84f4', 'category-phone', '#475569', 'published', 'verified', 0, '{"highlights":["Pearl 트랙볼","SureType 키보드","카메라와 미디어 기능"],"specs":{"제조사":"Research In Motion","출시":"2006년","형태":"바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-blackberry-pearl', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-pearl', 'tag-d765ee7e84f4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-pearl', 'tag-424f4d75c4df');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-pearl', 'tag-4aa08aab8d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-1ff614aa4efe', 'phone-blackberry-pearl', 'BlackBerry 기기 연혁', 'https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c2091fe4ac1d', '/images/archive/devices/blackberry-pearl-8100.jpg', '/images/archive/devices/blackberry-pearl-8100.jpg', 'static', 'blackberry-pearl-8100.jpg', 'image/jpeg', 276663, 'BlackBerry Pearl 8100 실물 사진', 'Terje Norli / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:BlackBerry_8100_(1).jpg', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-blackberry-pearl', 'media-c2091fe4ac1d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-1ff614aa4efe', 'phone-blackberry-pearl', 1, '{"name":"BlackBerry Pearl 8100","summary":"작은 바디와 트랙볼, 카메라로 소비자 시장을 넓힌 BlackBerry","description":"2006년 출시된 Pearl은 기업용 이메일 기기의 인상을 벗고 음악과 카메라까지 담은 컴팩트한 스마트폰이었습니다.","source":{"label":"BlackBerry 기기 연혁","url":"https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/"},"image":{"src":"/images/archive/devices/blackberry-pearl-8100.jpg","alt":"BlackBerry Pearl 8100 실물 사진","credit":"Terje Norli / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:BlackBerry_8100_(1).jpg","license":"CC BY-SA 4.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-anycall-haptic', 'phone', 'anycall-haptic', 'Anycall HAPTIC', '만지는 즐거움', '위젯과 진동 피드백으로 풀터치폰 시대를 알린 애니콜', '손끝에 반응하는 진동과 화면 위 위젯은 스마트폰 직전의 모바일 경험을 대표했습니다.', 2008, NULL, 'brand-90e01d646458', 'category-phone', '#fbbf24', 'published', 'verified', 0, '{"highlights":["햅틱 피드백","위젯 UI","지상파 DMB"],"specs":{"제조사":"삼성전자","출시":"2008년","형태":"풀터치 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-anycall-haptic', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-anycall-haptic', 'tag-166a7988e726');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-anycall-haptic', 'tag-6cd8f39f8360');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-anycall-haptic', 'tag-2a78f366de89');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e6dd64d6a019', 'phone-anycall-haptic', 'Samsung Newsroom Korea', 'https://news.samsung.com/kr/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%95%A0%EB%8B%88%EC%BD%9C-%ED%96%85%ED%8B%B1%ED%8F%B0-%EB%A7%88%EC%BC%80%ED%8C%85-%EB%B3%B8%EA%B2%A9-%EA%B0%80%EB%8F%99', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2f079a5d9a1a', '/images/archive/devices/samsung-anycall-haptic.jpg', '/images/archive/devices/samsung-anycall-haptic.jpg', 'static', 'samsung-anycall-haptic.jpg', 'image/jpeg', 25573, 'Samsung Anycall Haptic을 손으로 조작하는 공식 광고 이미지', 'Samsung Electronics Newsroom', 'https://news.samsung.com/kr/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%95%A0%EB%8B%88%EC%BD%9C-%ED%96%85%ED%8B%B1%ED%8F%B0-%EB%A7%88%EC%BC%80%ED%8C%85-%EB%B3%B8%EA%B2%A9-%EA%B0%80%EB%8F%99', '© Samsung Electronics · 출처 표기', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-anycall-haptic', 'media-2f079a5d9a1a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e6dd64d6a019', 'phone-anycall-haptic', 1, '{"name":"Anycall HAPTIC","summary":"위젯과 진동 피드백으로 풀터치폰 시대를 알린 애니콜","description":"손끝에 반응하는 진동과 화면 위 위젯은 스마트폰 직전의 모바일 경험을 대표했습니다.","source":{"label":"Samsung Newsroom Korea","url":"https://news.samsung.com/kr/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%95%A0%EB%8B%88%EC%BD%9C-%ED%96%85%ED%8B%B1%ED%8F%B0-%EB%A7%88%EC%BC%80%ED%8C%85-%EB%B3%B8%EA%B2%A9-%EA%B0%80%EB%8F%99"},"image":{"src":"/images/archive/devices/samsung-anycall-haptic.jpg","alt":"Samsung Anycall Haptic을 손으로 조작하는 공식 광고 이미지","credit":"Samsung Electronics Newsroom","sourceUrl":"https://news.samsung.com/kr/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%95%A0%EB%8B%88%EC%BD%9C-%ED%96%85%ED%8B%B1%ED%8F%B0-%EB%A7%88%EC%BC%80%ED%8C%85-%EB%B3%B8%EA%B2%A9-%EA%B0%80%EB%8F%99","license":"© Samsung Electronics · 출처 표기"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-blackberry-bold', 'phone', 'blackberry-bold-9000', 'BlackBerry Bold 9000', '쿼티 키보드의 완성', '가죽 질감 후면과 정교한 키보드로 업무용 스마트폰의 상징이 된 모델', '2008년 출시된 Bold 9000은 빠른 이메일과 물리 키보드, 고급스러운 소재를 결합했습니다.', 2008, NULL, 'brand-d765ee7e84f4', 'category-phone', '#334155', 'published', 'verified', 0, '{"highlights":["풀 QWERTY 키보드","트랙볼","푸시 이메일"],"specs":{"제조사":"Research In Motion","출시":"2008년","형태":"쿼티 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-blackberry-bold', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-bold', 'tag-d765ee7e84f4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-bold', 'tag-65e21ea0de88');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-bold', 'tag-3c37764a2b97');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-613b1e2f1af9', 'phone-blackberry-bold', 'BlackBerry 기기 연혁', 'https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-6c266fbec0b4', '/images/archive/devices/blackberry-bold-9000.jpg', '/images/archive/devices/blackberry-bold-9000.jpg', 'static', 'blackberry-bold-9000.jpg', 'image/jpeg', 399384, 'BlackBerry Bold 9000 실물 사진', 'Metrónomo / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:BlackBerry_Bold_9000.JPG', 'CC BY-SA 2.5 ar', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-blackberry-bold', 'media-6c266fbec0b4', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-613b1e2f1af9', 'phone-blackberry-bold', 1, '{"name":"BlackBerry Bold 9000","summary":"가죽 질감 후면과 정교한 키보드로 업무용 스마트폰의 상징이 된 모델","description":"2008년 출시된 Bold 9000은 빠른 이메일과 물리 키보드, 고급스러운 소재를 결합했습니다.","source":{"label":"BlackBerry 기기 연혁","url":"https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/"},"image":{"src":"/images/archive/devices/blackberry-bold-9000.jpg","alt":"BlackBerry Bold 9000 실물 사진","credit":"Metrónomo / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:BlackBerry_Bold_9000.JPG","license":"CC BY-SA 2.5 ar"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-galaxy-s', 'phone', 'galaxy-s', 'Samsung Galaxy S', 'Galaxy S의 시작', 'Super AMOLED와 Android로 삼성 스마트폰 계보를 시작한 모델', '2010년 6월 출시된 첫 Galaxy S는 선명한 화면과 얇은 바디를 앞세워 글로벌 스마트폰 경쟁에 뛰어들었습니다.', 2010, NULL, 'brand-90e01d646458', 'category-phone', '#2563eb', 'published', 'verified', 0, '{"highlights":["Super AMOLED","Android","Galaxy S 시리즈의 시작"],"specs":{"제조사":"삼성전자","출시":"2010년 6월","형태":"풀터치 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-galaxy-s', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s', 'tag-f69ff6e8d889');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s', 'tag-1928f95c598b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-71cfa0c0b261', 'phone-galaxy-s', 'Samsung Galaxy S 연혁', 'https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-fa2b6e28b246', '/images/archive/devices/samsung-galaxy-s.jpg', '/images/archive/devices/samsung-galaxy-s.jpg', 'static', 'samsung-galaxy-s.jpg', 'image/jpeg', 74118, 'Samsung Galaxy S I9000 전체 실물 사진', 'Grobert / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Samsung_i9000_galaxy_s.jpeg', 'CC BY-SA 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-galaxy-s', 'media-fa2b6e28b246', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-71cfa0c0b261', 'phone-galaxy-s', 1, '{"name":"Samsung Galaxy S","summary":"Super AMOLED와 Android로 삼성 스마트폰 계보를 시작한 모델","description":"2010년 6월 출시된 첫 Galaxy S는 선명한 화면과 얇은 바디를 앞세워 글로벌 스마트폰 경쟁에 뛰어들었습니다.","source":{"label":"Samsung Galaxy S 연혁","url":"https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s"},"image":{"src":"/images/archive/devices/samsung-galaxy-s.jpg","alt":"Samsung Galaxy S I9000 전체 실물 사진","credit":"Grobert / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Samsung_i9000_galaxy_s.jpeg","license":"CC BY-SA 3.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-blackberry-torch', 'phone', 'blackberry-torch-9800', 'BlackBerry Torch 9800', '터치와 키보드의 공존', '터치 화면 아래에 쿼티 키보드를 숨긴 슬라이드형 BlackBerry', '2010년 출시된 Torch는 기존 사용자의 물리 키보드와 새 스마트폰의 터치 경험을 함께 담았습니다.', 2010, NULL, 'brand-d765ee7e84f4', 'category-phone', '#334155', 'published', 'verified', 0, '{"highlights":["터치 디스플레이","슬라이드 QWERTY","BlackBerry OS 6"],"specs":{"제조사":"Research In Motion","출시":"2010년","형태":"세로 슬라이드"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-blackberry-torch', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-torch', 'tag-d765ee7e84f4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-torch', 'tag-85df59670655');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-torch', 'tag-f6ce87680390');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8c0469d81e06', 'phone-blackberry-torch', 'BlackBerry 기기 연혁', 'https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-37a262b8c940', '/images/archive/devices/blackberry-torch-9800.jpg', '/images/archive/devices/blackberry-torch-9800.jpg', 'static', 'blackberry-torch-9800.jpg', 'image/jpeg', 482314, 'BlackBerry Torch 9800 실물 사진', 'Enrique Dans / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:BlackBerry_Torch.jpg', 'CC BY 2.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-blackberry-torch', 'media-37a262b8c940', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8c0469d81e06', 'phone-blackberry-torch', 1, '{"name":"BlackBerry Torch 9800","summary":"터치 화면 아래에 쿼티 키보드를 숨긴 슬라이드형 BlackBerry","description":"2010년 출시된 Torch는 기존 사용자의 물리 키보드와 새 스마트폰의 터치 경험을 함께 담았습니다.","source":{"label":"BlackBerry 기기 연혁","url":"https://arstechnica.com/gadgets/2013/02/a-look-at-blackberrys-devices-through-the-ages/"},"image":{"src":"/images/archive/devices/blackberry-torch-9800.jpg","alt":"BlackBerry Torch 9800 실물 사진","credit":"Enrique Dans / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:BlackBerry_Torch.jpg","license":"CC BY 2.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-galaxy-s3', 'phone', 'galaxy-s3', 'Samsung Galaxy S III', '자연에서 가져온 곡선', '큰 화면과 유기적인 디자인으로 Android 스마트폰 대중화를 이끈 모델', '2012년 5월 출시된 Galaxy S III는 4.8인치 화면과 둥근 디자인, 동작 인식 기능을 선보였습니다.', 2012, NULL, 'brand-90e01d646458', 'category-phone', '#4f86c6', 'published', 'verified', 0, '{"highlights":["HD Super AMOLED","Smart Stay","자연을 닮은 디자인"],"specs":{"제조사":"삼성전자","출시":"2012년 5월","화면":"4.8인치"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-galaxy-s3', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s3', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s3', 'tag-f69ff6e8d889');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s3', 'tag-1928f95c598b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-337082ac5545', 'phone-galaxy-s3', 'Samsung Galaxy S 연혁', 'https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-daa2fd81dbf7', '/images/archive/devices/samsung-galaxy-s3.png', '/images/archive/devices/samsung-galaxy-s3.png', 'static', 'samsung-galaxy-s3.png', 'image/png', 126699, 'Samsung Galaxy S III 제품 이미지', 'GadgetsGuy / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S_III.png', 'CC BY 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-galaxy-s3', 'media-daa2fd81dbf7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-337082ac5545', 'phone-galaxy-s3', 1, '{"name":"Samsung Galaxy S III","summary":"큰 화면과 유기적인 디자인으로 Android 스마트폰 대중화를 이끈 모델","description":"2012년 5월 출시된 Galaxy S III는 4.8인치 화면과 둥근 디자인, 동작 인식 기능을 선보였습니다.","source":{"label":"Samsung Galaxy S 연혁","url":"https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s"},"image":{"src":"/images/archive/devices/samsung-galaxy-s3.png","alt":"Samsung Galaxy S III 제품 이미지","credit":"GadgetsGuy / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S_III.png","license":"CC BY 3.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-lg-optimus-g', 'phone', 'lg-optimus-g', 'LG Optimus G', 'LG 스마트폰의 전환점', '유리 일체형 디자인과 고성능 AP를 결합한 LG의 플래그십', '2012년 출시된 Optimus G는 이후 G 시리즈로 이어지는 LG 플래그십 스마트폰의 출발점이었습니다.', 2012, NULL, 'brand-b4301e4bc1ae', 'category-phone', '#a21caf', 'published', 'verified', 0, '{"highlights":["크리스털 리플렉션","Snapdragon S4 Pro","G 시리즈의 기반"],"specs":{"제조사":"LG전자","출시":"2012년","형태":"풀터치 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-lg-optimus-g', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-optimus-g', 'tag-b4301e4bc1ae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-optimus-g', 'tag-e426ddc63482');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-optimus-g', 'tag-1928f95c598b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-c6df467a9b61', 'phone-lg-optimus-g', 'LG Mobile History', 'https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2aa81f34225a', '/images/archive/devices/lg-optimus-g.jpg', '/images/archive/devices/lg-optimus-g.jpg', 'static', 'lg-optimus-g.jpg', 'image/jpeg', 199317, 'LG Optimus G 실물 사진', 'LG전자 / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:LG_Optimus_G_(Black).jpg', 'CC BY 2.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-lg-optimus-g', 'media-2aa81f34225a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-c6df467a9b61', 'phone-lg-optimus-g', 1, '{"name":"LG Optimus G","summary":"유리 일체형 디자인과 고성능 AP를 결합한 LG의 플래그십","description":"2012년 출시된 Optimus G는 이후 G 시리즈로 이어지는 LG 플래그십 스마트폰의 출발점이었습니다.","source":{"label":"LG Mobile History","url":"https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/"},"image":{"src":"/images/archive/devices/lg-optimus-g.jpg","alt":"LG Optimus G 실물 사진","credit":"LG전자 / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:LG_Optimus_G_(Black).jpg","license":"CC BY 2.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-galaxy-s6', 'phone', 'galaxy-s6', 'Samsung Galaxy S6', '메탈과 글라스의 Galaxy', '금속 프레임과 유리 후면으로 디자인 방향을 바꾼 플래그십', '2015년 공개된 Galaxy S6는 소재와 카메라, 곡면 화면을 통해 Galaxy 디자인의 큰 전환점을 만들었습니다.', 2015, NULL, 'brand-90e01d646458', 'category-phone', '#38bdf8', 'published', 'verified', 0, '{"highlights":["메탈·글라스 바디","빠른 카메라 실행","무선 충전"],"specs":{"제조사":"삼성전자","출시":"2015년","형태":"풀터치 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-galaxy-s6', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s6', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s6', 'tag-f69ff6e8d889');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s6', 'tag-55440dab6a37');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5bd22de97134', 'phone-galaxy-s6', 'Samsung Galaxy S 연혁', 'https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-dc68f17232b5', '/images/archive/devices/samsung-galaxy-s6.png', '/images/archive/devices/samsung-galaxy-s6.png', 'static', 'samsung-galaxy-s6.png', 'image/png', 115556, 'Samsung Galaxy S6 제품 이미지', 'GadgetsGuy, GalaxyOptimus / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S6.png', 'CC BY-SA 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-galaxy-s6', 'media-dc68f17232b5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5bd22de97134', 'phone-galaxy-s6', 1, '{"name":"Samsung Galaxy S6","summary":"금속 프레임과 유리 후면으로 디자인 방향을 바꾼 플래그십","description":"2015년 공개된 Galaxy S6는 소재와 카메라, 곡면 화면을 통해 Galaxy 디자인의 큰 전환점을 만들었습니다.","source":{"label":"Samsung Galaxy S 연혁","url":"https://news.samsung.com/global/from-zero-to-infinity-the-five-year-journey-of-the-samsung-galaxy-s"},"image":{"src":"/images/archive/devices/samsung-galaxy-s6.png","alt":"Samsung Galaxy S6 제품 이미지","credit":"GadgetsGuy, GalaxyOptimus / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S6.png","license":"CC BY-SA 3.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-moto-x-style', 'phone', 'moto-x-style', 'Motorola Moto X Style', '취향대로 고르는 Moto', '큰 화면과 전면 스피커, 사용자 맞춤 디자인을 강조한 Android폰', '2015년 발표된 Moto X Style은 비교적 순정에 가까운 Android와 전면 스피커, Moto Maker 개인화를 앞세웠습니다.', 2015, NULL, 'brand-399f01e13e37', 'category-phone', '#14b8a6', 'published', 'verified', 0, '{"highlights":["Moto Maker","전면 스테레오 스피커","순정형 Android"],"specs":{"제조사":"Motorola","출시":"2015년","화면":"5.7인치"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-moto-x-style', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-moto-x-style', 'tag-399f01e13e37');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-moto-x-style', 'tag-9e6ed37766a8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-moto-x-style', 'tag-1928f95c598b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-196431ef1252', 'phone-moto-x-style', 'Moto X Style 발표', 'https://time.com/3975370/motorola-moto-x-style-play/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-62867a1bd9f7', '/images/archive/devices/motorola-moto-x-style.jpg', '/images/archive/devices/motorola-moto-x-style.jpg', 'static', 'motorola-moto-x-style.jpg', 'image/jpeg', 85100, 'Motorola Moto X Style 실물 사진', 'Kārlis Dambrāns / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Motorola_Moto_X_Style_(21598739494).jpg', 'CC BY-SA 2.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-moto-x-style', 'media-62867a1bd9f7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-196431ef1252', 'phone-moto-x-style', 1, '{"name":"Motorola Moto X Style","summary":"큰 화면과 전면 스피커, 사용자 맞춤 디자인을 강조한 Android폰","description":"2015년 발표된 Moto X Style은 비교적 순정에 가까운 Android와 전면 스피커, Moto Maker 개인화를 앞세웠습니다.","source":{"label":"Moto X Style 발표","url":"https://time.com/3975370/motorola-moto-x-style-play/"},"image":{"src":"/images/archive/devices/motorola-moto-x-style.jpg","alt":"Motorola Moto X Style 실물 사진","credit":"Kārlis Dambrāns / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Motorola_Moto_X_Style_(21598739494).jpg","license":"CC BY-SA 2.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-galaxy-s9', 'phone', 'galaxy-s9', 'Samsung Galaxy S9', '카메라를 다시 상상하다', '가변 조리개 카메라와 인피니티 디스플레이를 다듬은 Galaxy', '2018년 3월 출시된 Galaxy S9은 어두운 환경에 대응하는 가변 조리개와 몰입형 화면을 강조했습니다.', 2018, NULL, 'brand-90e01d646458', 'category-phone', '#7c3aed', 'published', 'verified', 0, '{"highlights":["듀얼 조리개","Super Slow-mo","Infinity Display"],"specs":{"제조사":"삼성전자","출시":"2018년 3월","형태":"풀터치 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-galaxy-s9', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s9', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s9', 'tag-f69ff6e8d889');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s9', 'tag-e0d8b86ab8c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0568c3ab5e78', 'phone-galaxy-s9', 'Samsung 공식 출시', 'https://news.samsung.com/global/samsung-electronics-officially-launches-galaxy-s9-and-s9-plus', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b9c191827dc6', '/images/archive/devices/samsung-galaxy-s9.png', '/images/archive/devices/samsung-galaxy-s9.png', 'static', 'samsung-galaxy-s9.png', 'image/png', 77648, 'Samsung Galaxy S9과 S9 Plus 제품 이미지', 'Samsung / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S9_and_S9_Plus.png', 'CC BY 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-galaxy-s9', 'media-b9c191827dc6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0568c3ab5e78', 'phone-galaxy-s9', 1, '{"name":"Samsung Galaxy S9","summary":"가변 조리개 카메라와 인피니티 디스플레이를 다듬은 Galaxy","description":"2018년 3월 출시된 Galaxy S9은 어두운 환경에 대응하는 가변 조리개와 몰입형 화면을 강조했습니다.","source":{"label":"Samsung 공식 출시","url":"https://news.samsung.com/global/samsung-electronics-officially-launches-galaxy-s9-and-s9-plus"},"image":{"src":"/images/archive/devices/samsung-galaxy-s9.png","alt":"Samsung Galaxy S9과 S9 Plus 제품 이미지","credit":"Samsung / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S9_and_S9_Plus.png","license":"CC BY 3.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-blackberry-key2', 'phone', 'blackberry-key2', 'BlackBerry KEY2', '물리 키보드의 마지막 진화', 'Android와 쿼티 키보드를 결합한 생산성 중심 스마트폰', '2018년 출시된 KEY2는 앱 단축키와 보안 기능을 물리 키보드 경험에 결합했습니다.', 2018, NULL, 'brand-d765ee7e84f4', 'category-phone', '#475569', 'published', 'verified', 0, '{"highlights":["Speed Key","물리 QWERTY","DTEK 보안"],"specs":{"제조사":"TCL Communication","출시":"2018년","형태":"쿼티 바"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-blackberry-key2', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-key2', 'tag-d765ee7e84f4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-key2', 'tag-65e21ea0de88');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-blackberry-key2', 'tag-1928f95c598b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d84501a9eb95', 'phone-blackberry-key2', 'BlackBerry KEY2 발표', 'https://www.blackberry.com/us/en/company/newsroom/press-releases/2018/tcl-communication-introduces-the-all-new-blackberry-key2', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-270935f1759a', '/images/archive/devices/blackberry-key2.png', '/images/archive/devices/blackberry-key2.png', 'static', 'blackberry-key2.png', 'image/png', 316047, 'BlackBerry KEY2 제품 이미지', 'BlackBerry Mobile / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:BlackBerry%C2%AE_KEY2.png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-blackberry-key2', 'media-270935f1759a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d84501a9eb95', 'phone-blackberry-key2', 1, '{"name":"BlackBerry KEY2","summary":"Android와 쿼티 키보드를 결합한 생산성 중심 스마트폰","description":"2018년 출시된 KEY2는 앱 단축키와 보안 기능을 물리 키보드 경험에 결합했습니다.","source":{"label":"BlackBerry KEY2 발표","url":"https://www.blackberry.com/us/en/company/newsroom/press-releases/2018/tcl-communication-introduces-the-all-new-blackberry-key2"},"image":{"src":"/images/archive/devices/blackberry-key2.png","alt":"BlackBerry KEY2 제품 이미지","credit":"BlackBerry Mobile / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:BlackBerry%C2%AE_KEY2.png","license":"CC BY-SA 4.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-galaxy-s20', 'phone', 'galaxy-s20', 'Samsung Galaxy S20', '5G와 고배율 카메라', '120Hz 화면과 5G, 고화소 카메라로 2020년 플래그십 기준을 제시한 모델', '2020년 3월 출시된 Galaxy S20 시리즈는 빠른 화면과 고배율 촬영, 5G 연결을 핵심으로 내세웠습니다.', 2020, NULL, 'brand-90e01d646458', 'category-phone', '#93c5fd', 'published', 'verified', 0, '{"highlights":["120Hz 디스플레이","고화소 카메라","5G 연결"],"specs":{"제조사":"삼성전자","출시":"2020년 3월","네트워크":"5G"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-galaxy-s20', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s20', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s20', 'tag-f69ff6e8d889');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-galaxy-s20', 'tag-8a85fe387e2c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4cdb12990e72', 'phone-galaxy-s20', 'Samsung 공식 발표', 'https://news.samsung.com/us/introducing-samsung-galaxy-s20-5g-unpacked2020', 'official', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d544a699cb51', '/images/archive/devices/samsung-galaxy-s20.jpg', '/images/archive/devices/samsung-galaxy-s20.jpg', 'static', 'samsung-galaxy-s20.jpg', 'image/jpeg', 611186, 'Samsung Galaxy S20 전체 후면 실물 사진', 'Danish971 / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S20.jpg', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-galaxy-s20', 'media-d544a699cb51', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4cdb12990e72', 'phone-galaxy-s20', 1, '{"name":"Samsung Galaxy S20","summary":"120Hz 화면과 5G, 고화소 카메라로 2020년 플래그십 기준을 제시한 모델","description":"2020년 3월 출시된 Galaxy S20 시리즈는 빠른 화면과 고배율 촬영, 5G 연결을 핵심으로 내세웠습니다.","source":{"label":"Samsung 공식 발표","url":"https://news.samsung.com/us/introducing-samsung-galaxy-s20-5g-unpacked2020"},"image":{"src":"/images/archive/devices/samsung-galaxy-s20.jpg","alt":"Samsung Galaxy S20 전체 후면 실물 사진","credit":"Danish971 / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Samsung_Galaxy_S20.jpg","license":"CC BY-SA 4.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('phone-lg-wing', 'phone', 'lg-wing', 'LG WING', '회전하는 두 개의 화면', '메인 화면을 돌려 T자 형태로 사용하는 LG의 실험적인 스마트폰', '2020년 출시된 LG WING은 영상을 보며 다른 작업을 하는 스위블 구조로 폼팩터의 가능성을 탐색했습니다.', 2020, NULL, 'brand-b4301e4bc1ae', 'category-phone', '#c084fc', 'published', 'verified', 0, '{"highlights":["90도 회전 화면","짐벌 모션 카메라","멀티태스킹"],"specs":{"제조사":"LG전자","출시":"2020년","형태":"스위블"}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('phone-lg-wing', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-wing', 'tag-b4301e4bc1ae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-wing', 'tag-2b5224439e04');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('phone-lg-wing', 'tag-94d38cc243d4');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-24decdcea4dc', 'phone-lg-wing', 'LG Mobile History', 'https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8091870a8749', '/images/archive/devices/lg-wing.jpg', '/images/archive/devices/lg-wing.jpg', 'static', 'lg-wing.jpg', 'image/jpeg', 477675, 'LG WING 제품 전체 모습과 회전 화면 사용 예', 'LG전자 / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/Category:LG_Wing', 'CC BY 2.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('phone-lg-wing', 'media-8091870a8749', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-24decdcea4dc', 'phone-lg-wing', 1, '{"name":"LG WING","summary":"메인 화면을 돌려 T자 형태로 사용하는 LG의 실험적인 스마트폰","description":"2020년 출시된 LG WING은 영상을 보며 다른 작업을 하는 스위블 구조로 폼팩터의 가능성을 탐색했습니다.","source":{"label":"LG Mobile History","url":"https://www.lg.com/it/magazine/2021-04-lg-mobile-storia-tecnologie-prodotti/"},"image":{"src":"/images/archive/devices/lg-wing.jpg","alt":"LG WING 제품 전체 모습과 회전 화면 사용 예","credit":"LG전자 / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/Category:LG_Wing","license":"CC BY 2.0"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-imac-g3', 'product', 'imac-g3', 'iMac G3', '시대를 바꾼 신제품', 'Apple가 1998년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'iMac G3: Apple가 1998년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1998, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-imac-g3', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-imac-g3', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-imac-g3', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-imac-g3', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-7e88439acc6e', 'milestone-1998-imac-g3', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iMac%20G3', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2433fb72d5ea', '/images/archive/milestones/1998-imac-g3.png', '/images/archive/milestones/1998-imac-g3.png', 'static', '1998-imac-g3.png', 'image/png', 327876, '1998년 iMac G3 대표 이미지', 'Alterations by David Fuchs ; original by Rama , licensed CC-by-SA', 'https://commons.wikimedia.org/wiki/File:IMac_G3_Bondi_Blue,_three-quarters_view.png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-imac-g3', 'media-2433fb72d5ea', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-7e88439acc6e', 'milestone-1998-imac-g3', 1, '{"name":"iMac G3","summary":"Apple가 1998년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iMac G3: Apple가 1998년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iMac%20G3"},"image":{"src":"/images/archive/milestones/1998-imac-g3.png","alt":"1998년 iMac G3 대표 이미지","credit":"Alterations by David Fuchs ; original by Rama , licensed CC-by-SA","sourceUrl":"https://commons.wikimedia.org/wiki/File:IMac_G3_Bondi_Blue,_three-quarters_view.png","license":"CC BY-SA 4.0","matchedTitle":"IMac G3"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-windows-98', 'program', 'windows-98', 'Windows 98', '새로운 디지털 도구', 'Microsoft가 1998년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows 98: Microsoft가 1998년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 1998, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-windows-98', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-windows-98', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-windows-98', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-windows-98', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-314146353494', 'milestone-1998-windows-98', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%2098', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-10500c11c434', '/images/archive/milestones/1998-windows-98.png', '/images/archive/milestones/1998-windows-98.png', 'static', '1998-windows-98.png', 'image/png', 37916, '1998년 Windows 98 대표 이미지', 'Windows 98 contributors', 'https://en.wikipedia.org/wiki/Windows_98', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-windows-98', 'media-10500c11c434', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-314146353494', 'milestone-1998-windows-98', 1, '{"name":"Windows 98","summary":"Microsoft가 1998년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows 98: Microsoft가 1998년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%2098"},"image":{"src":"/images/archive/milestones/1998-windows-98.png","alt":"1998년 Windows 98 대표 이미지","credit":"Windows 98 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Windows_98","license":"Wikimedia source","matchedTitle":"Windows 98"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-dreamcast', 'product', 'dreamcast', 'Dreamcast', '시대를 바꾼 신제품', 'Sega가 1998년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Dreamcast: Sega가 1998년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1998, NULL, 'brand-54dd4c71cae8', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Sega","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-dreamcast', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-dreamcast', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-dreamcast', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-dreamcast', 'tag-54dd4c71cae8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2aadf94cb1f1', 'milestone-1998-dreamcast', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Dreamcast', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b580fe056b55', '/images/archive/milestones/1998-dreamcast.png', '/images/archive/milestones/1998-dreamcast.png', 'static', '1998-dreamcast.png', 'image/png', 78534, '1998년 Dreamcast 대표 이미지', 'Dreamcast contributors', 'https://en.wikipedia.org/wiki/Dreamcast', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-dreamcast', 'media-b580fe056b55', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2aadf94cb1f1', 'milestone-1998-dreamcast', 1, '{"name":"Dreamcast","summary":"Sega가 1998년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Dreamcast: Sega가 1998년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Dreamcast"},"image":{"src":"/images/archive/milestones/1998-dreamcast.png","alt":"1998년 Dreamcast 대표 이미지","credit":"Dreamcast contributors","sourceUrl":"https://en.wikipedia.org/wiki/Dreamcast","license":"Wikimedia source","matchedTitle":"Dreamcast"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-game-boy-color', 'product', 'game-boy-color', 'Game Boy Color', '시대를 바꾼 신제품', 'Nintendo가 1998년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Game Boy Color: Nintendo가 1998년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1998, NULL, 'brand-0cac146e40c7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Nintendo","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-game-boy-color', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-game-boy-color', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-game-boy-color', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-game-boy-color', 'tag-0cac146e40c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-22d5b6972802', 'milestone-1998-game-boy-color', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Game%20Boy%20Color', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-77d38d22a88e', '/images/archive/milestones/1998-game-boy-color.png', '/images/archive/milestones/1998-game-boy-color.png', 'static', '1998-game-boy-color.png', 'image/png', 765995, '1998년 Game Boy Color 대표 이미지', 'Game Boy Color contributors', 'https://en.wikipedia.org/wiki/Game_Boy_Color', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-game-boy-color', 'media-77d38d22a88e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-22d5b6972802', 'milestone-1998-game-boy-color', 1, '{"name":"Game Boy Color","summary":"Nintendo가 1998년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Game Boy Color: Nintendo가 1998년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Game%20Boy%20Color"},"image":{"src":"/images/archive/milestones/1998-game-boy-color.png","alt":"1998년 Game Boy Color 대표 이미지","credit":"Game Boy Color contributors","sourceUrl":"https://en.wikipedia.org/wiki/Game_Boy_Color","license":"Wikimedia source","matchedTitle":"Game Boy Color"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-nokia-5110', 'phone', 'nokia-5110', 'Nokia 5110', '그해 출시된 휴대전화', 'Nokia가 1998년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia 5110: Nokia가 1998년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 1998, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-nokia-5110', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-nokia-5110', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-nokia-5110', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-nokia-5110', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-25a97d9663cd', 'milestone-1998-nokia-5110', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%205110', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a24a4ff48e15', '/images/archive/milestones/1998-nokia-5110-exact.jpg', '/images/archive/milestones/1998-nokia-5110-exact.jpg', 'static', '1998-nokia-5110-exact.jpg', 'image/jpeg', 1006080, 'Nokia 5110 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia_5110_(1998).jpg', 'See Wikimedia Commons file page', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-nokia-5110', 'media-a24a4ff48e15', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-25a97d9663cd', 'milestone-1998-nokia-5110', 1, '{"name":"Nokia 5110","summary":"Nokia가 1998년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia 5110: Nokia가 1998년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%205110"},"image":{"src":"/images/archive/milestones/1998-nokia-5110-exact.jpg","alt":"Nokia 5110 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_5110_(1998).jpg","license":"See Wikimedia Commons file page","matchedTitle":"Nokia 5110"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-paypal', 'service', 'paypal', 'PayPal', '새롭게 시작된 서비스', 'PayPal가 1998년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'PayPal: PayPal가 1998년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 1998, NULL, 'brand-559ef5544c82', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","PayPal","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-paypal', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-paypal', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-paypal', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-paypal', 'tag-559ef5544c82');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a23f1f6c4cdc', 'milestone-1998-paypal', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PayPal', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8a33e9ce3fbc', '/images/archive/milestones/1998-paypal.jpg', '/images/archive/milestones/1998-paypal.jpg', 'static', '1998-paypal.jpg', 'image/jpeg', 414382, '1998년 PayPal 대표 이미지', 'PayPal contributors', 'https://en.wikipedia.org/wiki/PayPal', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-paypal', 'media-8a33e9ce3fbc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a23f1f6c4cdc', 'milestone-1998-paypal', 1, '{"name":"PayPal","summary":"PayPal가 1998년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PayPal: PayPal가 1998년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PayPal"},"image":{"src":"/images/archive/milestones/1998-paypal.jpg","alt":"1998년 PayPal 대표 이미지","credit":"PayPal contributors","sourceUrl":"https://en.wikipedia.org/wiki/PayPal","license":"Wikimedia source","matchedTitle":"PayPal"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-mpman-f10', 'product', 'mpman-f10', 'MPMan F10', '시대를 바꾼 신제품', 'Saehan Information Systems가 1998년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'MPMan F10: Saehan Information Systems가 1998년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1998, NULL, 'brand-18329e56255c', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Saehan Information Systems","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-mpman-f10', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-mpman-f10', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-mpman-f10', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-mpman-f10', 'tag-18329e56255c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d5db1cf49624', 'milestone-1998-mpman-f10', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=MPMan%20F10', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1b1fe98ce891', '/images/archive/milestones/1998-mpman-f10.jpg', '/images/archive/milestones/1998-mpman-f10.jpg', 'static', '1998-mpman-f10.jpg', 'image/jpeg', 280921, '1998년 MPMan F10 대표 이미지', 'MPMan contributors', 'https://en.wikipedia.org/wiki/MPMan', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-mpman-f10', 'media-1b1fe98ce891', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d5db1cf49624', 'milestone-1998-mpman-f10', 1, '{"name":"MPMan F10","summary":"Saehan Information Systems가 1998년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"MPMan F10: Saehan Information Systems가 1998년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=MPMan%20F10"},"image":{"src":"/images/archive/milestones/1998-mpman-f10.jpg","alt":"1998년 MPMan F10 대표 이미지","credit":"MPMan contributors","sourceUrl":"https://en.wikipedia.org/wiki/MPMan","license":"Wikimedia source","matchedTitle":"MPMan"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-furby', 'product', 'furby', 'Furby', '시대를 바꾼 신제품', 'Tiger Electronics가 1998년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Furby: Tiger Electronics가 1998년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1998, NULL, 'brand-834673647e69', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Tiger Electronics","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-furby', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-furby', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-furby', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-furby', 'tag-834673647e69');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-77b3972cafd2', 'milestone-1998-furby', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Furby', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-46646af0c00a', '/images/archive/milestones/1998-furby.png', '/images/archive/milestones/1998-furby.png', 'static', '1998-furby.png', 'image/png', 112540, '1998년 Furby 대표 이미지', 'Furby contributors', 'https://en.wikipedia.org/wiki/Furby', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-furby', 'media-46646af0c00a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-77b3972cafd2', 'milestone-1998-furby', 1, '{"name":"Furby","summary":"Tiger Electronics가 1998년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Furby: Tiger Electronics가 1998년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Furby"},"image":{"src":"/images/archive/milestones/1998-furby.png","alt":"1998년 Furby 대표 이미지","credit":"Furby contributors","sourceUrl":"https://en.wikipedia.org/wiki/Furby","license":"Wikimedia source","matchedTitle":"Furby"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-starcraft', 'game', 'starcraft', 'StarCraft', '새롭게 등장한 플레이', 'Blizzard Entertainment가 1998년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'StarCraft: Blizzard Entertainment가 1998년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 1998, NULL, 'brand-62a1ee25c03b', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Blizzard Entertainment","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-starcraft', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0c87c5684bd7', 'milestone-1998-starcraft', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=StarCraft', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-07589842a1ba', '/images/archive/milestones/1998-starcraft-user.jpg', '/images/archive/milestones/1998-starcraft-user.jpg', 'static', '1998-starcraft-user.jpg', 'image/jpeg', 69157, 'StarCraft: Mass Recall 메인 이미지', '사용자 제공 이미지', '/images/archive/milestones/1998-starcraft-user.jpg', '사용자 제공', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-starcraft', 'media-07589842a1ba', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0c87c5684bd7', 'milestone-1998-starcraft', 1, '{"name":"StarCraft","summary":"Blizzard Entertainment가 1998년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"StarCraft: Blizzard Entertainment가 1998년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=StarCraft"},"image":{"src":"/images/archive/milestones/1998-starcraft-user.jpg","alt":"StarCraft: Mass Recall 메인 이미지","credit":"사용자 제공 이미지","sourceUrl":"/images/archive/milestones/1998-starcraft-user.jpg","license":"사용자 제공","matchedTitle":"StarCraft"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-mozilla-project', 'service', 'mozilla-project', 'Mozilla Project', '새롭게 시작된 서비스', 'Mozilla Organization가 1998년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Mozilla Project: Mozilla Organization가 1998년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 1998, NULL, 'brand-d5b35353dfa8', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["1998년 공개·출시","Mozilla Organization","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-mozilla-project', 1998, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-mozilla-project', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-mozilla-project', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-mozilla-project', 'tag-d5b35353dfa8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-033d237720a8', 'milestone-1998-mozilla-project', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Mozilla%20Project', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-57334b82f9b9', '/images/archive/milestones/1998-mozilla-project-mark.svg', '/images/archive/milestones/1998-mozilla-project-mark.svg', 'static', '1998-mozilla-project-mark.svg', 'image/svg+xml', 287, 'Mozilla Project 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Mozilla%20Project', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-mozilla-project', 'media-57334b82f9b9', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-033d237720a8', 'milestone-1998-mozilla-project', 1, '{"name":"Mozilla Project","summary":"Mozilla Organization가 1998년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Mozilla Project: Mozilla Organization가 1998년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Mozilla%20Project"},"image":{"src":"/images/archive/milestones/1998-mozilla-project-mark.svg","alt":"Mozilla Project 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Mozilla%20Project","license":"CC0 1.0 · trademark","matchedTitle":"mozilla brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-blackberry-850', 'product', 'blackberry-850', 'BlackBerry 850', '시대를 바꾼 신제품', 'Research In Motion가 1999년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'BlackBerry 850: Research In Motion가 1999년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1999, NULL, 'brand-b16b1db72bde', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Research In Motion","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-blackberry-850', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-blackberry-850', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-blackberry-850', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-blackberry-850', 'tag-b16b1db72bde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-693102b64240', 'milestone-1999-blackberry-850', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%20850', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b944362596c6', '/images/archive/milestones/user-blackberry-reference.jpg', '/images/archive/milestones/user-blackberry-reference.jpg', 'static', 'user-blackberry-reference.jpg', 'image/jpeg', 70667, '사용자가 제공한 BlackBerry 휴대기기 참고 이미지', '사용자 제공 이미지', '/images/archive/milestones/user-blackberry-reference.jpg', '사용자 제공', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-blackberry-850', 'media-b944362596c6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-693102b64240', 'milestone-1999-blackberry-850', 1, '{"name":"BlackBerry 850","summary":"Research In Motion가 1999년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"BlackBerry 850: Research In Motion가 1999년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%20850"},"image":{"src":"/images/archive/milestones/user-blackberry-reference.jpg","alt":"사용자가 제공한 BlackBerry 휴대기기 참고 이미지","credit":"사용자 제공 이미지","sourceUrl":"/images/archive/milestones/user-blackberry-reference.jpg","license":"사용자 제공","matchedTitle":"BlackBerry reference"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-geforce-256', 'product', 'geforce-256', 'GeForce 256', '시대를 바꾼 신제품', 'NVIDIA가 1999년에 선보인 PC 그래픽 처리 장치로, 당시 디지털 경험의 변화를 보여줍니다.', 'GeForce 256: NVIDIA가 1999년에 출시한 PC 그래픽 처리 장치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1999, NULL, 'brand-088472395b26', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","NVIDIA","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-geforce-256', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-geforce-256', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-geforce-256', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-geforce-256', 'tag-088472395b26');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-bca1332d0360', 'milestone-1999-geforce-256', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=GeForce%20256', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0201ba6157bf', '/images/archive/milestones/1999-geforce-256.jpg', '/images/archive/milestones/1999-geforce-256.jpg', 'static', '1999-geforce-256.jpg', 'image/jpeg', 428725, '1999년 GeForce 256 대표 이미지', 'GeForce 256 contributors', 'https://en.wikipedia.org/wiki/GeForce_256', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-geforce-256', 'media-0201ba6157bf', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-bca1332d0360', 'milestone-1999-geforce-256', 1, '{"name":"GeForce 256","summary":"NVIDIA가 1999년에 선보인 PC 그래픽 처리 장치로, 당시 디지털 경험의 변화를 보여줍니다.","description":"GeForce 256: NVIDIA가 1999년에 출시한 PC 그래픽 처리 장치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=GeForce%20256"},"image":{"src":"/images/archive/milestones/1999-geforce-256.jpg","alt":"1999년 GeForce 256 대표 이미지","credit":"GeForce 256 contributors","sourceUrl":"https://en.wikipedia.org/wiki/GeForce_256","license":"Wikimedia source","matchedTitle":"GeForce 256"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-nokia-3210', 'phone', 'nokia-3210', 'Nokia 3210', '그해 출시된 휴대전화', 'Nokia가 1999년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia 3210: Nokia가 1999년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 1999, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-nokia-3210', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-nokia-3210', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-nokia-3210', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-nokia-3210', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-cc8bd0631277', 'milestone-1999-nokia-3210', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%203210', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-3a9b11f9290d', '/images/archive/milestones/1999-nokia-3210-exact.jpg', '/images/archive/milestones/1999-nokia-3210-exact.jpg', 'static', '1999-nokia-3210-exact.jpg', 'image/jpeg', 255795, 'Nokia 3210 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia_3210_(9136307576).jpg', 'See Wikimedia Commons file page', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-nokia-3210', 'media-3a9b11f9290d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-cc8bd0631277', 'milestone-1999-nokia-3210', 1, '{"name":"Nokia 3210","summary":"Nokia가 1999년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia 3210: Nokia가 1999년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%203210"},"image":{"src":"/images/archive/milestones/1999-nokia-3210-exact.jpg","alt":"Nokia 3210 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_3210_(9136307576).jpg","license":"See Wikimedia Commons file page","matchedTitle":"Nokia 3210"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-napster', 'service', 'napster', 'Napster', '새롭게 시작된 서비스', 'Napster가 1999년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Napster: Napster가 1999년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 1999, NULL, 'brand-833e63c4e94b', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Napster","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-napster', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-napster', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-napster', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-napster', 'tag-833e63c4e94b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-13e2c3e26a8f', 'milestone-1999-napster', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Napster', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c818badbbed1', '/images/archive/milestones/1999-napster.webp', '/images/archive/milestones/1999-napster.webp', 'static', '1999-napster.webp', 'image/webp', 86078, '1999년 Napster 대표 이미지', 'Napster contributors', 'https://en.wikipedia.org/wiki/Napster', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-napster', 'media-c818badbbed1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-13e2c3e26a8f', 'milestone-1999-napster', 1, '{"name":"Napster","summary":"Napster가 1999년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Napster: Napster가 1999년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Napster"},"image":{"src":"/images/archive/milestones/1999-napster.webp","alt":"1999년 Napster 대표 이미지","credit":"Napster contributors","sourceUrl":"https://en.wikipedia.org/wiki/Napster","license":"Wikimedia source","matchedTitle":"Napster"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-blogger', 'service', 'blogger', 'Blogger', '새롭게 시작된 서비스', 'Pyra Labs가 1999년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Blogger: Pyra Labs가 1999년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 1999, NULL, 'brand-e66cf50cfdc8', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Pyra Labs","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-blogger', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-blogger', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-blogger', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-blogger', 'tag-e66cf50cfdc8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-006ca1eb8c59', 'milestone-1999-blogger', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Blogger', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-58fec9ff7f34', '/images/archive/milestones/1999-blogger-mark.svg', '/images/archive/milestones/1999-blogger-mark.svg', 'static', '1999-blogger-mark.svg', 'image/svg+xml', 661, 'Blogger 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Blogger', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-blogger', 'media-58fec9ff7f34', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-006ca1eb8c59', 'milestone-1999-blogger', 1, '{"name":"Blogger","summary":"Pyra Labs가 1999년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Blogger: Pyra Labs가 1999년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Blogger"},"image":{"src":"/images/archive/milestones/1999-blogger-mark.svg","alt":"Blogger 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Blogger","license":"CC0 1.0 · trademark","matchedTitle":"blogger brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-livejournal', 'service', 'livejournal', 'LiveJournal', '새롭게 시작된 서비스', 'Danga Interactive가 1999년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'LiveJournal: Danga Interactive가 1999년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 1999, NULL, 'brand-a9b8c7fdbc05', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Danga Interactive","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-livejournal', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-livejournal', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-livejournal', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-livejournal', 'tag-a9b8c7fdbc05');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-84967826940a', 'milestone-1999-livejournal', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=LiveJournal', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-df3475fe9267', '/images/archive/milestones/1999-livejournal.png', '/images/archive/milestones/1999-livejournal.png', 'static', '1999-livejournal.png', 'image/png', 38128, '1999년 LiveJournal 대표 이미지', 'LiveJournal contributors', 'https://en.wikipedia.org/wiki/LiveJournal', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-livejournal', 'media-df3475fe9267', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-84967826940a', 'milestone-1999-livejournal', 1, '{"name":"LiveJournal","summary":"Danga Interactive가 1999년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"LiveJournal: Danga Interactive가 1999년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=LiveJournal"},"image":{"src":"/images/archive/milestones/1999-livejournal.png","alt":"1999년 LiveJournal 대표 이미지","credit":"LiveJournal contributors","sourceUrl":"https://en.wikipedia.org/wiki/LiveJournal","license":"Wikimedia source","matchedTitle":"LiveJournal"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-everquest', 'game', 'everquest', 'EverQuest', '새롭게 등장한 플레이', 'Sony Online Entertainment가 1999년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'EverQuest: Sony Online Entertainment가 1999년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 1999, NULL, 'brand-b87db20f2ac9', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Sony Online Entertainment","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-everquest', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-b87db20f2ac9');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-58f28840393e', 'milestone-1999-everquest', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=EverQuest', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c50cd72a7221', '/images/archive/milestones/1999-everquest.png', '/images/archive/milestones/1999-everquest.png', 'static', '1999-everquest.png', 'image/png', 269524, '1999년 EverQuest 대표 이미지', 'EverQuest contributors', 'https://en.wikipedia.org/wiki/EverQuest', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-everquest', 'media-c50cd72a7221', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-58f28840393e', 'milestone-1999-everquest', 1, '{"name":"EverQuest","summary":"Sony Online Entertainment가 1999년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"EverQuest: Sony Online Entertainment가 1999년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=EverQuest"},"image":{"src":"/images/archive/milestones/1999-everquest.png","alt":"1999년 EverQuest 대표 이미지","credit":"EverQuest contributors","sourceUrl":"https://en.wikipedia.org/wiki/EverQuest","license":"Wikimedia source","matchedTitle":"EverQuest"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-adobe-indesign', 'program', 'adobe-indesign', 'Adobe InDesign', '새로운 디지털 도구', 'Adobe가 1999년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.', 'Adobe InDesign: Adobe가 1999년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 1999, NULL, 'brand-7bc25d25f16d', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Adobe","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-adobe-indesign', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-adobe-indesign', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-adobe-indesign', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-adobe-indesign', 'tag-7bc25d25f16d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3b59c6b71a04', 'milestone-1999-adobe-indesign', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Adobe%20InDesign', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d203d54c12da', '/images/archive/milestones/1999-adobe-indesign.png', '/images/archive/milestones/1999-adobe-indesign.png', 'static', '1999-adobe-indesign.png', 'image/png', 4533, '1999년 Adobe InDesign 대표 이미지', 'Adobe InDesign contributors', 'https://en.wikipedia.org/wiki/Adobe_InDesign', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-adobe-indesign', 'media-d203d54c12da', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3b59c6b71a04', 'milestone-1999-adobe-indesign', 1, '{"name":"Adobe InDesign","summary":"Adobe가 1999년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Adobe InDesign: Adobe가 1999년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Adobe%20InDesign"},"image":{"src":"/images/archive/milestones/1999-adobe-indesign.png","alt":"1999년 Adobe InDesign 대표 이미지","credit":"Adobe InDesign contributors","sourceUrl":"https://en.wikipedia.org/wiki/Adobe_InDesign","license":"Wikimedia source","matchedTitle":"Adobe InDesign"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-sega-dreamcast-global', 'product', 'sega-dreamcast-global', 'Sega Dreamcast (Global)', '시대를 바꾼 신제품', 'Sega가 1999년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Sega Dreamcast (Global): Sega가 1999년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 1999, NULL, 'brand-54dd4c71cae8', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","Sega","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-sega-dreamcast-global', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-sega-dreamcast-global', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-sega-dreamcast-global', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-sega-dreamcast-global', 'tag-54dd4c71cae8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8f3e75abcf6f', 'milestone-1999-sega-dreamcast-global', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Sega%20Dreamcast%20(Global)', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c3e30ff8acfc', '/images/archive/milestones/1999-sega-dreamcast-global.png', '/images/archive/milestones/1999-sega-dreamcast-global.png', 'static', '1999-sega-dreamcast-global.png', 'image/png', 78534, '1999년 Sega Dreamcast (Global) 대표 이미지', 'Dreamcast contributors', 'https://en.wikipedia.org/wiki/Dreamcast', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-sega-dreamcast-global', 'media-c3e30ff8acfc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8f3e75abcf6f', 'milestone-1999-sega-dreamcast-global', 1, '{"name":"Sega Dreamcast (Global)","summary":"Sega가 1999년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Sega Dreamcast (Global): Sega가 1999년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Sega%20Dreamcast%20(Global)"},"image":{"src":"/images/archive/milestones/1999-sega-dreamcast-global.png","alt":"1999년 Sega Dreamcast (Global) 대표 이미지","credit":"Dreamcast contributors","sourceUrl":"https://en.wikipedia.org/wiki/Dreamcast","license":"Wikimedia source","matchedTitle":"Dreamcast"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-aol-instant-messenger-3-0', 'service', 'aol-instant-messenger-3-0', 'AOL Instant Messenger 3.0', '새롭게 시작된 서비스', 'AOL가 1999년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'AOL Instant Messenger 3.0: AOL가 1999년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 1999, NULL, 'brand-a583e0bb899c', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["1999년 공개·출시","AOL","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-aol-instant-messenger-3-0', 1999, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-aol-instant-messenger-3-0', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-aol-instant-messenger-3-0', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-aol-instant-messenger-3-0', 'tag-a583e0bb899c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d536d0cc2d04', 'milestone-1999-aol-instant-messenger-3-0', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=AOL%20Instant%20Messenger%203.0', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c518f329e1f0', '/images/archive/milestones/1999-aol-instant-messenger-3-0-commons.png', '/images/archive/milestones/1999-aol-instant-messenger-3-0-commons.png', 'static', '1999-aol-instant-messenger-3-0-commons.png', 'image/png', 19710, 'AOL Instant Messenger 3.0 대표 이미지', 'AOL, Inc.', 'https://commons.wikimedia.org/wiki/File:Logo_of_AOL_Instant_Messenger_(2011).png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-aol-instant-messenger-3-0', 'media-c518f329e1f0', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d536d0cc2d04', 'milestone-1999-aol-instant-messenger-3-0', 1, '{"name":"AOL Instant Messenger 3.0","summary":"AOL가 1999년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"AOL Instant Messenger 3.0: AOL가 1999년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=AOL%20Instant%20Messenger%203.0"},"image":{"src":"/images/archive/milestones/1999-aol-instant-messenger-3-0-commons.png","alt":"AOL Instant Messenger 3.0 대표 이미지","credit":"AOL, Inc.","sourceUrl":"https://commons.wikimedia.org/wiki/File:Logo_of_AOL_Instant_Messenger_(2011).png","license":"Public domain","matchedTitle":"Logo of AOL Instant Messenger (2011).png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-playstation-2', 'product', 'playstation-2', 'PlayStation 2', '시대를 바꾼 신제품', 'Sony가 2000년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation 2: Sony가 2000년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2000, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-playstation-2', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-playstation-2', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-playstation-2', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-playstation-2', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-002de547b0d5', 'milestone-2000-playstation-2', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%202', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-684b6525e78e', '/images/archive/milestones/2000-playstation-2.jpg', '/images/archive/milestones/2000-playstation-2.jpg', 'static', '2000-playstation-2.jpg', 'image/jpeg', 64838, '2000년 PlayStation 2 대표 이미지', 'PlayStation 2 contributors', 'https://en.wikipedia.org/wiki/PlayStation_2', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-playstation-2', 'media-684b6525e78e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-002de547b0d5', 'milestone-2000-playstation-2', 1, '{"name":"PlayStation 2","summary":"Sony가 2000년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation 2: Sony가 2000년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%202"},"image":{"src":"/images/archive/milestones/2000-playstation-2.jpg","alt":"2000년 PlayStation 2 대표 이미지","credit":"PlayStation 2 contributors","sourceUrl":"https://en.wikipedia.org/wiki/PlayStation_2","license":"Wikimedia source","matchedTitle":"PlayStation 2"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-windows-2000', 'program', 'windows-2000', 'Windows 2000', '새로운 디지털 도구', 'Microsoft가 2000년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows 2000: Microsoft가 2000년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2000, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-windows-2000', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-windows-2000', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-windows-2000', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-windows-2000', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-53d5fb792b2e', 'milestone-2000-windows-2000', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%202000', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d9d6caa6b3fa', '/images/archive/milestones/2000-windows-2000.png', '/images/archive/milestones/2000-windows-2000.png', 'static', '2000-windows-2000.png', 'image/png', 18602, '2000년 Windows 2000 대표 이미지', 'Windows 2000 contributors', 'https://en.wikipedia.org/wiki/Windows_2000', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-windows-2000', 'media-d9d6caa6b3fa', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-53d5fb792b2e', 'milestone-2000-windows-2000', 1, '{"name":"Windows 2000","summary":"Microsoft가 2000년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows 2000: Microsoft가 2000년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%202000"},"image":{"src":"/images/archive/milestones/2000-windows-2000.png","alt":"2000년 Windows 2000 대표 이미지","credit":"Windows 2000 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Windows_2000","license":"Wikimedia source","matchedTitle":"Windows 2000"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-mac-os-x-public-beta', 'program', 'mac-os-x-public-beta', 'Mac OS X Public Beta', '새로운 디지털 도구', 'Apple가 2000년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Mac OS X Public Beta: Apple가 2000년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2000, NULL, 'brand-476432a3e85a', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Apple","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-mac-os-x-public-beta', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-mac-os-x-public-beta', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-mac-os-x-public-beta', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-mac-os-x-public-beta', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d5935177c994', 'milestone-2000-mac-os-x-public-beta', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Mac%20OS%20X%20Public%20Beta', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-010bcdc20c05', '/images/archive/milestones/2000-mac-os-x-public-beta-mark.svg', '/images/archive/milestones/2000-mac-os-x-public-beta-mark.svg', 'static', '2000-mac-os-x-public-beta-mark.svg', 'image/svg+xml', 665, 'Mac OS X Public Beta 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Mac%20OS%20X%20Public%20Beta', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-mac-os-x-public-beta', 'media-010bcdc20c05', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d5935177c994', 'milestone-2000-mac-os-x-public-beta', 1, '{"name":"Mac OS X Public Beta","summary":"Apple가 2000년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Mac OS X Public Beta: Apple가 2000년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Mac%20OS%20X%20Public%20Beta"},"image":{"src":"/images/archive/milestones/2000-mac-os-x-public-beta-mark.svg","alt":"Mac OS X Public Beta 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Mac%20OS%20X%20Public%20Beta","license":"CC0 1.0 · trademark","matchedTitle":"apple brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-google-adwords', 'service', 'google-adwords', 'Google AdWords', '새롭게 시작된 서비스', 'Google가 2000년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google AdWords: Google가 2000년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2000, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-google-adwords', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-google-adwords', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-google-adwords', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-google-adwords', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-02b64d8709a3', 'milestone-2000-google-adwords', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20AdWords', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b36b2ec05eba', '/images/archive/milestones/2000-google-adwords-mark.svg', '/images/archive/milestones/2000-google-adwords-mark.svg', 'static', '2000-google-adwords-mark.svg', 'image/svg+xml', 622, 'Google AdWords 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20AdWords', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-google-adwords', 'media-b36b2ec05eba', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-02b64d8709a3', 'milestone-2000-google-adwords', 1, '{"name":"Google AdWords","summary":"Google가 2000년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google AdWords: Google가 2000년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20AdWords"},"image":{"src":"/images/archive/milestones/2000-google-adwords-mark.svg","alt":"Google AdWords 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20AdWords","license":"CC0 1.0 · trademark","matchedTitle":"googleads brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-baidu', 'website', 'baidu', 'Baidu', '웹의 새로운 입구', 'Baidu가 2000년에 선보인 검색 웹사이트로, 당시 디지털 경험의 변화를 보여줍니다.', 'Baidu: Baidu가 2000년에 공개한 검색 웹사이트입니다. 브라우저에서 정보와 콘텐츠를 찾고 이용할 수 있도록 만든 인터넷 공간입니다.', 2000, NULL, 'brand-12d6f299af44', 'category-website', '#315b76', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Baidu","웹사이트"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-baidu', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-baidu', 'tag-d8d66e82c2b8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-baidu', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-baidu', 'tag-12d6f299af44');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3fb427a85b85', 'milestone-2000-baidu', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Baidu', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-61d2c2c2072b', '/images/archive/milestones/2000-baidu.jpg', '/images/archive/milestones/2000-baidu.jpg', 'static', '2000-baidu.jpg', 'image/jpeg', 439192, '2000년 Baidu 대표 이미지', 'Baidu contributors', 'https://en.wikipedia.org/wiki/Baidu', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-baidu', 'media-61d2c2c2072b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3fb427a85b85', 'milestone-2000-baidu', 1, '{"name":"Baidu","summary":"Baidu가 2000년에 선보인 검색 웹사이트로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Baidu: Baidu가 2000년에 공개한 검색 웹사이트입니다. 브라우저에서 정보와 콘텐츠를 찾고 이용할 수 있도록 만든 인터넷 공간입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Baidu"},"image":{"src":"/images/archive/milestones/2000-baidu.jpg","alt":"2000년 Baidu 대표 이미지","credit":"Baidu contributors","sourceUrl":"https://en.wikipedia.org/wiki/Baidu","license":"Wikimedia source","matchedTitle":"Baidu"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-deviantart', 'service', 'deviantart', 'DeviantArt', '새롭게 시작된 서비스', 'DeviantArt가 2000년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'DeviantArt: DeviantArt가 2000년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2000, NULL, 'brand-2394cbc21fa1', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","DeviantArt","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-deviantart', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-deviantart', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-deviantart', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-deviantart', 'tag-2394cbc21fa1');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8962416d2af2', 'milestone-2000-deviantart', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=DeviantArt', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-52c514685478', '/images/archive/milestones/2000-deviantart-mark.svg', '/images/archive/milestones/2000-deviantart-mark.svg', 'static', '2000-deviantart-mark.svg', 'image/svg+xml', 308, 'DeviantArt 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=DeviantArt', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-deviantart', 'media-52c514685478', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8962416d2af2', 'milestone-2000-deviantart', 1, '{"name":"DeviantArt","summary":"DeviantArt가 2000년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"DeviantArt: DeviantArt가 2000년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=DeviantArt"},"image":{"src":"/images/archive/milestones/2000-deviantart-mark.svg","alt":"DeviantArt 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=DeviantArt","license":"CC0 1.0 · trademark","matchedTitle":"deviantart brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-habbo', 'service', 'habbo', 'Habbo', '새롭게 시작된 서비스', 'Sulake가 2000년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Habbo: Sulake가 2000년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2000, NULL, 'brand-ffa26e1057b5', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Sulake","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-habbo', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-habbo', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-habbo', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-habbo', 'tag-ffa26e1057b5');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a3104f3fa719', 'milestone-2000-habbo', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Habbo', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0a9266c32601', '/images/archive/milestones/2000-habbo-commons.png', '/images/archive/milestones/2000-habbo-commons.png', 'static', '2000-habbo-commons.png', 'image/png', 495, 'Habbo 대표 이미지', 'Sulake Corporation', 'https://commons.wikimedia.org/wiki/File:Habbo_logo.png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-habbo', 'media-0a9266c32601', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a3104f3fa719', 'milestone-2000-habbo', 1, '{"name":"Habbo","summary":"Sulake가 2000년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Habbo: Sulake가 2000년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Habbo"},"image":{"src":"/images/archive/milestones/2000-habbo-commons.png","alt":"Habbo 대표 이미지","credit":"Sulake Corporation","sourceUrl":"https://commons.wikimedia.org/wiki/File:Habbo_logo.png","license":"Public domain","matchedTitle":"Habbo logo.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-trek-thumbdrive', 'product', 'trek-thumbdrive', 'Trek ThumbDrive', '시대를 바꾼 신제품', 'Trek 2000가 2000년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Trek ThumbDrive: Trek 2000가 2000년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2000, NULL, 'brand-30566b25fb58', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Trek 2000","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-trek-thumbdrive', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-trek-thumbdrive', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-trek-thumbdrive', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-trek-thumbdrive', 'tag-30566b25fb58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-fa59c8b5c195', 'milestone-2000-trek-thumbdrive', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Trek%20ThumbDrive', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-afc3875ee3e7', '/images/archive/milestones/2000-trek-thumbdrive.jpg', '/images/archive/milestones/2000-trek-thumbdrive.jpg', 'static', '2000-trek-thumbdrive.jpg', 'image/jpeg', 218173, '2000년 무렵 출시된 Trek ThumbDrive', 'TechnoEdge', 'https://www.techno-edge.net/article/2025/02/19/4123.html', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-trek-thumbdrive', 'media-afc3875ee3e7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-fa59c8b5c195', 'milestone-2000-trek-thumbdrive', 1, '{"name":"Trek ThumbDrive","summary":"Trek 2000가 2000년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Trek ThumbDrive: Trek 2000가 2000년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Trek%20ThumbDrive"},"image":{"src":"/images/archive/milestones/2000-trek-thumbdrive.jpg","alt":"2000년 무렵 출시된 Trek ThumbDrive","credit":"TechnoEdge","sourceUrl":"https://www.techno-edge.net/article/2025/02/19/4123.html","license":"See source","matchedTitle":"trek thumbdrive"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-sharp-j-sh04', 'phone', 'sharp-j-sh04', 'Sharp J-SH04', '그해 출시된 휴대전화', 'Sharp가 2000년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Sharp J-SH04: Sharp가 2000년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2000, NULL, 'brand-cf3e9a41dee8', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Sharp","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-sharp-j-sh04', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-sharp-j-sh04', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-sharp-j-sh04', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-sharp-j-sh04', 'tag-cf3e9a41dee8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9e7b1c9b2f03', 'milestone-2000-sharp-j-sh04', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Sharp%20J-SH04', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-52a852a9abf6', '/images/archive/milestones/user-sharp-reference.jpg', '/images/archive/milestones/user-sharp-reference.jpg', 'static', 'user-sharp-reference.jpg', 'image/jpeg', 13406, '사용자가 제공한 Sharp J-SH04 참고 이미지', '사용자 제공 이미지', '/images/archive/milestones/user-sharp-reference.jpg', '사용자 제공', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-sharp-j-sh04', 'media-52a852a9abf6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9e7b1c9b2f03', 'milestone-2000-sharp-j-sh04', 1, '{"name":"Sharp J-SH04","summary":"Sharp가 2000년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Sharp J-SH04: Sharp가 2000년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Sharp%20J-SH04"},"image":{"src":"/images/archive/milestones/user-sharp-reference.jpg","alt":"사용자가 제공한 Sharp J-SH04 참고 이미지","credit":"사용자 제공 이미지","sourceUrl":"/images/archive/milestones/user-sharp-reference.jpg","license":"사용자 제공","matchedTitle":"Sharp J-SH04 reference"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2000-the-sims', 'game', 'the-sims', 'The Sims', '새롭게 등장한 플레이', 'Maxis가 2000년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'The Sims: Maxis가 2000년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2000, NULL, 'brand-4a4d708531cc', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2000년 공개·출시","Maxis","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2000-the-sims', 2000, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-the-sims', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-the-sims', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2000-the-sims', 'tag-4a4d708531cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-839c4cdc4bf8', 'milestone-2000-the-sims', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=The%20Sims', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f2e0ec0c3e0c', '/images/archive/milestones/2000-the-sims.png', '/images/archive/milestones/2000-the-sims.png', 'static', '2000-the-sims.png', 'image/png', 48987, '2000년 The Sims 대표 이미지', 'The Sims contributors', 'https://en.wikipedia.org/wiki/The_Sims', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2000-the-sims', 'media-f2e0ec0c3e0c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-839c4cdc4bf8', 'milestone-2000-the-sims', 1, '{"name":"The Sims","summary":"Maxis가 2000년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"The Sims: Maxis가 2000년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=The%20Sims"},"image":{"src":"/images/archive/milestones/2000-the-sims.png","alt":"2000년 The Sims 대표 이미지","credit":"The Sims contributors","sourceUrl":"https://en.wikipedia.org/wiki/The_Sims","license":"Wikimedia source","matchedTitle":"The Sims"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-ipod', 'product', 'ipod', 'iPod', '시대를 바꾼 신제품', 'Apple가 2001년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPod: Apple가 2001년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2001, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-ipod', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-ipod', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-ipod', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-ipod', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e7049a85beb7', 'milestone-2001-ipod', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPod', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ab63c88209e0', '/images/archive/milestones/2001-ipod.png', '/images/archive/milestones/2001-ipod.png', 'static', '2001-ipod.png', 'image/png', 272655, '2001년 iPod 대표 이미지', 'IPod contributors', 'https://en.wikipedia.org/wiki/IPod', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-ipod', 'media-ab63c88209e0', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e7049a85beb7', 'milestone-2001-ipod', 1, '{"name":"iPod","summary":"Apple가 2001년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPod: Apple가 2001년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPod"},"image":{"src":"/images/archive/milestones/2001-ipod.png","alt":"2001년 iPod 대표 이미지","credit":"IPod contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPod","license":"Wikimedia source","matchedTitle":"IPod"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-windows-xp', 'program', 'windows-xp', 'Windows XP', '새로운 디지털 도구', 'Microsoft가 2001년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows XP: Microsoft가 2001년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2001, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-windows-xp', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-windows-xp', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-windows-xp', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-windows-xp', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-992530a00fdd', 'milestone-2001-windows-xp', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%20XP', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2bcdd4d39f51', '/images/archive/milestones/2001-windows-xp.png', '/images/archive/milestones/2001-windows-xp.png', 'static', '2001-windows-xp.png', 'image/png', 252354, '2001년 Windows XP 대표 이미지', 'Windows XP contributors', 'https://en.wikipedia.org/wiki/Windows_XP', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-windows-xp', 'media-2bcdd4d39f51', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-992530a00fdd', 'milestone-2001-windows-xp', 1, '{"name":"Windows XP","summary":"Microsoft가 2001년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows XP: Microsoft가 2001년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%20XP"},"image":{"src":"/images/archive/milestones/2001-windows-xp.png","alt":"2001년 Windows XP 대표 이미지","credit":"Windows XP contributors","sourceUrl":"https://en.wikipedia.org/wiki/Windows_XP","license":"Wikimedia source","matchedTitle":"Windows XP"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-xbox', 'product', 'xbox', 'Xbox', '시대를 바꾼 신제품', 'Microsoft가 2001년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Xbox: Microsoft가 2001년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2001, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-xbox', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-xbox', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-xbox', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-xbox', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a54b34745306', 'milestone-2001-xbox', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Xbox', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ca4bd522fc8d', '/images/archive/milestones/2001-xbox.jpg', '/images/archive/milestones/2001-xbox.jpg', 'static', '2001-xbox.jpg', 'image/jpeg', 32364, '2001년 Xbox 대표 이미지', 'Xbox contributors', 'https://en.wikipedia.org/wiki/Xbox', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-xbox', 'media-ca4bd522fc8d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a54b34745306', 'milestone-2001-xbox', 1, '{"name":"Xbox","summary":"Microsoft가 2001년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Xbox: Microsoft가 2001년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Xbox"},"image":{"src":"/images/archive/milestones/2001-xbox.jpg","alt":"2001년 Xbox 대표 이미지","credit":"Xbox contributors","sourceUrl":"https://en.wikipedia.org/wiki/Xbox","license":"Wikimedia source","matchedTitle":"Xbox"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-nintendo-gamecube', 'product', 'nintendo-gamecube', 'Nintendo GameCube', '시대를 바꾼 신제품', 'Nintendo가 2001년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nintendo GameCube: Nintendo가 2001년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2001, NULL, 'brand-0cac146e40c7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Nintendo","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-nintendo-gamecube', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-nintendo-gamecube', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-nintendo-gamecube', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-nintendo-gamecube', 'tag-0cac146e40c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-73fc39dc1302', 'milestone-2001-nintendo-gamecube', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20GameCube', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-baf3204f851a', '/images/archive/milestones/2001-nintendo-gamecube-commons.jpg', '/images/archive/milestones/2001-nintendo-gamecube-commons.jpg', 'static', '2001-nintendo-gamecube-commons.jpg', 'image/jpeg', 90860, 'Nintendo GameCube 제품 이미지', 'Evan-Amos', 'https://commons.wikimedia.org/wiki/File:Nintendo-GameCube-Console-FL.jpg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-nintendo-gamecube', 'media-baf3204f851a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-73fc39dc1302', 'milestone-2001-nintendo-gamecube', 1, '{"name":"Nintendo GameCube","summary":"Nintendo가 2001년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nintendo GameCube: Nintendo가 2001년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20GameCube"},"image":{"src":"/images/archive/milestones/2001-nintendo-gamecube-commons.jpg","alt":"Nintendo GameCube 제품 이미지","credit":"Evan-Amos","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nintendo-GameCube-Console-FL.jpg","license":"Public domain","matchedTitle":"Nintendo-GameCube-Console-FL.jpg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-wikipedia', 'website', 'wikipedia', 'Wikipedia', '웹의 새로운 입구', 'Wikimedia Foundation가 2001년에 선보인 정보를 탐색하고 공유하는 웹사이트로, 당시 디지털 경험의 변화를 보여줍니다.', 'Wikipedia: Wikimedia Foundation가 2001년에 공개한 정보를 탐색하고 공유하는 웹사이트입니다. 브라우저에서 정보와 콘텐츠를 찾고 이용할 수 있도록 만든 인터넷 공간입니다.', 2001, NULL, 'brand-52f2ffa198ad', 'category-website', '#315b76', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Wikimedia Foundation","웹사이트"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-wikipedia', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-wikipedia', 'tag-d8d66e82c2b8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-wikipedia', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-wikipedia', 'tag-52f2ffa198ad');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-c5db73c5a4ae', 'milestone-2001-wikipedia', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Wikipedia', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-935d682a449e', '/images/archive/milestones/2001-wikipedia.png', '/images/archive/milestones/2001-wikipedia.png', 'static', '2001-wikipedia.png', 'image/png', 19573, '2001년 Wikipedia 대표 이미지', 'Wikipedia contributors', 'https://en.wikipedia.org/wiki/Wikipedia', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-wikipedia', 'media-935d682a449e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-c5db73c5a4ae', 'milestone-2001-wikipedia', 1, '{"name":"Wikipedia","summary":"Wikimedia Foundation가 2001년에 선보인 정보를 탐색하고 공유하는 웹사이트로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Wikipedia: Wikimedia Foundation가 2001년에 공개한 정보를 탐색하고 공유하는 웹사이트입니다. 브라우저에서 정보와 콘텐츠를 찾고 이용할 수 있도록 만든 인터넷 공간입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Wikipedia"},"image":{"src":"/images/archive/milestones/2001-wikipedia.png","alt":"2001년 Wikipedia 대표 이미지","credit":"Wikipedia contributors","sourceUrl":"https://en.wikipedia.org/wiki/Wikipedia","license":"Wikimedia source","matchedTitle":"Wikipedia"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-bittorrent', 'service', 'bittorrent', 'BitTorrent', '새롭게 시작된 서비스', 'Bram Cohen가 2001년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'BitTorrent: Bram Cohen가 2001년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2001, NULL, 'brand-b8c890ca9277', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Bram Cohen","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-bittorrent', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-bittorrent', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-bittorrent', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-bittorrent', 'tag-b8c890ca9277');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2d1fb6c459de', 'milestone-2001-bittorrent', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=BitTorrent', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1bf9eb07a0d5', '/images/archive/milestones/2001-bittorrent-mark.svg', '/images/archive/milestones/2001-bittorrent-mark.svg', 'static', '2001-bittorrent-mark.svg', 'image/svg+xml', 1559, 'BitTorrent 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=BitTorrent', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-bittorrent', 'media-1bf9eb07a0d5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2d1fb6c459de', 'milestone-2001-bittorrent', 1, '{"name":"BitTorrent","summary":"Bram Cohen가 2001년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"BitTorrent: Bram Cohen가 2001년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=BitTorrent"},"image":{"src":"/images/archive/milestones/2001-bittorrent-mark.svg","alt":"BitTorrent 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=BitTorrent","license":"CC0 1.0 · trademark","matchedTitle":"bittorrent brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-itunes', 'program', 'itunes', 'iTunes', '새로운 디지털 도구', 'Apple가 2001년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.', 'iTunes: Apple가 2001년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2001, NULL, 'brand-476432a3e85a', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Apple","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-itunes', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-itunes', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-itunes', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-itunes', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0be67281cc2a', 'milestone-2001-itunes', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iTunes', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-fecaa31d3854', '/images/archive/milestones/2001-itunes-mark.svg', '/images/archive/milestones/2001-itunes-mark.svg', 'static', '2001-itunes-mark.svg', 'image/svg+xml', 1497, 'iTunes 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=iTunes', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-itunes', 'media-fecaa31d3854', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0be67281cc2a', 'milestone-2001-itunes', 1, '{"name":"iTunes","summary":"Apple가 2001년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iTunes: Apple가 2001년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iTunes"},"image":{"src":"/images/archive/milestones/2001-itunes-mark.svg","alt":"iTunes 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=iTunes","license":"CC0 1.0 · trademark","matchedTitle":"itunes brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-mac-os-x', 'program', 'mac-os-x', 'Mac OS X', '새로운 디지털 도구', 'Apple가 2001년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Mac OS X: Apple가 2001년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2001, NULL, 'brand-476432a3e85a', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Apple","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-mac-os-x', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-mac-os-x', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-mac-os-x', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-mac-os-x', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-014257945f8a', 'milestone-2001-mac-os-x', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Mac%20OS%20X', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d0ab14b82c96', '/images/archive/milestones/2001-mac-os-x.png', '/images/archive/milestones/2001-mac-os-x.png', 'static', '2001-mac-os-x.png', 'image/png', 180604, '2001년 Mac OS X 대표 이미지', 'MacOS contributors', 'https://en.wikipedia.org/wiki/MacOS', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-mac-os-x', 'media-d0ab14b82c96', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-014257945f8a', 'milestone-2001-mac-os-x', 1, '{"name":"Mac OS X","summary":"Apple가 2001년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Mac OS X: Apple가 2001년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Mac%20OS%20X"},"image":{"src":"/images/archive/milestones/2001-mac-os-x.png","alt":"2001년 Mac OS X 대표 이미지","credit":"MacOS contributors","sourceUrl":"https://en.wikipedia.org/wiki/MacOS","license":"Wikimedia source","matchedTitle":"MacOS"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-nokia-5510', 'phone', 'nokia-5510', 'Nokia 5510', '그해 출시된 휴대전화', 'Nokia가 2001년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia 5510: Nokia가 2001년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2001, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-nokia-5510', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-nokia-5510', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-nokia-5510', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-nokia-5510', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3f361a000465', 'milestone-2001-nokia-5510', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%205510', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-926137b70df1', '/images/archive/milestones/2001-nokia-5510-exact.jpg', '/images/archive/milestones/2001-nokia-5510-exact.jpg', 'static', '2001-nokia-5510-exact.jpg', 'image/jpeg', 61281, 'Nokia 5510 실제 제품 전면 사진', 'Mobilissimo', 'https://www.mobilissimo.ro/telefoane/nokia/5510/', 'Source-site editorial image', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-nokia-5510', 'media-926137b70df1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3f361a000465', 'milestone-2001-nokia-5510', 1, '{"name":"Nokia 5510","summary":"Nokia가 2001년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia 5510: Nokia가 2001년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%205510"},"image":{"src":"/images/archive/milestones/2001-nokia-5510-exact.jpg","alt":"Nokia 5510 실제 제품 전면 사진","credit":"Mobilissimo","sourceUrl":"https://www.mobilissimo.ro/telefoane/nokia/5510/","license":"Source-site editorial image","matchedTitle":"Nokia 5510"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2001-powerbook-g4', 'product', 'powerbook-g4', 'PowerBook G4', '시대를 바꾼 신제품', 'Apple가 2001년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'PowerBook G4: Apple가 2001년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2001, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2001년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2001-powerbook-g4', 2001, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-powerbook-g4', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-powerbook-g4', 'tag-9195f873d171');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2001-powerbook-g4', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e45c6ae4e4ea', 'milestone-2001-powerbook-g4', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PowerBook%20G4', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-47d2a0c8e590', '/images/archive/milestones/2001-powerbook-g4.jpg', '/images/archive/milestones/2001-powerbook-g4.jpg', 'static', '2001-powerbook-g4.jpg', 'image/jpeg', 54622, '2001년 PowerBook G4 대표 이미지', 'PowerBook G4 contributors', 'https://en.wikipedia.org/wiki/PowerBook_G4', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2001-powerbook-g4', 'media-47d2a0c8e590', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e45c6ae4e4ea', 'milestone-2001-powerbook-g4', 1, '{"name":"PowerBook G4","summary":"Apple가 2001년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PowerBook G4: Apple가 2001년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PowerBook%20G4"},"image":{"src":"/images/archive/milestones/2001-powerbook-g4.jpg","alt":"2001년 PowerBook G4 대표 이미지","credit":"PowerBook G4 contributors","sourceUrl":"https://en.wikipedia.org/wiki/PowerBook_G4","license":"Wikimedia source","matchedTitle":"PowerBook G4"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-xbox-live', 'service', 'xbox-live', 'Xbox Live', '새롭게 시작된 서비스', 'Microsoft가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Xbox Live: Microsoft가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2002, NULL, 'brand-11f3242118ff', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Microsoft","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-xbox-live', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-xbox-live', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-xbox-live', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-xbox-live', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-91e4910c3966', 'milestone-2002-xbox-live', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20Live', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d8d28df11e03', '/images/archive/milestones/2002-xbox-live-commons.png', '/images/archive/milestones/2002-xbox-live-commons.png', 'static', '2002-xbox-live-commons.png', 'image/png', 35753, 'Xbox Live 대표 이미지', 'Xbox Live', 'https://commons.wikimedia.org/wiki/File:Xbox_Live_logo.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-xbox-live', 'media-d8d28df11e03', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-91e4910c3966', 'milestone-2002-xbox-live', 1, '{"name":"Xbox Live","summary":"Microsoft가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Xbox Live: Microsoft가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20Live"},"image":{"src":"/images/archive/milestones/2002-xbox-live-commons.png","alt":"Xbox Live 대표 이미지","credit":"Xbox Live","sourceUrl":"https://commons.wikimedia.org/wiki/File:Xbox_Live_logo.svg","license":"Public domain","matchedTitle":"Xbox Live logo.svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-blackberry-5810', 'phone', 'blackberry-5810', 'BlackBerry 5810', '그해 출시된 휴대전화', 'Research In Motion가 2002년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'BlackBerry 5810: Research In Motion가 2002년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2002, NULL, 'brand-b16b1db72bde', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Research In Motion","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-blackberry-5810', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-blackberry-5810', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-blackberry-5810', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-blackberry-5810', 'tag-b16b1db72bde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f8053dc9811f', 'milestone-2002-blackberry-5810', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%205810', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b944362596c6', '/images/archive/milestones/user-blackberry-reference.jpg', '/images/archive/milestones/user-blackberry-reference.jpg', 'static', 'user-blackberry-reference.jpg', 'image/jpeg', 70667, '사용자가 제공한 BlackBerry 휴대기기 참고 이미지', '사용자 제공 이미지', '/images/archive/milestones/user-blackberry-reference.jpg', '사용자 제공', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-blackberry-5810', 'media-b944362596c6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f8053dc9811f', 'milestone-2002-blackberry-5810', 1, '{"name":"BlackBerry 5810","summary":"Research In Motion가 2002년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"BlackBerry 5810: Research In Motion가 2002년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%205810"},"image":{"src":"/images/archive/milestones/user-blackberry-reference.jpg","alt":"사용자가 제공한 BlackBerry 휴대기기 참고 이미지","credit":"사용자 제공 이미지","sourceUrl":"/images/archive/milestones/user-blackberry-reference.jpg","license":"사용자 제공","matchedTitle":"BlackBerry reference"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-nokia-7650', 'phone', 'nokia-7650', 'Nokia 7650', '그해 출시된 휴대전화', 'Nokia가 2002년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia 7650: Nokia가 2002년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2002, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-nokia-7650', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-nokia-7650', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-nokia-7650', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-nokia-7650', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-351af5052b18', 'milestone-2002-nokia-7650', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%207650', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-652bda1695ae', '/images/archive/milestones/2002-nokia-7650-exact.jpg', '/images/archive/milestones/2002-nokia-7650-exact.jpg', 'static', '2002-nokia-7650-exact.jpg', 'image/jpeg', 93188, 'Nokia 7650 실제 제품 전면 사진', 'Expus', 'https://www.expus.gr/products/Mobile_Phones/Nokia/01160', 'Source-site product image', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-nokia-7650', 'media-652bda1695ae', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-351af5052b18', 'milestone-2002-nokia-7650', 1, '{"name":"Nokia 7650","summary":"Nokia가 2002년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia 7650: Nokia가 2002년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%207650"},"image":{"src":"/images/archive/milestones/2002-nokia-7650-exact.jpg","alt":"Nokia 7650 실제 제품 전면 사진","credit":"Expus","sourceUrl":"https://www.expus.gr/products/Mobile_Phones/Nokia/01160","license":"Source-site product image","matchedTitle":"Nokia 7650"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-imac-g4', 'product', 'imac-g4', 'iMac G4', '시대를 바꾼 신제품', 'Apple가 2002년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'iMac G4: Apple가 2002년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2002, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-imac-g4', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-imac-g4', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-imac-g4', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-imac-g4', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-41064ac66ae5', 'milestone-2002-imac-g4', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iMac%20G4', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ae324c1ece67', '/images/archive/milestones/2002-imac-g4-commons.png', '/images/archive/milestones/2002-imac-g4-commons.png', 'static', '2002-imac-g4-commons.png', 'image/png', 131571, 'iMac G4 제품 이미지', 'No machine-readable author provided. Bishonen assumed (based on copyright claims).', 'https://commons.wikimedia.org/wiki/File:IMac_G4_sunflower6.png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-imac-g4', 'media-ae324c1ece67', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-41064ac66ae5', 'milestone-2002-imac-g4', 1, '{"name":"iMac G4","summary":"Apple가 2002년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iMac G4: Apple가 2002년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iMac%20G4"},"image":{"src":"/images/archive/milestones/2002-imac-g4-commons.png","alt":"iMac G4 제품 이미지","credit":"No machine-readable author provided. Bishonen assumed (based on copyright claims).","sourceUrl":"https://commons.wikimedia.org/wiki/File:IMac_G4_sunflower6.png","license":"Public domain","matchedTitle":"IMac G4 sunflower6.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-friendster', 'service', 'friendster', 'Friendster', '새롭게 시작된 서비스', 'Friendster가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Friendster: Friendster가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2002, NULL, 'brand-c847a70d6bda', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Friendster","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-friendster', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-friendster', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-friendster', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-friendster', 'tag-c847a70d6bda');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4503363944e9', 'milestone-2002-friendster', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Friendster', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c3c2fe1c98a1', '/images/archive/milestones/2002-friendster-commons.png', '/images/archive/milestones/2002-friendster-commons.png', 'static', '2002-friendster-commons.png', 'image/png', 8703, 'Friendster 대표 이미지', 'Basavarajtalwar', 'https://commons.wikimedia.org/wiki/File:Friendster_logo.svg', 'CC BY-SA 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-friendster', 'media-c3c2fe1c98a1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4503363944e9', 'milestone-2002-friendster', 1, '{"name":"Friendster","summary":"Friendster가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Friendster: Friendster가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Friendster"},"image":{"src":"/images/archive/milestones/2002-friendster-commons.png","alt":"Friendster 대표 이미지","credit":"Basavarajtalwar","sourceUrl":"https://commons.wikimedia.org/wiki/File:Friendster_logo.svg","license":"CC BY-SA 3.0","matchedTitle":"Friendster logo.svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-google-news', 'service', 'google-news', 'Google News', '새롭게 시작된 서비스', 'Google가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google News: Google가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2002, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-google-news', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-google-news', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-google-news', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-google-news', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3a70aa634c23', 'milestone-2002-google-news', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20News', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-79a8e2dcf3f6', '/images/archive/milestones/2002-google-news-mark.svg', '/images/archive/milestones/2002-google-news-mark.svg', 'static', '2002-google-news-mark.svg', 'image/svg+xml', 1577, 'Google News 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20News', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-google-news', 'media-79a8e2dcf3f6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3a70aa634c23', 'milestone-2002-google-news', 1, '{"name":"Google News","summary":"Google가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google News: Google가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20News"},"image":{"src":"/images/archive/milestones/2002-google-news-mark.svg","alt":"Google News 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20News","license":"CC0 1.0 · trademark","matchedTitle":"googlenews brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-froogle', 'service', 'froogle', 'Froogle', '새롭게 시작된 서비스', 'Google가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Froogle: Google가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2002, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-froogle', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-froogle', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-froogle', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-froogle', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-894d10c78653', 'milestone-2002-froogle', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Froogle', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d384e69a93eb', '/images/archive/milestones/2002-froogle-mark.svg', '/images/archive/milestones/2002-froogle-mark.svg', 'static', '2002-froogle-mark.svg', 'image/svg+xml', 472, 'Froogle 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Froogle', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-froogle', 'media-d384e69a93eb', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-894d10c78653', 'milestone-2002-froogle', 1, '{"name":"Froogle","summary":"Google가 2002년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Froogle: Google가 2002년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Froogle"},"image":{"src":"/images/archive/milestones/2002-froogle-mark.svg","alt":"Froogle 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Froogle","license":"CC0 1.0 · trademark","matchedTitle":"google brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-mozilla-1-0', 'program', 'mozilla-1-0', 'Mozilla 1.0', '새로운 디지털 도구', 'Mozilla가 2002년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.', 'Mozilla 1.0: Mozilla가 2002년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2002, NULL, 'brand-d83016dd56e9', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Mozilla","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-mozilla-1-0', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-mozilla-1-0', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-mozilla-1-0', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-mozilla-1-0', 'tag-d83016dd56e9');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-abe19c124580', 'milestone-2002-mozilla-1-0', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Mozilla%201.0', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-01bd13623f45', '/images/archive/milestones/2002-mozilla-1-0-mark.svg', '/images/archive/milestones/2002-mozilla-1-0-mark.svg', 'static', '2002-mozilla-1-0-mark.svg', 'image/svg+xml', 287, 'Mozilla 1.0 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Mozilla%201.0', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-mozilla-1-0', 'media-01bd13623f45', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-abe19c124580', 'milestone-2002-mozilla-1-0', 1, '{"name":"Mozilla 1.0","summary":"Mozilla가 2002년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Mozilla 1.0: Mozilla가 2002년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Mozilla%201.0"},"image":{"src":"/images/archive/milestones/2002-mozilla-1-0-mark.svg","alt":"Mozilla 1.0 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Mozilla%201.0","license":"CC0 1.0 · trademark","matchedTitle":"mozilla brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-openoffice-org-1-0', 'program', 'openoffice-org-1-0', 'OpenOffice.org 1.0', '새로운 디지털 도구', 'OpenOffice.org가 2002년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.', 'OpenOffice.org 1.0: OpenOffice.org가 2002년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2002, NULL, 'brand-7e0ab390e4f8', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","OpenOffice.org","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-openoffice-org-1-0', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-openoffice-org-1-0', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-openoffice-org-1-0', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-openoffice-org-1-0', 'tag-7e0ab390e4f8');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5b7b71ca5213', 'milestone-2002-openoffice-org-1-0', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=OpenOffice.org%201.0', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2d7bb2a44807', '/images/archive/milestones/2002-openoffice-org-1-0-mark.svg', '/images/archive/milestones/2002-openoffice-org-1-0-mark.svg', 'static', '2002-openoffice-org-1-0-mark.svg', 'image/svg+xml', 941, 'OpenOffice.org 1.0 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=OpenOffice.org%201.0', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-openoffice-org-1-0', 'media-2d7bb2a44807', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5b7b71ca5213', 'milestone-2002-openoffice-org-1-0', 1, '{"name":"OpenOffice.org 1.0","summary":"OpenOffice.org가 2002년에 선보인 PC와 모바일에서 사용하는 소프트웨어로, 당시 디지털 경험의 변화를 보여줍니다.","description":"OpenOffice.org 1.0: OpenOffice.org가 2002년에 공개한 PC와 모바일에서 사용하는 소프트웨어입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=OpenOffice.org%201.0"},"image":{"src":"/images/archive/milestones/2002-openoffice-org-1-0-mark.svg","alt":"OpenOffice.org 1.0 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=OpenOffice.org%201.0","license":"CC0 1.0 · trademark","matchedTitle":"apacheopenoffice brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2002-kingdom-hearts', 'game', 'kingdom-hearts', 'Kingdom Hearts', '새롭게 등장한 플레이', 'Square가 2002년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'Kingdom Hearts: Square가 2002년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2002, NULL, 'brand-82810cb97184', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2002년 공개·출시","Square","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2002-kingdom-hearts', 2002, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-kingdom-hearts', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-kingdom-hearts', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2002-kingdom-hearts', 'tag-82810cb97184');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3ed713fc5cf7', 'milestone-2002-kingdom-hearts', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Kingdom%20Hearts', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-4fc22fd5bdb7', '/images/archive/milestones/2002-kingdom-hearts-commons.png', '/images/archive/milestones/2002-kingdom-hearts-commons.png', 'static', '2002-kingdom-hearts-commons.png', 'image/png', 26406, 'Kingdom Hearts 대표 이미지', '0 Noctis 0', 'https://commons.wikimedia.org/wiki/File:Kingdom_Hearts_wordmark.png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2002-kingdom-hearts', 'media-4fc22fd5bdb7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3ed713fc5cf7', 'milestone-2002-kingdom-hearts', 1, '{"name":"Kingdom Hearts","summary":"Square가 2002년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Kingdom Hearts: Square가 2002년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Kingdom%20Hearts"},"image":{"src":"/images/archive/milestones/2002-kingdom-hearts-commons.png","alt":"Kingdom Hearts 대표 이미지","credit":"0 Noctis 0","sourceUrl":"https://commons.wikimedia.org/wiki/File:Kingdom_Hearts_wordmark.png","license":"Public domain","matchedTitle":"Kingdom Hearts wordmark.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-skype', 'service', 'skype', 'Skype', '새롭게 시작된 서비스', 'Skype Technologies가 2003년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Skype: Skype Technologies가 2003년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2003, NULL, 'brand-26535aa23010', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Skype Technologies","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-skype', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-skype', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-skype', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-skype', 'tag-26535aa23010');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-355f045793c4', 'milestone-2003-skype', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Skype', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d7b0235b69f2', '/images/archive/milestones/2003-skype-commons.png', '/images/archive/milestones/2003-skype-commons.png', 'static', '2003-skype-commons.png', 'image/png', 55229, 'Skype 대표 이미지', 'Skype', 'https://commons.wikimedia.org/wiki/File:Skype_Logo.png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-skype', 'media-d7b0235b69f2', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-355f045793c4', 'milestone-2003-skype', 1, '{"name":"Skype","summary":"Skype Technologies가 2003년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Skype: Skype Technologies가 2003년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Skype"},"image":{"src":"/images/archive/milestones/2003-skype-commons.png","alt":"Skype 대표 이미지","credit":"Skype","sourceUrl":"https://commons.wikimedia.org/wiki/File:Skype_Logo.png","license":"Public domain","matchedTitle":"Skype Logo.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-linkedin', 'service', 'linkedin', 'LinkedIn', '새롭게 시작된 서비스', 'LinkedIn가 2003년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'LinkedIn: LinkedIn가 2003년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2003, NULL, 'brand-6b6390a44161', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","LinkedIn","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-linkedin', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-linkedin', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-linkedin', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-linkedin', 'tag-6b6390a44161');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b25f18f373e9', 'milestone-2003-linkedin', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=LinkedIn', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-fc5b9a6c7578', '/images/archive/milestones/2003-linkedin-commons.png', '/images/archive/milestones/2003-linkedin-commons.png', 'static', '2003-linkedin-commons.png', 'image/png', 21550, 'LinkedIn 대표 이미지', 'LinkedIn', 'https://commons.wikimedia.org/wiki/File:LinkedIn_Logo_2013_(2).svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-linkedin', 'media-fc5b9a6c7578', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b25f18f373e9', 'milestone-2003-linkedin', 1, '{"name":"LinkedIn","summary":"LinkedIn가 2003년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"LinkedIn: LinkedIn가 2003년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=LinkedIn"},"image":{"src":"/images/archive/milestones/2003-linkedin-commons.png","alt":"LinkedIn 대표 이미지","credit":"LinkedIn","sourceUrl":"https://commons.wikimedia.org/wiki/File:LinkedIn_Logo_2013_(2).svg","license":"Public domain","matchedTitle":"LinkedIn Logo 2013 (2).svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-myspace', 'service', 'myspace', 'Myspace', '새롭게 시작된 서비스', 'Intermix Media가 2003년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Myspace: Intermix Media가 2003년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2003, NULL, 'brand-39d03f32a468', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Intermix Media","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-myspace', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-myspace', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-myspace', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-myspace', 'tag-39d03f32a468');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-afe44fd11b8a', 'milestone-2003-myspace', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Myspace', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a94a87ce95b1', '/images/archive/milestones/2003-myspace-mark.svg', '/images/archive/milestones/2003-myspace-mark.svg', 'static', '2003-myspace-mark.svg', 'image/svg+xml', 897, 'Myspace 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Myspace', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-myspace', 'media-a94a87ce95b1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-afe44fd11b8a', 'milestone-2003-myspace', 1, '{"name":"Myspace","summary":"Intermix Media가 2003년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Myspace: Intermix Media가 2003년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Myspace"},"image":{"src":"/images/archive/milestones/2003-myspace-mark.svg","alt":"Myspace 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Myspace","license":"CC0 1.0 · trademark","matchedTitle":"myspace brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-steam', 'service', 'steam', 'Steam', '새롭게 시작된 서비스', 'Valve가 2003년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Steam: Valve가 2003년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2003, NULL, 'brand-986d2de2ea6d', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Valve","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-steam', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-steam', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-steam', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-steam', 'tag-986d2de2ea6d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-19850af8cf04', 'milestone-2003-steam', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Steam', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-cf973af49e90', '/images/archive/milestones/2003-steam-mark.svg', '/images/archive/milestones/2003-steam-mark.svg', 'static', '2003-steam-mark.svg', 'image/svg+xml', 1051, 'Steam 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Steam', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-steam', 'media-cf973af49e90', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-19850af8cf04', 'milestone-2003-steam', 1, '{"name":"Steam","summary":"Valve가 2003년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Steam: Valve가 2003년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Steam"},"image":{"src":"/images/archive/milestones/2003-steam-mark.svg","alt":"Steam 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Steam","license":"CC0 1.0 · trademark","matchedTitle":"steam brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-itunes-store', 'service', 'itunes-store', 'iTunes Store', '새롭게 시작된 서비스', 'Apple가 2003년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'iTunes Store: Apple가 2003년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2003, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-itunes-store', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-itunes-store', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-itunes-store', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-itunes-store', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-140cefa3d47d', 'milestone-2003-itunes-store', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iTunes%20Store', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-bdf281853473', '/images/archive/milestones/2003-itunes-store-mark.svg', '/images/archive/milestones/2003-itunes-store-mark.svg', 'static', '2003-itunes-store-mark.svg', 'image/svg+xml', 1497, 'iTunes Store 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=iTunes%20Store', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-itunes-store', 'media-bdf281853473', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-140cefa3d47d', 'milestone-2003-itunes-store', 1, '{"name":"iTunes Store","summary":"Apple가 2003년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iTunes Store: Apple가 2003년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iTunes%20Store"},"image":{"src":"/images/archive/milestones/2003-itunes-store-mark.svg","alt":"iTunes Store 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=iTunes%20Store","license":"CC0 1.0 · trademark","matchedTitle":"itunes brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-blackberry-6210', 'phone', 'blackberry-6210', 'BlackBerry 6210', '그해 출시된 휴대전화', 'Research In Motion가 2003년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'BlackBerry 6210: Research In Motion가 2003년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2003, NULL, 'brand-b16b1db72bde', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Research In Motion","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-blackberry-6210', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-blackberry-6210', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-blackberry-6210', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-blackberry-6210', 'tag-b16b1db72bde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-08a016ff19b4', 'milestone-2003-blackberry-6210', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%206210', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b944362596c6', '/images/archive/milestones/user-blackberry-reference.jpg', '/images/archive/milestones/user-blackberry-reference.jpg', 'static', 'user-blackberry-reference.jpg', 'image/jpeg', 70667, '사용자가 제공한 BlackBerry 휴대기기 참고 이미지', '사용자 제공 이미지', '/images/archive/milestones/user-blackberry-reference.jpg', '사용자 제공', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-blackberry-6210', 'media-b944362596c6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-08a016ff19b4', 'milestone-2003-blackberry-6210', 1, '{"name":"BlackBerry 6210","summary":"Research In Motion가 2003년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"BlackBerry 6210: Research In Motion가 2003년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%206210"},"image":{"src":"/images/archive/milestones/user-blackberry-reference.jpg","alt":"사용자가 제공한 BlackBerry 휴대기기 참고 이미지","credit":"사용자 제공 이미지","sourceUrl":"/images/archive/milestones/user-blackberry-reference.jpg","license":"사용자 제공","matchedTitle":"BlackBerry reference"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-nokia-n-gage', 'product', 'nokia-n-gage', 'Nokia N-Gage', '시대를 바꾼 신제품', 'Nokia가 2003년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia N-Gage: Nokia가 2003년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2003, NULL, 'brand-ec307432a3d7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Nokia","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-nokia-n-gage', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-nokia-n-gage', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-nokia-n-gage', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-nokia-n-gage', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-402ce3378072', 'milestone-2003-nokia-n-gage', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N-Gage', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5ab87c7d9e1d', '/images/archive/milestones/2003-nokia-n-gage-exact.png', '/images/archive/milestones/2003-nokia-n-gage-exact.png', 'static', '2003-nokia-n-gage-exact.png', 'image/png', 438912, 'Nokia N-Gage 실제 제품 전면 사진', 'J-P Kärnä / Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Nokia_N-Gage.png', 'CC BY-SA 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-nokia-n-gage', 'media-5ab87c7d9e1d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-402ce3378072', 'milestone-2003-nokia-n-gage', 1, '{"name":"Nokia N-Gage","summary":"Nokia가 2003년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia N-Gage: Nokia가 2003년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N-Gage"},"image":{"src":"/images/archive/milestones/2003-nokia-n-gage-exact.png","alt":"Nokia N-Gage 실제 제품 전면 사진","credit":"J-P Kärnä / Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_N-Gage.png","license":"CC BY-SA 3.0","matchedTitle":"Nokia N-Gage"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-power-mac-g5', 'product', 'power-mac-g5', 'Power Mac G5', '시대를 바꾼 신제품', 'Apple가 2003년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'Power Mac G5: Apple가 2003년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2003, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-power-mac-g5', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-power-mac-g5', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-power-mac-g5', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-power-mac-g5', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ee2080f33a7e', 'milestone-2003-power-mac-g5', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Power%20Mac%20G5', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-383d12c30b36', '/images/archive/milestones/2003-power-mac-g5.jpg', '/images/archive/milestones/2003-power-mac-g5.jpg', 'static', '2003-power-mac-g5.jpg', 'image/jpeg', 311914, '2003년 Power Mac G5 대표 이미지', 'Power Mac G5 contributors', 'https://en.wikipedia.org/wiki/Power_Mac_G5', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-power-mac-g5', 'media-383d12c30b36', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ee2080f33a7e', 'milestone-2003-power-mac-g5', 1, '{"name":"Power Mac G5","summary":"Apple가 2003년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Power Mac G5: Apple가 2003년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Power%20Mac%20G5"},"image":{"src":"/images/archive/milestones/2003-power-mac-g5.jpg","alt":"2003년 Power Mac G5 대표 이미지","credit":"Power Mac G5 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Power_Mac_G5","license":"Wikimedia source","matchedTitle":"Power Mac G5"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-wordpress', 'service', 'wordpress', 'WordPress', '새롭게 시작된 서비스', 'WordPress Foundation가 2003년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'WordPress: WordPress Foundation가 2003년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2003, NULL, 'brand-5880fc6231df', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","WordPress Foundation","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-wordpress', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-wordpress', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-wordpress', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-wordpress', 'tag-5880fc6231df');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3cc5abf978a6', 'milestone-2003-wordpress', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=WordPress', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a94d09b19735', '/images/archive/milestones/2003-wordpress.png', '/images/archive/milestones/2003-wordpress.png', 'static', '2003-wordpress.png', 'image/png', 115761, '2003년 WordPress 대표 이미지', 'WordPress contributors', 'https://en.wikipedia.org/wiki/WordPress', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-wordpress', 'media-a94d09b19735', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3cc5abf978a6', 'milestone-2003-wordpress', 1, '{"name":"WordPress","summary":"WordPress Foundation가 2003년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"WordPress: WordPress Foundation가 2003년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=WordPress"},"image":{"src":"/images/archive/milestones/2003-wordpress.png","alt":"2003년 WordPress 대표 이미지","credit":"WordPress contributors","sourceUrl":"https://en.wikipedia.org/wiki/WordPress","license":"Wikimedia source","matchedTitle":"WordPress"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2003-safari', 'program', 'safari', 'Safari', '새로운 디지털 도구', 'Apple가 2003년에 선보인 웹 브라우저로, 당시 디지털 경험의 변화를 보여줍니다.', 'Safari: Apple가 2003년에 공개한 웹 브라우저입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2003, NULL, 'brand-476432a3e85a', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2003년 공개·출시","Apple","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2003-safari', 2003, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-safari', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-safari', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2003-safari', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-75d5696793be', 'milestone-2003-safari', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Safari', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8d803e7c2e30', '/images/archive/milestones/2003-safari-mark.svg', '/images/archive/milestones/2003-safari-mark.svg', 'static', '2003-safari-mark.svg', 'image/svg+xml', 11859, 'Safari 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Safari', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2003-safari', 'media-8d803e7c2e30', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-75d5696793be', 'milestone-2003-safari', 1, '{"name":"Safari","summary":"Apple가 2003년에 선보인 웹 브라우저로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Safari: Apple가 2003년에 공개한 웹 브라우저입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Safari"},"image":{"src":"/images/archive/milestones/2003-safari-mark.svg","alt":"Safari 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Safari","license":"CC0 1.0 · trademark","matchedTitle":"safari brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-gmail', 'service', 'gmail', 'Gmail', '새롭게 시작된 서비스', 'Google가 2004년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Gmail: Google가 2004년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2004, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-gmail', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-gmail', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-gmail', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-gmail', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a271de689e57', 'milestone-2004-gmail', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Gmail', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-086ef4ad18ea', '/images/archive/milestones/2004-gmail.png', '/images/archive/milestones/2004-gmail.png', 'static', '2004-gmail.png', 'image/png', 30768, '2004년 Gmail 대표 이미지', 'Gmail contributors', 'https://en.wikipedia.org/wiki/Gmail', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-gmail', 'media-086ef4ad18ea', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a271de689e57', 'milestone-2004-gmail', 1, '{"name":"Gmail","summary":"Google가 2004년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Gmail: Google가 2004년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Gmail"},"image":{"src":"/images/archive/milestones/2004-gmail.png","alt":"2004년 Gmail 대표 이미지","credit":"Gmail contributors","sourceUrl":"https://en.wikipedia.org/wiki/Gmail","license":"Wikimedia source","matchedTitle":"Gmail"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-flickr', 'service', 'flickr', 'Flickr', '새롭게 시작된 서비스', 'Ludicorp가 2004년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Flickr: Ludicorp가 2004년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2004, NULL, 'brand-28b3d10ccc21', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Ludicorp","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-flickr', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-flickr', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-flickr', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-flickr', 'tag-28b3d10ccc21');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-857a573dff78', 'milestone-2004-flickr', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Flickr', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-3ae249d31666', '/images/archive/milestones/2004-flickr.png', '/images/archive/milestones/2004-flickr.png', 'static', '2004-flickr.png', 'image/png', 244152, '2004년 Flickr 대표 이미지', 'Flickr contributors', 'https://en.wikipedia.org/wiki/Flickr', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-flickr', 'media-3ae249d31666', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-857a573dff78', 'milestone-2004-flickr', 1, '{"name":"Flickr","summary":"Ludicorp가 2004년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Flickr: Ludicorp가 2004년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Flickr"},"image":{"src":"/images/archive/milestones/2004-flickr.png","alt":"2004년 Flickr 대표 이미지","credit":"Flickr contributors","sourceUrl":"https://en.wikipedia.org/wiki/Flickr","license":"Wikimedia source","matchedTitle":"Flickr"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-mozilla-firefox', 'program', 'mozilla-firefox', 'Mozilla Firefox', '새로운 디지털 도구', 'Mozilla가 2004년에 선보인 웹 브라우저로, 당시 디지털 경험의 변화를 보여줍니다.', 'Mozilla Firefox: Mozilla가 2004년에 공개한 웹 브라우저입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2004, NULL, 'brand-d83016dd56e9', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Mozilla","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-mozilla-firefox', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-mozilla-firefox', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-mozilla-firefox', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-mozilla-firefox', 'tag-d83016dd56e9');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f9f8367fff06', 'milestone-2004-mozilla-firefox', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Mozilla%20Firefox', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f1b013c21cba', '/images/archive/milestones/2004-mozilla-firefox.png', '/images/archive/milestones/2004-mozilla-firefox.png', 'static', '2004-mozilla-firefox.png', 'image/png', 269520, '2004년 Mozilla Firefox 대표 이미지', 'Firefox contributors', 'https://en.wikipedia.org/wiki/Firefox', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-mozilla-firefox', 'media-f1b013c21cba', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f9f8367fff06', 'milestone-2004-mozilla-firefox', 1, '{"name":"Mozilla Firefox","summary":"Mozilla가 2004년에 선보인 웹 브라우저로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Mozilla Firefox: Mozilla가 2004년에 공개한 웹 브라우저입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Mozilla%20Firefox"},"image":{"src":"/images/archive/milestones/2004-mozilla-firefox.png","alt":"2004년 Mozilla Firefox 대표 이미지","credit":"Firefox contributors","sourceUrl":"https://en.wikipedia.org/wiki/Firefox","license":"Wikimedia source","matchedTitle":"Firefox"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-playstation-portable', 'product', 'playstation-portable', 'PlayStation Portable', '시대를 바꾼 신제품', 'Sony가 2004년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation Portable: Sony가 2004년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2004, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-playstation-portable', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-playstation-portable', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-playstation-portable', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-playstation-portable', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-894946ee53cd', 'milestone-2004-playstation-portable', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20Portable', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-97e412cb5fda', '/images/archive/milestones/2004-playstation-portable.png', '/images/archive/milestones/2004-playstation-portable.png', 'static', '2004-playstation-portable.png', 'image/png', 379961, '2004년 PlayStation Portable 대표 이미지', 'PlayStation Portable contributors', 'https://en.wikipedia.org/wiki/PlayStation_Portable', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-playstation-portable', 'media-97e412cb5fda', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-894946ee53cd', 'milestone-2004-playstation-portable', 1, '{"name":"PlayStation Portable","summary":"Sony가 2004년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation Portable: Sony가 2004년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20Portable"},"image":{"src":"/images/archive/milestones/2004-playstation-portable.png","alt":"2004년 PlayStation Portable 대표 이미지","credit":"PlayStation Portable contributors","sourceUrl":"https://en.wikipedia.org/wiki/PlayStation_Portable","license":"Wikimedia source","matchedTitle":"PlayStation Portable"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-nintendo-ds', 'product', 'nintendo-ds', 'Nintendo DS', '시대를 바꾼 신제품', 'Nintendo가 2004년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nintendo DS: Nintendo가 2004년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2004, NULL, 'brand-0cac146e40c7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Nintendo","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-nintendo-ds', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-nintendo-ds', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-nintendo-ds', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-nintendo-ds', 'tag-0cac146e40c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-62094502e9d4', 'milestone-2004-nintendo-ds', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20DS', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c4f0788a0ab9', '/images/archive/milestones/2004-nintendo-ds.png', '/images/archive/milestones/2004-nintendo-ds.png', 'static', '2004-nintendo-ds.png', 'image/png', 848684, '2004년 Nintendo DS 대표 이미지', 'Nintendo DS contributors', 'https://en.wikipedia.org/wiki/Nintendo_DS', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-nintendo-ds', 'media-c4f0788a0ab9', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-62094502e9d4', 'milestone-2004-nintendo-ds', 1, '{"name":"Nintendo DS","summary":"Nintendo가 2004년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nintendo DS: Nintendo가 2004년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20DS"},"image":{"src":"/images/archive/milestones/2004-nintendo-ds.png","alt":"2004년 Nintendo DS 대표 이미지","credit":"Nintendo DS contributors","sourceUrl":"https://en.wikipedia.org/wiki/Nintendo_DS","license":"Wikimedia source","matchedTitle":"Nintendo DS"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-ubuntu', 'program', 'ubuntu', 'Ubuntu', '새로운 디지털 도구', 'Canonical가 2004년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Ubuntu: Canonical가 2004년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2004, NULL, 'brand-52e10d5a13da', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Canonical","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-ubuntu', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-ubuntu', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-ubuntu', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-ubuntu', 'tag-52e10d5a13da');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ff6766453a99', 'milestone-2004-ubuntu', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Ubuntu', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-07f4defe0412', '/images/archive/milestones/2004-ubuntu.png', '/images/archive/milestones/2004-ubuntu.png', 'static', '2004-ubuntu.png', 'image/png', 19468, '2004년 Ubuntu 대표 이미지', 'Ubuntu contributors', 'https://en.wikipedia.org/wiki/Ubuntu', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-ubuntu', 'media-07f4defe0412', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ff6766453a99', 'milestone-2004-ubuntu', 1, '{"name":"Ubuntu","summary":"Canonical가 2004년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Ubuntu: Canonical가 2004년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Ubuntu"},"image":{"src":"/images/archive/milestones/2004-ubuntu.png","alt":"2004년 Ubuntu 대표 이미지","credit":"Ubuntu contributors","sourceUrl":"https://en.wikipedia.org/wiki/Ubuntu","license":"Wikimedia source","matchedTitle":"Ubuntu"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-digg', 'service', 'digg', 'Digg', '새롭게 시작된 서비스', 'Digg가 2004년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Digg: Digg가 2004년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2004, NULL, 'brand-68f235b2bb31', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Digg","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-digg', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-digg', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-digg', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-digg', 'tag-68f235b2bb31');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a3fb9e56fd3a', 'milestone-2004-digg', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Digg', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-625e65c4468b', '/images/archive/milestones/2004-digg-mark.svg', '/images/archive/milestones/2004-digg-mark.svg', 'static', '2004-digg-mark.svg', 'image/svg+xml', 404, 'Digg 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Digg', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-digg', 'media-625e65c4468b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a3fb9e56fd3a', 'milestone-2004-digg', 1, '{"name":"Digg","summary":"Digg가 2004년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Digg: Digg가 2004년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Digg"},"image":{"src":"/images/archive/milestones/2004-digg-mark.svg","alt":"Digg 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Digg","license":"CC0 1.0 · trademark","matchedTitle":"digg brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-world-of-warcraft', 'game', 'world-of-warcraft', 'World of Warcraft', '새롭게 등장한 플레이', 'Blizzard Entertainment가 2004년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'World of Warcraft: Blizzard Entertainment가 2004년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2004, NULL, 'brand-62a1ee25c03b', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Blizzard Entertainment","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-world-of-warcraft', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-99add6be8b0f', 'milestone-2004-world-of-warcraft', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=World%20of%20Warcraft', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-020df2991672', '/images/archive/milestones/2004-world-of-warcraft.png', '/images/archive/milestones/2004-world-of-warcraft.png', 'static', '2004-world-of-warcraft.png', 'image/png', 267121, '2004년 World of Warcraft 대표 이미지', 'World of Warcraft contributors', 'https://en.wikipedia.org/wiki/World_of_Warcraft', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-world-of-warcraft', 'media-020df2991672', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-99add6be8b0f', 'milestone-2004-world-of-warcraft', 1, '{"name":"World of Warcraft","summary":"Blizzard Entertainment가 2004년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"World of Warcraft: Blizzard Entertainment가 2004년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=World%20of%20Warcraft"},"image":{"src":"/images/archive/milestones/2004-world-of-warcraft.png","alt":"2004년 World of Warcraft 대표 이미지","credit":"World of Warcraft contributors","sourceUrl":"https://en.wikipedia.org/wiki/World_of_Warcraft","license":"Wikimedia source","matchedTitle":"World of Warcraft"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-nokia-7610', 'phone', 'nokia-7610', 'Nokia 7610', '그해 출시된 휴대전화', 'Nokia가 2004년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia 7610: Nokia가 2004년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2004, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-nokia-7610', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-nokia-7610', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-nokia-7610', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-nokia-7610', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a40029e32184', 'milestone-2004-nokia-7610', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%207610', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-76faa77e9b65', '/images/archive/milestones/2004-nokia-7610-exact.png', '/images/archive/milestones/2004-nokia-7610-exact.png', 'static', '2004-nokia-7610-exact.png', 'image/png', 673528, 'Nokia 7610 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia_7610.png', 'See Wikimedia Commons file page', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-nokia-7610', 'media-76faa77e9b65', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a40029e32184', 'milestone-2004-nokia-7610', 1, '{"name":"Nokia 7610","summary":"Nokia가 2004년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia 7610: Nokia가 2004년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%207610"},"image":{"src":"/images/archive/milestones/2004-nokia-7610-exact.png","alt":"Nokia 7610 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_7610.png","license":"See Wikimedia Commons file page","matchedTitle":"Nokia 7610"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-canon-eos-1d-mark-ii', 'product', 'canon-eos-1d-mark-ii', 'Canon EOS-1D Mark II', '시대를 바꾼 신제품', 'Canon가 2004년에 선보인 디지털 촬영 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Canon EOS-1D Mark II: Canon가 2004년에 출시한 디지털 촬영 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2004, NULL, 'brand-f2d8526a8109', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2004년 공개·출시","Canon","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-canon-eos-1d-mark-ii', 2004, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-canon-eos-1d-mark-ii', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-canon-eos-1d-mark-ii', 'tag-667e624fb374');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-canon-eos-1d-mark-ii', 'tag-f2d8526a8109');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-98ea68dcb2d9', 'milestone-2004-canon-eos-1d-mark-ii', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Canon%20EOS-1D%20Mark%20II', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5ce424d33f99', '/images/archive/milestones/2004-canon-eos-1d-mark-ii.jpg', '/images/archive/milestones/2004-canon-eos-1d-mark-ii.jpg', 'static', '2004-canon-eos-1d-mark-ii.jpg', 'image/jpeg', 334512, 'Canon EOS-1D Mark II DSLR 카메라 바디', 'District Camera product archive', 'https://www.districtcamera.com/products/used-canon-eos-1d-mark-ii-dslr-camera-body', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-canon-eos-1d-mark-ii', 'media-5ce424d33f99', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-98ea68dcb2d9', 'milestone-2004-canon-eos-1d-mark-ii', 1, '{"name":"Canon EOS-1D Mark II","summary":"Canon가 2004년에 선보인 디지털 촬영 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Canon EOS-1D Mark II: Canon가 2004년에 출시한 디지털 촬영 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Canon%20EOS-1D%20Mark%20II"},"image":{"src":"/images/archive/milestones/2004-canon-eos-1d-mark-ii.jpg","alt":"Canon EOS-1D Mark II DSLR 카메라 바디","credit":"District Camera product archive","sourceUrl":"https://www.districtcamera.com/products/used-canon-eos-1d-mark-ii-dslr-camera-body","license":"See source","matchedTitle":"canon eos-1d mark ii"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-google-maps', 'service', 'google-maps', 'Google Maps', '새롭게 시작된 서비스', 'Google가 2005년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Maps: Google가 2005년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2005, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-google-maps', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-maps', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-maps', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-maps', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9e0a4b5b4768', 'milestone-2005-google-maps', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Maps', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-922165446205', '/images/archive/milestones/2005-google-maps.png', '/images/archive/milestones/2005-google-maps.png', 'static', '2005-google-maps.png', 'image/png', 30839, '2005년 Google Maps 대표 이미지', 'Google Maps contributors', 'https://en.wikipedia.org/wiki/Google_Maps', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-google-maps', 'media-922165446205', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9e0a4b5b4768', 'milestone-2005-google-maps', 1, '{"name":"Google Maps","summary":"Google가 2005년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Maps: Google가 2005년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Maps"},"image":{"src":"/images/archive/milestones/2005-google-maps.png","alt":"2005년 Google Maps 대표 이미지","credit":"Google Maps contributors","sourceUrl":"https://en.wikipedia.org/wiki/Google_Maps","license":"Wikimedia source","matchedTitle":"Google Maps"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-reddit', 'service', 'reddit', 'Reddit', '새롭게 시작된 서비스', 'Reddit가 2005년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Reddit: Reddit가 2005년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2005, NULL, 'brand-4af26436ae9d', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Reddit","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-reddit', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-reddit', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-reddit', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-reddit', 'tag-4af26436ae9d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3fc37e5cf959', 'milestone-2005-reddit', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Reddit', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-3c4ec559b868', '/images/archive/milestones/2005-reddit.png', '/images/archive/milestones/2005-reddit.png', 'static', '2005-reddit.png', 'image/png', 313255, '2005년 Reddit 대표 이미지', 'Reddit contributors', 'https://en.wikipedia.org/wiki/Reddit', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-reddit', 'media-3c4ec559b868', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3fc37e5cf959', 'milestone-2005-reddit', 1, '{"name":"Reddit","summary":"Reddit가 2005년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Reddit: Reddit가 2005년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Reddit"},"image":{"src":"/images/archive/milestones/2005-reddit.png","alt":"2005년 Reddit 대표 이미지","credit":"Reddit contributors","sourceUrl":"https://en.wikipedia.org/wiki/Reddit","license":"Wikimedia source","matchedTitle":"Reddit"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-xbox-360', 'product', 'xbox-360', 'Xbox 360', '시대를 바꾼 신제품', 'Microsoft가 2005년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Xbox 360: Microsoft가 2005년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2005, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-xbox-360', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-xbox-360', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-xbox-360', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-xbox-360', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4acee94182f4', 'milestone-2005-xbox-360', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20360', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d265629dfb03', '/images/archive/milestones/2005-xbox-360-console.jpg', '/images/archive/milestones/2005-xbox-360-console.jpg', 'static', '2005-xbox-360-console.jpg', 'image/jpeg', 32448, '초기형 흰색 Xbox 360 콘솔', 'Amazon product media', 'https://cyttestwp.rec.uba.ar/gbpps/v14084942.html', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-xbox-360', 'media-d265629dfb03', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4acee94182f4', 'milestone-2005-xbox-360', 1, '{"name":"Xbox 360","summary":"Microsoft가 2005년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Xbox 360: Microsoft가 2005년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20360"},"image":{"src":"/images/archive/milestones/2005-xbox-360-console.jpg","alt":"초기형 흰색 Xbox 360 콘솔","credit":"Amazon product media","sourceUrl":"https://cyttestwp.rec.uba.ar/gbpps/v14084942.html","license":"Source-site media terms","matchedTitle":"xbox 360"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-google-talk', 'service', 'google-talk', 'Google Talk', '새롭게 시작된 서비스', 'Google가 2005년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Talk: Google가 2005년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2005, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-google-talk', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-talk', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-talk', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-talk', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e059b70b8ab9', 'milestone-2005-google-talk', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Talk', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2790f1dac46a', '/images/archive/milestones/2005-google-talk.jpg', '/images/archive/milestones/2005-google-talk.jpg', 'static', '2005-google-talk.jpg', 'image/jpeg', 29999, '2005년 Google Talk 대표 이미지', 'Google Talk contributors', 'https://en.wikipedia.org/wiki/Google_Talk', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-google-talk', 'media-2790f1dac46a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e059b70b8ab9', 'milestone-2005-google-talk', 1, '{"name":"Google Talk","summary":"Google가 2005년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Talk: Google가 2005년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Talk"},"image":{"src":"/images/archive/milestones/2005-google-talk.jpg","alt":"2005년 Google Talk 대표 이미지","credit":"Google Talk contributors","sourceUrl":"https://en.wikipedia.org/wiki/Google_Talk","license":"Wikimedia source","matchedTitle":"Google Talk"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-nokia-n70', 'phone', 'nokia-n70', 'Nokia N70', '그해 출시된 휴대전화', 'Nokia가 2005년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia N70: Nokia가 2005년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2005, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-nokia-n70', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-nokia-n70', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-nokia-n70', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-nokia-n70', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b9ef18adca0f', 'milestone-2005-nokia-n70', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N70', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-6b0e24d35ede', '/images/archive/milestones/2005-nokia-n70-exact.jpg', '/images/archive/milestones/2005-nokia-n70-exact.jpg', 'static', '2005-nokia-n70-exact.jpg', 'image/jpeg', 509673, 'Nokia N70 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia_N70_2.jpg', 'See Wikimedia Commons file page', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-nokia-n70', 'media-6b0e24d35ede', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b9ef18adca0f', 'milestone-2005-nokia-n70', 1, '{"name":"Nokia N70","summary":"Nokia가 2005년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia N70: Nokia가 2005년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N70"},"image":{"src":"/images/archive/milestones/2005-nokia-n70-exact.jpg","alt":"Nokia N70 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_N70_2.jpg","license":"See Wikimedia Commons file page","matchedTitle":"Nokia N70"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-blackberry-8700', 'phone', 'blackberry-8700', 'BlackBerry 8700', '그해 출시된 휴대전화', 'Research In Motion가 2005년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'BlackBerry 8700: Research In Motion가 2005년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2005, NULL, 'brand-b16b1db72bde', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Research In Motion","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-blackberry-8700', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-blackberry-8700', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-blackberry-8700', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-blackberry-8700', 'tag-b16b1db72bde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d68be1a7c4ea', 'milestone-2005-blackberry-8700', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%208700', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b944362596c6', '/images/archive/milestones/user-blackberry-reference.jpg', '/images/archive/milestones/user-blackberry-reference.jpg', 'static', 'user-blackberry-reference.jpg', 'image/jpeg', 70667, '사용자가 제공한 BlackBerry 휴대기기 참고 이미지', '사용자 제공 이미지', '/images/archive/milestones/user-blackberry-reference.jpg', '사용자 제공', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-blackberry-8700', 'media-b944362596c6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d68be1a7c4ea', 'milestone-2005-blackberry-8700', 1, '{"name":"BlackBerry 8700","summary":"Research In Motion가 2005년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"BlackBerry 8700: Research In Motion가 2005년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=BlackBerry%208700"},"image":{"src":"/images/archive/milestones/user-blackberry-reference.jpg","alt":"사용자가 제공한 BlackBerry 휴대기기 참고 이미지","credit":"사용자 제공 이미지","sourceUrl":"/images/archive/milestones/user-blackberry-reference.jpg","license":"사용자 제공","matchedTitle":"BlackBerry reference"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-bebo', 'service', 'bebo', 'Bebo', '새롭게 시작된 서비스', 'Bebo가 2005년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Bebo: Bebo가 2005년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2005, NULL, 'brand-db1bab8efefb', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Bebo","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-bebo', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-bebo', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-bebo', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-bebo', 'tag-db1bab8efefb');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2fe58fd463e4', 'milestone-2005-bebo', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Bebo', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1da2ad0b40e4', '/images/archive/milestones/2005-bebo.png', '/images/archive/milestones/2005-bebo.png', 'static', '2005-bebo.png', 'image/png', 5363, '2005년 Bebo 대표 이미지', 'Bebo contributors', 'https://en.wikipedia.org/wiki/Bebo', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-bebo', 'media-1da2ad0b40e4', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2fe58fd463e4', 'milestone-2005-bebo', 1, '{"name":"Bebo","summary":"Bebo가 2005년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Bebo: Bebo가 2005년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Bebo"},"image":{"src":"/images/archive/milestones/2005-bebo.png","alt":"2005년 Bebo 대표 이미지","credit":"Bebo contributors","sourceUrl":"https://en.wikipedia.org/wiki/Bebo","license":"Wikimedia source","matchedTitle":"Bebo"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-etsy', 'service', 'etsy', 'Etsy', '새롭게 시작된 서비스', 'Etsy가 2005년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Etsy: Etsy가 2005년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2005, NULL, 'brand-181d9489c30a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Etsy","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-etsy', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-etsy', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-etsy', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-etsy', 'tag-181d9489c30a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8628a6bf4cb1', 'milestone-2005-etsy', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Etsy', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-07c782b30e39', '/images/archive/milestones/2005-etsy.png', '/images/archive/milestones/2005-etsy.png', 'static', '2005-etsy.png', 'image/png', 28526, '2005년 Etsy 대표 이미지', 'Etsy contributors', 'https://en.wikipedia.org/wiki/Etsy', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-etsy', 'media-07c782b30e39', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8628a6bf4cb1', 'milestone-2005-etsy', 1, '{"name":"Etsy","summary":"Etsy가 2005년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Etsy: Etsy가 2005년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Etsy"},"image":{"src":"/images/archive/milestones/2005-etsy.png","alt":"2005년 Etsy 대표 이미지","credit":"Etsy contributors","sourceUrl":"https://en.wikipedia.org/wiki/Etsy","license":"Wikimedia source","matchedTitle":"Etsy"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-google-analytics', 'service', 'google-analytics', 'Google Analytics', '새롭게 시작된 서비스', 'Google가 2005년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Analytics: Google가 2005년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2005, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-google-analytics', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-analytics', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-analytics', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-google-analytics', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b571b76e5e88', 'milestone-2005-google-analytics', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Analytics', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e694cef97607', '/images/archive/milestones/2005-google-analytics.png', '/images/archive/milestones/2005-google-analytics.png', 'static', '2005-google-analytics.png', 'image/png', 21286, '2005년 Google Analytics 대표 이미지', 'Google Analytics contributors', 'https://en.wikipedia.org/wiki/Google_Analytics', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-google-analytics', 'media-e694cef97607', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b571b76e5e88', 'milestone-2005-google-analytics', 1, '{"name":"Google Analytics","summary":"Google가 2005년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Analytics: Google가 2005년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Analytics"},"image":{"src":"/images/archive/milestones/2005-google-analytics.png","alt":"2005년 Google Analytics 대표 이미지","credit":"Google Analytics contributors","sourceUrl":"https://en.wikipedia.org/wiki/Google_Analytics","license":"Wikimedia source","matchedTitle":"Google Analytics"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2005-mac-mini', 'product', 'mac-mini', 'Mac mini', '시대를 바꾼 신제품', 'Apple가 2005년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Mac mini: Apple가 2005년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2005, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2005년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2005-mac-mini', 2005, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-mac-mini', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-mac-mini', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2005-mac-mini', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-861199619130', 'milestone-2005-mac-mini', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Mac%20mini', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d615b3130e56', '/images/archive/milestones/2005-mac-mini.png', '/images/archive/milestones/2005-mac-mini.png', 'static', '2005-mac-mini.png', 'image/png', 17496, '2005년 Mac mini 대표 이미지', 'Mac Mini contributors', 'https://en.wikipedia.org/wiki/Mac_Mini', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2005-mac-mini', 'media-d615b3130e56', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-861199619130', 'milestone-2005-mac-mini', 1, '{"name":"Mac mini","summary":"Apple가 2005년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Mac mini: Apple가 2005년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Mac%20mini"},"image":{"src":"/images/archive/milestones/2005-mac-mini.png","alt":"2005년 Mac mini 대표 이미지","credit":"Mac Mini contributors","sourceUrl":"https://en.wikipedia.org/wiki/Mac_Mini","license":"Wikimedia source","matchedTitle":"Mac Mini"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-twitter', 'service', 'twitter', 'Twitter', '새롭게 시작된 서비스', 'Twitter가 2006년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Twitter: Twitter가 2006년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2006, NULL, 'brand-5392c950bdde', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Twitter","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-twitter', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-twitter', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-twitter', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-twitter', 'tag-5392c950bdde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9d868b93901c', 'milestone-2006-twitter', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Twitter', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1ef01bd404b6', '/images/archive/milestones/2006-twitter.png', '/images/archive/milestones/2006-twitter.png', 'static', '2006-twitter.png', 'image/png', 5536, '2006년 Twitter 대표 이미지', 'X (social network) contributors', 'https://en.wikipedia.org/wiki/X_(social_network)', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-twitter', 'media-1ef01bd404b6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9d868b93901c', 'milestone-2006-twitter', 1, '{"name":"Twitter","summary":"Twitter가 2006년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Twitter: Twitter가 2006년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Twitter"},"image":{"src":"/images/archive/milestones/2006-twitter.png","alt":"2006년 Twitter 대표 이미지","credit":"X (social network) contributors","sourceUrl":"https://en.wikipedia.org/wiki/X_(social_network)","license":"Wikimedia source","matchedTitle":"X (social network)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-nintendo-wii', 'product', 'nintendo-wii', 'Nintendo Wii', '시대를 바꾼 신제품', 'Nintendo가 2006년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nintendo Wii: Nintendo가 2006년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2006, NULL, 'brand-0cac146e40c7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Nintendo","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-nintendo-wii', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-nintendo-wii', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-nintendo-wii', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-nintendo-wii', 'tag-0cac146e40c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-11ffc18a3b36', 'milestone-2006-nintendo-wii', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20Wii', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-dc6268da1972', '/images/archive/milestones/2006-nintendo-wii-console.jpg', '/images/archive/milestones/2006-nintendo-wii-console.jpg', 'static', '2006-nintendo-wii-console.jpg', 'image/jpeg', 8212, '흰색 Nintendo Wii 콘솔', 'FindThisBest product archive', 'https://www.findthisbest.com/best-wii-consoles', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-nintendo-wii', 'media-dc6268da1972', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-11ffc18a3b36', 'milestone-2006-nintendo-wii', 1, '{"name":"Nintendo Wii","summary":"Nintendo가 2006년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nintendo Wii: Nintendo가 2006년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20Wii"},"image":{"src":"/images/archive/milestones/2006-nintendo-wii-console.jpg","alt":"흰색 Nintendo Wii 콘솔","credit":"FindThisBest product archive","sourceUrl":"https://www.findthisbest.com/best-wii-consoles","license":"Source-site media terms","matchedTitle":"nintendo wii"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-playstation-3', 'product', 'playstation-3', 'PlayStation 3', '시대를 바꾼 신제품', 'Sony가 2006년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation 3: Sony가 2006년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2006, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-playstation-3', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-playstation-3', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-playstation-3', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-playstation-3', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ea0d7cf7189b', 'milestone-2006-playstation-3', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%203', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-16f09a9c1af8', '/images/archive/milestones/2006-playstation-3.png', '/images/archive/milestones/2006-playstation-3.png', 'static', '2006-playstation-3.png', 'image/png', 390869, '2006년 PlayStation 3 대표 이미지', 'PlayStation 3 contributors', 'https://en.wikipedia.org/wiki/PlayStation_3', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-playstation-3', 'media-16f09a9c1af8', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ea0d7cf7189b', 'milestone-2006-playstation-3', 1, '{"name":"PlayStation 3","summary":"Sony가 2006년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation 3: Sony가 2006년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%203"},"image":{"src":"/images/archive/milestones/2006-playstation-3.png","alt":"2006년 PlayStation 3 대표 이미지","credit":"PlayStation 3 contributors","sourceUrl":"https://en.wikipedia.org/wiki/PlayStation_3","license":"Wikimedia source","matchedTitle":"PlayStation 3"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-google-docs', 'service', 'google-docs', 'Google Docs', '새롭게 시작된 서비스', 'Google가 2006년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Docs: Google가 2006년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2006, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-google-docs', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-google-docs', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-google-docs', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-google-docs', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-bfd4f0045bdf', 'milestone-2006-google-docs', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Docs', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-3aafc180c3f9', '/images/archive/milestones/2006-google-docs-mark.svg', '/images/archive/milestones/2006-google-docs-mark.svg', 'static', '2006-google-docs-mark.svg', 'image/svg+xml', 393, 'Google Docs 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Docs', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-google-docs', 'media-3aafc180c3f9', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-bfd4f0045bdf', 'milestone-2006-google-docs', 1, '{"name":"Google Docs","summary":"Google가 2006년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Docs: Google가 2006년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Docs"},"image":{"src":"/images/archive/milestones/2006-google-docs-mark.svg","alt":"Google Docs 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Docs","license":"CC0 1.0 · trademark","matchedTitle":"googledocs brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-roblox', 'service', 'roblox', 'Roblox', '새롭게 시작된 서비스', 'Roblox Corporation가 2006년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Roblox: Roblox Corporation가 2006년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2006, NULL, 'brand-b36783b63a3d', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Roblox Corporation","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-roblox', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-roblox', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-roblox', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-roblox', 'tag-b36783b63a3d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2e78cb615588', 'milestone-2006-roblox', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Roblox', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-192cd91c6e16', '/images/archive/milestones/2006-roblox-mark.svg', '/images/archive/milestones/2006-roblox-mark.svg', 'static', '2006-roblox-mark.svg', 'image/svg+xml', 219, 'Roblox 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Roblox', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-roblox', 'media-192cd91c6e16', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2e78cb615588', 'milestone-2006-roblox', 1, '{"name":"Roblox","summary":"Roblox Corporation가 2006년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Roblox: Roblox Corporation가 2006년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Roblox"},"image":{"src":"/images/archive/milestones/2006-roblox-mark.svg","alt":"Roblox 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Roblox","license":"CC0 1.0 · trademark","matchedTitle":"roblox brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-amazon-s3', 'service', 'amazon-s3', 'Amazon S3', '새롭게 시작된 서비스', 'Amazon Web Services가 2006년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Amazon S3: Amazon Web Services가 2006년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2006, NULL, 'brand-d3e00d24b349', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Amazon Web Services","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-amazon-s3', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-amazon-s3', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-amazon-s3', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-amazon-s3', 'tag-d3e00d24b349');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-dd89aac4450c', 'milestone-2006-amazon-s3', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20S3', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-4f6e42a0271d', '/images/archive/milestones/2006-amazon-s3-commons.png', '/images/archive/milestones/2006-amazon-s3-commons.png', 'static', '2006-amazon-s3-commons.png', 'image/png', 39742, 'Amazon S3 대표 이미지', 'Amazon Web Services LLC', 'https://commons.wikimedia.org/wiki/File:AWS_Simple_Icons_Storage_Amazon_S3.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-amazon-s3', 'media-4f6e42a0271d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-dd89aac4450c', 'milestone-2006-amazon-s3', 1, '{"name":"Amazon S3","summary":"Amazon Web Services가 2006년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Amazon S3: Amazon Web Services가 2006년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20S3"},"image":{"src":"/images/archive/milestones/2006-amazon-s3-commons.png","alt":"Amazon S3 대표 이미지","credit":"Amazon Web Services LLC","sourceUrl":"https://commons.wikimedia.org/wiki/File:AWS_Simple_Icons_Storage_Amazon_S3.svg","license":"Public domain","matchedTitle":"AWS Simple Icons Storage Amazon S3.svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-macbook-pro', 'product', 'macbook-pro', 'MacBook Pro', '시대를 바꾼 신제품', 'Apple가 2006년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'MacBook Pro: Apple가 2006년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2006, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-macbook-pro', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-macbook-pro', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-macbook-pro', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-macbook-pro', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e2b1e13bb5a1', 'milestone-2006-macbook-pro', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Pro', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e499faf46c63', '/images/archive/milestones/2006-macbook-pro.jpg', '/images/archive/milestones/2006-macbook-pro.jpg', 'static', '2006-macbook-pro.jpg', 'image/jpeg', 911958, '2006년 MacBook Pro 대표 이미지', 'MacBook Pro contributors', 'https://en.wikipedia.org/wiki/MacBook_Pro', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-macbook-pro', 'media-e499faf46c63', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e2b1e13bb5a1', 'milestone-2006-macbook-pro', 1, '{"name":"MacBook Pro","summary":"Apple가 2006년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"MacBook Pro: Apple가 2006년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Pro"},"image":{"src":"/images/archive/milestones/2006-macbook-pro.jpg","alt":"2006년 MacBook Pro 대표 이미지","credit":"MacBook Pro contributors","sourceUrl":"https://en.wikipedia.org/wiki/MacBook_Pro","license":"Wikimedia source","matchedTitle":"MacBook Pro"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-nokia-n73', 'phone', 'nokia-n73', 'Nokia N73', '그해 출시된 휴대전화', 'Nokia가 2006년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia N73: Nokia가 2006년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2006, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-nokia-n73', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-nokia-n73', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-nokia-n73', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-nokia-n73', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-89b182925aa8', 'milestone-2006-nokia-n73', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N73', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c70111e7f3a8', '/images/archive/milestones/2006-nokia-n73-exact.jpg', '/images/archive/milestones/2006-nokia-n73-exact.jpg', 'static', '2006-nokia-n73-exact.jpg', 'image/jpeg', 690164, 'Nokia N73 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia-N73.jpg', 'See Wikimedia Commons file page', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-nokia-n73', 'media-c70111e7f3a8', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-89b182925aa8', 'milestone-2006-nokia-n73', 1, '{"name":"Nokia N73","summary":"Nokia가 2006년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia N73: Nokia가 2006년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N73"},"image":{"src":"/images/archive/milestones/2006-nokia-n73-exact.jpg","alt":"Nokia N73 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia-N73.jpg","license":"See Wikimedia Commons file page","matchedTitle":"Nokia N73"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-google-calendar', 'service', 'google-calendar', 'Google Calendar', '새롭게 시작된 서비스', 'Google가 2006년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Calendar: Google가 2006년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2006, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-google-calendar', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-google-calendar', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-google-calendar', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-google-calendar', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-20818dcf4049', 'milestone-2006-google-calendar', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Calendar', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-6787eb1b4636', '/images/archive/milestones/2006-google-calendar-mark.svg', '/images/archive/milestones/2006-google-calendar-mark.svg', 'static', '2006-google-calendar-mark.svg', 'image/svg+xml', 1225, 'Google Calendar 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Calendar', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-google-calendar', 'media-6787eb1b4636', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-20818dcf4049', 'milestone-2006-google-calendar', 1, '{"name":"Google Calendar","summary":"Google가 2006년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Calendar: Google가 2006년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Calendar"},"image":{"src":"/images/archive/milestones/2006-google-calendar-mark.svg","alt":"Google Calendar 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Calendar","license":"CC0 1.0 · trademark","matchedTitle":"googlecalendar brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2006-windows-live-messenger', 'service', 'windows-live-messenger', 'Windows Live Messenger', '새롭게 시작된 서비스', 'Microsoft가 2006년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows Live Messenger: Microsoft가 2006년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2006, NULL, 'brand-11f3242118ff', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2006년 공개·출시","Microsoft","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2006-windows-live-messenger', 2006, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-windows-live-messenger', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-windows-live-messenger', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2006-windows-live-messenger', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-248a497aaee6', 'milestone-2006-windows-live-messenger', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%20Live%20Messenger', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1a9765d0f67a', '/images/archive/milestones/2006-windows-live-messenger.png', '/images/archive/milestones/2006-windows-live-messenger.png', 'static', '2006-windows-live-messenger.png', 'image/png', 69926, '2006년 Windows Live Messenger 대표 이미지', 'MSN Messenger contributors', 'https://en.wikipedia.org/wiki/MSN_Messenger', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2006-windows-live-messenger', 'media-1a9765d0f67a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-248a497aaee6', 'milestone-2006-windows-live-messenger', 1, '{"name":"Windows Live Messenger","summary":"Microsoft가 2006년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows Live Messenger: Microsoft가 2006년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%20Live%20Messenger"},"image":{"src":"/images/archive/milestones/2006-windows-live-messenger.png","alt":"2006년 Windows Live Messenger 대표 이미지","credit":"MSN Messenger contributors","sourceUrl":"https://en.wikipedia.org/wiki/MSN_Messenger","license":"Wikimedia source","matchedTitle":"MSN Messenger"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-iphone', 'phone', 'iphone', 'iPhone', '그해 출시된 휴대전화', 'Apple가 2007년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone: Apple가 2007년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2007, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-iphone', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-iphone', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-iphone', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-iphone', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4dc8527c6691', 'milestone-2007-iphone', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b468784c1af7', '/images/archive/milestones/2007-iphone.png', '/images/archive/milestones/2007-iphone.png', 'static', '2007-iphone.png', 'image/png', 12846, '2007년 iPhone 대표 이미지', 'IPhone contributors', 'https://en.wikipedia.org/wiki/IPhone', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-iphone', 'media-b468784c1af7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4dc8527c6691', 'milestone-2007-iphone', 1, '{"name":"iPhone","summary":"Apple가 2007년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone: Apple가 2007년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone"},"image":{"src":"/images/archive/milestones/2007-iphone.png","alt":"2007년 iPhone 대표 이미지","credit":"IPhone contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone","license":"Wikimedia source","matchedTitle":"IPhone"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-kindle', 'product', 'kindle', 'Kindle', '시대를 바꾼 신제품', 'Amazon가 2007년에 선보인 전자책 단말기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Kindle: Amazon가 2007년에 출시한 전자책 단말기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2007, NULL, 'brand-74c0fda1054b', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Amazon","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-kindle', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-kindle', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-kindle', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-kindle', 'tag-74c0fda1054b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d546d16b18f6', 'milestone-2007-kindle', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Kindle', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e090f72b0085', '/images/archive/milestones/2007-kindle.png', '/images/archive/milestones/2007-kindle.png', 'static', '2007-kindle.png', 'image/png', 47681, '2007년 Kindle 대표 이미지', 'Amazon.com, Inc.', 'https://commons.wikimedia.org/wiki/File:Amazon_Kindle_2024.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-kindle', 'media-e090f72b0085', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d546d16b18f6', 'milestone-2007-kindle', 1, '{"name":"Kindle","summary":"Amazon가 2007년에 선보인 전자책 단말기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Kindle: Amazon가 2007년에 출시한 전자책 단말기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Kindle"},"image":{"src":"/images/archive/milestones/2007-kindle.png","alt":"2007년 Kindle 대표 이미지","credit":"Amazon.com, Inc.","sourceUrl":"https://commons.wikimedia.org/wiki/File:Amazon_Kindle_2024.svg","license":"Public domain","matchedTitle":"Amazon Kindle"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-tumblr', 'service', 'tumblr', 'Tumblr', '새롭게 시작된 서비스', 'Tumblr가 2007년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Tumblr: Tumblr가 2007년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2007, NULL, 'brand-af069f8fc07d', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Tumblr","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-tumblr', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-tumblr', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-tumblr', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-tumblr', 'tag-af069f8fc07d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ec16390e0b2a', 'milestone-2007-tumblr', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Tumblr', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1768cf8bdfc6', '/images/archive/milestones/2007-tumblr-mark.svg', '/images/archive/milestones/2007-tumblr-mark.svg', 'static', '2007-tumblr-mark.svg', 'image/svg+xml', 408, 'Tumblr 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Tumblr', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-tumblr', 'media-1768cf8bdfc6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ec16390e0b2a', 'milestone-2007-tumblr', 1, '{"name":"Tumblr","summary":"Tumblr가 2007년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Tumblr: Tumblr가 2007년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Tumblr"},"image":{"src":"/images/archive/milestones/2007-tumblr-mark.svg","alt":"Tumblr 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Tumblr","license":"CC0 1.0 · trademark","matchedTitle":"tumblr brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-netflix-streaming', 'service', 'netflix-streaming', 'Netflix Streaming', '새롭게 시작된 서비스', 'Netflix가 2007년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Netflix Streaming: Netflix가 2007년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2007, NULL, 'brand-ca024fd6b411', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Netflix","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-netflix-streaming', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-netflix-streaming', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-netflix-streaming', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-netflix-streaming', 'tag-ca024fd6b411');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-cd13ac5b3008', 'milestone-2007-netflix-streaming', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Netflix%20Streaming', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1ab73f042af8', '/images/archive/milestones/2007-netflix-streaming-mark.svg', '/images/archive/milestones/2007-netflix-streaming-mark.svg', 'static', '2007-netflix-streaming-mark.svg', 'image/svg+xml', 291, 'Netflix Streaming 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Netflix%20Streaming', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-netflix-streaming', 'media-1ab73f042af8', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-cd13ac5b3008', 'milestone-2007-netflix-streaming', 1, '{"name":"Netflix Streaming","summary":"Netflix가 2007년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Netflix Streaming: Netflix가 2007년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Netflix%20Streaming"},"image":{"src":"/images/archive/milestones/2007-netflix-streaming-mark.svg","alt":"Netflix Streaming 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Netflix%20Streaming","license":"CC0 1.0 · trademark","matchedTitle":"netflix brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-ustream', 'service', 'ustream', 'Ustream', '새롭게 시작된 서비스', 'Ustream가 2007년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Ustream: Ustream가 2007년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2007, NULL, 'brand-f17ae7fa5dcf', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Ustream","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-ustream', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-ustream', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-ustream', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-ustream', 'tag-f17ae7fa5dcf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0760f287a40c', 'milestone-2007-ustream', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Ustream', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-6423c1c74d01', '/images/archive/milestones/2007-ustream-commons.png', '/images/archive/milestones/2007-ustream-commons.png', 'static', '2007-ustream-commons.png', 'image/png', 1953, 'Ustream 대표 이미지', 'Wikimedia Commons contributors', 'https://commons.wikimedia.org/wiki/File:Ustreamletterlogo.png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-ustream', 'media-6423c1c74d01', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0760f287a40c', 'milestone-2007-ustream', 1, '{"name":"Ustream","summary":"Ustream가 2007년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Ustream: Ustream가 2007년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Ustream"},"image":{"src":"/images/archive/milestones/2007-ustream-commons.png","alt":"Ustream 대표 이미지","credit":"Wikimedia Commons contributors","sourceUrl":"https://commons.wikimedia.org/wiki/File:Ustreamletterlogo.png","license":"Public domain","matchedTitle":"Ustreamletterlogo.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-google-street-view', 'service', 'google-street-view', 'Google Street View', '새롭게 시작된 서비스', 'Google가 2007년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Street View: Google가 2007년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2007, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-google-street-view', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-google-street-view', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-google-street-view', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-google-street-view', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8b54290a1601', 'milestone-2007-google-street-view', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Street%20View', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2b6e3872b881', '/images/archive/milestones/2007-google-street-view.png', '/images/archive/milestones/2007-google-street-view.png', 'static', '2007-google-street-view.png', 'image/png', 84851, '2007년 Google Street View 대표 이미지', 'Google', 'https://commons.wikimedia.org/wiki/File:Google_Street_View_icon.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-google-street-view', 'media-2b6e3872b881', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8b54290a1601', 'milestone-2007-google-street-view', 1, '{"name":"Google Street View","summary":"Google가 2007년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Street View: Google가 2007년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Street%20View"},"image":{"src":"/images/archive/milestones/2007-google-street-view.png","alt":"2007년 Google Street View 대표 이미지","credit":"Google","sourceUrl":"https://commons.wikimedia.org/wiki/File:Google_Street_View_icon.svg","license":"Public domain","matchedTitle":"Google Street View"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-hulu', 'service', 'hulu', 'Hulu', '새롭게 시작된 서비스', 'Hulu가 2007년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Hulu: Hulu가 2007년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2007, NULL, 'brand-3bf0b3699bbd', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Hulu","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-hulu', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-hulu', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-hulu', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-hulu', 'tag-3bf0b3699bbd');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a82e1c606e47', 'milestone-2007-hulu', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Hulu', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-115c61216115', '/images/archive/milestones/2007-hulu-commons.png', '/images/archive/milestones/2007-hulu-commons.png', 'static', '2007-hulu-commons.png', 'image/png', 17373, 'Hulu 대표 이미지', 'NBCUniversal, Fox Entertainment Group, and Disney-ABC Television Group', 'https://commons.wikimedia.org/wiki/File:Hulu_logo_(2007).svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-hulu', 'media-115c61216115', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a82e1c606e47', 'milestone-2007-hulu', 1, '{"name":"Hulu","summary":"Hulu가 2007년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Hulu: Hulu가 2007년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Hulu"},"image":{"src":"/images/archive/milestones/2007-hulu-commons.png","alt":"Hulu 대표 이미지","credit":"NBCUniversal, Fox Entertainment Group, and Disney-ABC Television Group","sourceUrl":"https://commons.wikimedia.org/wiki/File:Hulu_logo_(2007).svg","license":"Public domain","matchedTitle":"Hulu logo (2007).svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-asus-eee-pc', 'product', 'asus-eee-pc', 'ASUS Eee PC', '시대를 바꾼 신제품', 'ASUS가 2007년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'ASUS Eee PC: ASUS가 2007년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2007, NULL, 'brand-45f853acc01a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","ASUS","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-asus-eee-pc', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-asus-eee-pc', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-asus-eee-pc', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-asus-eee-pc', 'tag-45f853acc01a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0e491665ee9f', 'milestone-2007-asus-eee-pc', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=ASUS%20Eee%20PC', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1ef0dde6bc63', '/images/archive/milestones/2007-asus-eee-pc-commons.jpg', '/images/archive/milestones/2007-asus-eee-pc-commons.jpg', 'static', '2007-asus-eee-pc-commons.jpg', 'image/jpeg', 607630, 'ASUS Eee PC 제품 이미지', 'Salim Fadhley', 'https://commons.wikimedia.org/wiki/File:Harvey%27s_Asus_eee_PC.jpg', 'CC BY-SA 2.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-asus-eee-pc', 'media-1ef0dde6bc63', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0e491665ee9f', 'milestone-2007-asus-eee-pc', 1, '{"name":"ASUS Eee PC","summary":"ASUS가 2007년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"ASUS Eee PC: ASUS가 2007년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=ASUS%20Eee%20PC"},"image":{"src":"/images/archive/milestones/2007-asus-eee-pc-commons.jpg","alt":"ASUS Eee PC 제품 이미지","credit":"Salim Fadhley","sourceUrl":"https://commons.wikimedia.org/wiki/File:Harvey%27s_Asus_eee_PC.jpg","license":"CC BY-SA 2.0","matchedTitle":"Harvey''s Asus eee PC.jpg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-nokia-n95', 'phone', 'nokia-n95', 'Nokia N95', '그해 출시된 휴대전화', 'Nokia가 2007년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia N95: Nokia가 2007년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2007, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-nokia-n95', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-nokia-n95', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-nokia-n95', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-nokia-n95', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2900fc9eb0a9', 'milestone-2007-nokia-n95', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N95', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b8efd47a64fe', '/images/archive/milestones/2007-nokia-n95-exact.png', '/images/archive/milestones/2007-nokia-n95-exact.png', 'static', '2007-nokia-n95-exact.png', 'image/png', 1668069, 'Nokia N95 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia_N95.png', 'Wikimedia Commons license', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-nokia-n95', 'media-b8efd47a64fe', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2900fc9eb0a9', 'milestone-2007-nokia-n95', 1, '{"name":"Nokia N95","summary":"Nokia가 2007년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia N95: Nokia가 2007년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20N95"},"image":{"src":"/images/archive/milestones/2007-nokia-n95-exact.png","alt":"Nokia N95 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_N95.png","license":"Wikimedia Commons license","matchedTitle":"Nokia N95"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2007-android', 'program', 'android', 'Android', '새로운 디지털 도구', 'Open Handset Alliance가 2007년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Android: Open Handset Alliance가 2007년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2007, NULL, 'brand-6f1dc81033db', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2007년 공개·출시","Open Handset Alliance","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2007-android', 2007, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-android', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-android', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2007-android', 'tag-6f1dc81033db');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-52349b4d4f97', 'milestone-2007-android', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Android', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-730fa5f7ba25', '/images/archive/milestones/2007-android-mark.svg', '/images/archive/milestones/2007-android-mark.svg', 'static', '2007-android-mark.svg', 'image/svg+xml', 1099, 'Android 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Android', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2007-android', 'media-730fa5f7ba25', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-52349b4d4f97', 'milestone-2007-android', 1, '{"name":"Android","summary":"Open Handset Alliance가 2007년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Android: Open Handset Alliance가 2007년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Android"},"image":{"src":"/images/archive/milestones/2007-android-mark.svg","alt":"Android 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Android","license":"CC0 1.0 · trademark","matchedTitle":"android brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-apple-app-store', 'service', 'apple-app-store', 'Apple App Store', '새롭게 시작된 서비스', 'Apple가 2008년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple App Store: Apple가 2008년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2008, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-apple-app-store', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-apple-app-store', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-apple-app-store', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-apple-app-store', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-cd9f0c4173f3', 'milestone-2008-apple-app-store', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20App%20Store', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e715ef07a90c', '/images/archive/milestones/2008-apple-app-store-mark.svg', '/images/archive/milestones/2008-apple-app-store-mark.svg', 'static', '2008-apple-app-store-mark.svg', 'image/svg+xml', 2017, 'Apple App Store 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Apple%20App%20Store', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-apple-app-store', 'media-e715ef07a90c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-cd9f0c4173f3', 'milestone-2008-apple-app-store', 1, '{"name":"Apple App Store","summary":"Apple가 2008년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple App Store: Apple가 2008년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20App%20Store"},"image":{"src":"/images/archive/milestones/2008-apple-app-store-mark.svg","alt":"Apple App Store 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Apple%20App%20Store","license":"CC0 1.0 · trademark","matchedTitle":"appstore brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-htc-dream', 'phone', 'htc-dream', 'HTC Dream', '그해 출시된 휴대전화', 'HTC가 2008년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'HTC Dream: HTC가 2008년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2008, NULL, 'brand-2f5371407d06', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","HTC","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-htc-dream', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-htc-dream', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-htc-dream', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-htc-dream', 'tag-2f5371407d06');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-7ec74d962fbe', 'milestone-2008-htc-dream', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=HTC%20Dream', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-cd48b1836f18', '/images/archive/milestones/2008-htc-dream.jpg', '/images/archive/milestones/2008-htc-dream.jpg', 'static', '2008-htc-dream.jpg', 'image/jpeg', 987250, '2008년 HTC Dream 대표 이미지', 'HTC Dream contributors', 'https://en.wikipedia.org/wiki/HTC_Dream', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-htc-dream', 'media-cd48b1836f18', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-7ec74d962fbe', 'milestone-2008-htc-dream', 1, '{"name":"HTC Dream","summary":"HTC가 2008년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"HTC Dream: HTC가 2008년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=HTC%20Dream"},"image":{"src":"/images/archive/milestones/2008-htc-dream.jpg","alt":"2008년 HTC Dream 대표 이미지","credit":"HTC Dream contributors","sourceUrl":"https://en.wikipedia.org/wiki/HTC_Dream","license":"Wikimedia source","matchedTitle":"HTC Dream"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-spotify', 'service', 'spotify', 'Spotify', '새롭게 시작된 서비스', 'Spotify가 2008년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Spotify: Spotify가 2008년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2008, NULL, 'brand-2a0cb6b42add', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Spotify","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-spotify', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-spotify', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-spotify', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-spotify', 'tag-2a0cb6b42add');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-024e6fbde05b', 'milestone-2008-spotify', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Spotify', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-eeac733fb3be', '/images/archive/milestones/2008-spotify-mark.svg', '/images/archive/milestones/2008-spotify-mark.svg', 'static', '2008-spotify-mark.svg', 'image/svg+xml', 712, 'Spotify 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Spotify', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-spotify', 'media-eeac733fb3be', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-024e6fbde05b', 'milestone-2008-spotify', 1, '{"name":"Spotify","summary":"Spotify가 2008년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Spotify: Spotify가 2008년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Spotify"},"image":{"src":"/images/archive/milestones/2008-spotify-mark.svg","alt":"Spotify 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Spotify","license":"CC0 1.0 · trademark","matchedTitle":"spotify brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-airbnb', 'service', 'airbnb', 'Airbnb', '새롭게 시작된 서비스', 'Airbnb가 2008년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Airbnb: Airbnb가 2008년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2008, NULL, 'brand-6d785501e2b5', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Airbnb","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-airbnb', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-airbnb', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-airbnb', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-airbnb', 'tag-6d785501e2b5');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-4a4cb3892f39', 'milestone-2008-airbnb', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Airbnb', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c8d2cb046dc3', '/images/archive/milestones/2008-airbnb-mark.svg', '/images/archive/milestones/2008-airbnb-mark.svg', 'static', '2008-airbnb-mark.svg', 'image/svg+xml', 1378, 'Airbnb 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Airbnb', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-airbnb', 'media-c8d2cb046dc3', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-4a4cb3892f39', 'milestone-2008-airbnb', 1, '{"name":"Airbnb","summary":"Airbnb가 2008년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Airbnb: Airbnb가 2008년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Airbnb"},"image":{"src":"/images/archive/milestones/2008-airbnb-mark.svg","alt":"Airbnb 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Airbnb","license":"CC0 1.0 · trademark","matchedTitle":"airbnb brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-google-chrome', 'program', 'google-chrome', 'Google Chrome', '새로운 디지털 도구', 'Google가 2008년에 선보인 웹 브라우저로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Chrome: Google가 2008년에 공개한 웹 브라우저입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2008, NULL, 'brand-2b681c0a24ba', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Google","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-google-chrome', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-google-chrome', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-google-chrome', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-google-chrome', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-51b7f5e31bd7', 'milestone-2008-google-chrome', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Chrome', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0e63d0464078', '/images/archive/milestones/2008-google-chrome-mark.svg', '/images/archive/milestones/2008-google-chrome-mark.svg', 'static', '2008-google-chrome-mark.svg', 'image/svg+xml', 550, 'Google Chrome 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Chrome', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-google-chrome', 'media-0e63d0464078', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-51b7f5e31bd7', 'milestone-2008-google-chrome', 1, '{"name":"Google Chrome","summary":"Google가 2008년에 선보인 웹 브라우저로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Chrome: Google가 2008년에 공개한 웹 브라우저입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Chrome"},"image":{"src":"/images/archive/milestones/2008-google-chrome-mark.svg","alt":"Google Chrome 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Chrome","license":"CC0 1.0 · trademark","matchedTitle":"googlechrome brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-github', 'service', 'github', 'GitHub', '새롭게 시작된 서비스', 'GitHub가 2008년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'GitHub: GitHub가 2008년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2008, NULL, 'brand-5442e2b64fa0', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","GitHub","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-github', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-github', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-github', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-github', 'tag-5442e2b64fa0');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-207da9048094', 'milestone-2008-github', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=GitHub', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1bb414f4871e', '/images/archive/milestones/2008-github-mark.svg', '/images/archive/milestones/2008-github-mark.svg', 'static', '2008-github-mark.svg', 'image/svg+xml', 837, 'GitHub 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=GitHub', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-github', 'media-1bb414f4871e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-207da9048094', 'milestone-2008-github', 1, '{"name":"GitHub","summary":"GitHub가 2008년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"GitHub: GitHub가 2008년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=GitHub"},"image":{"src":"/images/archive/milestones/2008-github-mark.svg","alt":"GitHub 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=GitHub","license":"CC0 1.0 · trademark","matchedTitle":"github brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-hulu-public-launch', 'service', 'hulu-public-launch', 'Hulu Public Launch', '새롭게 시작된 서비스', 'Hulu가 2008년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Hulu Public Launch: Hulu가 2008년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2008, NULL, 'brand-3bf0b3699bbd', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Hulu","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-hulu-public-launch', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-hulu-public-launch', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-hulu-public-launch', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-hulu-public-launch', 'tag-3bf0b3699bbd');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5a1ad53cc800', 'milestone-2008-hulu-public-launch', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Hulu%20Public%20Launch', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5de71720f633', '/images/archive/milestones/2008-hulu-public-launch.png', '/images/archive/milestones/2008-hulu-public-launch.png', 'static', '2008-hulu-public-launch.png', 'image/png', 5129, '2008년 Hulu Public Launch 대표 이미지', 'Hulu contributors', 'https://en.wikipedia.org/wiki/Hulu', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-hulu-public-launch', 'media-5de71720f633', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5a1ad53cc800', 'milestone-2008-hulu-public-launch', 1, '{"name":"Hulu Public Launch","summary":"Hulu가 2008년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Hulu Public Launch: Hulu가 2008년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Hulu%20Public%20Launch"},"image":{"src":"/images/archive/milestones/2008-hulu-public-launch.png","alt":"2008년 Hulu Public Launch 대표 이미지","credit":"Hulu contributors","sourceUrl":"https://en.wikipedia.org/wiki/Hulu","license":"Wikimedia source","matchedTitle":"Hulu"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-macbook-air', 'product', 'macbook-air', 'MacBook Air', '시대를 바꾼 신제품', 'Apple가 2008년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'MacBook Air: Apple가 2008년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2008, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-macbook-air', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-macbook-air', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-macbook-air', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-macbook-air', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2ab20a03bc7a', 'milestone-2008-macbook-air', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-3bd9539de595', '/images/archive/milestones/2008-macbook-air.jpg', '/images/archive/milestones/2008-macbook-air.jpg', 'static', '2008-macbook-air.jpg', 'image/jpeg', 286158, '2008년 MacBook Air 대표 이미지', 'MacBook Air contributors', 'https://en.wikipedia.org/wiki/MacBook_Air', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-macbook-air', 'media-3bd9539de595', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2ab20a03bc7a', 'milestone-2008-macbook-air', 1, '{"name":"MacBook Air","summary":"Apple가 2008년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"MacBook Air: Apple가 2008년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air"},"image":{"src":"/images/archive/milestones/2008-macbook-air.jpg","alt":"2008년 MacBook Air 대표 이미지","credit":"MacBook Air contributors","sourceUrl":"https://en.wikipedia.org/wiki/MacBook_Air","license":"Wikimedia source","matchedTitle":"MacBook Air"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-nokia-5800-xpressmusic', 'phone', 'nokia-5800-xpressmusic', 'Nokia 5800 XpressMusic', '그해 출시된 휴대전화', 'Nokia가 2008년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia 5800 XpressMusic: Nokia가 2008년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2008, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-nokia-5800-xpressmusic', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-nokia-5800-xpressmusic', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-nokia-5800-xpressmusic', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-nokia-5800-xpressmusic', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-86b24a77e0b4', 'milestone-2008-nokia-5800-xpressmusic', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%205800%20XpressMusic', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-567fdf22fcf2', '/images/archive/milestones/2008-nokia-5800-xpressmusic-exact.jpg', '/images/archive/milestones/2008-nokia-5800-xpressmusic-exact.jpg', 'static', '2008-nokia-5800-xpressmusic-exact.jpg', 'image/jpeg', 969708, 'Nokia 5800 XpressMusic 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:(49)_Nokia-5800-xpressmusic.jpg', 'Wikimedia Commons license', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-nokia-5800-xpressmusic', 'media-567fdf22fcf2', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-86b24a77e0b4', 'milestone-2008-nokia-5800-xpressmusic', 1, '{"name":"Nokia 5800 XpressMusic","summary":"Nokia가 2008년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia 5800 XpressMusic: Nokia가 2008년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%205800%20XpressMusic"},"image":{"src":"/images/archive/milestones/2008-nokia-5800-xpressmusic-exact.jpg","alt":"Nokia 5800 XpressMusic 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:(49)_Nokia-5800-xpressmusic.jpg","license":"Wikimedia Commons license","matchedTitle":"Nokia 5800 XpressMusic"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2008-nikon-d90', 'product', 'nikon-d90', 'Nikon D90', '시대를 바꾼 신제품', 'Nikon가 2008년에 선보인 디지털 촬영 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nikon D90: Nikon가 2008년에 출시한 디지털 촬영 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2008, NULL, 'brand-7a43bf56a86c', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2008년 공개·출시","Nikon","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2008-nikon-d90', 2008, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-nikon-d90', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-nikon-d90', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2008-nikon-d90', 'tag-7a43bf56a86c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0a8940093e9f', 'milestone-2008-nikon-d90', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nikon%20D90', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f206c432f913', '/images/archive/milestones/2008-nikon-d90-camera.jpg', '/images/archive/milestones/2008-nikon-d90-camera.jpg', 'static', '2008-nikon-d90-camera.jpg', 'image/jpeg', 12214, 'Nikon D90 DSLR 카메라 바디', 'Newegg product archive', 'https://www.newegg.com/nikon-d90/p/N82E16830113154', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2008-nikon-d90', 'media-f206c432f913', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0a8940093e9f', 'milestone-2008-nikon-d90', 1, '{"name":"Nikon D90","summary":"Nikon가 2008년에 선보인 디지털 촬영 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nikon D90: Nikon가 2008년에 출시한 디지털 촬영 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nikon%20D90"},"image":{"src":"/images/archive/milestones/2008-nikon-d90-camera.jpg","alt":"Nikon D90 DSLR 카메라 바디","credit":"Newegg product archive","sourceUrl":"https://www.newegg.com/nikon-d90/p/N82E16830113154","license":"Source-site media terms","matchedTitle":"nikon d90"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-windows-7', 'program', 'windows-7', 'Windows 7', '새로운 디지털 도구', 'Microsoft가 2009년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows 7: Microsoft가 2009년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2009, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-windows-7', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-windows-7', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-windows-7', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-windows-7', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-7f22388a59f1', 'milestone-2009-windows-7', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%207', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-4799c77cd7af', '/images/archive/milestones/2009-windows-7.png', '/images/archive/milestones/2009-windows-7.png', 'static', '2009-windows-7.png', 'image/png', 258033, '2009년 Windows 7 대표 이미지', 'Windows 7 contributors', 'https://en.wikipedia.org/wiki/Windows_7', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-windows-7', 'media-4799c77cd7af', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-7f22388a59f1', 'milestone-2009-windows-7', 1, '{"name":"Windows 7","summary":"Microsoft가 2009년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows 7: Microsoft가 2009년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%207"},"image":{"src":"/images/archive/milestones/2009-windows-7.png","alt":"2009년 Windows 7 대표 이미지","credit":"Windows 7 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Windows_7","license":"Wikimedia source","matchedTitle":"Windows 7"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-iphone-3gs', 'phone', 'iphone-3gs', 'iPhone 3GS', '그해 출시된 휴대전화', 'Apple가 2009년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 3GS: Apple가 2009년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2009, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-iphone-3gs', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-iphone-3gs', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-iphone-3gs', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-iphone-3gs', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-79ff206a0367', 'milestone-2009-iphone-3gs', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%203GS', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-eb8da5e69a9c', '/images/archive/milestones/2009-iphone-3gs.jpg', '/images/archive/milestones/2009-iphone-3gs.jpg', 'static', '2009-iphone-3gs.jpg', 'image/jpeg', 73030, '2009년 iPhone 3GS 대표 이미지', 'IPhone 3GS contributors', 'https://en.wikipedia.org/wiki/IPhone_3GS', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-iphone-3gs', 'media-eb8da5e69a9c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-79ff206a0367', 'milestone-2009-iphone-3gs', 1, '{"name":"iPhone 3GS","summary":"Apple가 2009년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 3GS: Apple가 2009년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%203GS"},"image":{"src":"/images/archive/milestones/2009-iphone-3gs.jpg","alt":"2009년 iPhone 3GS 대표 이미지","credit":"IPhone 3GS contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone_3GS","license":"Wikimedia source","matchedTitle":"IPhone 3GS"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-whatsapp', 'service', 'whatsapp', 'WhatsApp', '새롭게 시작된 서비스', 'WhatsApp가 2009년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'WhatsApp: WhatsApp가 2009년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2009, NULL, 'brand-b336fc558722', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","WhatsApp","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-whatsapp', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-whatsapp', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-whatsapp', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-whatsapp', 'tag-b336fc558722');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ff6c614230d0', 'milestone-2009-whatsapp', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=WhatsApp', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5062da9d6f0a', '/images/archive/milestones/2009-whatsapp-mark.svg', '/images/archive/milestones/2009-whatsapp-mark.svg', 'static', '2009-whatsapp-mark.svg', 'image/svg+xml', 1231, 'WhatsApp 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=WhatsApp', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-whatsapp', 'media-5062da9d6f0a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ff6c614230d0', 'milestone-2009-whatsapp', 1, '{"name":"WhatsApp","summary":"WhatsApp가 2009년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"WhatsApp: WhatsApp가 2009년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=WhatsApp"},"image":{"src":"/images/archive/milestones/2009-whatsapp-mark.svg","alt":"WhatsApp 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=WhatsApp","license":"CC0 1.0 · trademark","matchedTitle":"whatsapp brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-uber', 'service', 'uber', 'Uber', '새롭게 시작된 서비스', 'Uber가 2009년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Uber: Uber가 2009년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2009, NULL, 'brand-f1905b7e8dd9', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Uber","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-uber', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-uber', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-uber', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-uber', 'tag-f1905b7e8dd9');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e49bd24d3821', 'milestone-2009-uber', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Uber', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-db9500b5c2b3', '/images/archive/milestones/2009-uber-mark.svg', '/images/archive/milestones/2009-uber-mark.svg', 'static', '2009-uber-mark.svg', 'image/svg+xml', 948, 'Uber 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Uber', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-uber', 'media-db9500b5c2b3', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e49bd24d3821', 'milestone-2009-uber', 1, '{"name":"Uber","summary":"Uber가 2009년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Uber: Uber가 2009년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Uber"},"image":{"src":"/images/archive/milestones/2009-uber-mark.svg","alt":"Uber 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Uber","license":"CC0 1.0 · trademark","matchedTitle":"uber brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-kickstarter', 'service', 'kickstarter', 'Kickstarter', '새롭게 시작된 서비스', 'Kickstarter가 2009년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Kickstarter: Kickstarter가 2009년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2009, NULL, 'brand-893e5d1b0f98', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Kickstarter","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-kickstarter', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-kickstarter', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-kickstarter', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-kickstarter', 'tag-893e5d1b0f98');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ab64a27047e5', 'milestone-2009-kickstarter', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Kickstarter', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a965155bf861', '/images/archive/milestones/2009-kickstarter-mark.svg', '/images/archive/milestones/2009-kickstarter-mark.svg', 'static', '2009-kickstarter-mark.svg', 'image/svg+xml', 482, 'Kickstarter 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Kickstarter', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-kickstarter', 'media-a965155bf861', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ab64a27047e5', 'milestone-2009-kickstarter', 1, '{"name":"Kickstarter","summary":"Kickstarter가 2009년에 선보인 온라인 거래·플랫폼 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Kickstarter: Kickstarter가 2009년에 공개한 온라인 거래·플랫폼 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Kickstarter"},"image":{"src":"/images/archive/milestones/2009-kickstarter-mark.svg","alt":"Kickstarter 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Kickstarter","license":"CC0 1.0 · trademark","matchedTitle":"kickstarter brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-bing', 'service', 'bing', 'Bing', '새롭게 시작된 서비스', 'Microsoft가 2009년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Bing: Microsoft가 2009년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2009, NULL, 'brand-11f3242118ff', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Microsoft","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-bing', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-bing', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-bing', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-bing', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2c5715266fd1', 'milestone-2009-bing', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Bing', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f408b2245d08', '/images/archive/milestones/2009-bing-commons.png', '/images/archive/milestones/2009-bing-commons.png', 'static', '2009-bing-commons.png', 'image/png', 25796, 'Bing 대표 이미지', 'Original logo is made by Microsoft . SVG version is created and uploaded by GageSkidmore ( talk · contribs ) of English Wikipedia.', 'https://commons.wikimedia.org/wiki/File:Bing_logo.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-bing', 'media-f408b2245d08', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2c5715266fd1', 'milestone-2009-bing', 1, '{"name":"Bing","summary":"Microsoft가 2009년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Bing: Microsoft가 2009년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Bing"},"image":{"src":"/images/archive/milestones/2009-bing-commons.png","alt":"Bing 대표 이미지","credit":"Original logo is made by Microsoft . SVG version is created and uploaded by GageSkidmore ( talk · contribs ) of English Wikipedia.","sourceUrl":"https://commons.wikimedia.org/wiki/File:Bing_logo.svg","license":"Public domain","matchedTitle":"Bing logo.svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-samsung-omnia-ii', 'phone', 'samsung-omnia-ii', 'Samsung Omnia II', '그해 출시된 휴대전화', 'Samsung가 2009년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Omnia II: Samsung가 2009년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2009, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-samsung-omnia-ii', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-samsung-omnia-ii', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-samsung-omnia-ii', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-samsung-omnia-ii', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ac268865fa04', 'milestone-2009-samsung-omnia-ii', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Omnia%20II', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-9744d1ebf431', '/images/archive/milestones/2009-samsung-omnia-ii.png', '/images/archive/milestones/2009-samsung-omnia-ii.png', 'static', '2009-samsung-omnia-ii.png', 'image/png', 691830, '2009년 Samsung Omnia II 대표 이미지', 'Samsung i8000 Omnia II contributors', 'https://en.wikipedia.org/wiki/Samsung_i8000_Omnia_II', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-samsung-omnia-ii', 'media-9744d1ebf431', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ac268865fa04', 'milestone-2009-samsung-omnia-ii', 1, '{"name":"Samsung Omnia II","summary":"Samsung가 2009년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Omnia II: Samsung가 2009년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Omnia%20II"},"image":{"src":"/images/archive/milestones/2009-samsung-omnia-ii.png","alt":"2009년 Samsung Omnia II 대표 이미지","credit":"Samsung i8000 Omnia II contributors","sourceUrl":"https://en.wikipedia.org/wiki/Samsung_i8000_Omnia_II","license":"Wikimedia source","matchedTitle":"Samsung i8000 Omnia II"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-motorola-droid', 'phone', 'motorola-droid', 'Motorola Droid', '그해 출시된 휴대전화', 'Motorola가 2009년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Motorola Droid: Motorola가 2009년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2009, NULL, 'brand-399f01e13e37', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Motorola","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-motorola-droid', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-motorola-droid', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-motorola-droid', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-motorola-droid', 'tag-399f01e13e37');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-bccdbc4fc3f1', 'milestone-2009-motorola-droid', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Motorola%20Droid', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ae2f42d0e3fc', '/images/archive/milestones/2009-motorola-droid.jpg', '/images/archive/milestones/2009-motorola-droid.jpg', 'static', '2009-motorola-droid.jpg', 'image/jpeg', 185576, 'Motorola Droid의 국제판인 Motorola Milestone', 'Shritwod · Wikimedia Commons · CC BY-SA 3.0', 'https://commons.wikimedia.org/wiki/File:Motorola-milestone-wikipedia.jpg', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-motorola-droid', 'media-ae2f42d0e3fc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-bccdbc4fc3f1', 'milestone-2009-motorola-droid', 1, '{"name":"Motorola Droid","summary":"Motorola가 2009년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Motorola Droid: Motorola가 2009년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Motorola%20Droid"},"image":{"src":"/images/archive/milestones/2009-motorola-droid.jpg","alt":"Motorola Droid의 국제판인 Motorola Milestone","credit":"Shritwod · Wikimedia Commons · CC BY-SA 3.0","sourceUrl":"https://commons.wikimedia.org/wiki/File:Motorola-milestone-wikipedia.jpg","license":"See source","matchedTitle":"motorola droid"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-minecraft-alpha', 'game', 'minecraft-alpha', 'Minecraft Alpha', '새롭게 등장한 플레이', 'Mojang가 2009년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'Minecraft Alpha: Mojang가 2009년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2009, NULL, 'brand-723ba985328e', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Mojang","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-minecraft-alpha', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-minecraft-alpha', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-minecraft-alpha', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-minecraft-alpha', 'tag-723ba985328e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8e5e08c9eba8', 'milestone-2009-minecraft-alpha', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Minecraft%20Alpha', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-44a08df53abb', '/images/archive/milestones/2009-minecraft-alpha-commons.png', '/images/archive/milestones/2009-minecraft-alpha-commons.png', 'static', '2009-minecraft-alpha-commons.png', 'image/png', 20618, 'Minecraft Alpha 대표 이미지', 'NJDaeger', 'https://commons.wikimedia.org/wiki/File:Small_Greenfield_Minecraft_logo_with_background.png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-minecraft-alpha', 'media-44a08df53abb', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8e5e08c9eba8', 'milestone-2009-minecraft-alpha', 1, '{"name":"Minecraft Alpha","summary":"Mojang가 2009년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Minecraft Alpha: Mojang가 2009년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Minecraft%20Alpha"},"image":{"src":"/images/archive/milestones/2009-minecraft-alpha-commons.png","alt":"Minecraft Alpha 대표 이미지","credit":"NJDaeger","sourceUrl":"https://commons.wikimedia.org/wiki/File:Small_Greenfield_Minecraft_logo_with_background.png","license":"CC BY-SA 4.0","matchedTitle":"Small Greenfield Minecraft logo with background.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2009-foursquare', 'service', 'foursquare', 'Foursquare', '새롭게 시작된 서비스', 'Foursquare가 2009년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Foursquare: Foursquare가 2009년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2009, NULL, 'brand-fb75a35db897', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2009년 공개·출시","Foursquare","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2009-foursquare', 2009, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-foursquare', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-foursquare', 'tag-7263d678abae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2009-foursquare', 'tag-fb75a35db897');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a4c812e2ccdc', 'milestone-2009-foursquare', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Foursquare', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-07fe17666cbc', '/images/archive/milestones/2009-foursquare-mark.svg', '/images/archive/milestones/2009-foursquare-mark.svg', 'static', '2009-foursquare-mark.svg', 'image/svg+xml', 1065, 'Foursquare 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Foursquare', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2009-foursquare', 'media-07fe17666cbc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a4c812e2ccdc', 'milestone-2009-foursquare', 1, '{"name":"Foursquare","summary":"Foursquare가 2009년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Foursquare: Foursquare가 2009년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Foursquare"},"image":{"src":"/images/archive/milestones/2009-foursquare-mark.svg","alt":"Foursquare 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Foursquare","license":"CC0 1.0 · trademark","matchedTitle":"foursquare brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-ipad', 'product', 'ipad', 'iPad', '시대를 바꾼 신제품', 'Apple가 2010년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPad: Apple가 2010년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2010, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-ipad', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-ipad', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-ipad', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-ipad', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8e5fbb1574cd', 'milestone-2010-ipad', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPad', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-38da9a6c6df6', '/images/archive/milestones/2010-ipad.png', '/images/archive/milestones/2010-ipad.png', 'static', '2010-ipad.png', 'image/png', 521965, '2010년 iPad 대표 이미지', 'IPad contributors', 'https://en.wikipedia.org/wiki/IPad', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-ipad', 'media-38da9a6c6df6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8e5fbb1574cd', 'milestone-2010-ipad', 1, '{"name":"iPad","summary":"Apple가 2010년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPad: Apple가 2010년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPad"},"image":{"src":"/images/archive/milestones/2010-ipad.png","alt":"2010년 iPad 대표 이미지","credit":"IPad contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPad","license":"Wikimedia source","matchedTitle":"IPad"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-pinterest', 'service', 'pinterest', 'Pinterest', '새롭게 시작된 서비스', 'Pinterest가 2010년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Pinterest: Pinterest가 2010년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2010, NULL, 'brand-a45a7994973a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Pinterest","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-pinterest', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-pinterest', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-pinterest', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-pinterest', 'tag-a45a7994973a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5c6071891a96', 'milestone-2010-pinterest', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Pinterest', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ce87c3e7ea83', '/images/archive/milestones/2010-pinterest-mark.svg', '/images/archive/milestones/2010-pinterest-mark.svg', 'static', '2010-pinterest-mark.svg', 'image/svg+xml', 924, 'Pinterest 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Pinterest', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-pinterest', 'media-ce87c3e7ea83', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5c6071891a96', 'milestone-2010-pinterest', 1, '{"name":"Pinterest","summary":"Pinterest가 2010년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Pinterest: Pinterest가 2010년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Pinterest"},"image":{"src":"/images/archive/milestones/2010-pinterest-mark.svg","alt":"Pinterest 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Pinterest","license":"CC0 1.0 · trademark","matchedTitle":"pinterest brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-windows-phone-7', 'program', 'windows-phone-7', 'Windows Phone 7', '새로운 디지털 도구', 'Microsoft가 2010년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows Phone 7: Microsoft가 2010년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2010, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-windows-phone-7', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-windows-phone-7', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-windows-phone-7', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-windows-phone-7', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e68fa75e3922', 'milestone-2010-windows-phone-7', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%20Phone%207', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-fd0df1238f23', '/images/archive/milestones/2010-windows-phone-7-commons.png', '/images/archive/milestones/2010-windows-phone-7-commons.png', 'static', '2010-windows-phone-7-commons.png', 'image/png', 5013, 'Windows Phone 7 대표 이미지', 'Original work: Microsoft Corporation This SVG version: JCRules from English Wikipedia', 'https://commons.wikimedia.org/wiki/File:Windows_Phone_7_logo_and_wordmark.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-windows-phone-7', 'media-fd0df1238f23', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e68fa75e3922', 'milestone-2010-windows-phone-7', 1, '{"name":"Windows Phone 7","summary":"Microsoft가 2010년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows Phone 7: Microsoft가 2010년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%20Phone%207"},"image":{"src":"/images/archive/milestones/2010-windows-phone-7-commons.png","alt":"Windows Phone 7 대표 이미지","credit":"Original work: Microsoft Corporation This SVG version: JCRules from English Wikipedia","sourceUrl":"https://commons.wikimedia.org/wiki/File:Windows_Phone_7_logo_and_wordmark.svg","license":"Public domain","matchedTitle":"Windows Phone 7 logo and wordmark.svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-kinect', 'product', 'kinect', 'Kinect', '시대를 바꾼 신제품', 'Microsoft가 2010년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Kinect: Microsoft가 2010년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2010, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-kinect', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-kinect', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-kinect', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-kinect', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0b438a1880f9', 'milestone-2010-kinect', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Kinect', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d280fd6aa71c', '/images/archive/milestones/2010-kinect-sensor.jpg', '/images/archive/milestones/2010-kinect-sensor.jpg', 'static', '2010-kinect-sensor.jpg', 'image/jpeg', 4938, 'Xbox 360용 Microsoft Kinect 모션 센서', 'El Español product archive', 'https://www.elespanol.com/omicrono/hardware/20200717/adios-kinect-xbox-microsoft-entierra-iconico-movimiento/505949837_0.html', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-kinect', 'media-d280fd6aa71c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0b438a1880f9', 'milestone-2010-kinect', 1, '{"name":"Kinect","summary":"Microsoft가 2010년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Kinect: Microsoft가 2010년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Kinect"},"image":{"src":"/images/archive/milestones/2010-kinect-sensor.jpg","alt":"Xbox 360용 Microsoft Kinect 모션 센서","credit":"El Español product archive","sourceUrl":"https://www.elespanol.com/omicrono/hardware/20200717/adios-kinect-xbox-microsoft-entierra-iconico-movimiento/505949837_0.html","license":"Source-site media terms","matchedTitle":"kinect"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-flipboard', 'service', 'flipboard', 'Flipboard', '새롭게 시작된 서비스', 'Flipboard가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Flipboard: Flipboard가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2010, NULL, 'brand-3b713b2bde03', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Flipboard","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-flipboard', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-flipboard', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-flipboard', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-flipboard', 'tag-3b713b2bde03');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-c30227be0b87', 'milestone-2010-flipboard', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Flipboard', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e1bbca6142eb', '/images/archive/milestones/2010-flipboard-mark.svg', '/images/archive/milestones/2010-flipboard-mark.svg', 'static', '2010-flipboard-mark.svg', 'image/svg+xml', 187, 'Flipboard 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Flipboard', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-flipboard', 'media-e1bbca6142eb', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-c30227be0b87', 'milestone-2010-flipboard', 1, '{"name":"Flipboard","summary":"Flipboard가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Flipboard: Flipboard가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Flipboard"},"image":{"src":"/images/archive/milestones/2010-flipboard-mark.svg","alt":"Flipboard 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Flipboard","license":"CC0 1.0 · trademark","matchedTitle":"flipboard brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-google-tv', 'service', 'google-tv', 'Google TV', '새롭게 시작된 서비스', 'Google가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google TV: Google가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2010, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-google-tv', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-google-tv', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-google-tv', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-google-tv', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-39f731c70e52', 'milestone-2010-google-tv', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20TV', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-cef7b7b9d119', '/images/archive/milestones/2010-google-tv-mark.svg', '/images/archive/milestones/2010-google-tv-mark.svg', 'static', '2010-google-tv-mark.svg', 'image/svg+xml', 583, 'Google TV 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20TV', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-google-tv', 'media-cef7b7b9d119', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-39f731c70e52', 'milestone-2010-google-tv', 1, '{"name":"Google TV","summary":"Google가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google TV: Google가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20TV"},"image":{"src":"/images/archive/milestones/2010-google-tv-mark.svg","alt":"Google TV 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20TV","license":"CC0 1.0 · trademark","matchedTitle":"googletv brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-macbook-air-2010', 'product', 'macbook-air-2010', 'MacBook Air 2010', '시대를 바꾼 신제품', 'Apple가 2010년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'MacBook Air 2010: Apple가 2010년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2010, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-macbook-air-2010', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-macbook-air-2010', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-macbook-air-2010', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-macbook-air-2010', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-08f7b71c41d0', 'milestone-2010-macbook-air-2010', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air%202010', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-fa390eb59593', '/images/archive/milestones/2010-macbook-air-product.jpg', '/images/archive/milestones/2010-macbook-air-product.jpg', 'static', '2010-macbook-air-product.jpg', 'image/jpeg', 67888, '2010년형 13인치 Apple MacBook Air', 'Maujual product archive', 'https://www.maujual.com/macbook/jual-apple-macbook-air-13-inch-2010', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-macbook-air-2010', 'media-fa390eb59593', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-08f7b71c41d0', 'milestone-2010-macbook-air-2010', 1, '{"name":"MacBook Air 2010","summary":"Apple가 2010년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"MacBook Air 2010: Apple가 2010년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air%202010"},"image":{"src":"/images/archive/milestones/2010-macbook-air-product.jpg","alt":"2010년형 13인치 Apple MacBook Air","credit":"Maujual product archive","sourceUrl":"https://www.maujual.com/macbook/jual-apple-macbook-air-13-inch-2010","license":"Source-site media terms","matchedTitle":"macbook air 2010"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-facetime', 'service', 'facetime', 'FaceTime', '새롭게 시작된 서비스', 'Apple가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'FaceTime: Apple가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2010, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-facetime', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-facetime', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-facetime', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-facetime', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-07b1dcdb4c1a', 'milestone-2010-facetime', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=FaceTime', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-41a7a371593f', '/images/archive/milestones/2010-facetime-mark.svg', '/images/archive/milestones/2010-facetime-mark.svg', 'static', '2010-facetime-mark.svg', 'image/svg+xml', 665, 'FaceTime 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=FaceTime', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-facetime', 'media-41a7a371593f', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-07b1dcdb4c1a', 'milestone-2010-facetime', 1, '{"name":"FaceTime","summary":"Apple가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"FaceTime: Apple가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=FaceTime"},"image":{"src":"/images/archive/milestones/2010-facetime-mark.svg","alt":"FaceTime 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=FaceTime","license":"CC0 1.0 · trademark","matchedTitle":"apple brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-viber', 'service', 'viber', 'Viber', '새롭게 시작된 서비스', 'Viber Media가 2010년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Viber: Viber Media가 2010년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2010, NULL, 'brand-82915d30229c', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Viber Media","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-viber', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-viber', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-viber', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-viber', 'tag-82915d30229c');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5d537af0df6c', 'milestone-2010-viber', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Viber', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-724986ae2a8a', '/images/archive/milestones/2010-viber-mark.svg', '/images/archive/milestones/2010-viber-mark.svg', 'static', '2010-viber-mark.svg', 'image/svg+xml', 2328, 'Viber 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Viber', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-viber', 'media-724986ae2a8a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5d537af0df6c', 'milestone-2010-viber', 1, '{"name":"Viber","summary":"Viber Media가 2010년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Viber: Viber Media가 2010년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Viber"},"image":{"src":"/images/archive/milestones/2010-viber-mark.svg","alt":"Viber 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Viber","license":"CC0 1.0 · trademark","matchedTitle":"viber brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2010-path', 'service', 'path', 'Path', '새롭게 시작된 서비스', 'Path가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Path: Path가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2010, NULL, 'brand-519e39132bb9', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2010년 공개·출시","Path","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2010-path', 2010, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-path', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-path', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2010-path', 'tag-519e39132bb9');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8ec96584f689', 'milestone-2010-path', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Path', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8bcf8e641cd3', '/images/archive/milestones/2010-path-logo.png', '/images/archive/milestones/2010-path-logo.png', 'static', '2010-path-logo.png', 'image/png', 32985, 'Path 소셜 네트워크 앱 로고', 'Brandlogos.net', 'https://brandlogos.net/path-30668.html', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2010-path', 'media-8bcf8e641cd3', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8ec96584f689', 'milestone-2010-path', 1, '{"name":"Path","summary":"Path가 2010년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Path: Path가 2010년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Path"},"image":{"src":"/images/archive/milestones/2010-path-logo.png","alt":"Path 소셜 네트워크 앱 로고","credit":"Brandlogos.net","sourceUrl":"https://brandlogos.net/path-30668.html","license":"See source","matchedTitle":"path"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-samsung-galaxy-s-ii', 'phone', 'samsung-galaxy-s-ii', 'Samsung Galaxy S II', '그해 출시된 휴대전화', 'Samsung가 2011년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy S II: Samsung가 2011년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2011, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-samsung-galaxy-s-ii', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-samsung-galaxy-s-ii', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-samsung-galaxy-s-ii', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-samsung-galaxy-s-ii', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ae81dec97448', 'milestone-2011-samsung-galaxy-s-ii', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S%20II', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8c826cbb1820', '/images/archive/milestones/2011-samsung-galaxy-s-ii.png', '/images/archive/milestones/2011-samsung-galaxy-s-ii.png', 'static', '2011-samsung-galaxy-s-ii.png', 'image/png', 51176, '2011년 Samsung Galaxy S II 대표 이미지', 'Samsung Galaxy S II contributors', 'https://en.wikipedia.org/wiki/Samsung_Galaxy_S_II', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-samsung-galaxy-s-ii', 'media-8c826cbb1820', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ae81dec97448', 'milestone-2011-samsung-galaxy-s-ii', 1, '{"name":"Samsung Galaxy S II","summary":"Samsung가 2011년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy S II: Samsung가 2011년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S%20II"},"image":{"src":"/images/archive/milestones/2011-samsung-galaxy-s-ii.png","alt":"2011년 Samsung Galaxy S II 대표 이미지","credit":"Samsung Galaxy S II contributors","sourceUrl":"https://en.wikipedia.org/wiki/Samsung_Galaxy_S_II","license":"Wikimedia source","matchedTitle":"Samsung Galaxy S II"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-iphone-4s', 'phone', 'iphone-4s', 'iPhone 4S', '그해 출시된 휴대전화', 'Apple가 2011년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 4S: Apple가 2011년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2011, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-iphone-4s', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-iphone-4s', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-iphone-4s', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-iphone-4s', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-173031400425', 'milestone-2011-iphone-4s', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%204S', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-438043629bc1', '/images/archive/milestones/2011-iphone-4s.png', '/images/archive/milestones/2011-iphone-4s.png', 'static', '2011-iphone-4s.png', 'image/png', 757105, '2011년 iPhone 4S 대표 이미지', 'IPhone 4s contributors', 'https://en.wikipedia.org/wiki/IPhone_4s', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-iphone-4s', 'media-438043629bc1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-173031400425', 'milestone-2011-iphone-4s', 1, '{"name":"iPhone 4S","summary":"Apple가 2011년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 4S: Apple가 2011년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%204S"},"image":{"src":"/images/archive/milestones/2011-iphone-4s.png","alt":"2011년 iPhone 4S 대표 이미지","credit":"IPhone 4s contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone_4s","license":"Wikimedia source","matchedTitle":"IPhone 4s"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-siri', 'service', 'siri', 'Siri', '새롭게 시작된 서비스', 'Apple가 2011년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Siri: Apple가 2011년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2011, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-siri', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-siri', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-siri', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-siri', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-73277681e982', 'milestone-2011-siri', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Siri', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-dd1f34d4d9b9', '/images/archive/milestones/2011-siri.png', '/images/archive/milestones/2011-siri.png', 'static', '2011-siri.png', 'image/png', 17309, '2011년 Siri 대표 이미지', 'Siri contributors', 'https://en.wikipedia.org/wiki/Siri', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-siri', 'media-dd1f34d4d9b9', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-73277681e982', 'milestone-2011-siri', 1, '{"name":"Siri","summary":"Apple가 2011년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Siri: Apple가 2011년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Siri"},"image":{"src":"/images/archive/milestones/2011-siri.png","alt":"2011년 Siri 대표 이미지","credit":"Siri contributors","sourceUrl":"https://en.wikipedia.org/wiki/Siri","license":"Wikimedia source","matchedTitle":"Siri"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-snapchat', 'service', 'snapchat', 'Snapchat', '새롭게 시작된 서비스', 'Snap Inc.가 2011년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Snapchat: Snap Inc.가 2011년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2011, NULL, 'brand-9ecb0ed7d23e', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Snap Inc.","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-snapchat', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-snapchat', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-snapchat', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-snapchat', 'tag-9ecb0ed7d23e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-37d1477a852a', 'milestone-2011-snapchat', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Snapchat', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ca08aa59059c', '/images/archive/milestones/2011-snapchat-mark.svg', '/images/archive/milestones/2011-snapchat-mark.svg', 'static', '2011-snapchat-mark.svg', 'image/svg+xml', 1493, 'Snapchat 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Snapchat', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-snapchat', 'media-ca08aa59059c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-37d1477a852a', 'milestone-2011-snapchat', 1, '{"name":"Snapchat","summary":"Snap Inc.가 2011년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Snapchat: Snap Inc.가 2011년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Snapchat"},"image":{"src":"/images/archive/milestones/2011-snapchat-mark.svg","alt":"Snapchat 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Snapchat","license":"CC0 1.0 · trademark","matchedTitle":"snapchat brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-twitch', 'service', 'twitch', 'Twitch', '새롭게 시작된 서비스', 'Twitch Interactive가 2011년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Twitch: Twitch Interactive가 2011년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2011, NULL, 'brand-e43cc2d6a3d2', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Twitch Interactive","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-twitch', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-twitch', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-twitch', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-twitch', 'tag-e43cc2d6a3d2');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-321dcabe94fc', 'milestone-2011-twitch', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Twitch', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a8e613d4e476', '/images/archive/milestones/2011-twitch.png', '/images/archive/milestones/2011-twitch.png', 'static', '2011-twitch.png', 'image/png', 8691, '2011년 Twitch 대표 이미지', 'Twitch Interactive', 'https://commons.wikimedia.org/wiki/File:Twitch_logo_2019.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-twitch', 'media-a8e613d4e476', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-321dcabe94fc', 'milestone-2011-twitch', 1, '{"name":"Twitch","summary":"Twitch Interactive가 2011년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Twitch: Twitch Interactive가 2011년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Twitch"},"image":{"src":"/images/archive/milestones/2011-twitch.png","alt":"2011년 Twitch 대표 이미지","credit":"Twitch Interactive","sourceUrl":"https://commons.wikimedia.org/wiki/File:Twitch_logo_2019.svg","license":"Public domain","matchedTitle":"Twitch (service)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-google', 'service', 'google', 'Google+', '새롭게 시작된 서비스', 'Google가 2011년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google+: Google가 2011년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2011, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-google', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-google', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-google', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-google', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ea3fac95953c', 'milestone-2011-google', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%2B', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-072e87d8345c', '/images/archive/milestones/2011-google-mark.svg', '/images/archive/milestones/2011-google-mark.svg', 'static', '2011-google-mark.svg', 'image/svg+xml', 472, 'Google+ 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%2B', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-google', 'media-072e87d8345c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ea3fac95953c', 'milestone-2011-google', 1, '{"name":"Google+","summary":"Google가 2011년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google+: Google가 2011년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%2B"},"image":{"src":"/images/archive/milestones/2011-google-mark.svg","alt":"Google+ 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%2B","license":"CC0 1.0 · trademark","matchedTitle":"google brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-chromebook', 'product', 'chromebook', 'Chromebook', '시대를 바꾼 신제품', 'Google가 2011년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'Chromebook: Google가 2011년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2011, NULL, 'brand-2b681c0a24ba', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Google","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-chromebook', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-chromebook', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-chromebook', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-chromebook', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-1c3bb70d1c86', 'milestone-2011-chromebook', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Chromebook', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-4ffe5578147d', '/images/archive/milestones/2011-chromebook-commons.jpg', '/images/archive/milestones/2011-chromebook-commons.jpg', 'static', '2011-chromebook-commons.jpg', 'image/jpeg', 265675, 'Chromebook 제품 이미지', 'Pmsyyz', 'https://commons.wikimedia.org/wiki/File:Chromebook_Pixel_(WiFi)_open.JPG', 'CC BY-SA 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-chromebook', 'media-4ffe5578147d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-1c3bb70d1c86', 'milestone-2011-chromebook', 1, '{"name":"Chromebook","summary":"Google가 2011년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Chromebook: Google가 2011년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Chromebook"},"image":{"src":"/images/archive/milestones/2011-chromebook-commons.jpg","alt":"Chromebook 제품 이미지","credit":"Pmsyyz","sourceUrl":"https://commons.wikimedia.org/wiki/File:Chromebook_Pixel_(WiFi)_open.JPG","license":"CC BY-SA 3.0","matchedTitle":"Chromebook Pixel (WiFi) open.JPG"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-kindle-fire', 'product', 'kindle-fire', 'Kindle Fire', '시대를 바꾼 신제품', 'Amazon가 2011년에 선보인 전자책 단말기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Kindle Fire: Amazon가 2011년에 출시한 전자책 단말기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2011, NULL, 'brand-74c0fda1054b', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Amazon","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-kindle-fire', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-kindle-fire', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-kindle-fire', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-kindle-fire', 'tag-74c0fda1054b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ff8a14910f0e', 'milestone-2011-kindle-fire', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Kindle%20Fire', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-85c4e8da98c4', '/images/archive/milestones/2011-kindle-fire.png', '/images/archive/milestones/2011-kindle-fire.png', 'static', '2011-kindle-fire.png', 'image/png', 33438, '2011년 Kindle Fire 대표 이미지', 'Amazon Fire contributors', 'https://en.wikipedia.org/wiki/Amazon_Fire', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-kindle-fire', 'media-85c4e8da98c4', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ff8a14910f0e', 'milestone-2011-kindle-fire', 1, '{"name":"Kindle Fire","summary":"Amazon가 2011년에 선보인 전자책 단말기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Kindle Fire: Amazon가 2011년에 출시한 전자책 단말기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Kindle%20Fire"},"image":{"src":"/images/archive/milestones/2011-kindle-fire.png","alt":"2011년 Kindle Fire 대표 이미지","credit":"Amazon Fire contributors","sourceUrl":"https://en.wikipedia.org/wiki/Amazon_Fire","license":"Wikimedia source","matchedTitle":"Amazon Fire"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-minecraft-1-0', 'game', 'minecraft-1-0', 'Minecraft 1.0', '새롭게 등장한 플레이', 'Mojang가 2011년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'Minecraft 1.0: Mojang가 2011년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2011, NULL, 'brand-723ba985328e', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Mojang","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-minecraft-1-0', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-minecraft-1-0', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-minecraft-1-0', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-minecraft-1-0', 'tag-723ba985328e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5ae82cea6ac1', 'milestone-2011-minecraft-1-0', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Minecraft%201.0', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f4ce6b7b2862', '/images/archive/milestones/2011-minecraft-1-0-commons.png', '/images/archive/milestones/2011-minecraft-1-0-commons.png', 'static', '2011-minecraft-1-0-commons.png', 'image/png', 20618, 'Minecraft 1.0 대표 이미지', 'NJDaeger', 'https://commons.wikimedia.org/wiki/File:Small_Greenfield_Minecraft_logo_with_background.png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-minecraft-1-0', 'media-f4ce6b7b2862', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5ae82cea6ac1', 'milestone-2011-minecraft-1-0', 1, '{"name":"Minecraft 1.0","summary":"Mojang가 2011년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Minecraft 1.0: Mojang가 2011년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Minecraft%201.0"},"image":{"src":"/images/archive/milestones/2011-minecraft-1-0-commons.png","alt":"Minecraft 1.0 대표 이미지","credit":"NJDaeger","sourceUrl":"https://commons.wikimedia.org/wiki/File:Small_Greenfield_Minecraft_logo_with_background.png","license":"CC BY-SA 4.0","matchedTitle":"Small Greenfield Minecraft logo with background.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2011-playstation-vita', 'product', 'playstation-vita', 'PlayStation Vita', '시대를 바꾼 신제품', 'Sony가 2011년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation Vita: Sony가 2011년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2011, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2011년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2011-playstation-vita', 2011, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-playstation-vita', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-playstation-vita', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2011-playstation-vita', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-38e7c9c323bb', 'milestone-2011-playstation-vita', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20Vita', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-78248d582884', '/images/archive/milestones/2011-playstation-vita-commons.jpg', '/images/archive/milestones/2011-playstation-vita-commons.jpg', 'static', '2011-playstation-vita-commons.jpg', 'image/jpeg', 95777, 'PlayStation Vita 제품 이미지', 'Evan-Amos', 'https://commons.wikimedia.org/wiki/File:PlayStation-Vita-1101-BL.jpg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2011-playstation-vita', 'media-78248d582884', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-38e7c9c323bb', 'milestone-2011-playstation-vita', 1, '{"name":"PlayStation Vita","summary":"Sony가 2011년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation Vita: Sony가 2011년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20Vita"},"image":{"src":"/images/archive/milestones/2011-playstation-vita-commons.jpg","alt":"PlayStation Vita 제품 이미지","credit":"Evan-Amos","sourceUrl":"https://commons.wikimedia.org/wiki/File:PlayStation-Vita-1101-BL.jpg","license":"Public domain","matchedTitle":"PlayStation-Vita-1101-BL.jpg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-iphone-5', 'phone', 'iphone-5', 'iPhone 5', '그해 출시된 휴대전화', 'Apple가 2012년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 5: Apple가 2012년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2012, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-iphone-5', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-iphone-5', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-iphone-5', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-iphone-5', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f971a3f35cfe', 'milestone-2012-iphone-5', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%205', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-be24996a4409', '/images/archive/milestones/2012-iphone-5-commons.png', '/images/archive/milestones/2012-iphone-5-commons.png', 'static', '2012-iphone-5-commons.png', 'image/png', 222294, 'iPhone 5 제품 이미지', 'Zach Vega', 'https://commons.wikimedia.org/wiki/File:IPhone_5.png', 'CC BY-SA 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-iphone-5', 'media-be24996a4409', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f971a3f35cfe', 'milestone-2012-iphone-5', 1, '{"name":"iPhone 5","summary":"Apple가 2012년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 5: Apple가 2012년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%205"},"image":{"src":"/images/archive/milestones/2012-iphone-5-commons.png","alt":"iPhone 5 제품 이미지","credit":"Zach Vega","sourceUrl":"https://commons.wikimedia.org/wiki/File:IPhone_5.png","license":"CC BY-SA 3.0","matchedTitle":"IPhone 5.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-windows-8', 'program', 'windows-8', 'Windows 8', '새로운 디지털 도구', 'Microsoft가 2012년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows 8: Microsoft가 2012년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2012, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-windows-8', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-windows-8', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-windows-8', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-windows-8', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ffee0c1a9fab', 'milestone-2012-windows-8', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%208', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-eaf12f720c81', '/images/archive/milestones/2012-windows-8-commons.png', '/images/archive/milestones/2012-windows-8-commons.png', 'static', '2012-windows-8-commons.png', 'image/png', 31842, 'Windows 8 대표 이미지', 'Microsoft Corporation', 'https://commons.wikimedia.org/wiki/File:Windows_8_logo_and_wordmark.svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-windows-8', 'media-eaf12f720c81', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ffee0c1a9fab', 'milestone-2012-windows-8', 1, '{"name":"Windows 8","summary":"Microsoft가 2012년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows 8: Microsoft가 2012년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%208"},"image":{"src":"/images/archive/milestones/2012-windows-8-commons.png","alt":"Windows 8 대표 이미지","credit":"Microsoft Corporation","sourceUrl":"https://commons.wikimedia.org/wiki/File:Windows_8_logo_and_wordmark.svg","license":"Public domain","matchedTitle":"Windows 8 logo and wordmark.svg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-surface-rt', 'product', 'surface-rt', 'Surface RT', '시대를 바꾼 신제품', 'Microsoft가 2012년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'Surface RT: Microsoft가 2012년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2012, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-surface-rt', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-surface-rt', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-surface-rt', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-surface-rt', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-36a71912db83', 'milestone-2012-surface-rt', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Surface%20RT', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8550071f2039', '/images/archive/milestones/2012-surface-rt.jpg', '/images/archive/milestones/2012-surface-rt.jpg', 'static', '2012-surface-rt.jpg', 'image/jpeg', 10657, 'Microsoft Surface RT 태블릿', 'iFixit', 'https://www.ifixit.com/Device/Microsoft_Surface_RT', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-surface-rt', 'media-8550071f2039', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-36a71912db83', 'milestone-2012-surface-rt', 1, '{"name":"Surface RT","summary":"Microsoft가 2012년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Surface RT: Microsoft가 2012년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Surface%20RT"},"image":{"src":"/images/archive/milestones/2012-surface-rt.jpg","alt":"Microsoft Surface RT 태블릿","credit":"iFixit","sourceUrl":"https://www.ifixit.com/Device/Microsoft_Surface_RT","license":"Source-site media terms","matchedTitle":"surface rt"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-google-drive', 'service', 'google-drive', 'Google Drive', '새롭게 시작된 서비스', 'Google가 2012년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Drive: Google가 2012년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2012, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-google-drive', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-google-drive', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-google-drive', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-google-drive', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5598228ffd4c', 'milestone-2012-google-drive', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Drive', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a937abb632e8', '/images/archive/milestones/2012-google-drive-mark.svg', '/images/archive/milestones/2012-google-drive-mark.svg', 'static', '2012-google-drive-mark.svg', 'image/svg+xml', 614, 'Google Drive 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Drive', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-google-drive', 'media-a937abb632e8', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5598228ffd4c', 'milestone-2012-google-drive', 1, '{"name":"Google Drive","summary":"Google가 2012년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Drive: Google가 2012년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Drive"},"image":{"src":"/images/archive/milestones/2012-google-drive-mark.svg","alt":"Google Drive 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Drive","license":"CC0 1.0 · trademark","matchedTitle":"googledrive brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-tinder', 'service', 'tinder', 'Tinder', '새롭게 시작된 서비스', 'Match Group가 2012년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Tinder: Match Group가 2012년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2012, NULL, 'brand-1481bb38548f', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Match Group","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-tinder', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-tinder', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-tinder', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-tinder', 'tag-1481bb38548f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f40e407844ec', 'milestone-2012-tinder', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Tinder', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e7f4d266c9c0', '/images/archive/milestones/2012-tinder-mark.svg', '/images/archive/milestones/2012-tinder-mark.svg', 'static', '2012-tinder-mark.svg', 'image/svg+xml', 573, 'Tinder 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Tinder', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-tinder', 'media-e7f4d266c9c0', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f40e407844ec', 'milestone-2012-tinder', 1, '{"name":"Tinder","summary":"Match Group가 2012년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Tinder: Match Group가 2012년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Tinder"},"image":{"src":"/images/archive/milestones/2012-tinder-mark.svg","alt":"Tinder 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Tinder","license":"CC0 1.0 · trademark","matchedTitle":"tinder brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-raspberry-pi', 'product', 'raspberry-pi', 'Raspberry Pi', '시대를 바꾼 신제품', 'Raspberry Pi Foundation가 2012년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'Raspberry Pi: Raspberry Pi Foundation가 2012년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2012, NULL, 'brand-5f08937928a3', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Raspberry Pi Foundation","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-raspberry-pi', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-raspberry-pi', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-raspberry-pi', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-raspberry-pi', 'tag-5f08937928a3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-67d684471da9', 'milestone-2012-raspberry-pi', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Raspberry%20Pi', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-75abdacf0375', '/images/archive/milestones/2012-raspberry-pi.png', '/images/archive/milestones/2012-raspberry-pi.png', 'static', '2012-raspberry-pi.png', 'image/png', 32852, '2012년 Raspberry Pi 대표 이미지', 'Raspberry Pi contributors', 'https://en.wikipedia.org/wiki/Raspberry_Pi', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-raspberry-pi', 'media-75abdacf0375', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-67d684471da9', 'milestone-2012-raspberry-pi', 1, '{"name":"Raspberry Pi","summary":"Raspberry Pi Foundation가 2012년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Raspberry Pi: Raspberry Pi Foundation가 2012년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Raspberry%20Pi"},"image":{"src":"/images/archive/milestones/2012-raspberry-pi.png","alt":"2012년 Raspberry Pi 대표 이미지","credit":"Raspberry Pi contributors","sourceUrl":"https://en.wikipedia.org/wiki/Raspberry_Pi","license":"Wikimedia source","matchedTitle":"Raspberry Pi"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-oculus-rift-kickstarter', 'product', 'oculus-rift-kickstarter', 'Oculus Rift Kickstarter', '시대를 바꾼 신제품', 'Oculus VR가 2012년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Oculus Rift Kickstarter: Oculus VR가 2012년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2012, NULL, 'brand-b5d7a11bec4a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Oculus VR","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-oculus-rift-kickstarter', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-oculus-rift-kickstarter', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-oculus-rift-kickstarter', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-oculus-rift-kickstarter', 'tag-b5d7a11bec4a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e3132cf14b83', 'milestone-2012-oculus-rift-kickstarter', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Oculus%20Rift%20Kickstarter', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-5b977533ea32', '/images/archive/milestones/2012-oculus-rift-dk1.webp', '/images/archive/milestones/2012-oculus-rift-dk1.webp', 'static', '2012-oculus-rift-dk1.webp', 'image/webp', 109991, 'Oculus Rift DK1 가상현실 헤드셋', 'Virtualnye Ochki product archive', 'https://virtualnyeochki.ru/shlem-virtualnoy-realnosti/oculus-rift-cena/oculus-rift-dk-1', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-oculus-rift-kickstarter', 'media-5b977533ea32', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e3132cf14b83', 'milestone-2012-oculus-rift-kickstarter', 1, '{"name":"Oculus Rift Kickstarter","summary":"Oculus VR가 2012년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Oculus Rift Kickstarter: Oculus VR가 2012년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Oculus%20Rift%20Kickstarter"},"image":{"src":"/images/archive/milestones/2012-oculus-rift-dk1.webp","alt":"Oculus Rift DK1 가상현실 헤드셋","credit":"Virtualnye Ochki product archive","sourceUrl":"https://virtualnyeochki.ru/shlem-virtualnoy-realnosti/oculus-rift-cena/oculus-rift-dk-1","license":"Source-site media terms","matchedTitle":"oculus rift kickstarter"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-nokia-lumia-920', 'phone', 'nokia-lumia-920', 'Nokia Lumia 920', '그해 출시된 휴대전화', 'Nokia가 2012년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nokia Lumia 920: Nokia가 2012년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2012, NULL, 'brand-ec307432a3d7', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Nokia","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-nokia-lumia-920', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-nokia-lumia-920', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-nokia-lumia-920', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-nokia-lumia-920', 'tag-ec307432a3d7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ece6aa3d3f9a', 'milestone-2012-nokia-lumia-920', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20Lumia%20920', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-9218ca307da0', '/images/archive/milestones/2012-nokia-lumia-920-exact.jpg', '/images/archive/milestones/2012-nokia-lumia-920-exact.jpg', 'static', '2012-nokia-lumia-920-exact.jpg', 'image/jpeg', 519133, 'Nokia Lumia 920 실제 제품 사진', 'Wikimedia Commons contributor', 'https://commons.wikimedia.org/wiki/File:Nokia_Lumia_920.jpg', 'Wikimedia Commons license', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-nokia-lumia-920', 'media-9218ca307da0', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ece6aa3d3f9a', 'milestone-2012-nokia-lumia-920', 1, '{"name":"Nokia Lumia 920","summary":"Nokia가 2012년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nokia Lumia 920: Nokia가 2012년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nokia%20Lumia%20920"},"image":{"src":"/images/archive/milestones/2012-nokia-lumia-920-exact.jpg","alt":"Nokia Lumia 920 실제 제품 사진","credit":"Wikimedia Commons contributor","sourceUrl":"https://commons.wikimedia.org/wiki/File:Nokia_Lumia_920.jpg","license":"Wikimedia Commons license","matchedTitle":"Nokia Lumia 920"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-wii-u', 'product', 'wii-u', 'Wii U', '시대를 바꾼 신제품', 'Nintendo가 2012년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Wii U: Nintendo가 2012년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2012, NULL, 'brand-0cac146e40c7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","Nintendo","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-wii-u', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-wii-u', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-wii-u', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-wii-u', 'tag-0cac146e40c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-18b4347b9b80', 'milestone-2012-wii-u', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Wii%20U', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d199b9119a7c', '/images/archive/milestones/2012-wii-u.png', '/images/archive/milestones/2012-wii-u.png', 'static', '2012-wii-u.png', 'image/png', 973048, '2012년 Wii U 대표 이미지', 'Wii U contributors', 'https://en.wikipedia.org/wiki/Wii_U', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-wii-u', 'media-d199b9119a7c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-18b4347b9b80', 'milestone-2012-wii-u', 1, '{"name":"Wii U","summary":"Nintendo가 2012년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Wii U: Nintendo가 2012년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Wii%20U"},"image":{"src":"/images/archive/milestones/2012-wii-u.png","alt":"2012년 Wii U 대표 이미지","credit":"Wii U contributors","sourceUrl":"https://en.wikipedia.org/wiki/Wii_U","license":"Wikimedia source","matchedTitle":"Wii U"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2012-candy-crush-saga', 'game', 'candy-crush-saga', 'Candy Crush Saga', '새롭게 등장한 플레이', 'King가 2012년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'Candy Crush Saga: King가 2012년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2012, NULL, 'brand-364d37be779d', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2012년 공개·출시","King","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2012-candy-crush-saga', 2012, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-candy-crush-saga', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-candy-crush-saga', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2012-candy-crush-saga', 'tag-364d37be779d');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0bafd49e3be6', 'milestone-2012-candy-crush-saga', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Candy%20Crush%20Saga', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ed6f618fa724', '/images/archive/milestones/2012-candy-crush-saga.png', '/images/archive/milestones/2012-candy-crush-saga.png', 'static', '2012-candy-crush-saga.png', 'image/png', 84775, '2012년 Candy Crush Saga 대표 이미지', 'Candy Crush Saga contributors', 'https://en.wikipedia.org/wiki/Candy_Crush_Saga', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2012-candy-crush-saga', 'media-ed6f618fa724', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0bafd49e3be6', 'milestone-2012-candy-crush-saga', 1, '{"name":"Candy Crush Saga","summary":"King가 2012년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Candy Crush Saga: King가 2012년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Candy%20Crush%20Saga"},"image":{"src":"/images/archive/milestones/2012-candy-crush-saga.png","alt":"2012년 Candy Crush Saga 대표 이미지","credit":"Candy Crush Saga contributors","sourceUrl":"https://en.wikipedia.org/wiki/Candy_Crush_Saga","license":"Wikimedia source","matchedTitle":"Candy Crush Saga"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-playstation-4', 'product', 'playstation-4', 'PlayStation 4', '시대를 바꾼 신제품', 'Sony가 2013년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation 4: Sony가 2013년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2013, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-playstation-4', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-playstation-4', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-playstation-4', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-playstation-4', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-66b2890d0bb2', 'milestone-2013-playstation-4', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%204', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8ba7a247686b', '/images/archive/milestones/2013-playstation-4.jpg', '/images/archive/milestones/2013-playstation-4.jpg', 'static', '2013-playstation-4.jpg', 'image/jpeg', 125429, '2013년 PlayStation 4 대표 이미지', 'PlayStation 4 contributors', 'https://en.wikipedia.org/wiki/PlayStation_4', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-playstation-4', 'media-8ba7a247686b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-66b2890d0bb2', 'milestone-2013-playstation-4', 1, '{"name":"PlayStation 4","summary":"Sony가 2013년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation 4: Sony가 2013년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%204"},"image":{"src":"/images/archive/milestones/2013-playstation-4.jpg","alt":"2013년 PlayStation 4 대표 이미지","credit":"PlayStation 4 contributors","sourceUrl":"https://en.wikipedia.org/wiki/PlayStation_4","license":"Wikimedia source","matchedTitle":"PlayStation 4"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-xbox-one', 'product', 'xbox-one', 'Xbox One', '시대를 바꾼 신제품', 'Microsoft가 2013년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Xbox One: Microsoft가 2013년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2013, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-xbox-one', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-xbox-one', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-xbox-one', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-xbox-one', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-c9031c9b30f8', 'milestone-2013-xbox-one', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20One', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f8ada679869d', '/images/archive/milestones/2013-xbox-one.png', '/images/archive/milestones/2013-xbox-one.png', 'static', '2013-xbox-one.png', 'image/png', 471878, '2013년 Xbox One 대표 이미지', 'Xbox One contributors', 'https://en.wikipedia.org/wiki/Xbox_One', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-xbox-one', 'media-f8ada679869d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-c9031c9b30f8', 'milestone-2013-xbox-one', 1, '{"name":"Xbox One","summary":"Microsoft가 2013년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Xbox One: Microsoft가 2013년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20One"},"image":{"src":"/images/archive/milestones/2013-xbox-one.png","alt":"2013년 Xbox One 대표 이미지","credit":"Xbox One contributors","sourceUrl":"https://en.wikipedia.org/wiki/Xbox_One","license":"Wikimedia source","matchedTitle":"Xbox One"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-samsung-galaxy-s4', 'phone', 'samsung-galaxy-s4', 'Samsung Galaxy S4', '그해 출시된 휴대전화', 'Samsung가 2013년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy S4: Samsung가 2013년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2013, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-samsung-galaxy-s4', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-samsung-galaxy-s4', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-samsung-galaxy-s4', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-samsung-galaxy-s4', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-07cc83dac423', 'milestone-2013-samsung-galaxy-s4', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S4', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b3d2260b040d', '/images/archive/milestones/2013-samsung-galaxy-s4.png', '/images/archive/milestones/2013-samsung-galaxy-s4.png', 'static', '2013-samsung-galaxy-s4.png', 'image/png', 6343, '2013년 Samsung Galaxy S4 대표 이미지', 'Samsung Galaxy S4 contributors', 'https://en.wikipedia.org/wiki/Samsung_Galaxy_S4', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-samsung-galaxy-s4', 'media-b3d2260b040d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-07cc83dac423', 'milestone-2013-samsung-galaxy-s4', 1, '{"name":"Samsung Galaxy S4","summary":"Samsung가 2013년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy S4: Samsung가 2013년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S4"},"image":{"src":"/images/archive/milestones/2013-samsung-galaxy-s4.png","alt":"2013년 Samsung Galaxy S4 대표 이미지","credit":"Samsung Galaxy S4 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Samsung_Galaxy_S4","license":"Wikimedia source","matchedTitle":"Samsung Galaxy S4"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-lg-g2', 'phone', 'lg-g2', 'LG G2', '그해 출시된 휴대전화', 'LG가 2013년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'LG G2: LG가 2013년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2013, NULL, 'brand-b4301e4bc1ae', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","LG","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-lg-g2', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-lg-g2', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-lg-g2', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-lg-g2', 'tag-b4301e4bc1ae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ce2fea47146d', 'milestone-2013-lg-g2', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=LG%20G2', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0c7d037126ed', '/images/archive/milestones/2013-lg-g2.jpg', '/images/archive/milestones/2013-lg-g2.jpg', 'static', '2013-lg-g2.jpg', 'image/jpeg', 21988, '2013년 LG G2 대표 이미지', 'LG G2 contributors', 'https://en.wikipedia.org/wiki/LG_G2', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-lg-g2', 'media-0c7d037126ed', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ce2fea47146d', 'milestone-2013-lg-g2', 1, '{"name":"LG G2","summary":"LG가 2013년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"LG G2: LG가 2013년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=LG%20G2"},"image":{"src":"/images/archive/milestones/2013-lg-g2.jpg","alt":"2013년 LG G2 대표 이미지","credit":"LG G2 contributors","sourceUrl":"https://en.wikipedia.org/wiki/LG_G2","license":"Wikimedia source","matchedTitle":"LG G2"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-motorola-moto-x', 'phone', 'motorola-moto-x', 'Motorola Moto X', '그해 출시된 휴대전화', 'Motorola가 2013년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Motorola Moto X: Motorola가 2013년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2013, NULL, 'brand-399f01e13e37', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Motorola","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-motorola-moto-x', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-motorola-moto-x', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-motorola-moto-x', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-motorola-moto-x', 'tag-399f01e13e37');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-458cd1586871', 'milestone-2013-motorola-moto-x', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Motorola%20Moto%20X', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-cf7933b4694b', '/images/archive/milestones/2013-motorola-moto-x.jpg', '/images/archive/milestones/2013-motorola-moto-x.jpg', 'static', '2013-motorola-moto-x.jpg', 'image/jpeg', 608318, '2013년형 Motorola Moto X 1세대', 'Anderson N. Leonardo · Wikimedia Commons · CC BY-SA 2.0', 'https://commons.wikimedia.org/wiki/File:Moto_X_(11236439494).jpg', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-motorola-moto-x', 'media-cf7933b4694b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-458cd1586871', 'milestone-2013-motorola-moto-x', 1, '{"name":"Motorola Moto X","summary":"Motorola가 2013년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Motorola Moto X: Motorola가 2013년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Motorola%20Moto%20X"},"image":{"src":"/images/archive/milestones/2013-motorola-moto-x.jpg","alt":"2013년형 Motorola Moto X 1세대","credit":"Anderson N. Leonardo · Wikimedia Commons · CC BY-SA 2.0","sourceUrl":"https://commons.wikimedia.org/wiki/File:Moto_X_(11236439494).jpg","license":"See source","matchedTitle":"motorola moto x"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-chromecast', 'product', 'chromecast', 'Chromecast', '시대를 바꾼 신제품', 'Google가 2013년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Chromecast: Google가 2013년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2013, NULL, 'brand-2b681c0a24ba', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Google","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-chromecast', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-chromecast', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-chromecast', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-chromecast', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-78301f4a3f66', 'milestone-2013-chromecast', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Chromecast', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-26b6440724ee', '/images/archive/milestones/2013-chromecast-commons.jpg', '/images/archive/milestones/2013-chromecast-commons.jpg', 'static', '2013-chromecast-commons.jpg', 'image/jpeg', 62529, 'Chromecast 제품 이미지', '@iannnnn', 'https://commons.wikimedia.org/wiki/File:View_of_HDMI_plug_of_first-generation_Chromecast_in_hand.jpg', 'CC BY 2.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-chromecast', 'media-26b6440724ee', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-78301f4a3f66', 'milestone-2013-chromecast', 1, '{"name":"Chromecast","summary":"Google가 2013년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Chromecast: Google가 2013년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Chromecast"},"image":{"src":"/images/archive/milestones/2013-chromecast-commons.jpg","alt":"Chromecast 제품 이미지","credit":"@iannnnn","sourceUrl":"https://commons.wikimedia.org/wiki/File:View_of_HDMI_plug_of_first-generation_Chromecast_in_hand.jpg","license":"CC BY 2.0","matchedTitle":"View of HDMI plug of first-generation Chromecast in hand.jpg"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-slack', 'service', 'slack', 'Slack', '새롭게 시작된 서비스', 'Slack Technologies가 2013년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Slack: Slack Technologies가 2013년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2013, NULL, 'brand-ce981920830e', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Slack Technologies","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-slack', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-slack', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-slack', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-slack', 'tag-ce981920830e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8a82db90c5e2', 'milestone-2013-slack', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Slack', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-74f2638f54f5', '/images/archive/milestones/2013-slack-commons.png', '/images/archive/milestones/2013-slack-commons.png', 'static', '2013-slack-commons.png', 'image/png', 6060, 'Slack 대표 이미지', 'Luis Resende', 'https://commons.wikimedia.org/wiki/File:SlackLogo.png', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-slack', 'media-74f2638f54f5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8a82db90c5e2', 'milestone-2013-slack', 1, '{"name":"Slack","summary":"Slack Technologies가 2013년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Slack: Slack Technologies가 2013년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Slack"},"image":{"src":"/images/archive/milestones/2013-slack-commons.png","alt":"Slack 대표 이미지","credit":"Luis Resende","sourceUrl":"https://commons.wikimedia.org/wiki/File:SlackLogo.png","license":"Public domain","matchedTitle":"SlackLogo.png"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-telegram', 'service', 'telegram', 'Telegram', '새롭게 시작된 서비스', 'Telegram가 2013년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Telegram: Telegram가 2013년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2013, NULL, 'brand-edbea9ff1a78', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Telegram","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-telegram', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-telegram', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-telegram', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-telegram', 'tag-edbea9ff1a78');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b6a1d578cffd', 'milestone-2013-telegram', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Telegram', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-17bf4cedaaf3', '/images/archive/milestones/2013-telegram-mark.svg', '/images/archive/milestones/2013-telegram-mark.svg', 'static', '2013-telegram-mark.svg', 'image/svg+xml', 757, 'Telegram 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Telegram', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-telegram', 'media-17bf4cedaaf3', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b6a1d578cffd', 'milestone-2013-telegram', 1, '{"name":"Telegram","summary":"Telegram가 2013년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Telegram: Telegram가 2013년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Telegram"},"image":{"src":"/images/archive/milestones/2013-telegram-mark.svg","alt":"Telegram 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Telegram","license":"CC0 1.0 · trademark","matchedTitle":"telegram brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-vine', 'service', 'vine', 'Vine', '새롭게 시작된 서비스', 'Twitter가 2013년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Vine: Twitter가 2013년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2013, NULL, 'brand-5392c950bdde', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Twitter","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-vine', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-vine', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-vine', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-vine', 'tag-5392c950bdde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-34c4d98c7467', 'milestone-2013-vine', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Vine', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c10b1b00f755', '/images/archive/milestones/2013-vine.jpg', '/images/archive/milestones/2013-vine.jpg', 'static', '2013-vine.jpg', 'image/jpeg', 681536, '2013년 Vine 대표 이미지', 'Vine contributors', 'https://en.wikipedia.org/wiki/Vine', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-vine', 'media-c10b1b00f755', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-34c4d98c7467', 'milestone-2013-vine', 1, '{"name":"Vine","summary":"Twitter가 2013년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Vine: Twitter가 2013년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Vine"},"image":{"src":"/images/archive/milestones/2013-vine.jpg","alt":"2013년 Vine 대표 이미지","credit":"Vine contributors","sourceUrl":"https://en.wikipedia.org/wiki/Vine","license":"Wikimedia source","matchedTitle":"Vine"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2013-google-glass-explorer-edition', 'product', 'google-glass-explorer-edition', 'Google Glass Explorer Edition', '시대를 바꾼 신제품', 'Google가 2013년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Glass Explorer Edition: Google가 2013년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2013, NULL, 'brand-2b681c0a24ba', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2013년 공개·출시","Google","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2013-google-glass-explorer-edition', 2013, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-google-glass-explorer-edition', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-google-glass-explorer-edition', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2013-google-glass-explorer-edition', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-7885923f2f62', 'milestone-2013-google-glass-explorer-edition', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Glass%20Explorer%20Edition', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-7ca5c639f660', '/images/archive/milestones/2013-google-glass-explorer.jpg', '/images/archive/milestones/2013-google-glass-explorer.jpg', 'static', '2013-google-glass-explorer.jpg', 'image/jpeg', 17291, 'Google Glass Explorer Edition 제품 모습', 'Duke University', 'https://today.duke.edu/main-feed/161542', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2013-google-glass-explorer-edition', 'media-7ca5c639f660', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-7885923f2f62', 'milestone-2013-google-glass-explorer-edition', 1, '{"name":"Google Glass Explorer Edition","summary":"Google가 2013년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Glass Explorer Edition: Google가 2013년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Glass%20Explorer%20Edition"},"image":{"src":"/images/archive/milestones/2013-google-glass-explorer.jpg","alt":"Google Glass Explorer Edition 제품 모습","credit":"Duke University","sourceUrl":"https://today.duke.edu/main-feed/161542","license":"Source-site media terms","matchedTitle":"google glass explorer edition"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-iphone-6', 'phone', 'iphone-6', 'iPhone 6', '그해 출시된 휴대전화', 'Apple가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 6: Apple가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2014, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-iphone-6', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-iphone-6', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-iphone-6', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-iphone-6', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2d3c5e82a4d4', 'milestone-2014-iphone-6', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%206', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-86909dab2312', '/images/archive/milestones/2014-iphone-6.png', '/images/archive/milestones/2014-iphone-6.png', 'static', '2014-iphone-6.png', 'image/png', 18331, '2014년 iPhone 6 대표 이미지', 'IPhone 6 contributors', 'https://en.wikipedia.org/wiki/IPhone_6', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-iphone-6', 'media-86909dab2312', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2d3c5e82a4d4', 'milestone-2014-iphone-6', 1, '{"name":"iPhone 6","summary":"Apple가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 6: Apple가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%206"},"image":{"src":"/images/archive/milestones/2014-iphone-6.png","alt":"2014년 iPhone 6 대표 이미지","credit":"IPhone 6 contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone_6","license":"Wikimedia source","matchedTitle":"IPhone 6"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-samsung-galaxy-s5', 'phone', 'samsung-galaxy-s5', 'Samsung Galaxy S5', '그해 출시된 휴대전화', 'Samsung가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy S5: Samsung가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2014, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-samsung-galaxy-s5', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-samsung-galaxy-s5', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-samsung-galaxy-s5', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-samsung-galaxy-s5', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-79e5a4a05054', 'milestone-2014-samsung-galaxy-s5', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S5', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0fb7918c6647', '/images/archive/milestones/2014-samsung-galaxy-s5.png', '/images/archive/milestones/2014-samsung-galaxy-s5.png', 'static', '2014-samsung-galaxy-s5.png', 'image/png', 98523, '2014년 Samsung Galaxy S5 대표 이미지', 'Samsung Galaxy S5 contributors', 'https://en.wikipedia.org/wiki/Samsung_Galaxy_S5', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-samsung-galaxy-s5', 'media-0fb7918c6647', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-79e5a4a05054', 'milestone-2014-samsung-galaxy-s5', 1, '{"name":"Samsung Galaxy S5","summary":"Samsung가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy S5: Samsung가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S5"},"image":{"src":"/images/archive/milestones/2014-samsung-galaxy-s5.png","alt":"2014년 Samsung Galaxy S5 대표 이미지","credit":"Samsung Galaxy S5 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Samsung_Galaxy_S5","license":"Wikimedia source","matchedTitle":"Samsung Galaxy S5"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-lg-g3', 'phone', 'lg-g3', 'LG G3', '그해 출시된 휴대전화', 'LG가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'LG G3: LG가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2014, NULL, 'brand-b4301e4bc1ae', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","LG","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-lg-g3', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-lg-g3', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-lg-g3', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-lg-g3', 'tag-b4301e4bc1ae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-24805e635d45', 'milestone-2014-lg-g3', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=LG%20G3', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-45c98cb9986e', '/images/archive/milestones/2014-lg-g3-product.jpg', '/images/archive/milestones/2014-lg-g3-product.jpg', 'static', '2014-lg-g3-product.jpg', 'image/jpeg', 179781, 'LG G3 전면과 후면 제품 모습', 'TechRadar', 'https://www.techradar.com/news/a-history-of-every-lg-flagship-android-phone', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-lg-g3', 'media-45c98cb9986e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-24805e635d45', 'milestone-2014-lg-g3', 1, '{"name":"LG G3","summary":"LG가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"LG G3: LG가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=LG%20G3"},"image":{"src":"/images/archive/milestones/2014-lg-g3-product.jpg","alt":"LG G3 전면과 후면 제품 모습","credit":"TechRadar","sourceUrl":"https://www.techradar.com/news/a-history-of-every-lg-flagship-android-phone","license":"Source-site media terms","matchedTitle":"lg g3"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-oneplus-one', 'phone', 'oneplus-one', 'OnePlus One', '그해 출시된 휴대전화', 'OnePlus가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'OnePlus One: OnePlus가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2014, NULL, 'brand-abf8a47ffd27', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","OnePlus","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-oneplus-one', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-oneplus-one', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-oneplus-one', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-oneplus-one', 'tag-abf8a47ffd27');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9d2973098a65', 'milestone-2014-oneplus-one', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=OnePlus%20One', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-7f3151c288bc', '/images/archive/milestones/2014-oneplus-one.jpg', '/images/archive/milestones/2014-oneplus-one.jpg', 'static', '2014-oneplus-one.jpg', 'image/jpeg', 165932, '2014년 OnePlus One 대표 이미지', 'OnePlus One contributors', 'https://en.wikipedia.org/wiki/OnePlus_One', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-oneplus-one', 'media-7f3151c288bc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9d2973098a65', 'milestone-2014-oneplus-one', 1, '{"name":"OnePlus One","summary":"OnePlus가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"OnePlus One: OnePlus가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=OnePlus%20One"},"image":{"src":"/images/archive/milestones/2014-oneplus-one.jpg","alt":"2014년 OnePlus One 대표 이미지","credit":"OnePlus One contributors","sourceUrl":"https://en.wikipedia.org/wiki/OnePlus_One","license":"Wikimedia source","matchedTitle":"OnePlus One"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-amazon-echo', 'product', 'amazon-echo', 'Amazon Echo', '시대를 바꾼 신제품', 'Amazon가 2014년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Amazon Echo: Amazon가 2014년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2014, NULL, 'brand-74c0fda1054b', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Amazon","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-amazon-echo', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-amazon-echo', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-amazon-echo', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-amazon-echo', 'tag-74c0fda1054b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2182546d7354', 'milestone-2014-amazon-echo', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20Echo', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-402f0c6f5fb9', '/images/archive/milestones/2014-amazon-echo-first-generation.jpg', '/images/archive/milestones/2014-amazon-echo-first-generation.jpg', 'static', '2014-amazon-echo-first-generation.jpg', 'image/jpeg', 27875, '1세대 Amazon Echo 스마트 스피커', 'Woot product archive', 'https://electronics.woot.com/offers/amazon-echo-1st-generation-1', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-amazon-echo', 'media-402f0c6f5fb9', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2182546d7354', 'milestone-2014-amazon-echo', 1, '{"name":"Amazon Echo","summary":"Amazon가 2014년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Amazon Echo: Amazon가 2014년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20Echo"},"image":{"src":"/images/archive/milestones/2014-amazon-echo-first-generation.jpg","alt":"1세대 Amazon Echo 스마트 스피커","credit":"Woot product archive","sourceUrl":"https://electronics.woot.com/offers/amazon-echo-1st-generation-1","license":"Source-site media terms","matchedTitle":"amazon echo"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-android-wear', 'program', 'android-wear', 'Android Wear', '새로운 디지털 도구', 'Google가 2014년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Android Wear: Google가 2014년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2014, NULL, 'brand-2b681c0a24ba', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Google","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-android-wear', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-android-wear', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-android-wear', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-android-wear', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-be83ddcd0d1c', 'milestone-2014-android-wear', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Android%20Wear', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ebcadfa41888', '/images/archive/milestones/2014-android-wear-mark.svg', '/images/archive/milestones/2014-android-wear-mark.svg', 'static', '2014-android-wear-mark.svg', 'image/svg+xml', 472, 'Android Wear 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Android%20Wear', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-android-wear', 'media-ebcadfa41888', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-be83ddcd0d1c', 'milestone-2014-android-wear', 1, '{"name":"Android Wear","summary":"Google가 2014년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Android Wear: Google가 2014년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Android%20Wear"},"image":{"src":"/images/archive/milestones/2014-android-wear-mark.svg","alt":"Android Wear 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Android%20Wear","license":"CC0 1.0 · trademark","matchedTitle":"google brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-musical-ly', 'service', 'musical-ly', 'Musical.ly', '새롭게 시작된 서비스', 'Musical.ly가 2014년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Musical.ly: Musical.ly가 2014년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2014, NULL, 'brand-f03787494805', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Musical.ly","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-musical-ly', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-musical-ly', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-musical-ly', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-musical-ly', 'tag-f03787494805');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-386b83616904', 'milestone-2014-musical-ly', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Musical.ly', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ef2adceabcfa', '/images/archive/milestones/2014-musical-ly.png', '/images/archive/milestones/2014-musical-ly.png', 'static', '2014-musical-ly.png', 'image/png', 30654, '2014년 Musical.ly 대표 이미지', 'Musical.ly contributors', 'https://en.wikipedia.org/wiki/Musical.ly', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-musical-ly', 'media-ef2adceabcfa', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-386b83616904', 'milestone-2014-musical-ly', 1, '{"name":"Musical.ly","summary":"Musical.ly가 2014년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Musical.ly: Musical.ly가 2014년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Musical.ly"},"image":{"src":"/images/archive/milestones/2014-musical-ly.png","alt":"2014년 Musical.ly 대표 이미지","credit":"Musical.ly contributors","sourceUrl":"https://en.wikipedia.org/wiki/Musical.ly","license":"Wikimedia source","matchedTitle":"Musical.ly"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-google-cardboard', 'product', 'google-cardboard', 'Google Cardboard', '시대를 바꾼 신제품', 'Google가 2014년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Cardboard: Google가 2014년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2014, NULL, 'brand-2b681c0a24ba', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Google","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-google-cardboard', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-google-cardboard', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-google-cardboard', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-google-cardboard', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f7088ac4abfc', 'milestone-2014-google-cardboard', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Cardboard', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e7a6fb39bc5a', '/images/archive/milestones/2014-google-cardboard.jpg', '/images/archive/milestones/2014-google-cardboard.jpg', 'static', '2014-google-cardboard.jpg', 'image/jpeg', 364983, '스마트폰을 장착한 Google Cardboard VR 뷰어', 'Evan-Amos · Wikimedia Commons · Public domain', 'https://commons.wikimedia.org/wiki/File:Google-Cardboard.jpg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-google-cardboard', 'media-e7a6fb39bc5a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f7088ac4abfc', 'milestone-2014-google-cardboard', 1, '{"name":"Google Cardboard","summary":"Google가 2014년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Cardboard: Google가 2014년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Cardboard"},"image":{"src":"/images/archive/milestones/2014-google-cardboard.jpg","alt":"스마트폰을 장착한 Google Cardboard VR 뷰어","credit":"Evan-Amos · Wikimedia Commons · Public domain","sourceUrl":"https://commons.wikimedia.org/wiki/File:Google-Cardboard.jpg","license":"Public domain","matchedTitle":"google cardboard"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-amazon-fire-phone', 'phone', 'amazon-fire-phone', 'Amazon Fire Phone', '그해 출시된 휴대전화', 'Amazon가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Amazon Fire Phone: Amazon가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2014, NULL, 'brand-74c0fda1054b', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Amazon","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-amazon-fire-phone', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-amazon-fire-phone', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-amazon-fire-phone', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-amazon-fire-phone', 'tag-74c0fda1054b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9683e8aa06ea', 'milestone-2014-amazon-fire-phone', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20Fire%20Phone', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ca3ebff4f0f5', '/images/archive/milestones/2014-amazon-fire-phone.jpg', '/images/archive/milestones/2014-amazon-fire-phone.jpg', 'static', '2014-amazon-fire-phone.jpg', 'image/jpeg', 326682, '2014년 Amazon Fire Phone 대표 이미지', 'Fire Phone contributors', 'https://en.wikipedia.org/wiki/Fire_Phone', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-amazon-fire-phone', 'media-ca3ebff4f0f5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9683e8aa06ea', 'milestone-2014-amazon-fire-phone', 1, '{"name":"Amazon Fire Phone","summary":"Amazon가 2014년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Amazon Fire Phone: Amazon가 2014년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20Fire%20Phone"},"image":{"src":"/images/archive/milestones/2014-amazon-fire-phone.jpg","alt":"2014년 Amazon Fire Phone 대표 이미지","credit":"Fire Phone contributors","sourceUrl":"https://en.wikipedia.org/wiki/Fire_Phone","license":"Wikimedia source","matchedTitle":"Fire Phone"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2014-playstation-tv', 'product', 'playstation-tv', 'PlayStation TV', '시대를 바꾼 신제품', 'Sony가 2014년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation TV: Sony가 2014년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2014, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2014년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2014-playstation-tv', 2014, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-playstation-tv', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-playstation-tv', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2014-playstation-tv', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-1bfd5cffb3d7', 'milestone-2014-playstation-tv', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20TV', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f548a66116d7', '/images/archive/milestones/2014-playstation-tv.jpg', '/images/archive/milestones/2014-playstation-tv.jpg', 'static', '2014-playstation-tv.jpg', 'image/jpeg', 50728, '2014년 PlayStation TV 대표 이미지', 'PlayStation TV contributors', 'https://en.wikipedia.org/wiki/PlayStation_TV', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2014-playstation-tv', 'media-f548a66116d7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-1bfd5cffb3d7', 'milestone-2014-playstation-tv', 1, '{"name":"PlayStation TV","summary":"Sony가 2014년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation TV: Sony가 2014년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20TV"},"image":{"src":"/images/archive/milestones/2014-playstation-tv.jpg","alt":"2014년 PlayStation TV 대표 이미지","credit":"PlayStation TV contributors","sourceUrl":"https://en.wikipedia.org/wiki/PlayStation_TV","license":"Wikimedia source","matchedTitle":"PlayStation TV"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-apple-watch', 'product', 'apple-watch', 'Apple Watch', '시대를 바꾼 신제품', 'Apple가 2015년에 선보인 스마트워치로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple Watch: Apple가 2015년에 출시한 스마트워치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2015, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-apple-watch', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-apple-watch', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-apple-watch', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-apple-watch', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-30bcf99bef7d', 'milestone-2015-apple-watch', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Watch', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-568e6f2d0a7d', '/images/archive/milestones/2015-apple-watch.jpg', '/images/archive/milestones/2015-apple-watch.jpg', 'static', '2015-apple-watch.jpg', 'image/jpeg', 254464, '2015년 Apple Watch 대표 이미지', 'Apple Watch contributors', 'https://en.wikipedia.org/wiki/Apple_Watch', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-apple-watch', 'media-568e6f2d0a7d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-30bcf99bef7d', 'milestone-2015-apple-watch', 1, '{"name":"Apple Watch","summary":"Apple가 2015년에 선보인 스마트워치로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple Watch: Apple가 2015년에 출시한 스마트워치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Watch"},"image":{"src":"/images/archive/milestones/2015-apple-watch.jpg","alt":"2015년 Apple Watch 대표 이미지","credit":"Apple Watch contributors","sourceUrl":"https://en.wikipedia.org/wiki/Apple_Watch","license":"Wikimedia source","matchedTitle":"Apple Watch"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-lg-g4', 'phone', 'lg-g4', 'LG G4', '그해 출시된 휴대전화', 'LG가 2015년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'LG G4: LG가 2015년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2015, NULL, 'brand-b4301e4bc1ae', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","LG","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-lg-g4', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-lg-g4', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-lg-g4', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-lg-g4', 'tag-b4301e4bc1ae');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-479ef7730e4e', 'milestone-2015-lg-g4', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=LG%20G4', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0c11623f3d59', '/images/archive/milestones/2015-lg-g4.jpg', '/images/archive/milestones/2015-lg-g4.jpg', 'static', '2015-lg-g4.jpg', 'image/jpeg', 206580, '2015년 LG G4 대표 이미지', 'LG G4 contributors', 'https://en.wikipedia.org/wiki/LG_G4', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-lg-g4', 'media-0c11623f3d59', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-479ef7730e4e', 'milestone-2015-lg-g4', 1, '{"name":"LG G4","summary":"LG가 2015년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"LG G4: LG가 2015년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=LG%20G4"},"image":{"src":"/images/archive/milestones/2015-lg-g4.jpg","alt":"2015년 LG G4 대표 이미지","credit":"LG G4 contributors","sourceUrl":"https://en.wikipedia.org/wiki/LG_G4","license":"Wikimedia source","matchedTitle":"LG G4"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-windows-10', 'program', 'windows-10', 'Windows 10', '새로운 디지털 도구', 'Microsoft가 2015년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.', 'Windows 10: Microsoft가 2015년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.', 2015, NULL, 'brand-11f3242118ff', 'category-program', '#526b70', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Microsoft","소프트웨어"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-windows-10', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-windows-10', 'tag-baad6b46db2e');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-windows-10', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-windows-10', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f6fa39a26897', 'milestone-2015-windows-10', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Windows%2010', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-732afbde65ce', '/images/archive/milestones/2015-windows-10.png', '/images/archive/milestones/2015-windows-10.png', 'static', '2015-windows-10.png', 'image/png', 182194, '2015년 Windows 10 대표 이미지', 'Windows 10 contributors', 'https://en.wikipedia.org/wiki/Windows_10', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-windows-10', 'media-732afbde65ce', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f6fa39a26897', 'milestone-2015-windows-10', 1, '{"name":"Windows 10","summary":"Microsoft가 2015년에 선보인 운영체제로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Windows 10: Microsoft가 2015년에 공개한 운영체제입니다. 사용자가 컴퓨터나 모바일 기기에서 작업하고 콘텐츠에 접근하는 방식을 구성한 도구입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Windows%2010"},"image":{"src":"/images/archive/milestones/2015-windows-10.png","alt":"2015년 Windows 10 대표 이미지","credit":"Windows 10 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Windows_10","license":"Wikimedia source","matchedTitle":"Windows 10"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-discord', 'service', 'discord', 'Discord', '새롭게 시작된 서비스', 'Discord가 2015년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Discord: Discord가 2015년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2015, NULL, 'brand-bccc14ee7da1', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Discord","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-discord', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-discord', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-discord', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-discord', 'tag-bccc14ee7da1');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-52b71a5343fc', 'milestone-2015-discord', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Discord', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-6e322b4ccdbe', '/images/archive/milestones/2015-discord-mark.svg', '/images/archive/milestones/2015-discord-mark.svg', 'static', '2015-discord-mark.svg', 'image/svg+xml', 1389, 'Discord 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Discord', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-discord', 'media-6e322b4ccdbe', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-52b71a5343fc', 'milestone-2015-discord', 1, '{"name":"Discord","summary":"Discord가 2015년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Discord: Discord가 2015년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Discord"},"image":{"src":"/images/archive/milestones/2015-discord-mark.svg","alt":"Discord 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Discord","license":"CC0 1.0 · trademark","matchedTitle":"discord brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-periscope', 'service', 'periscope', 'Periscope', '새롭게 시작된 서비스', 'Twitter가 2015년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Periscope: Twitter가 2015년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2015, NULL, 'brand-5392c950bdde', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Twitter","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-periscope', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-periscope', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-periscope', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-periscope', 'tag-5392c950bdde');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ca7c02143d01', 'milestone-2015-periscope', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Periscope', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8792e6b8c85e', '/images/archive/milestones/2015-periscope.png', '/images/archive/milestones/2015-periscope.png', 'static', '2015-periscope.png', 'image/png', 64544, '2015년 Periscope 대표 이미지', 'Periscope contributors', 'https://en.wikipedia.org/wiki/Periscope', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-periscope', 'media-8792e6b8c85e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ca7c02143d01', 'milestone-2015-periscope', 1, '{"name":"Periscope","summary":"Twitter가 2015년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Periscope: Twitter가 2015년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Periscope"},"image":{"src":"/images/archive/milestones/2015-periscope.png","alt":"2015년 Periscope 대표 이미지","credit":"Periscope contributors","sourceUrl":"https://en.wikipedia.org/wiki/Periscope","license":"Wikimedia source","matchedTitle":"Periscope"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-apple-music', 'service', 'apple-music', 'Apple Music', '새롭게 시작된 서비스', 'Apple가 2015년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple Music: Apple가 2015년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2015, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-apple-music', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-apple-music', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-apple-music', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-apple-music', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-8ebad96b434b', 'milestone-2015-apple-music', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Music', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1be437dd4aab', '/images/archive/milestones/2015-apple-music.png', '/images/archive/milestones/2015-apple-music.png', 'static', '2015-apple-music.png', 'image/png', 125060, '2015년 Apple Music 대표 이미지', 'Apple Music contributors', 'https://en.wikipedia.org/wiki/Apple_Music', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-apple-music', 'media-1be437dd4aab', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-8ebad96b434b', 'milestone-2015-apple-music', 1, '{"name":"Apple Music","summary":"Apple가 2015년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple Music: Apple가 2015년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Music"},"image":{"src":"/images/archive/milestones/2015-apple-music.png","alt":"2015년 Apple Music 대표 이미지","credit":"Apple Music contributors","sourceUrl":"https://en.wikipedia.org/wiki/Apple_Music","license":"Wikimedia source","matchedTitle":"Apple Music"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-youtube-gaming', 'service', 'youtube-gaming', 'YouTube Gaming', '새롭게 시작된 서비스', 'Google가 2015년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'YouTube Gaming: Google가 2015년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2015, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-youtube-gaming', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-youtube-gaming', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-youtube-gaming', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-youtube-gaming', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-556f109341ac', 'milestone-2015-youtube-gaming', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=YouTube%20Gaming', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-ef2b11d41198', '/images/archive/milestones/2015-youtube-gaming-mark.svg', '/images/archive/milestones/2015-youtube-gaming-mark.svg', 'static', '2015-youtube-gaming-mark.svg', 'image/svg+xml', 414, 'YouTube Gaming 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=YouTube%20Gaming', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-youtube-gaming', 'media-ef2b11d41198', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-556f109341ac', 'milestone-2015-youtube-gaming', 1, '{"name":"YouTube Gaming","summary":"Google가 2015년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"YouTube Gaming: Google가 2015년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=YouTube%20Gaming"},"image":{"src":"/images/archive/milestones/2015-youtube-gaming-mark.svg","alt":"YouTube Gaming 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=YouTube%20Gaming","license":"CC0 1.0 · trademark","matchedTitle":"youtubegaming brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-surface-book', 'product', 'surface-book', 'Surface Book', '시대를 바꾼 신제품', 'Microsoft가 2015년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'Surface Book: Microsoft가 2015년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2015, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-surface-book', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-surface-book', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-surface-book', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-surface-book', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9b6b5f69ba17', 'milestone-2015-surface-book', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Surface%20Book', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-7ae78f851ce8', '/images/archive/milestones/2015-surface-book.jpg', '/images/archive/milestones/2015-surface-book.jpg', 'static', '2015-surface-book.jpg', 'image/jpeg', 72686, '2015년 Surface Book 대표 이미지', 'Surface Book contributors', 'https://en.wikipedia.org/wiki/Surface_Book', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-surface-book', 'media-7ae78f851ce8', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9b6b5f69ba17', 'milestone-2015-surface-book', 1, '{"name":"Surface Book","summary":"Microsoft가 2015년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Surface Book: Microsoft가 2015년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Surface%20Book"},"image":{"src":"/images/archive/milestones/2015-surface-book.jpg","alt":"2015년 Surface Book 대표 이미지","credit":"Surface Book contributors","sourceUrl":"https://en.wikipedia.org/wiki/Surface_Book","license":"Wikimedia source","matchedTitle":"Surface Book"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-google-photos', 'service', 'google-photos', 'Google Photos', '새롭게 시작된 서비스', 'Google가 2015년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Photos: Google가 2015년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2015, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-google-photos', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-google-photos', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-google-photos', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-google-photos', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e635eab67aa5', 'milestone-2015-google-photos', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Photos', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-769cdffa9291', '/images/archive/milestones/2015-google-photos-mark.svg', '/images/archive/milestones/2015-google-photos-mark.svg', 'static', '2015-google-photos-mark.svg', 'image/svg+xml', 696, 'Google Photos 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Photos', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-google-photos', 'media-769cdffa9291', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e635eab67aa5', 'milestone-2015-google-photos', 1, '{"name":"Google Photos","summary":"Google가 2015년에 선보인 웹 기반 정보·클라우드 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Photos: Google가 2015년에 공개한 웹 기반 정보·클라우드 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Photos"},"image":{"src":"/images/archive/milestones/2015-google-photos-mark.svg","alt":"Google Photos 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Photos","license":"CC0 1.0 · trademark","matchedTitle":"googlephotos brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2015-amazon-echo-public-release', 'product', 'amazon-echo-public-release', 'Amazon Echo (Public Release)', '시대를 바꾼 신제품', 'Amazon가 2015년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Amazon Echo (Public Release): Amazon가 2015년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2015, NULL, 'brand-74c0fda1054b', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2015년 공개·출시","Amazon","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2015-amazon-echo-public-release', 2015, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-amazon-echo-public-release', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-amazon-echo-public-release', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2015-amazon-echo-public-release', 'tag-74c0fda1054b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-64af66c8e772', 'milestone-2015-amazon-echo-public-release', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20Echo%20(Public%20Release)', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0c9dac2e524d', '/images/archive/milestones/2015-amazon-echo-first-generation.jpg', '/images/archive/milestones/2015-amazon-echo-first-generation.jpg', 'static', '2015-amazon-echo-first-generation.jpg', 'image/jpeg', 27875, '정식 판매된 1세대 Amazon Echo', 'Woot product archive', 'https://electronics.woot.com/offers/amazon-echo-1st-generation-1', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2015-amazon-echo-public-release', 'media-0c9dac2e524d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-64af66c8e772', 'milestone-2015-amazon-echo-public-release', 1, '{"name":"Amazon Echo (Public Release)","summary":"Amazon가 2015년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Amazon Echo (Public Release): Amazon가 2015년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Amazon%20Echo%20(Public%20Release)"},"image":{"src":"/images/archive/milestones/2015-amazon-echo-first-generation.jpg","alt":"정식 판매된 1세대 Amazon Echo","credit":"Woot product archive","sourceUrl":"https://electronics.woot.com/offers/amazon-echo-1st-generation-1","license":"Source-site media terms","matchedTitle":"amazon echo (public release)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-iphone-7', 'phone', 'iphone-7', 'iPhone 7', '그해 출시된 휴대전화', 'Apple가 2016년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 7: Apple가 2016년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2016, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-iphone-7', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-iphone-7', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-iphone-7', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-iphone-7', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d28a3c460c60', 'milestone-2016-iphone-7', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%207', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d0062973566d', '/images/archive/milestones/2016-iphone-7.png', '/images/archive/milestones/2016-iphone-7.png', 'static', '2016-iphone-7.png', 'image/png', 18840, '2016년 iPhone 7 대표 이미지', 'IPhone 7 contributors', 'https://en.wikipedia.org/wiki/IPhone_7', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-iphone-7', 'media-d0062973566d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d28a3c460c60', 'milestone-2016-iphone-7', 1, '{"name":"iPhone 7","summary":"Apple가 2016년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 7: Apple가 2016년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%207"},"image":{"src":"/images/archive/milestones/2016-iphone-7.png","alt":"2016년 iPhone 7 대표 이미지","credit":"IPhone 7 contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone_7","license":"Wikimedia source","matchedTitle":"IPhone 7"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-samsung-galaxy-s7', 'phone', 'samsung-galaxy-s7', 'Samsung Galaxy S7', '그해 출시된 휴대전화', 'Samsung가 2016년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy S7: Samsung가 2016년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2016, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-samsung-galaxy-s7', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-samsung-galaxy-s7', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-samsung-galaxy-s7', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-samsung-galaxy-s7', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-86335d8e765c', 'milestone-2016-samsung-galaxy-s7', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S7', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a8a1db99b360', '/images/archive/milestones/2016-samsung-galaxy-s7.jpg', '/images/archive/milestones/2016-samsung-galaxy-s7.jpg', 'static', '2016-samsung-galaxy-s7.jpg', 'image/jpeg', 61486, '2016년 Samsung Galaxy S7 대표 이미지', 'Samsung Galaxy S7 contributors', 'https://en.wikipedia.org/wiki/Samsung_Galaxy_S7', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-samsung-galaxy-s7', 'media-a8a1db99b360', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-86335d8e765c', 'milestone-2016-samsung-galaxy-s7', 1, '{"name":"Samsung Galaxy S7","summary":"Samsung가 2016년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy S7: Samsung가 2016년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S7"},"image":{"src":"/images/archive/milestones/2016-samsung-galaxy-s7.jpg","alt":"2016년 Samsung Galaxy S7 대표 이미지","credit":"Samsung Galaxy S7 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Samsung_Galaxy_S7","license":"Wikimedia source","matchedTitle":"Samsung Galaxy S7"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-google-pixel', 'phone', 'google-pixel', 'Google Pixel', '그해 출시된 휴대전화', 'Google가 2016년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Pixel: Google가 2016년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2016, NULL, 'brand-2b681c0a24ba', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Google","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-google-pixel', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-google-pixel', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-google-pixel', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-google-pixel', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-af1d79f85c68', 'milestone-2016-google-pixel', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Pixel', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-238887acc24f', '/images/archive/milestones/2016-google-pixel.png', '/images/archive/milestones/2016-google-pixel.png', 'static', '2016-google-pixel.png', 'image/png', 4230, '2016년 Google Pixel 대표 이미지', 'Google Pixel contributors', 'https://en.wikipedia.org/wiki/Google_Pixel', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-google-pixel', 'media-238887acc24f', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-af1d79f85c68', 'milestone-2016-google-pixel', 1, '{"name":"Google Pixel","summary":"Google가 2016년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Pixel: Google가 2016년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Pixel"},"image":{"src":"/images/archive/milestones/2016-google-pixel.png","alt":"2016년 Google Pixel 대표 이미지","credit":"Google Pixel contributors","sourceUrl":"https://en.wikipedia.org/wiki/Google_Pixel","license":"Wikimedia source","matchedTitle":"Google Pixel"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-airpods', 'product', 'airpods', 'AirPods', '시대를 바꾼 신제품', 'Apple가 2016년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'AirPods: Apple가 2016년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2016, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-airpods', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-airpods', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-airpods', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-airpods', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d486ab688c78', 'milestone-2016-airpods', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=AirPods', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-32ede204ccdb', '/images/archive/milestones/2016-airpods-first-generation.jpg', '/images/archive/milestones/2016-airpods-first-generation.jpg', 'static', '2016-airpods-first-generation.jpg', 'image/jpeg', 49867, 'Apple AirPods 1세대', 'Apple Newsroom', 'https://www.apple.com/newsroom/2016/12/apple-airpods-are-now-available/', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-airpods', 'media-32ede204ccdb', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d486ab688c78', 'milestone-2016-airpods', 1, '{"name":"AirPods","summary":"Apple가 2016년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"AirPods: Apple가 2016년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=AirPods"},"image":{"src":"/images/archive/milestones/2016-airpods-first-generation.jpg","alt":"Apple AirPods 1세대","credit":"Apple Newsroom","sourceUrl":"https://www.apple.com/newsroom/2016/12/apple-airpods-are-now-available/","license":"See source","matchedTitle":"airpods"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-douyin', 'service', 'douyin', 'Douyin', '새롭게 시작된 서비스', 'ByteDance가 2016년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Douyin: ByteDance가 2016년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2016, NULL, 'brand-f4b8cf281981', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","ByteDance","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-douyin', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-douyin', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-douyin', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-douyin', 'tag-f4b8cf281981');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e87d35faea16', 'milestone-2016-douyin', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Douyin', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-7b4e1048ad1d', '/images/archive/milestones/2016-douyin-mark.svg', '/images/archive/milestones/2016-douyin-mark.svg', 'static', '2016-douyin-mark.svg', 'image/svg+xml', 346, 'Douyin 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Douyin', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-douyin', 'media-7b4e1048ad1d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e87d35faea16', 'milestone-2016-douyin', 1, '{"name":"Douyin","summary":"ByteDance가 2016년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Douyin: ByteDance가 2016년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Douyin"},"image":{"src":"/images/archive/milestones/2016-douyin-mark.svg","alt":"Douyin 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Douyin","license":"CC0 1.0 · trademark","matchedTitle":"bytedance brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-pok-mon-go', 'game', 'pok-mon-go', 'Pokémon GO', '새롭게 등장한 플레이', 'Niantic가 2016년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'Pokémon GO: Niantic가 2016년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2016, NULL, 'brand-0caaa759b075', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Niantic","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-pok-mon-go', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-pok-mon-go', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-pok-mon-go', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-pok-mon-go', 'tag-0caaa759b075');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-96d25c0ce45a', 'milestone-2016-pok-mon-go', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Pok%C3%A9mon%20GO', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-6a652b8ad203', '/images/archive/milestones/2016-pokemon-go-logo.svg', '/images/archive/milestones/2016-pokemon-go-logo.svg', 'static', '2016-pokemon-go-logo.svg', 'image/svg+xml', 95294, 'Pokémon GO 로고', 'Wikimedia Commons · text logo', 'https://commons.wikimedia.org/wiki/File:Pok%C3%A9mon_GO_logo.svg', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-pok-mon-go', 'media-6a652b8ad203', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-96d25c0ce45a', 'milestone-2016-pok-mon-go', 1, '{"name":"Pokémon GO","summary":"Niantic가 2016년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Pokémon GO: Niantic가 2016년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Pok%C3%A9mon%20GO"},"image":{"src":"/images/archive/milestones/2016-pokemon-go-logo.svg","alt":"Pokémon GO 로고","credit":"Wikimedia Commons · text logo","sourceUrl":"https://commons.wikimedia.org/wiki/File:Pok%C3%A9mon_GO_logo.svg","license":"See source","matchedTitle":"pokémon go"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-instagram-stories', 'service', 'instagram-stories', 'Instagram Stories', '새롭게 시작된 서비스', 'Meta가 2016년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Instagram Stories: Meta가 2016년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2016, NULL, 'brand-8d546a6dea9f', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Meta","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-instagram-stories', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-instagram-stories', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-instagram-stories', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-instagram-stories', 'tag-8d546a6dea9f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b5f43fcf3528', 'milestone-2016-instagram-stories', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Instagram%20Stories', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-9533fb4f3bac', '/images/archive/milestones/2016-instagram-stories-mark.svg', '/images/archive/milestones/2016-instagram-stories-mark.svg', 'static', '2016-instagram-stories-mark.svg', 'image/svg+xml', 2116, 'Instagram Stories 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Instagram%20Stories', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-instagram-stories', 'media-9533fb4f3bac', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b5f43fcf3528', 'milestone-2016-instagram-stories', 1, '{"name":"Instagram Stories","summary":"Meta가 2016년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Instagram Stories: Meta가 2016년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Instagram%20Stories"},"image":{"src":"/images/archive/milestones/2016-instagram-stories-mark.svg","alt":"Instagram Stories 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Instagram%20Stories","license":"CC0 1.0 · trademark","matchedTitle":"instagram brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-google-assistant', 'service', 'google-assistant', 'Google Assistant', '새롭게 시작된 서비스', 'Google가 2016년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Assistant: Google가 2016년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2016, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-google-assistant', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-google-assistant', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-google-assistant', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-google-assistant', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5151e8814a48', 'milestone-2016-google-assistant', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Assistant', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c4eef8b11c16', '/images/archive/milestones/2016-google-assistant-mark.svg', '/images/archive/milestones/2016-google-assistant-mark.svg', 'static', '2016-google-assistant-mark.svg', 'image/svg+xml', 493, 'Google Assistant 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Assistant', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-google-assistant', 'media-c4eef8b11c16', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5151e8814a48', 'milestone-2016-google-assistant', 1, '{"name":"Google Assistant","summary":"Google가 2016년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Assistant: Google가 2016년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Assistant"},"image":{"src":"/images/archive/milestones/2016-google-assistant-mark.svg","alt":"Google Assistant 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Assistant","license":"CC0 1.0 · trademark","matchedTitle":"googleassistant brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-playstation-vr', 'product', 'playstation-vr', 'PlayStation VR', '시대를 바꾼 신제품', 'Sony가 2016년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation VR: Sony가 2016년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2016, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-playstation-vr', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-playstation-vr', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-playstation-vr', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-playstation-vr', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-f383f8777f14', 'milestone-2016-playstation-vr', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20VR', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-af5e72448cf5', '/images/archive/milestones/2016-playstation-vr.jpg', '/images/archive/milestones/2016-playstation-vr.jpg', 'static', '2016-playstation-vr.jpg', 'image/jpeg', 74217, '1세대 Sony PlayStation VR 헤드셋', 'Evan-Amos · Wikimedia Commons', 'https://commons.wikimedia.org/wiki/File:Sony-PlayStation-4-PSVR-Headset-Mk1-FL.jpg', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-playstation-vr', 'media-af5e72448cf5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-f383f8777f14', 'milestone-2016-playstation-vr', 1, '{"name":"PlayStation VR","summary":"Sony가 2016년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation VR: Sony가 2016년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%20VR"},"image":{"src":"/images/archive/milestones/2016-playstation-vr.jpg","alt":"1세대 Sony PlayStation VR 헤드셋","credit":"Evan-Amos · Wikimedia Commons","sourceUrl":"https://commons.wikimedia.org/wiki/File:Sony-PlayStation-4-PSVR-Headset-Mk1-FL.jpg","license":"Source-site media terms","matchedTitle":"playstation vr"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-htc-vive', 'product', 'htc-vive', 'HTC Vive', '시대를 바꾼 신제품', 'HTC가 2016년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'HTC Vive: HTC가 2016년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2016, NULL, 'brand-2f5371407d06', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","HTC","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-htc-vive', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-htc-vive', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-htc-vive', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-htc-vive', 'tag-2f5371407d06');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-cc70f02e8f87', 'milestone-2016-htc-vive', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=HTC%20Vive', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-742818d571b1', '/images/archive/milestones/2016-htc-vive.jpg', '/images/archive/milestones/2016-htc-vive.jpg', 'static', '2016-htc-vive.jpg', 'image/jpeg', 177254, 'HTC Vive 헤드셋과 모션 컨트롤러', 'PB · Wikimedia Commons · CC BY-SA 4.0', 'https://commons.wikimedia.org/wiki/File:HTC_Vive_Virtual_Reality_Headset_and_Controllers.jpg', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-htc-vive', 'media-742818d571b1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-cc70f02e8f87', 'milestone-2016-htc-vive', 1, '{"name":"HTC Vive","summary":"HTC가 2016년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"HTC Vive: HTC가 2016년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=HTC%20Vive"},"image":{"src":"/images/archive/milestones/2016-htc-vive.jpg","alt":"HTC Vive 헤드셋과 모션 컨트롤러","credit":"PB · Wikimedia Commons · CC BY-SA 4.0","sourceUrl":"https://commons.wikimedia.org/wiki/File:HTC_Vive_Virtual_Reality_Headset_and_Controllers.jpg","license":"See source","matchedTitle":"htc vive"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2016-oculus-rift-cv1', 'product', 'oculus-rift-cv1', 'Oculus Rift CV1', '시대를 바꾼 신제품', 'Oculus VR가 2016년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Oculus Rift CV1: Oculus VR가 2016년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2016, NULL, 'brand-b5d7a11bec4a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2016년 공개·출시","Oculus VR","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2016-oculus-rift-cv1', 2016, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-oculus-rift-cv1', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-oculus-rift-cv1', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2016-oculus-rift-cv1', 'tag-b5d7a11bec4a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-38d66562db84', 'milestone-2016-oculus-rift-cv1', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Oculus%20Rift%20CV1', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-550a86da268b', '/images/archive/milestones/2016-oculus-rift-cv1.jpg', '/images/archive/milestones/2016-oculus-rift-cv1.jpg', 'static', '2016-oculus-rift-cv1.jpg', 'image/jpeg', 82210, 'Oculus Rift CV1 전면 제품 모습', 'Evan-Amos · Wikimedia Commons · Public domain', 'https://commons.wikimedia.org/wiki/File:Oculus-Rift-CV1-Headset-Front.jpg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2016-oculus-rift-cv1', 'media-550a86da268b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-38d66562db84', 'milestone-2016-oculus-rift-cv1', 1, '{"name":"Oculus Rift CV1","summary":"Oculus VR가 2016년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Oculus Rift CV1: Oculus VR가 2016년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Oculus%20Rift%20CV1"},"image":{"src":"/images/archive/milestones/2016-oculus-rift-cv1.jpg","alt":"Oculus Rift CV1 전면 제품 모습","credit":"Evan-Amos · Wikimedia Commons · Public domain","sourceUrl":"https://commons.wikimedia.org/wiki/File:Oculus-Rift-CV1-Headset-Front.jpg","license":"Public domain","matchedTitle":"oculus rift cv1"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-iphone-x', 'phone', 'iphone-x', 'iPhone X', '그해 출시된 휴대전화', 'Apple가 2017년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone X: Apple가 2017년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2017, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-iphone-x', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-iphone-x', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-iphone-x', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-iphone-x', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3af3089baa05', 'milestone-2017-iphone-x', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%20X', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e765cc6092c6', '/images/archive/milestones/2017-iphone-x.webp', '/images/archive/milestones/2017-iphone-x.webp', 'static', '2017-iphone-x.webp', 'image/webp', 15436, 'Apple iPhone X 전면과 후면 제품 모습', 'MobileDokan product gallery', 'https://www.mobiledokan.com/mobile/apple-iphone-x/gallery', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-iphone-x', 'media-e765cc6092c6', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3af3089baa05', 'milestone-2017-iphone-x', 1, '{"name":"iPhone X","summary":"Apple가 2017년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone X: Apple가 2017년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%20X"},"image":{"src":"/images/archive/milestones/2017-iphone-x.webp","alt":"Apple iPhone X 전면과 후면 제품 모습","credit":"MobileDokan product gallery","sourceUrl":"https://www.mobiledokan.com/mobile/apple-iphone-x/gallery","license":"Source-site media terms","matchedTitle":"iphone x"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-samsung-galaxy-s8', 'phone', 'samsung-galaxy-s8', 'Samsung Galaxy S8', '그해 출시된 휴대전화', 'Samsung가 2017년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy S8: Samsung가 2017년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2017, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-samsung-galaxy-s8', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-samsung-galaxy-s8', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-samsung-galaxy-s8', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-samsung-galaxy-s8', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3ac007ad2c3f', 'milestone-2017-samsung-galaxy-s8', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S8', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e76723a5c16a', '/images/archive/milestones/2017-samsung-galaxy-s8.jpg', '/images/archive/milestones/2017-samsung-galaxy-s8.jpg', 'static', '2017-samsung-galaxy-s8.jpg', 'image/jpeg', 14915, 'Midnight Black 색상의 Samsung Galaxy S8', 'Lazada product archive', 'https://aetatis-vasa.blogspot.com/2018/03/sale-stock-samsung-galaxy-s8-smartphone_25.html', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-samsung-galaxy-s8', 'media-e76723a5c16a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3ac007ad2c3f', 'milestone-2017-samsung-galaxy-s8', 1, '{"name":"Samsung Galaxy S8","summary":"Samsung가 2017년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy S8: Samsung가 2017년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S8"},"image":{"src":"/images/archive/milestones/2017-samsung-galaxy-s8.jpg","alt":"Midnight Black 색상의 Samsung Galaxy S8","credit":"Lazada product archive","sourceUrl":"https://aetatis-vasa.blogspot.com/2018/03/sale-stock-samsung-galaxy-s8-smartphone_25.html","license":"Source-site media terms","matchedTitle":"samsung galaxy s8"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-nintendo-switch', 'product', 'nintendo-switch', 'Nintendo Switch', '시대를 바꾼 신제품', 'Nintendo가 2017년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Nintendo Switch: Nintendo가 2017년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2017, NULL, 'brand-0cac146e40c7', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Nintendo","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-nintendo-switch', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-nintendo-switch', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-nintendo-switch', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-nintendo-switch', 'tag-0cac146e40c7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-aaba029d766b', 'milestone-2017-nintendo-switch', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20Switch', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-71fbe1a94eb8', '/images/archive/milestones/2017-nintendo-switch.png', '/images/archive/milestones/2017-nintendo-switch.png', 'static', '2017-nintendo-switch.png', 'image/png', 15215, '2017년 Nintendo Switch 대표 이미지', 'Nintendo Switch contributors', 'https://en.wikipedia.org/wiki/Nintendo_Switch', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-nintendo-switch', 'media-71fbe1a94eb8', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-aaba029d766b', 'milestone-2017-nintendo-switch', 1, '{"name":"Nintendo Switch","summary":"Nintendo가 2017년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Nintendo Switch: Nintendo가 2017년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Nintendo%20Switch"},"image":{"src":"/images/archive/milestones/2017-nintendo-switch.png","alt":"2017년 Nintendo Switch 대표 이미지","credit":"Nintendo Switch contributors","sourceUrl":"https://en.wikipedia.org/wiki/Nintendo_Switch","license":"Wikimedia source","matchedTitle":"Nintendo Switch"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-fortnite', 'game', 'fortnite', 'Fortnite', '새롭게 등장한 플레이', 'Epic Games가 2017년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.', 'Fortnite: Epic Games가 2017년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.', 2017, NULL, 'brand-78bfbf99825a', 'category-game', '#856858', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Epic Games","게임"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-fortnite', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-fortnite', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-fortnite', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-fortnite', 'tag-78bfbf99825a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-fac9f6b86b1c', 'milestone-2017-fortnite', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Fortnite', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8fd7cf554974', '/images/archive/milestones/2017-fortnite-mark.svg', '/images/archive/milestones/2017-fortnite-mark.svg', 'static', '2017-fortnite-mark.svg', 'image/svg+xml', 202, 'Fortnite 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Fortnite', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-fortnite', 'media-8fd7cf554974', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-fac9f6b86b1c', 'milestone-2017-fortnite', 1, '{"name":"Fortnite","summary":"Epic Games가 2017년에 선보인 비디오 게임로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Fortnite: Epic Games가 2017년에 공개한 비디오 게임입니다. 당시의 기기와 네트워크 환경에서 새로운 플레이 경험과 이용자 문화를 만든 작품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Fortnite"},"image":{"src":"/images/archive/milestones/2017-fortnite-mark.svg","alt":"Fortnite 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Fortnite","license":"CC0 1.0 · trademark","matchedTitle":"fortnite brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-xbox-one-x', 'product', 'xbox-one-x', 'Xbox One X', '시대를 바꾼 신제품', 'Microsoft가 2017년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Xbox One X: Microsoft가 2017년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2017, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-xbox-one-x', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-xbox-one-x', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-xbox-one-x', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-xbox-one-x', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d7196c286597', 'milestone-2017-xbox-one-x', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20One%20X', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e16517a0820c', '/images/archive/milestones/2017-xbox-one-x.png', '/images/archive/milestones/2017-xbox-one-x.png', 'static', '2017-xbox-one-x.png', 'image/png', 471878, '2017년 Xbox One X 대표 이미지', 'Xbox One contributors', 'https://en.wikipedia.org/wiki/Xbox_One', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-xbox-one-x', 'media-e16517a0820c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d7196c286597', 'milestone-2017-xbox-one-x', 1, '{"name":"Xbox One X","summary":"Microsoft가 2017년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Xbox One X: Microsoft가 2017년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20One%20X"},"image":{"src":"/images/archive/milestones/2017-xbox-one-x.png","alt":"2017년 Xbox One X 대표 이미지","credit":"Xbox One contributors","sourceUrl":"https://en.wikipedia.org/wiki/Xbox_One","license":"Wikimedia source","matchedTitle":"Xbox One"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-surface-laptop', 'product', 'surface-laptop', 'Surface Laptop', '시대를 바꾼 신제품', 'Microsoft가 2017년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'Surface Laptop: Microsoft가 2017년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2017, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-surface-laptop', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-surface-laptop', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-surface-laptop', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-surface-laptop', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-44a533a504a6', 'milestone-2017-surface-laptop', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Surface%20Laptop', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-fee914127847', '/images/archive/milestones/2017-surface-laptop.png', '/images/archive/milestones/2017-surface-laptop.png', 'static', '2017-surface-laptop.png', 'image/png', 370699, '2017년 Surface Laptop 대표 이미지', 'WikIan', 'https://commons.wikimedia.org/wiki/File:SurfaceLaptop.png', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-surface-laptop', 'media-fee914127847', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-44a533a504a6', 'milestone-2017-surface-laptop', 1, '{"name":"Surface Laptop","summary":"Microsoft가 2017년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Surface Laptop: Microsoft가 2017년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Surface%20Laptop"},"image":{"src":"/images/archive/milestones/2017-surface-laptop.png","alt":"2017년 Surface Laptop 대표 이미지","credit":"WikIan","sourceUrl":"https://commons.wikimedia.org/wiki/File:SurfaceLaptop.png","license":"CC BY-SA 4.0","matchedTitle":"Surface Laptop (1st generation)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-google-home-mini', 'product', 'google-home-mini', 'Google Home Mini', '시대를 바꾼 신제품', 'Google가 2017년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Home Mini: Google가 2017년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2017, NULL, 'brand-2b681c0a24ba', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Google","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-google-home-mini', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-google-home-mini', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-google-home-mini', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-google-home-mini', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-7ea1c05f504f', 'milestone-2017-google-home-mini', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Home%20Mini', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2b3f0ac903cf', '/images/archive/milestones/2017-google-home-mini.png', '/images/archive/milestones/2017-google-home-mini.png', 'static', '2017-google-home-mini.png', 'image/png', 359563, '2017년 Google Home Mini 대표 이미지', 'Google Nest (smart speakers) contributors', 'https://en.wikipedia.org/wiki/Google_Nest_(smart_speakers)', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-google-home-mini', 'media-2b3f0ac903cf', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-7ea1c05f504f', 'milestone-2017-google-home-mini', 1, '{"name":"Google Home Mini","summary":"Google가 2017년에 선보인 소비자용 디지털 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Home Mini: Google가 2017년에 출시한 소비자용 디지털 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Home%20Mini"},"image":{"src":"/images/archive/milestones/2017-google-home-mini.png","alt":"2017년 Google Home Mini 대표 이미지","credit":"Google Nest (smart speakers) contributors","sourceUrl":"https://en.wikipedia.org/wiki/Google_Nest_(smart_speakers)","license":"Wikimedia source","matchedTitle":"Google Nest (smart speakers)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-essential-phone', 'phone', 'essential-phone', 'Essential Phone', '그해 출시된 휴대전화', 'Essential Products가 2017년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Essential Phone: Essential Products가 2017년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2017, NULL, 'brand-83303faa0eda', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Essential Products","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-essential-phone', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-essential-phone', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-essential-phone', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-essential-phone', 'tag-83303faa0eda');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5b0a289153a3', 'milestone-2017-essential-phone', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Essential%20Phone', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f754fc079332', '/images/archive/milestones/2017-essential-phone.jpg', '/images/archive/milestones/2017-essential-phone.jpg', 'static', '2017-essential-phone.jpg', 'image/jpeg', 263118, '2017년 Essential Phone 대표 이미지', 'Essential Products, Inc.', 'https://commons.wikimedia.org/wiki/File:Essential_Phone_in_ocean_depths.jpg', 'CC BY-SA 4.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-essential-phone', 'media-f754fc079332', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5b0a289153a3', 'milestone-2017-essential-phone', 1, '{"name":"Essential Phone","summary":"Essential Products가 2017년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Essential Phone: Essential Products가 2017년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Essential%20Phone"},"image":{"src":"/images/archive/milestones/2017-essential-phone.jpg","alt":"2017년 Essential Phone 대표 이미지","credit":"Essential Products, Inc.","sourceUrl":"https://commons.wikimedia.org/wiki/File:Essential_Phone_in_ocean_depths.jpg","license":"CC BY-SA 4.0","matchedTitle":"Essential Phone"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-microsoft-teams', 'service', 'microsoft-teams', 'Microsoft Teams', '새롭게 시작된 서비스', 'Microsoft가 2017년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Microsoft Teams: Microsoft가 2017년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2017, NULL, 'brand-11f3242118ff', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Microsoft","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-microsoft-teams', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-microsoft-teams', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-microsoft-teams', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-microsoft-teams', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b0555fc5196c', 'milestone-2017-microsoft-teams', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Microsoft%20Teams', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a0cdad936ccc', '/images/archive/milestones/2017-microsoft-teams.png', '/images/archive/milestones/2017-microsoft-teams.png', 'static', '2017-microsoft-teams.png', 'image/png', 426784, '2017년 Microsoft Teams 대표 이미지', 'Microsoft', 'https://commons.wikimedia.org/wiki/File:Microsoft_Office_Teams_(2025%E2%80%93present).svg', 'Public domain', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-microsoft-teams', 'media-a0cdad936ccc', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b0555fc5196c', 'milestone-2017-microsoft-teams', 1, '{"name":"Microsoft Teams","summary":"Microsoft가 2017년에 선보인 온라인 메신저·커뮤니케이션 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Microsoft Teams: Microsoft가 2017년에 공개한 온라인 메신저·커뮤니케이션 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Microsoft%20Teams"},"image":{"src":"/images/archive/milestones/2017-microsoft-teams.png","alt":"2017년 Microsoft Teams 대표 이미지","credit":"Microsoft","sourceUrl":"https://commons.wikimedia.org/wiki/File:Microsoft_Office_Teams_(2025%E2%80%93present).svg","license":"Public domain","matchedTitle":"Microsoft Teams"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2017-apple-watch-series-3', 'product', 'apple-watch-series-3', 'Apple Watch Series 3', '시대를 바꾼 신제품', 'Apple가 2017년에 선보인 스마트워치로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple Watch Series 3: Apple가 2017년에 출시한 스마트워치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2017, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2017년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2017-apple-watch-series-3', 2017, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-apple-watch-series-3', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-apple-watch-series-3', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2017-apple-watch-series-3', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-98f6c17ecf37', 'milestone-2017-apple-watch-series-3', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Watch%20Series%203', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e75d1bdb3635', '/images/archive/milestones/2017-apple-watch-series-3.jpg', '/images/archive/milestones/2017-apple-watch-series-3.jpg', 'static', '2017-apple-watch-series-3.jpg', 'image/jpeg', 254464, '2017년 Apple Watch Series 3 대표 이미지', 'Apple Watch contributors', 'https://en.wikipedia.org/wiki/Apple_Watch', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2017-apple-watch-series-3', 'media-e75d1bdb3635', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-98f6c17ecf37', 'milestone-2017-apple-watch-series-3', 1, '{"name":"Apple Watch Series 3","summary":"Apple가 2017년에 선보인 스마트워치로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple Watch Series 3: Apple가 2017년에 출시한 스마트워치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Watch%20Series%203"},"image":{"src":"/images/archive/milestones/2017-apple-watch-series-3.jpg","alt":"2017년 Apple Watch Series 3 대표 이미지","credit":"Apple Watch contributors","sourceUrl":"https://en.wikipedia.org/wiki/Apple_Watch","license":"Wikimedia source","matchedTitle":"Apple Watch"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-iphone-xs', 'phone', 'iphone-xs', 'iPhone XS', '그해 출시된 휴대전화', 'Apple가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone XS: Apple가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2018, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-iphone-xs', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-iphone-xs', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-iphone-xs', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-iphone-xs', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-af445ad925e2', 'milestone-2018-iphone-xs', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%20XS', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-aef87bf1ba18', '/images/archive/milestones/2018-iphone-xs.png', '/images/archive/milestones/2018-iphone-xs.png', 'static', '2018-iphone-xs.png', 'image/png', 23063, '2018년 iPhone XS 대표 이미지', 'IPhone XS contributors', 'https://en.wikipedia.org/wiki/IPhone_XS', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-iphone-xs', 'media-aef87bf1ba18', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-af445ad925e2', 'milestone-2018-iphone-xs', 1, '{"name":"iPhone XS","summary":"Apple가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone XS: Apple가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%20XS"},"image":{"src":"/images/archive/milestones/2018-iphone-xs.png","alt":"2018년 iPhone XS 대표 이미지","credit":"IPhone XS contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone_XS","license":"Wikimedia source","matchedTitle":"IPhone XS"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-huawei-mate-20-pro', 'phone', 'huawei-mate-20-pro', 'Huawei Mate 20 Pro', '그해 출시된 휴대전화', 'Huawei가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Huawei Mate 20 Pro: Huawei가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2018, NULL, 'brand-82069bb9dfb3', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Huawei","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-huawei-mate-20-pro', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-huawei-mate-20-pro', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-huawei-mate-20-pro', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-huawei-mate-20-pro', 'tag-82069bb9dfb3');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3a2f2b205ef9', 'milestone-2018-huawei-mate-20-pro', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Huawei%20Mate%2020%20Pro', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-66c07ad63f1c', '/images/archive/milestones/2018-huawei-mate-20-pro.jpg', '/images/archive/milestones/2018-huawei-mate-20-pro.jpg', 'static', '2018-huawei-mate-20-pro.jpg', 'image/jpeg', 322657, '2018년 Huawei Mate 20 Pro 대표 이미지', 'Huawei Mate 20 contributors', 'https://en.wikipedia.org/wiki/Huawei_Mate_20', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-huawei-mate-20-pro', 'media-66c07ad63f1c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3a2f2b205ef9', 'milestone-2018-huawei-mate-20-pro', 1, '{"name":"Huawei Mate 20 Pro","summary":"Huawei가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Huawei Mate 20 Pro: Huawei가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Huawei%20Mate%2020%20Pro"},"image":{"src":"/images/archive/milestones/2018-huawei-mate-20-pro.jpg","alt":"2018년 Huawei Mate 20 Pro 대표 이미지","credit":"Huawei Mate 20 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Huawei_Mate_20","license":"Wikimedia source","matchedTitle":"Huawei Mate 20"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-google-pixel-3', 'phone', 'google-pixel-3', 'Google Pixel 3', '그해 출시된 휴대전화', 'Google가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Pixel 3: Google가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2018, NULL, 'brand-2b681c0a24ba', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Google","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-google-pixel-3', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-google-pixel-3', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-google-pixel-3', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-google-pixel-3', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-1dc2b0b00ed8', 'milestone-2018-google-pixel-3', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Pixel%203', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c19199f46662', '/images/archive/milestones/2018-google-pixel-3.jpg', '/images/archive/milestones/2018-google-pixel-3.jpg', 'static', '2018-google-pixel-3.jpg', 'image/jpeg', 32737, '2018년 Google Pixel 3 대표 이미지', 'Pixel 3 contributors', 'https://en.wikipedia.org/wiki/Pixel_3', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-google-pixel-3', 'media-c19199f46662', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-1dc2b0b00ed8', 'milestone-2018-google-pixel-3', 1, '{"name":"Google Pixel 3","summary":"Google가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Pixel 3: Google가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Pixel%203"},"image":{"src":"/images/archive/milestones/2018-google-pixel-3.jpg","alt":"2018년 Google Pixel 3 대표 이미지","credit":"Pixel 3 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Pixel_3","license":"Wikimedia source","matchedTitle":"Pixel 3"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-igtv', 'service', 'igtv', 'IGTV', '새롭게 시작된 서비스', 'Meta가 2018년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'IGTV: Meta가 2018년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2018, NULL, 'brand-8d546a6dea9f', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Meta","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-igtv', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-igtv', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-igtv', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-igtv', 'tag-8d546a6dea9f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-48e2906108e8', 'milestone-2018-igtv', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=IGTV', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d4292dc9ecec', '/images/archive/milestones/2018-igtv.png', '/images/archive/milestones/2018-igtv.png', 'static', '2018-igtv.png', 'image/png', 302585, '2018년 IGTV 대표 이미지', 'IGTV contributors', 'https://en.wikipedia.org/wiki/IGTV', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-igtv', 'media-d4292dc9ecec', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-48e2906108e8', 'milestone-2018-igtv', 1, '{"name":"IGTV","summary":"Meta가 2018년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"IGTV: Meta가 2018년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=IGTV"},"image":{"src":"/images/archive/milestones/2018-igtv.png","alt":"2018년 IGTV 대표 이미지","credit":"IGTV contributors","sourceUrl":"https://en.wikipedia.org/wiki/IGTV","license":"Wikimedia source","matchedTitle":"IGTV"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-youtube-music', 'service', 'youtube-music', 'YouTube Music', '새롭게 시작된 서비스', 'Google가 2018년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'YouTube Music: Google가 2018년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2018, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-youtube-music', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-youtube-music', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-youtube-music', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-youtube-music', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-47a2f7b25e38', 'milestone-2018-youtube-music', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=YouTube%20Music', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b2916561654a', '/images/archive/milestones/2018-youtube-music.jpg', '/images/archive/milestones/2018-youtube-music.jpg', 'static', '2018-youtube-music.jpg', 'image/jpeg', 62035, '2018년 YouTube Music 대표 이미지', 'YouTube Music contributors', 'https://en.wikipedia.org/wiki/YouTube_Music', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-youtube-music', 'media-b2916561654a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-47a2f7b25e38', 'milestone-2018-youtube-music', 1, '{"name":"YouTube Music","summary":"Google가 2018년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"YouTube Music: Google가 2018년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=YouTube%20Music"},"image":{"src":"/images/archive/milestones/2018-youtube-music.jpg","alt":"2018년 YouTube Music 대표 이미지","credit":"YouTube Music contributors","sourceUrl":"https://en.wikipedia.org/wiki/YouTube_Music","license":"Wikimedia source","matchedTitle":"YouTube Music"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-apple-watch-series-4', 'product', 'apple-watch-series-4', 'Apple Watch Series 4', '시대를 바꾼 신제품', 'Apple가 2018년에 선보인 스마트워치로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple Watch Series 4: Apple가 2018년에 출시한 스마트워치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2018, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-apple-watch-series-4', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-apple-watch-series-4', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-apple-watch-series-4', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-apple-watch-series-4', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3bcb9213a516', 'milestone-2018-apple-watch-series-4', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Watch%20Series%204', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-89621d32154b', '/images/archive/milestones/2018-apple-watch-series-4.jpg', '/images/archive/milestones/2018-apple-watch-series-4.jpg', 'static', '2018-apple-watch-series-4.jpg', 'image/jpeg', 254464, '2018년 Apple Watch Series 4 대표 이미지', 'Apple Watch contributors', 'https://en.wikipedia.org/wiki/Apple_Watch', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-apple-watch-series-4', 'media-89621d32154b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3bcb9213a516', 'milestone-2018-apple-watch-series-4', 1, '{"name":"Apple Watch Series 4","summary":"Apple가 2018년에 선보인 스마트워치로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple Watch Series 4: Apple가 2018년에 출시한 스마트워치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Watch%20Series%204"},"image":{"src":"/images/archive/milestones/2018-apple-watch-series-4.jpg","alt":"2018년 Apple Watch Series 4 대표 이미지","credit":"Apple Watch contributors","sourceUrl":"https://en.wikipedia.org/wiki/Apple_Watch","license":"Wikimedia source","matchedTitle":"Apple Watch"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-pocophone-f1', 'phone', 'pocophone-f1', 'Pocophone F1', '그해 출시된 휴대전화', 'Xiaomi가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Pocophone F1: Xiaomi가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2018, NULL, 'brand-4f5f69c7b9d2', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Xiaomi","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-pocophone-f1', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-pocophone-f1', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-pocophone-f1', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-pocophone-f1', 'tag-4f5f69c7b9d2');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e9e3e9ba080e', 'milestone-2018-pocophone-f1', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Pocophone%20F1', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-88241152f78a', '/images/archive/milestones/2018-pocophone-f1.jpg', '/images/archive/milestones/2018-pocophone-f1.jpg', 'static', '2018-pocophone-f1.jpg', 'image/jpeg', 211396, '2018년 Pocophone F1 대표 이미지', 'Xiaomi Pocophone F1 contributors', 'https://en.wikipedia.org/wiki/Xiaomi_Pocophone_F1', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-pocophone-f1', 'media-88241152f78a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e9e3e9ba080e', 'milestone-2018-pocophone-f1', 1, '{"name":"Pocophone F1","summary":"Xiaomi가 2018년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Pocophone F1: Xiaomi가 2018년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Pocophone%20F1"},"image":{"src":"/images/archive/milestones/2018-pocophone-f1.jpg","alt":"2018년 Pocophone F1 대표 이미지","credit":"Xiaomi Pocophone F1 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Xiaomi_Pocophone_F1","license":"Wikimedia source","matchedTitle":"Xiaomi Pocophone F1"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-oculus-go', 'product', 'oculus-go', 'Oculus Go', '시대를 바꾼 신제품', 'Oculus가 2018년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Oculus Go: Oculus가 2018년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2018, NULL, 'brand-51984f4c8a58', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Oculus","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-oculus-go', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-oculus-go', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-oculus-go', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-oculus-go', 'tag-51984f4c8a58');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-5924b4c48725', 'milestone-2018-oculus-go', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Oculus%20Go', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f366b7e9ba61', '/images/archive/milestones/2018-oculus-go.jpg', '/images/archive/milestones/2018-oculus-go.jpg', 'static', '2018-oculus-go.jpg', 'image/jpeg', 128945, '2018년 Oculus Go 대표 이미지', 'Oculus Go contributors', 'https://en.wikipedia.org/wiki/Oculus_Go', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-oculus-go', 'media-f366b7e9ba61', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-5924b4c48725', 'milestone-2018-oculus-go', 1, '{"name":"Oculus Go","summary":"Oculus가 2018년에 선보인 가상·증강현실 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Oculus Go: Oculus가 2018년에 출시한 가상·증강현실 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Oculus%20Go"},"image":{"src":"/images/archive/milestones/2018-oculus-go.jpg","alt":"2018년 Oculus Go 대표 이미지","credit":"Oculus Go contributors","sourceUrl":"https://en.wikipedia.org/wiki/Oculus_Go","license":"Wikimedia source","matchedTitle":"Oculus Go"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-macbook-air-retina', 'product', 'macbook-air-retina', 'MacBook Air Retina', '시대를 바꾼 신제품', 'Apple가 2018년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'MacBook Air Retina: Apple가 2018년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2018, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-macbook-air-retina', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-macbook-air-retina', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-macbook-air-retina', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-macbook-air-retina', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-e5769185ceaf', 'milestone-2018-macbook-air-retina', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air%20Retina', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2822d9d2ba8b', '/images/archive/milestones/2018-macbook-air-retina.jpg', '/images/archive/milestones/2018-macbook-air-retina.jpg', 'static', '2018-macbook-air-retina.jpg', 'image/jpeg', 112658, '2018년 MacBook Air Retina 대표 이미지', 'MacBook Air (Intel-based) contributors', 'https://en.wikipedia.org/wiki/MacBook_Air_(Intel-based)', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-macbook-air-retina', 'media-2822d9d2ba8b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-e5769185ceaf', 'milestone-2018-macbook-air-retina', 1, '{"name":"MacBook Air Retina","summary":"Apple가 2018년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"MacBook Air Retina: Apple가 2018년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air%20Retina"},"image":{"src":"/images/archive/milestones/2018-macbook-air-retina.jpg","alt":"2018년 MacBook Air Retina 대표 이미지","credit":"MacBook Air (Intel-based) contributors","sourceUrl":"https://en.wikipedia.org/wiki/MacBook_Air_(Intel-based)","license":"Wikimedia source","matchedTitle":"MacBook Air (Intel-based)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2018-dji-mavic-2-pro', 'product', 'dji-mavic-2-pro', 'DJI Mavic 2 Pro', '시대를 바꾼 신제품', 'DJI가 2018년에 선보인 디지털 촬영 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'DJI Mavic 2 Pro: DJI가 2018년에 출시한 디지털 촬영 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2018, NULL, 'brand-2c702b7f705f', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2018년 공개·출시","DJI","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2018-dji-mavic-2-pro', 2018, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-dji-mavic-2-pro', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-dji-mavic-2-pro', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2018-dji-mavic-2-pro', 'tag-2c702b7f705f');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a28bf9ecddb5', 'milestone-2018-dji-mavic-2-pro', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=DJI%20Mavic%202%20Pro', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-02cb67d52d89', '/images/archive/milestones/2018-dji-mavic-2-pro.jpg', '/images/archive/milestones/2018-dji-mavic-2-pro.jpg', 'static', '2018-dji-mavic-2-pro.jpg', 'image/jpeg', 44013, '2018년 DJI Mavic 2 Pro 대표 이미지', 'DJI Mavic contributors', 'https://en.wikipedia.org/wiki/DJI_Mavic', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2018-dji-mavic-2-pro', 'media-02cb67d52d89', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a28bf9ecddb5', 'milestone-2018-dji-mavic-2-pro', 1, '{"name":"DJI Mavic 2 Pro","summary":"DJI가 2018년에 선보인 디지털 촬영 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"DJI Mavic 2 Pro: DJI가 2018년에 출시한 디지털 촬영 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=DJI%20Mavic%202%20Pro"},"image":{"src":"/images/archive/milestones/2018-dji-mavic-2-pro.jpg","alt":"2018년 DJI Mavic 2 Pro 대표 이미지","credit":"DJI Mavic contributors","sourceUrl":"https://en.wikipedia.org/wiki/DJI_Mavic","license":"Wikimedia source","matchedTitle":"DJI Mavic"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-samsung-galaxy-fold', 'phone', 'samsung-galaxy-fold', 'Samsung Galaxy Fold', '그해 출시된 휴대전화', 'Samsung가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy Fold: Samsung가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2019, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-samsung-galaxy-fold', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-samsung-galaxy-fold', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-samsung-galaxy-fold', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-samsung-galaxy-fold', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-047d947f3697', 'milestone-2019-samsung-galaxy-fold', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20Fold', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a2e34520bc6e', '/images/archive/milestones/2019-samsung-galaxy-fold.jpg', '/images/archive/milestones/2019-samsung-galaxy-fold.jpg', 'static', '2019-samsung-galaxy-fold.jpg', 'image/jpeg', 33487, '2019년 Samsung Galaxy Fold 대표 이미지', 'Samsung Galaxy Fold contributors', 'https://en.wikipedia.org/wiki/Samsung_Galaxy_Fold', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-samsung-galaxy-fold', 'media-a2e34520bc6e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-047d947f3697', 'milestone-2019-samsung-galaxy-fold', 1, '{"name":"Samsung Galaxy Fold","summary":"Samsung가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy Fold: Samsung가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20Fold"},"image":{"src":"/images/archive/milestones/2019-samsung-galaxy-fold.jpg","alt":"2019년 Samsung Galaxy Fold 대표 이미지","credit":"Samsung Galaxy Fold contributors","sourceUrl":"https://en.wikipedia.org/wiki/Samsung_Galaxy_Fold","license":"Wikimedia source","matchedTitle":"Samsung Galaxy Fold"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-iphone-11', 'phone', 'iphone-11', 'iPhone 11', '그해 출시된 휴대전화', 'Apple가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 11: Apple가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2019, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-iphone-11', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-iphone-11', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-iphone-11', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-iphone-11', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-c50e5f0a4233', 'milestone-2019-iphone-11', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%2011', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0812f901182b', '/images/archive/milestones/2019-iphone-11.png', '/images/archive/milestones/2019-iphone-11.png', 'static', '2019-iphone-11.png', 'image/png', 19722, '2019년 iPhone 11 대표 이미지', 'IPhone 11 contributors', 'https://en.wikipedia.org/wiki/IPhone_11', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-iphone-11', 'media-0812f901182b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-c50e5f0a4233', 'milestone-2019-iphone-11', 1, '{"name":"iPhone 11","summary":"Apple가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 11: Apple가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%2011"},"image":{"src":"/images/archive/milestones/2019-iphone-11.png","alt":"2019년 iPhone 11 대표 이미지","credit":"IPhone 11 contributors","sourceUrl":"https://en.wikipedia.org/wiki/IPhone_11","license":"Wikimedia source","matchedTitle":"IPhone 11"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-samsung-galaxy-s10', 'phone', 'samsung-galaxy-s10', 'Samsung Galaxy S10', '그해 출시된 휴대전화', 'Samsung가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy S10: Samsung가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2019, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-samsung-galaxy-s10', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-samsung-galaxy-s10', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-samsung-galaxy-s10', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-samsung-galaxy-s10', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-b4fbdf9cf23e', 'milestone-2019-samsung-galaxy-s10', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S10', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-bac2b097803f', '/images/archive/milestones/2019-samsung-galaxy-s10-official.jpg', '/images/archive/milestones/2019-samsung-galaxy-s10-official.jpg', 'static', '2019-samsung-galaxy-s10-official.jpg', 'image/jpeg', 945134, 'Prism White 색상의 Samsung Galaxy S10', 'Samsung Newsroom', 'https://news.samsung.com/medialibrary/global/photo/45822', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-samsung-galaxy-s10', 'media-bac2b097803f', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-b4fbdf9cf23e', 'milestone-2019-samsung-galaxy-s10', 1, '{"name":"Samsung Galaxy S10","summary":"Samsung가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy S10: Samsung가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20S10"},"image":{"src":"/images/archive/milestones/2019-samsung-galaxy-s10-official.jpg","alt":"Prism White 색상의 Samsung Galaxy S10","credit":"Samsung Newsroom","sourceUrl":"https://news.samsung.com/medialibrary/global/photo/45822","license":"Source-site media terms","matchedTitle":"samsung galaxy s10"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-motorola-razr-2019', 'phone', 'motorola-razr-2019', 'Motorola Razr 2019', '그해 출시된 휴대전화', 'Motorola가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Motorola Razr 2019: Motorola가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2019, NULL, 'brand-399f01e13e37', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Motorola","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-motorola-razr-2019', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-motorola-razr-2019', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-motorola-razr-2019', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-motorola-razr-2019', 'tag-399f01e13e37');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-863aa074baaf', 'milestone-2019-motorola-razr-2019', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Motorola%20Razr%202019', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-44ffb7c97847', '/images/archive/milestones/2019-motorola-razr-2019.jpg', '/images/archive/milestones/2019-motorola-razr-2019.jpg', 'static', '2019-motorola-razr-2019.jpg', 'image/jpeg', 67438, '2019년 Motorola Razr 2019 대표 이미지', 'Motorola Razr (2020) contributors', 'https://en.wikipedia.org/wiki/Motorola_Razr_(2020)', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-motorola-razr-2019', 'media-44ffb7c97847', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-863aa074baaf', 'milestone-2019-motorola-razr-2019', 1, '{"name":"Motorola Razr 2019","summary":"Motorola가 2019년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Motorola Razr 2019: Motorola가 2019년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Motorola%20Razr%202019"},"image":{"src":"/images/archive/milestones/2019-motorola-razr-2019.jpg","alt":"2019년 Motorola Razr 2019 대표 이미지","credit":"Motorola Razr (2020) contributors","sourceUrl":"https://en.wikipedia.org/wiki/Motorola_Razr_(2020)","license":"Wikimedia source","matchedTitle":"Motorola Razr (2020)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-disney', 'service', 'disney', 'Disney+', '새롭게 시작된 서비스', 'Disney가 2019년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Disney+: Disney가 2019년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2019, NULL, 'brand-3feb1ce9764b', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Disney","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-disney', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-disney', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-disney', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-disney', 'tag-3feb1ce9764b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ab6e1cb6bd77', 'milestone-2019-disney', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Disney%2B', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d767014c2461', '/images/archive/milestones/2019-disney.png', '/images/archive/milestones/2019-disney.png', 'static', '2019-disney.png', 'image/png', 71493, '2019년 Disney+ 대표 이미지', 'Disney+ contributors', 'https://en.wikipedia.org/wiki/Disney%2B', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-disney', 'media-d767014c2461', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ab6e1cb6bd77', 'milestone-2019-disney', 1, '{"name":"Disney+","summary":"Disney가 2019년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Disney+: Disney가 2019년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Disney%2B"},"image":{"src":"/images/archive/milestones/2019-disney.png","alt":"2019년 Disney+ 대표 이미지","credit":"Disney+ contributors","sourceUrl":"https://en.wikipedia.org/wiki/Disney%2B","license":"Wikimedia source","matchedTitle":"Disney+"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-apple-tv', 'service', 'apple-tv', 'Apple TV+', '새롭게 시작된 서비스', 'Apple가 2019년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple TV+: Apple가 2019년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2019, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-apple-tv', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-apple-tv', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-apple-tv', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-apple-tv', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-52f6e53e1b73', 'milestone-2019-apple-tv', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20TV%2B', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-549e8b908ace', '/images/archive/milestones/2019-apple-tv.png', '/images/archive/milestones/2019-apple-tv.png', 'static', '2019-apple-tv.png', 'image/png', 13525, '2019년 Apple TV+ 대표 이미지', 'Apple TV (streaming service) contributors', 'https://en.wikipedia.org/wiki/Apple_TV_(streaming_service)', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-apple-tv', 'media-549e8b908ace', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-52f6e53e1b73', 'milestone-2019-apple-tv', 1, '{"name":"Apple TV+","summary":"Apple가 2019년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple TV+: Apple가 2019년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20TV%2B"},"image":{"src":"/images/archive/milestones/2019-apple-tv.png","alt":"2019년 Apple TV+ 대표 이미지","credit":"Apple TV (streaming service) contributors","sourceUrl":"https://en.wikipedia.org/wiki/Apple_TV_(streaming_service)","license":"Wikimedia source","matchedTitle":"Apple TV (streaming service)"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-apple-arcade', 'service', 'apple-arcade', 'Apple Arcade', '새롭게 시작된 서비스', 'Apple가 2019년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple Arcade: Apple가 2019년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2019, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-apple-arcade', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-apple-arcade', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-apple-arcade', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-apple-arcade', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-093691045bce', 'milestone-2019-apple-arcade', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Arcade', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-31d6d46defd1', '/images/archive/milestones/2019-apple-arcade-mark.svg', '/images/archive/milestones/2019-apple-arcade-mark.svg', 'static', '2019-apple-arcade-mark.svg', 'image/svg+xml', 1053, 'Apple Arcade 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Apple%20Arcade', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-apple-arcade', 'media-31d6d46defd1', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-093691045bce', 'milestone-2019-apple-arcade', 1, '{"name":"Apple Arcade","summary":"Apple가 2019년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple Arcade: Apple가 2019년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Arcade"},"image":{"src":"/images/archive/milestones/2019-apple-arcade-mark.svg","alt":"Apple Arcade 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Apple%20Arcade","license":"CC0 1.0 · trademark","matchedTitle":"applearcade brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-google-stadia', 'service', 'google-stadia', 'Google Stadia', '새롭게 시작된 서비스', 'Google가 2019년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Google Stadia: Google가 2019년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2019, NULL, 'brand-2b681c0a24ba', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Google","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-google-stadia', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-google-stadia', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-google-stadia', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-google-stadia', 'tag-2b681c0a24ba');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-56494b07c4d1', 'milestone-2019-google-stadia', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Google%20Stadia', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e729afd09ef7', '/images/archive/milestones/2019-google-stadia-mark.svg', '/images/archive/milestones/2019-google-stadia-mark.svg', 'static', '2019-google-stadia-mark.svg', 'image/svg+xml', 472, 'Google Stadia 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Google%20Stadia', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-google-stadia', 'media-e729afd09ef7', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-56494b07c4d1', 'milestone-2019-google-stadia', 1, '{"name":"Google Stadia","summary":"Google가 2019년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Google Stadia: Google가 2019년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Google%20Stadia"},"image":{"src":"/images/archive/milestones/2019-google-stadia-mark.svg","alt":"Google Stadia 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Google%20Stadia","license":"CC0 1.0 · trademark","matchedTitle":"google brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-airpods-pro', 'product', 'airpods-pro', 'AirPods Pro', '시대를 바꾼 신제품', 'Apple가 2019년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'AirPods Pro: Apple가 2019년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2019, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-airpods-pro', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-airpods-pro', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-airpods-pro', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-airpods-pro', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-cfda415a2368', 'milestone-2019-airpods-pro', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=AirPods%20Pro', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-eaa5fff45880', '/images/archive/milestones/2019-airpods-pro.jpg', '/images/archive/milestones/2019-airpods-pro.jpg', 'static', '2019-airpods-pro.jpg', 'image/jpeg', 40057, '2019년 AirPods Pro 대표 이미지', 'AirPods Pro contributors', 'https://en.wikipedia.org/wiki/AirPods_Pro', 'Wikimedia source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-airpods-pro', 'media-eaa5fff45880', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-cfda415a2368', 'milestone-2019-airpods-pro', 1, '{"name":"AirPods Pro","summary":"Apple가 2019년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"AirPods Pro: Apple가 2019년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=AirPods%20Pro"},"image":{"src":"/images/archive/milestones/2019-airpods-pro.jpg","alt":"2019년 AirPods Pro 대표 이미지","credit":"AirPods Pro contributors","sourceUrl":"https://en.wikipedia.org/wiki/AirPods_Pro","license":"Wikimedia source","matchedTitle":"AirPods Pro"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2019-korea-5g-service', 'service', 'korea-5g-service', 'Korea 5G Service', '새롭게 시작된 서비스', 'Korean Telecoms가 2019년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Korea 5G Service: Korean Telecoms가 2019년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2019, NULL, 'brand-8e40f123d531', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2019년 공개·출시","Korean Telecoms","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2019-korea-5g-service', 2019, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-korea-5g-service', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-korea-5g-service', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2019-korea-5g-service', 'tag-8e40f123d531');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-d15da0bc58cc', 'milestone-2019-korea-5g-service', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Korea%205G%20Service', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-dbb81d7ee222', '/images/archive/milestones/2019-korea-5g-launch.jpg', '/images/archive/milestones/2019-korea-5g-launch.jpg', 'static', '2019-korea-5g-launch.jpg', 'image/jpeg', 109143, '2019년 대한민국 SK Telecom 5G 상용화 행사', 'DW / Reuters', 'https://www.dw.com/en/starting-gun-fired-for-south-koreas-5g-network/a-48218685', 'See source', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2019-korea-5g-service', 'media-dbb81d7ee222', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-d15da0bc58cc', 'milestone-2019-korea-5g-service', 1, '{"name":"Korea 5G Service","summary":"Korean Telecoms가 2019년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Korea 5G Service: Korean Telecoms가 2019년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Korea%205G%20Service"},"image":{"src":"/images/archive/milestones/2019-korea-5g-launch.jpg","alt":"2019년 대한민국 SK Telecom 5G 상용화 행사","credit":"DW / Reuters","sourceUrl":"https://www.dw.com/en/starting-gun-fired-for-south-koreas-5g-network/a-48218685","license":"See source","matchedTitle":"korea 5g service"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-iphone-12', 'phone', 'iphone-12', 'iPhone 12', '그해 출시된 휴대전화', 'Apple가 2020년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'iPhone 12: Apple가 2020년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2020, NULL, 'brand-476432a3e85a', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Apple","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-iphone-12', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-iphone-12', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-iphone-12', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-iphone-12', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-2f61c95bfefb', 'milestone-2020-iphone-12', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=iPhone%2012', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-e31cc6f99b61', '/images/archive/milestones/2020-iphone-12.jpg', '/images/archive/milestones/2020-iphone-12.jpg', 'static', '2020-iphone-12.jpg', 'image/jpeg', 81200, 'Apple iPhone 12와 iPhone 12 mini 블루 제품 모습', 'Apple Newsroom', 'https://www.apple.com/newsroom/2020/10/apple-announces-iphone-12-and-iphone-12-mini-a-new-era-for-iphone-with-5g/', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-iphone-12', 'media-e31cc6f99b61', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-2f61c95bfefb', 'milestone-2020-iphone-12', 1, '{"name":"iPhone 12","summary":"Apple가 2020년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"iPhone 12: Apple가 2020년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=iPhone%2012"},"image":{"src":"/images/archive/milestones/2020-iphone-12.jpg","alt":"Apple iPhone 12와 iPhone 12 mini 블루 제품 모습","credit":"Apple Newsroom","sourceUrl":"https://www.apple.com/newsroom/2020/10/apple-announces-iphone-12-and-iphone-12-mini-a-new-era-for-iphone-with-5g/","license":"Source-site media terms","matchedTitle":"iphone 12"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-playstation-5', 'product', 'playstation-5', 'PlayStation 5', '시대를 바꾼 신제품', 'Sony가 2020년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'PlayStation 5: Sony가 2020년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2020, NULL, 'brand-b8d5ce12f432', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Sony","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-playstation-5', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-playstation-5', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-playstation-5', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-playstation-5', 'tag-b8d5ce12f432');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a78acdc16c94', 'milestone-2020-playstation-5', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%205', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-419a0ba5203d', '/images/archive/milestones/2020-playstation-5.png', '/images/archive/milestones/2020-playstation-5.png', 'static', '2020-playstation-5.png', 'image/png', 156201, 'Sony PlayStation 5 콘솔과 DualSense 컨트롤러 제품 모습', 'TOPpng product archive', 'https://toppng.com/free-image/ps5-official-console-and-controller-PNG-free-PNG-Images_475439', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-playstation-5', 'media-419a0ba5203d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a78acdc16c94', 'milestone-2020-playstation-5', 1, '{"name":"PlayStation 5","summary":"Sony가 2020년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"PlayStation 5: Sony가 2020년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=PlayStation%205"},"image":{"src":"/images/archive/milestones/2020-playstation-5.png","alt":"Sony PlayStation 5 콘솔과 DualSense 컨트롤러 제품 모습","credit":"TOPpng product archive","sourceUrl":"https://toppng.com/free-image/ps5-official-console-and-controller-PNG-free-PNG-Images_475439","license":"Source-site media terms","matchedTitle":"playstation 5"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-xbox-series-x', 'product', 'xbox-series-x', 'Xbox Series X', '시대를 바꾼 신제품', 'Microsoft가 2020년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.', 'Xbox Series X: Microsoft가 2020년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2020, NULL, 'brand-11f3242118ff', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Microsoft","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-xbox-series-x', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-xbox-series-x', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-xbox-series-x', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-xbox-series-x', 'tag-11f3242118ff');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-0b3c5e730c28', 'milestone-2020-xbox-series-x', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20Series%20X', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-82a60e27604e', '/images/archive/milestones/2020-xbox-series-x.png', '/images/archive/milestones/2020-xbox-series-x.png', 'static', '2020-xbox-series-x.png', 'image/png', 374692, 'Xbox Series X 콘솔과 무선 컨트롤러 제품 모습', 'Xbox', 'https://www.xbox.com/en-US/consoles/xbox-series-x', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-xbox-series-x', 'media-82a60e27604e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-0b3c5e730c28', 'milestone-2020-xbox-series-x', 1, '{"name":"Xbox Series X","summary":"Microsoft가 2020년에 선보인 가정용·휴대용 게임기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Xbox Series X: Microsoft가 2020년에 출시한 가정용·휴대용 게임기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Xbox%20Series%20X"},"image":{"src":"/images/archive/milestones/2020-xbox-series-x.png","alt":"Xbox Series X 콘솔과 무선 컨트롤러 제품 모습","credit":"Xbox","sourceUrl":"https://www.xbox.com/en-US/consoles/xbox-series-x","license":"Source-site media terms","matchedTitle":"xbox series x"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-clubhouse', 'service', 'clubhouse', 'Clubhouse', '새롭게 시작된 서비스', 'Alpha Exploration Co.가 2020년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Clubhouse: Alpha Exploration Co.가 2020년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2020, NULL, 'brand-d7b64e325ed7', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Alpha Exploration Co.","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-clubhouse', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-clubhouse', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-clubhouse', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-clubhouse', 'tag-d7b64e325ed7');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a6aaf2fc007d', 'milestone-2020-clubhouse', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Clubhouse', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2bc377015759', '/images/archive/milestones/2020-clubhouse-mark.svg', '/images/archive/milestones/2020-clubhouse-mark.svg', 'static', '2020-clubhouse-mark.svg', 'image/svg+xml', 2513, 'Clubhouse 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Clubhouse', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-clubhouse', 'media-2bc377015759', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a6aaf2fc007d', 'milestone-2020-clubhouse', 1, '{"name":"Clubhouse","summary":"Alpha Exploration Co.가 2020년에 선보인 소셜 네트워크·커뮤니티 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Clubhouse: Alpha Exploration Co.가 2020년에 공개한 소셜 네트워크·커뮤니티 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Clubhouse"},"image":{"src":"/images/archive/milestones/2020-clubhouse-mark.svg","alt":"Clubhouse 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Clubhouse","license":"CC0 1.0 · trademark","matchedTitle":"clubhouse brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-samsung-galaxy-z-flip', 'phone', 'samsung-galaxy-z-flip', 'Samsung Galaxy Z Flip', '그해 출시된 휴대전화', 'Samsung가 2020년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.', 'Samsung Galaxy Z Flip: Samsung가 2020년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.', 2020, NULL, 'brand-90e01d646458', 'category-phone', '#7b6554', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Samsung","휴대전화"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-samsung-galaxy-z-flip', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-samsung-galaxy-z-flip', 'tag-f9d4f7f5f6ca');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-samsung-galaxy-z-flip', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-samsung-galaxy-z-flip', 'tag-90e01d646458');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-3ab24a5d3714', 'milestone-2020-samsung-galaxy-z-flip', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20Z%20Flip', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-63ea89f9e182', '/images/archive/milestones/2020-samsung-galaxy-z-flip.jpg', '/images/archive/milestones/2020-samsung-galaxy-z-flip.jpg', 'static', '2020-samsung-galaxy-z-flip.jpg', 'image/jpeg', 18396, 'Mirror Purple 색상의 Samsung Galaxy Z Flip 제품 모습', 'Samsung', 'https://news.samsung.com/us/galaxy-z-flip-unpacked2020-future-changes-shape', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-samsung-galaxy-z-flip', 'media-63ea89f9e182', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-3ab24a5d3714', 'milestone-2020-samsung-galaxy-z-flip', 1, '{"name":"Samsung Galaxy Z Flip","summary":"Samsung가 2020년에 선보인 휴대전화로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Samsung Galaxy Z Flip: Samsung가 2020년에 출시한 휴대전화입니다. 통화와 문자 중심의 이동통신 경험을 제조사의 디자인과 입력 방식으로 구현한 모델입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Samsung%20Galaxy%20Z%20Flip"},"image":{"src":"/images/archive/milestones/2020-samsung-galaxy-z-flip.jpg","alt":"Mirror Purple 색상의 Samsung Galaxy Z Flip 제품 모습","credit":"Samsung","sourceUrl":"https://news.samsung.com/us/galaxy-z-flip-unpacked2020-future-changes-shape","license":"Source-site media terms","matchedTitle":"samsung galaxy z flip"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-macbook-air-m1', 'product', 'macbook-air-m1', 'MacBook Air M1', '시대를 바꾼 신제품', 'Apple가 2020년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.', 'MacBook Air M1: Apple가 2020년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2020, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-macbook-air-m1', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-macbook-air-m1', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-macbook-air-m1', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-macbook-air-m1', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-9520983c2f6d', 'milestone-2020-macbook-air-m1', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air%20M1', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-90f991ec469c', '/images/archive/milestones/2020-macbook-air-m1.jpg', '/images/archive/milestones/2020-macbook-air-m1.jpg', 'static', '2020-macbook-air-m1.jpg', 'image/jpeg', 132813, 'M1 칩을 탑재한 로즈 골드 MacBook Air 제품 모습', 'Apple Newsroom', 'https://www.apple.com/newsroom/2020/11/introducing-the-next-generation-of-mac/', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-macbook-air-m1', 'media-90f991ec469c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-9520983c2f6d', 'milestone-2020-macbook-air-m1', 1, '{"name":"MacBook Air M1","summary":"Apple가 2020년에 선보인 개인용 컴퓨터로, 당시 디지털 경험의 변화를 보여줍니다.","description":"MacBook Air M1: Apple가 2020년에 출시한 개인용 컴퓨터입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=MacBook%20Air%20M1"},"image":{"src":"/images/archive/milestones/2020-macbook-air-m1.jpg","alt":"M1 칩을 탑재한 로즈 골드 MacBook Air 제품 모습","credit":"Apple Newsroom","sourceUrl":"https://www.apple.com/newsroom/2020/11/introducing-the-next-generation-of-mac/","license":"Source-site media terms","matchedTitle":"macbook air m1"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-airpods-max', 'product', 'airpods-max', 'AirPods Max', '시대를 바꾼 신제품', 'Apple가 2020년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.', 'AirPods Max: Apple가 2020년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2020, NULL, 'brand-476432a3e85a', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Apple","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-airpods-max', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-airpods-max', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-airpods-max', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-airpods-max', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-ba064eb74167', 'milestone-2020-airpods-max', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=AirPods%20Max', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1c987e5eda2d', '/images/archive/milestones/2020-airpods-max.jpg', '/images/archive/milestones/2020-airpods-max.jpg', 'static', '2020-airpods-max.jpg', 'image/jpeg', 49104, '실버 색상의 Apple AirPods Max 제품 모습', 'Apple Newsroom', 'https://www.apple.com/uk/newsroom/2020/12/apple-introduces-airpods-max-the-magic-of-airpods-in-a-stunning-over-ear-design/', 'Source-site media terms', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-airpods-max', 'media-1c987e5eda2d', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-ba064eb74167', 'milestone-2020-airpods-max', 1, '{"name":"AirPods Max","summary":"Apple가 2020년에 선보인 휴대용 오디오 기기로, 당시 디지털 경험의 변화를 보여줍니다.","description":"AirPods Max: Apple가 2020년에 출시한 휴대용 오디오 기기입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=AirPods%20Max"},"image":{"src":"/images/archive/milestones/2020-airpods-max.jpg","alt":"실버 색상의 Apple AirPods Max 제품 모습","credit":"Apple Newsroom","sourceUrl":"https://www.apple.com/uk/newsroom/2020/12/apple-introduces-airpods-max-the-magic-of-airpods-in-a-stunning-over-ear-design/","license":"Source-site media terms","matchedTitle":"airpods max"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-geforce-rtx-3080', 'product', 'geforce-rtx-3080', 'GeForce RTX 3080', '시대를 바꾼 신제품', 'NVIDIA가 2020년에 선보인 PC 그래픽 처리 장치로, 당시 디지털 경험의 변화를 보여줍니다.', 'GeForce RTX 3080: NVIDIA가 2020년에 출시한 PC 그래픽 처리 장치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.', 2020, NULL, 'brand-088472395b26', 'category-product', '#9a7657', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","NVIDIA","제품"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-geforce-rtx-3080', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-geforce-rtx-3080', 'tag-5ab9da942628');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-geforce-rtx-3080', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-geforce-rtx-3080', 'tag-088472395b26');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-a723bbe8342a', 'milestone-2020-geforce-rtx-3080', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=GeForce%20RTX%203080', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-639d938472bb', '/images/archive/milestones/2020-geforce-rtx-3080.png', '/images/archive/milestones/2020-geforce-rtx-3080.png', 'static', '2020-geforce-rtx-3080.png', 'image/png', 689292, '2020년 GeForce RTX 3080 대표 이미지', 'ZMASLO', 'https://commons.wikimedia.org/wiki/File:RTX_5090_-_du%C5%BCa_wydajno%C5%9B%C4%87_du%C5%BCym_kosztem_(2160p_30fps_VP9_LQ-96kbit_AAC)-00.00.04.100.png', 'CC BY 3.0', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-geforce-rtx-3080', 'media-639d938472bb', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-a723bbe8342a', 'milestone-2020-geforce-rtx-3080', 1, '{"name":"GeForce RTX 3080","summary":"NVIDIA가 2020년에 선보인 PC 그래픽 처리 장치로, 당시 디지털 경험의 변화를 보여줍니다.","description":"GeForce RTX 3080: NVIDIA가 2020년에 출시한 PC 그래픽 처리 장치입니다. 당시의 하드웨어 기술을 실제 생활과 엔터테인먼트에서 사용할 수 있게 만든 제품입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=GeForce%20RTX%203080"},"image":{"src":"/images/archive/milestones/2020-geforce-rtx-3080.png","alt":"2020년 GeForce RTX 3080 대표 이미지","credit":"ZMASLO","sourceUrl":"https://commons.wikimedia.org/wiki/File:RTX_5090_-_du%C5%BCa_wydajno%C5%9B%C4%87_du%C5%BCym_kosztem_(2160p_30fps_VP9_LQ-96kbit_AAC)-00.00.04.100.png","license":"CC BY 3.0","matchedTitle":"GeForce"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-apple-fitness', 'service', 'apple-fitness', 'Apple Fitness+', '새롭게 시작된 서비스', 'Apple가 2020년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'Apple Fitness+: Apple가 2020년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2020, NULL, 'brand-476432a3e85a', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","Apple","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-apple-fitness', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-apple-fitness', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-apple-fitness', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-apple-fitness', 'tag-476432a3e85a');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-103cd30e46ad', 'milestone-2020-apple-fitness', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Fitness%2B', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-b19eca49f3b2', '/images/archive/milestones/2020-apple-fitness-mark.svg', '/images/archive/milestones/2020-apple-fitness-mark.svg', 'static', '2020-apple-fitness-mark.svg', 'image/svg+xml', 665, 'Apple Fitness+ 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=Apple%20Fitness%2B', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-apple-fitness', 'media-b19eca49f3b2', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-103cd30e46ad', 'milestone-2020-apple-fitness', 1, '{"name":"Apple Fitness+","summary":"Apple가 2020년에 선보인 인터넷을 통해 제공된 온라인 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"Apple Fitness+: Apple가 2020년에 공개한 인터넷을 통해 제공된 온라인 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=Apple%20Fitness%2B"},"image":{"src":"/images/archive/milestones/2020-apple-fitness-mark.svg","alt":"Apple Fitness+ 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=Apple%20Fitness%2B","license":"CC0 1.0 · trademark","matchedTitle":"apple brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2020-hbo-max', 'service', 'hbo-max', 'HBO Max', '새롭게 시작된 서비스', 'WarnerMedia가 2020년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.', 'HBO Max: WarnerMedia가 2020년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.', 2020, NULL, 'brand-cc9180581594', 'category-service', '#6f8fa8', 'published', 'verified', 0, '{"highlights":["2020년 공개·출시","WarnerMedia","서비스"],"specs":{}}', 1, 1786492800000, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2020-hbo-max', 2020, 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-hbo-max', 'tag-45c901dcec1b');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-hbo-max', 'tag-85568b20c331');
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2020-hbo-max', 'tag-cc9180581594');
--> statement-breakpoint
INSERT OR IGNORE INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-96f709397ae4', 'milestone-2020-hbo-max', 'Wikipedia 출시 기록', 'https://en.wikipedia.org/wiki/Special:Search?search=HBO%20Max', 'reference', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-1e87168eef24', '/images/archive/milestones/2020-hbo-max-mark.svg', '/images/archive/milestones/2020-hbo-max-mark.svg', 'static', '2020-hbo-max-mark.svg', 'image/svg+xml', 1087, 'HBO Max 당시 서비스 마크', 'Simple Icons contributors', 'https://simpleicons.org/?q=HBO%20Max', 'CC0 1.0 · trademark', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000);
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2020-hbo-max', 'media-1e87168eef24', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-96f709397ae4', 'milestone-2020-hbo-max', 1, '{"name":"HBO Max","summary":"WarnerMedia가 2020년에 선보인 디지털 콘텐츠·스트리밍 서비스로, 당시 디지털 경험의 변화를 보여줍니다.","description":"HBO Max: WarnerMedia가 2020년에 공개한 디지털 콘텐츠·스트리밍 서비스입니다. 인터넷을 통해 사람·정보·콘텐츠를 연결하고 특정한 일을 더 쉽게 처리하도록 만든 서비스입니다.","source":{"label":"Wikipedia 출시 기록","url":"https://en.wikipedia.org/wiki/Special:Search?search=HBO%20Max"},"image":{"src":"/images/archive/milestones/2020-hbo-max-mark.svg","alt":"HBO Max 당시 서비스 마크","credit":"Simple Icons contributors","sourceUrl":"https://simpleicons.org/?q=HBO%20Max","license":"CC0 1.0 · trademark","matchedTitle":"hbomax brand mark"}}', 'v0.2 catalog import', 1786492800000);
--> statement-breakpoint
PRAGMA optimize;
