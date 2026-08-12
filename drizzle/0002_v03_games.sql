-- BACK TO 2000 V0.3 GLOBAL GAME ARCHIVE
--> statement-breakpoint
INSERT INTO categories (id, slug, name, description, sort_order, created_at, updated_at) VALUES ('category-game', 'game', '게임', '공개 테스트와 출시를 거쳐 세계적인 놀이 문화가 된 게임', 4, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, description=excluded.description, sort_order=excluded.sort_order, updated_at=excluded.updated_at;
--> statement-breakpoint
UPDATE content_items SET status='archived', updated_at=1786492800000 WHERE id IN ('milestone-2000-the-sims', 'milestone-2002-kingdom-hearts', 'milestone-2009-minecraft-alpha', 'milestone-2011-minecraft-1-0', 'milestone-2012-candy-crush-saga', 'milestone-2016-pok-mon-go', 'milestone-2017-fortnite');
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-62a1ee25c03b', 'brand-62a1ee25c03b', 'Blizzard Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1998-starcraft', 'game', 'starcraft', 'StarCraft', 'PC방과 e스포츠의 원형', '세 종족의 비대칭 전략과 Battle.net 대전을 세계적인 경쟁 문화로 만든 RTS', 'StarCraft는 테란·저그·프로토스가 서로 다른 방식으로 싸우는 실시간 전략 게임입니다. 빠른 네트워크 대전과 관전하기 좋은 경기 구조가 한국의 PC방 문화와 프로 리그 성장에 맞물리며 게임이 스포츠가 될 수 있음을 보여줬습니다.', 1998, NULL, 'brand-62a1ee25c03b', 'category-game', '#263c67', 'published', 'verified', 1, '{"highlights":["세 종족의 비대칭 밸런스","Battle.net 온라인 대전","글로벌 e스포츠의 출발점"],"specs":{"개발사":"Blizzard Entertainment","장르":"실시간 전략","플랫폼":"Windows, Mac OS","공개 단계":"정식 출시"},"story":{"significance":"정교한 종족 균형과 Battle.net을 통해 온라인 대전의 표준을 세웠고, 개인 플레이를 방송·리그·팬덤이 결합된 대중문화로 확장했습니다.","legacy":"빌드 오더, 리플레이 분석, 프로게이머와 리그 운영 방식은 후속 RTS뿐 아니라 오늘날의 e스포츠 전반에 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1998-starcraft', 1998, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f30a29de1455', 'tag-f30a29de1455', '실시간 전략', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-f30a29de1455');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-62a1ee25c03b', 'tag-62a1ee25c03b', 'Blizzard Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-3c4a80dbdfac', 'tag-3c4a80dbdfac', '1998', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-3c4a80dbdfac');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5b7064b92e0a', 'tag-5b7064b92e0a', '정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1998-starcraft', 'tag-5b7064b92e0a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-0c87c5684bd7', 'milestone-1998-starcraft', 'Blizzard 20주년 기록', 'https://news.blizzard.com/en-gb/article/21656008/sc20-anniversary-stream', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-07589842a1ba', '/images/archive/milestones/1998-starcraft-user.jpg', '/images/archive/milestones/1998-starcraft-user.jpg', 'static', '1998-starcraft-user.jpg', 'image/jpeg', 69157, 'StarCraft 대표 이미지', 'StarCraft publisher', '/images/archive/milestones/1998-starcraft-user.jpg', '역사 기록용 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1998-starcraft', 'media-07589842a1ba', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-0c87c5684bd7', 'milestone-1998-starcraft', 2, '{"name":"StarCraft","summary":"세 종족의 비대칭 전략과 Battle.net 대전을 세계적인 경쟁 문화로 만든 RTS","description":"StarCraft는 테란·저그·프로토스가 서로 다른 방식으로 싸우는 실시간 전략 게임입니다. 빠른 네트워크 대전과 관전하기 좋은 경기 구조가 한국의 PC방 문화와 프로 리그 성장에 맞물리며 게임이 스포츠가 될 수 있음을 보여줬습니다.","specs":{"개발사":"Blizzard Entertainment","장르":"실시간 전략","플랫폼":"Windows, Mac OS","공개 단계":"정식 출시"},"story":{"significance":"정교한 종족 균형과 Battle.net을 통해 온라인 대전의 표준을 세웠고, 개인 플레이를 방송·리그·팬덤이 결합된 대중문화로 확장했습니다.","legacy":"빌드 오더, 리플레이 분석, 프로게이머와 리그 운영 방식은 후속 RTS뿐 아니라 오늘날의 e스포츠 전반에 남아 있습니다."},"source":{"label":"Blizzard 20주년 기록","url":"https://news.blizzard.com/en-gb/article/21656008/sc20-anniversary-stream"},"image":{"src":"/images/archive/milestones/1998-starcraft-user.jpg","alt":"StarCraft 대표 이미지","credit":"StarCraft publisher","sourceUrl":"/images/archive/milestones/1998-starcraft-user.jpg","license":"역사 기록용 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b87db20f2ac9', 'brand-b87db20f2ac9', 'Sony Online Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-1999-everquest', 'game', 'everquest', 'EverQuest', '3D 세계에 모인 수천 명', '광대한 3D 세계와 협동 중심 플레이로 MMORPG의 가능성을 세계에 증명한 작품', 'EverQuest는 수천 명의 플레이어가 하나의 3D 판타지 세계를 공유하며 모험하는 MMORPG입니다. 파티, 길드, 공격대처럼 다른 사람과 협력해야만 완성되는 구조를 앞세워 온라인 게임을 장기적인 사회적 공간으로 바꿨습니다.', 1999, NULL, 'brand-b87db20f2ac9', 'category-game', '#7d6644', 'published', 'verified', 0, '{"highlights":["대규모 3D 온라인 세계","길드와 레이드 문화","MMORPG 상업화의 분기점"],"specs":{"개발사":"Sony Online Entertainment","장르":"MMORPG","플랫폼":"Windows","공개 단계":"정식 출시"},"story":{"significance":"대규모 3D 온라인 세계가 상업적으로 성공할 수 있음을 보여주며 이후 MMORPG의 퀘스트, 길드, 레이드 설계에 기준을 만들었습니다.","legacy":"월드 오브 워크래프트를 비롯한 현대 MMORPG의 사회 구조와 장기 운영 방식에서 EverQuest의 흔적을 찾을 수 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-1999-everquest', 1999, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b66d6bdc162d', 'tag-b66d6bdc162d', 'MMORPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-b66d6bdc162d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b87db20f2ac9', 'tag-b87db20f2ac9', 'Sony Online Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-b87db20f2ac9');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-fbc7843acd86', 'tag-fbc7843acd86', '1999', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-fbc7843acd86');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5b7064b92e0a', 'tag-5b7064b92e0a', '정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-1999-everquest', 'tag-5b7064b92e0a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-58f28840393e', 'milestone-1999-everquest', 'EverQuest 공식 15주년 기록', 'https://www.everquest.com/news/15th-anniversary-article', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-53d705f0f174', '/images/archive/games/1999-everquest.jpg', '/images/archive/games/1999-everquest.jpg', 'static', '1999-everquest.jpg', 'image/jpeg', 41034, 'EverQuest 공식 Steam 대표 이미지', 'EverQuest publisher / Steam', 'https://store.steampowered.com/app/205710/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-1999-everquest', 'media-53d705f0f174', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-58f28840393e', 'milestone-1999-everquest', 2, '{"name":"EverQuest","summary":"광대한 3D 세계와 협동 중심 플레이로 MMORPG의 가능성을 세계에 증명한 작품","description":"EverQuest는 수천 명의 플레이어가 하나의 3D 판타지 세계를 공유하며 모험하는 MMORPG입니다. 파티, 길드, 공격대처럼 다른 사람과 협력해야만 완성되는 구조를 앞세워 온라인 게임을 장기적인 사회적 공간으로 바꿨습니다.","specs":{"개발사":"Sony Online Entertainment","장르":"MMORPG","플랫폼":"Windows","공개 단계":"정식 출시"},"story":{"significance":"대규모 3D 온라인 세계가 상업적으로 성공할 수 있음을 보여주며 이후 MMORPG의 퀘스트, 길드, 레이드 설계에 기준을 만들었습니다.","legacy":"월드 오브 워크래프트를 비롯한 현대 MMORPG의 사회 구조와 장기 운영 방식에서 EverQuest의 흔적을 찾을 수 있습니다."},"source":{"label":"EverQuest 공식 15주년 기록","url":"https://www.everquest.com/news/15th-anniversary-article"},"image":{"src":"/images/archive/games/1999-everquest.jpg","alt":"EverQuest 공식 Steam 대표 이미지","credit":"EverQuest publisher / Steam","sourceUrl":"https://store.steampowered.com/app/205710/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-4145fe3223ce', 'brand-4145fe3223ce', 'Blizzard North', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2000-diablo-ii', 'game', 'diablo-ii', 'Diablo II', '반복 플레이가 만든 중독성', '무작위 아이템과 빠른 전투, 온라인 협동으로 액션 RPG의 문법을 완성한 작품', 'Diablo II는 무작위로 생성되는 장비를 모으고 캐릭터의 기술 조합을 완성해 가는 액션 RPG입니다. Battle.net 협동과 거래, 시즌형 반복 플레이를 통해 한 번 끝내는 모험을 오랫동안 파고드는 취미로 바꿨습니다.', 2000, NULL, 'brand-4145fe3223ce', 'category-game', '#7d261f', 'published', 'verified', 0, '{"highlights":["무작위 전리품과 파밍","Battle.net 협동·거래","액션 RPG 장르의 기준"],"specs":{"개발사":"Blizzard North","장르":"액션 RPG","플랫폼":"Windows, Mac OS","공개 단계":"정식 출시"},"story":{"significance":"아이템 등급, 스킬 트리, 난이도 순환과 파밍이라는 구조를 대중화해 수많은 액션 RPG와 온라인 서비스 게임의 설계에 영향을 줬습니다.","legacy":"오늘날의 루트 중심 RPG, 시즌제 핵앤슬래시, 장비 빌드 커뮤니티는 Diablo II가 정립한 플레이 흐름을 발전시키고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2000-diablo-ii', 2000, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2000-diablo-ii', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b126977fd737', 'tag-b126977fd737', '액션 RPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2000-diablo-ii', 'tag-b126977fd737');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4145fe3223ce', 'tag-4145fe3223ce', 'Blizzard North', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2000-diablo-ii', 'tag-4145fe3223ce');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a4ac914c09d7', 'tag-a4ac914c09d7', '2000', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2000-diablo-ii', 'tag-a4ac914c09d7');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5b7064b92e0a', 'tag-5b7064b92e0a', '정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2000-diablo-ii', 'tag-5b7064b92e0a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-efe5439404b4', 'game-2000-diablo-ii', 'Blizzard Diablo II 20주년 기록', 'https://worldofwarcraft.blizzard.com/en-gb/news/23459856', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8bb2dd98e751', '/images/archive/games/2000-diablo-ii.png', '/images/archive/games/2000-diablo-ii.png', 'static', '2000-diablo-ii.png', 'image/png', 197229, 'Diablo II 대표 이미지', 'Diablo II contributors', 'https://en.wikipedia.org/wiki/Diablo_II', '역사 기록용 · 이미지별 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2000-diablo-ii', 'media-8bb2dd98e751', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-efe5439404b4', 'game-2000-diablo-ii', 2, '{"name":"Diablo II","summary":"무작위 아이템과 빠른 전투, 온라인 협동으로 액션 RPG의 문법을 완성한 작품","description":"Diablo II는 무작위로 생성되는 장비를 모으고 캐릭터의 기술 조합을 완성해 가는 액션 RPG입니다. Battle.net 협동과 거래, 시즌형 반복 플레이를 통해 한 번 끝내는 모험을 오랫동안 파고드는 취미로 바꿨습니다.","specs":{"개발사":"Blizzard North","장르":"액션 RPG","플랫폼":"Windows, Mac OS","공개 단계":"정식 출시"},"story":{"significance":"아이템 등급, 스킬 트리, 난이도 순환과 파밍이라는 구조를 대중화해 수많은 액션 RPG와 온라인 서비스 게임의 설계에 영향을 줬습니다.","legacy":"오늘날의 루트 중심 RPG, 시즌제 핵앤슬래시, 장비 빌드 커뮤니티는 Diablo II가 정립한 플레이 흐름을 발전시키고 있습니다."},"source":{"label":"Blizzard Diablo II 20주년 기록","url":"https://worldofwarcraft.blizzard.com/en-gb/news/23459856"},"image":{"src":"/images/archive/games/2000-diablo-ii.png","alt":"Diablo II 대표 이미지","credit":"Diablo II contributors","sourceUrl":"https://en.wikipedia.org/wiki/Diablo_II","license":"역사 기록용 · 이미지별 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-a8023743291a', 'brand-a8023743291a', 'Jagex', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2001-runescape', 'game', 'runescape', 'RuneScape', '브라우저에서 열린 모험', '설치 부담을 낮춘 웹 기반 세계와 자유로운 성장으로 장수 MMORPG가 된 게임', 'RuneScape는 브라우저에서 곧바로 접속해 전투, 제작, 채집, 거래를 자유롭게 즐기는 MMORPG입니다. 2001년 공개 베타는 저사양 PC에서도 거대한 온라인 세계를 경험하게 하며 접근성 중심의 운영 모델을 보여줬습니다.', 2001, NULL, 'brand-a8023743291a', 'category-game', '#88723d', 'published', 'verified', 0, '{"highlights":["2001년 공개 베타","브라우저 기반 MMORPG","이용자와 함께하는 장기 운영"],"specs":{"개발사":"Jagex","장르":"MMORPG","플랫폼":"웹 브라우저","공개 단계":"공개 베타"},"story":{"significance":"무료 진입과 가벼운 클라이언트, 지속적인 콘텐츠 추가를 결합해 온라인 게임이 긴 시간에 걸쳐 이용자와 함께 성장하는 방식을 증명했습니다.","legacy":"현재의 RuneScape와 Old School RuneScape는 이용자 투표와 장기 업데이트를 통해 원형을 서로 다른 방식으로 이어가고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2001-runescape', 2001, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2001-runescape', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b66d6bdc162d', 'tag-b66d6bdc162d', 'MMORPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2001-runescape', 'tag-b66d6bdc162d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a8023743291a', 'tag-a8023743291a', 'Jagex', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2001-runescape', 'tag-a8023743291a');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9195f873d171', 'tag-9195f873d171', '2001', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2001-runescape', 'tag-9195f873d171');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f97bc396f348', 'tag-f97bc396f348', '공개 베타', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2001-runescape', 'tag-f97bc396f348');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-78654a3021f0', 'game-2001-runescape', 'Jagex 공식 회사 연혁', 'https://www.jagex.com/who-we-are', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a524dee61bf4', '/images/archive/games/2001-runescape.jpg', '/images/archive/games/2001-runescape.jpg', 'static', '2001-runescape.jpg', 'image/jpeg', 46800, 'RuneScape 공식 Steam 대표 이미지', 'RuneScape publisher / Steam', 'https://store.steampowered.com/app/1343400/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2001-runescape', 'media-a524dee61bf4', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-78654a3021f0', 'game-2001-runescape', 2, '{"name":"RuneScape","summary":"설치 부담을 낮춘 웹 기반 세계와 자유로운 성장으로 장수 MMORPG가 된 게임","description":"RuneScape는 브라우저에서 곧바로 접속해 전투, 제작, 채집, 거래를 자유롭게 즐기는 MMORPG입니다. 2001년 공개 베타는 저사양 PC에서도 거대한 온라인 세계를 경험하게 하며 접근성 중심의 운영 모델을 보여줬습니다.","specs":{"개발사":"Jagex","장르":"MMORPG","플랫폼":"웹 브라우저","공개 단계":"공개 베타"},"story":{"significance":"무료 진입과 가벼운 클라이언트, 지속적인 콘텐츠 추가를 결합해 온라인 게임이 긴 시간에 걸쳐 이용자와 함께 성장하는 방식을 증명했습니다.","legacy":"현재의 RuneScape와 Old School RuneScape는 이용자 투표와 장기 업데이트를 통해 원형을 서로 다른 방식으로 이어가고 있습니다."},"source":{"label":"Jagex 공식 회사 연혁","url":"https://www.jagex.com/who-we-are"},"image":{"src":"/images/archive/games/2001-runescape.jpg","alt":"RuneScape 공식 Steam 대표 이미지","credit":"RuneScape publisher / Steam","sourceUrl":"https://store.steampowered.com/app/1343400/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-888601e87c0d', 'brand-888601e87c0d', 'DICE', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2002-battlefield-1942', 'game', 'battlefield-1942', 'Battlefield 1942', '64명이 만든 전장', '보병·전차·항공기를 한 전장에 묶어 대규모 팀 기반 FPS를 대중화한 작품', 'Battlefield 1942는 넓은 지도에서 보병과 각종 탑승 장비가 동시에 싸우는 팀 기반 FPS입니다. 개인의 사격 실력뿐 아니라 거점 점령과 병과 조합을 강조해 온라인 슈팅을 거대한 전장 체험으로 확장했습니다.', 2002, NULL, 'brand-888601e87c0d', 'category-game', '#68756c', 'published', 'verified', 0, '{"highlights":["최대 64인 온라인 전투","보병과 탈것의 결합","대규모 팀 FPS의 원형"],"specs":{"개발사":"DICE","장르":"멀티플레이 FPS","플랫폼":"Windows, Mac OS","공개 단계":"정식 출시"},"story":{"significance":"64인 전투, 탈것, 병과 역할과 점령전의 결합은 이후 Battlefield 시리즈와 대규모 멀티플레이 슈팅의 핵심 문법이 됐습니다.","legacy":"현대의 대규모 FPS가 사용하는 분대, 거점, 육해공 복합 전투 설계는 이 작품에서 시작된 흐름을 고도화한 것입니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2002-battlefield-1942', 2002, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2002-battlefield-1942', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-29b25217b2aa', 'tag-29b25217b2aa', '멀티플레이 FPS', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2002-battlefield-1942', 'tag-29b25217b2aa');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-888601e87c0d', 'tag-888601e87c0d', 'DICE', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2002-battlefield-1942', 'tag-888601e87c0d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2e8c0277e396', 'tag-2e8c0277e396', '2002', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2002-battlefield-1942', 'tag-2e8c0277e396');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5b7064b92e0a', 'tag-5b7064b92e0a', '정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2002-battlefield-1942', 'tag-5b7064b92e0a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-4aaa0db42e1b', 'game-2002-battlefield-1942', 'EA 10주년 기록', 'https://www.ea.com/news/get-battlefield-1942-free-from-origin', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-053147eaf6b3', '/images/archive/games/2002-battlefield-1942.jpg', '/images/archive/games/2002-battlefield-1942.jpg', 'static', '2002-battlefield-1942.jpg', 'image/jpeg', 29861, 'Battlefield 1942 대표 이미지', 'Battlefield 1942 contributors', 'https://en.wikipedia.org/wiki/Battlefield_1942', '역사 기록용 · 이미지별 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2002-battlefield-1942', 'media-053147eaf6b3', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-4aaa0db42e1b', 'game-2002-battlefield-1942', 2, '{"name":"Battlefield 1942","summary":"보병·전차·항공기를 한 전장에 묶어 대규모 팀 기반 FPS를 대중화한 작품","description":"Battlefield 1942는 넓은 지도에서 보병과 각종 탑승 장비가 동시에 싸우는 팀 기반 FPS입니다. 개인의 사격 실력뿐 아니라 거점 점령과 병과 조합을 강조해 온라인 슈팅을 거대한 전장 체험으로 확장했습니다.","specs":{"개발사":"DICE","장르":"멀티플레이 FPS","플랫폼":"Windows, Mac OS","공개 단계":"정식 출시"},"story":{"significance":"64인 전투, 탈것, 병과 역할과 점령전의 결합은 이후 Battlefield 시리즈와 대규모 멀티플레이 슈팅의 핵심 문법이 됐습니다.","legacy":"현대의 대규모 FPS가 사용하는 분대, 거점, 육해공 복합 전투 설계는 이 작품에서 시작된 흐름을 고도화한 것입니다."},"source":{"label":"EA 10주년 기록","url":"https://www.ea.com/news/get-battlefield-1942-free-from-origin"},"image":{"src":"/images/archive/games/2002-battlefield-1942.jpg","alt":"Battlefield 1942 대표 이미지","credit":"Battlefield 1942 contributors","sourceUrl":"https://en.wikipedia.org/wiki/Battlefield_1942","license":"역사 기록용 · 이미지별 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-a696d4137899', 'brand-a696d4137899', 'Wizet · Nexon', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2003-maplestory', 'game', 'maplestory', 'MapleStory', '횡스크롤 세계의 커뮤니티', '친근한 2D 그래픽과 무료 서비스로 세계적인 온라인 커뮤니티가 된 MMORPG', 'MapleStory는 횡스크롤 액션과 캐릭터 성장, 꾸미기와 커뮤니티를 결합한 2D MMORPG입니다. 낮은 진입 장벽과 밝은 시각 언어, 무료 플레이 모델을 바탕으로 여러 지역에 진출해 거대한 글로벌 이용자층을 만들었습니다.', 2003, NULL, 'brand-a696d4137899', 'category-game', '#e8984a', 'published', 'verified', 0, '{"highlights":["2D 횡스크롤 MMORPG","글로벌 1억 명대 계정","아바타와 부분 유료화 문화"],"specs":{"개발사":"Wizet · Nexon","장르":"2D MMORPG","플랫폼":"Windows","공개 단계":"한국 공개 서비스"},"story":{"significance":"부분 유료화와 아바타 꾸미기, 계절 이벤트가 결합된 장기 서비스 모델을 대중화하며 온라인 게임의 사업 구조와 팬 문화를 바꿨습니다.","legacy":"PC 원작은 계속 운영되고 있으며 모바일 버전, 굿즈, 음악회 등 게임 밖의 문화로도 확장된 장수 프랜차이즈가 됐습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2003-maplestory', 2003, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2003-maplestory', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-f4cfb71452d6', 'tag-f4cfb71452d6', '2D MMORPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2003-maplestory', 'tag-f4cfb71452d6');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-a696d4137899', 'tag-a696d4137899', 'Wizet · Nexon', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2003-maplestory', 'tag-a696d4137899');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ab165cb90d19', 'tag-ab165cb90d19', '2003', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2003-maplestory', 'tag-ab165cb90d19');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-c3e4ec263aec', 'tag-c3e4ec263aec', '한국 공개 서비스', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2003-maplestory', 'tag-c3e4ec263aec');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-759b5947eab0', 'game-2003-maplestory', 'Nexon 공식 제품 연혁', 'https://www.nexon.co.jp/en/products/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f703675a4fb5', '/images/archive/games/2003-maplestory.jpg', '/images/archive/games/2003-maplestory.jpg', 'static', '2003-maplestory.jpg', 'image/jpeg', 62262, 'MapleStory 공식 Steam 대표 이미지', 'MapleStory publisher / Steam', 'https://store.steampowered.com/app/216150/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2003-maplestory', 'media-f703675a4fb5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-759b5947eab0', 'game-2003-maplestory', 2, '{"name":"MapleStory","summary":"친근한 2D 그래픽과 무료 서비스로 세계적인 온라인 커뮤니티가 된 MMORPG","description":"MapleStory는 횡스크롤 액션과 캐릭터 성장, 꾸미기와 커뮤니티를 결합한 2D MMORPG입니다. 낮은 진입 장벽과 밝은 시각 언어, 무료 플레이 모델을 바탕으로 여러 지역에 진출해 거대한 글로벌 이용자층을 만들었습니다.","specs":{"개발사":"Wizet · Nexon","장르":"2D MMORPG","플랫폼":"Windows","공개 단계":"한국 공개 서비스"},"story":{"significance":"부분 유료화와 아바타 꾸미기, 계절 이벤트가 결합된 장기 서비스 모델을 대중화하며 온라인 게임의 사업 구조와 팬 문화를 바꿨습니다.","legacy":"PC 원작은 계속 운영되고 있으며 모바일 버전, 굿즈, 음악회 등 게임 밖의 문화로도 확장된 장수 프랜차이즈가 됐습니다."},"source":{"label":"Nexon 공식 제품 연혁","url":"https://www.nexon.co.jp/en/products/"},"image":{"src":"/images/archive/games/2003-maplestory.jpg","alt":"MapleStory 공식 Steam 대표 이미지","credit":"MapleStory publisher / Steam","sourceUrl":"https://store.steampowered.com/app/216150/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-62a1ee25c03b', 'brand-62a1ee25c03b', 'Blizzard Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('milestone-2004-world-of-warcraft', 'game', 'world-of-warcraft', 'World of Warcraft', 'MMORPG가 대중문화가 되다', '거대한 세계와 친절한 퀘스트, 공격대 콘텐츠로 MMORPG의 대중화를 이끈 작품', 'World of Warcraft는 Warcraft 세계를 누구나 탐험할 수 있는 온라인 공간으로 확장한 MMORPG입니다. 접근하기 쉬운 퀘스트와 명확한 역할 분담, 길드와 공격대 콘텐츠를 결합해 장르의 이용자 규모를 세계적으로 넓혔습니다.', 2004, NULL, 'brand-62a1ee25c03b', 'category-game', '#7c5b2c', 'published', 'verified', 1, '{"highlights":["2004년 북미 오픈 베타","길드와 공격대 콘텐츠","MMORPG의 세계적 대중화"],"specs":{"개발사":"Blizzard Entertainment","장르":"MMORPG","플랫폼":"Windows, Mac OS","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"대규모 온라인 게임도 친절한 동선과 안정적인 운영으로 대중적인 여가가 될 수 있음을 보여주며 구독형 서비스의 정점을 만들었습니다.","legacy":"확장팩과 클래식 서버가 함께 운영되며, 시즌과 공격대 중심의 현대 MMORPG 설계에 여전히 큰 기준점으로 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('milestone-2004-world-of-warcraft', 2004, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b66d6bdc162d', 'tag-b66d6bdc162d', 'MMORPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-b66d6bdc162d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-62a1ee25c03b', 'tag-62a1ee25c03b', 'Blizzard Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-667e624fb374', 'tag-667e624fb374', '2004', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-667e624fb374');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-905e5537a901', 'tag-905e5537a901', '오픈 베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('milestone-2004-world-of-warcraft', 'tag-905e5537a901');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-99add6be8b0f', 'milestone-2004-world-of-warcraft', 'Blizzard 20주년 기록', 'https://worldofwarcraft.blizzard.com/en-us/news/24162447/wow-weekly-wrap-up-wow-classic-20th-anniversary-edition-and-more', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-020df2991672', '/images/archive/milestones/2004-world-of-warcraft.png', '/images/archive/milestones/2004-world-of-warcraft.png', 'static', '2004-world-of-warcraft.png', 'image/png', 267121, 'World of Warcraft 대표 이미지', 'World of Warcraft publisher', '/images/archive/milestones/2004-world-of-warcraft.png', '역사 기록용 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('milestone-2004-world-of-warcraft', 'media-020df2991672', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-99add6be8b0f', 'milestone-2004-world-of-warcraft', 2, '{"name":"World of Warcraft","summary":"거대한 세계와 친절한 퀘스트, 공격대 콘텐츠로 MMORPG의 대중화를 이끈 작품","description":"World of Warcraft는 Warcraft 세계를 누구나 탐험할 수 있는 온라인 공간으로 확장한 MMORPG입니다. 접근하기 쉬운 퀘스트와 명확한 역할 분담, 길드와 공격대 콘텐츠를 결합해 장르의 이용자 규모를 세계적으로 넓혔습니다.","specs":{"개발사":"Blizzard Entertainment","장르":"MMORPG","플랫폼":"Windows, Mac OS","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"대규모 온라인 게임도 친절한 동선과 안정적인 운영으로 대중적인 여가가 될 수 있음을 보여주며 구독형 서비스의 정점을 만들었습니다.","legacy":"확장팩과 클래식 서버가 함께 운영되며, 시즌과 공격대 중심의 현대 MMORPG 설계에 여전히 큰 기준점으로 남아 있습니다."},"source":{"label":"Blizzard 20주년 기록","url":"https://worldofwarcraft.blizzard.com/en-us/news/24162447/wow-weekly-wrap-up-wow-classic-20th-anniversary-edition-and-more"},"image":{"src":"/images/archive/milestones/2004-world-of-warcraft.png","alt":"World of Warcraft 대표 이미지","credit":"World of Warcraft publisher","sourceUrl":"/images/archive/milestones/2004-world-of-warcraft.png","license":"역사 기록용 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-feffb312d3fe', 'brand-feffb312d3fe', 'ArenaNet', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2005-guild-wars', 'game', 'guild-wars', 'Guild Wars', '구독료 없는 온라인 RPG', '인스턴스 모험과 경쟁전, 구독료 없는 운영으로 다른 MMORPG의 길을 제시한 작품', 'Guild Wars는 도시에서 사람을 만나고 전투 지역은 파티 단위로 분리하는 온라인 RPG입니다. 월 구독료 없이 패키지와 확장팩으로 운영하면서 정교한 스킬 조합과 경쟁전을 강조해 독자적인 팬층을 만들었습니다.', 2005, NULL, 'brand-feffb312d3fe', 'category-game', '#9c3d32', 'published', 'verified', 0, '{"highlights":["월 구독료 없는 운영","인스턴스 기반 모험","스킬 조합 중심 PvP"],"specs":{"개발사":"ArenaNet","장르":"온라인 RPG","플랫폼":"Windows","공개 단계":"정식 출시"},"story":{"significance":"서버 부담을 낮춘 인스턴스 구조와 공정한 PvP, 구독료 없는 모델은 온라인 RPG가 거대한 단일 세계만을 따를 필요가 없음을 보여줬습니다.","legacy":"Guild Wars 2의 이벤트 중심 세계와 수평적 성장 철학으로 이어졌고, 원작 또한 오랜 기간 공식 서버를 유지하고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2005-guild-wars', 2005, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2005-guild-wars', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-54da37ecfab2', 'tag-54da37ecfab2', '온라인 RPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2005-guild-wars', 'tag-54da37ecfab2');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-feffb312d3fe', 'tag-feffb312d3fe', 'ArenaNet', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2005-guild-wars', 'tag-feffb312d3fe');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-23a0538f53cc', 'tag-23a0538f53cc', '2005', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2005-guild-wars', 'tag-23a0538f53cc');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-5b7064b92e0a', 'tag-5b7064b92e0a', '정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2005-guild-wars', 'tag-5b7064b92e0a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-33912f649066', 'game-2005-guild-wars', 'Guild Wars 공식 기념 페이지', 'https://www.guildwars.com/en/events/anniversary', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f52ea34c0e38', '/images/archive/games/2005-guild-wars.jpg', '/images/archive/games/2005-guild-wars.jpg', 'static', '2005-guild-wars.jpg', 'image/jpeg', 31746, 'Guild Wars 공식 Steam 대표 이미지', 'Guild Wars publisher / Steam', 'https://store.steampowered.com/app/29720/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2005-guild-wars', 'media-f52ea34c0e38', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-33912f649066', 'game-2005-guild-wars', 2, '{"name":"Guild Wars","summary":"인스턴스 모험과 경쟁전, 구독료 없는 운영으로 다른 MMORPG의 길을 제시한 작품","description":"Guild Wars는 도시에서 사람을 만나고 전투 지역은 파티 단위로 분리하는 온라인 RPG입니다. 월 구독료 없이 패키지와 확장팩으로 운영하면서 정교한 스킬 조합과 경쟁전을 강조해 독자적인 팬층을 만들었습니다.","specs":{"개발사":"ArenaNet","장르":"온라인 RPG","플랫폼":"Windows","공개 단계":"정식 출시"},"story":{"significance":"서버 부담을 낮춘 인스턴스 구조와 공정한 PvP, 구독료 없는 모델은 온라인 RPG가 거대한 단일 세계만을 따를 필요가 없음을 보여줬습니다.","legacy":"Guild Wars 2의 이벤트 중심 세계와 수평적 성장 철학으로 이어졌고, 원작 또한 오랜 기간 공식 서버를 유지하고 있습니다."},"source":{"label":"Guild Wars 공식 기념 페이지","url":"https://www.guildwars.com/en/events/anniversary"},"image":{"src":"/images/archive/games/2005-guild-wars.jpg","alt":"Guild Wars 공식 Steam 대표 이미지","credit":"Guild Wars publisher / Steam","sourceUrl":"https://store.steampowered.com/app/29720/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-b36783b63a3d', 'brand-b36783b63a3d', 'Roblox Corporation', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2006-roblox', 'game', 'roblox', 'Roblox', '플레이어가 만드는 세계', '이용자가 직접 게임을 만들고 공유하는 구조로 거대한 창작 생태계를 만든 플랫폼', 'Roblox는 하나의 완성된 게임보다 이용자가 직접 경험을 제작하고 다른 사람과 공유하는 플랫폼에 가깝습니다. 간단한 제작 도구와 아바타, 사회적 연결을 결합해 어린 창작자도 개발자와 운영자가 될 수 있는 공간을 만들었습니다.', 2006, NULL, 'brand-b36783b63a3d', 'category-game', '#d44848', 'published', 'verified', 0, '{"highlights":["2006년 공개 베타","사용자 제작 게임","창작자 경제와 소셜 플랫폼"],"specs":{"개발사":"Roblox Corporation","장르":"게임 제작 플랫폼","플랫폼":"Windows","공개 단계":"공개 베타 출시"},"story":{"significance":"사용자 제작 콘텐츠를 플랫폼의 중심에 두고 제작, 배포, 수익화를 하나의 생태계로 연결해 게임과 소셜 공간의 경계를 흐렸습니다.","legacy":"오늘날 Roblox는 콘솔과 모바일, VR까지 확장됐으며 브랜드 행사와 공연, 교육 콘텐츠가 함께 존재하는 대규모 창작 플랫폼으로 발전했습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2006-roblox', 2006, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2006-roblox', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-015c1e1a976b', 'tag-015c1e1a976b', '게임 제작 플랫폼', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2006-roblox', 'tag-015c1e1a976b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b36783b63a3d', 'tag-b36783b63a3d', 'Roblox Corporation', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2006-roblox', 'tag-b36783b63a3d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-1938b79762f0', 'tag-1938b79762f0', '2006', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2006-roblox', 'tag-1938b79762f0');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d663b116c005', 'tag-d663b116c005', '공개 베타 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2006-roblox', 'tag-d663b116c005');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-ff0fbf9234b8', 'game-2006-roblox', 'Roblox 회사 정보', 'https://en.help.roblox.com/hc/en-us/articles/203313370-Roblox-Company-Information', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-a979a3b5e83f', '/images/archive/games/2006-roblox.jpg', '/images/archive/games/2006-roblox.jpg', 'static', '2006-roblox.jpg', 'image/jpeg', 43603, 'Roblox 대표 이미지', 'Roblox publisher', 'https://www.pinterest.com/pin/roblox-logo-png-20062009--333547916165324131/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2006-roblox', 'media-a979a3b5e83f', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-ff0fbf9234b8', 'game-2006-roblox', 2, '{"name":"Roblox","summary":"이용자가 직접 게임을 만들고 공유하는 구조로 거대한 창작 생태계를 만든 플랫폼","description":"Roblox는 하나의 완성된 게임보다 이용자가 직접 경험을 제작하고 다른 사람과 공유하는 플랫폼에 가깝습니다. 간단한 제작 도구와 아바타, 사회적 연결을 결합해 어린 창작자도 개발자와 운영자가 될 수 있는 공간을 만들었습니다.","specs":{"개발사":"Roblox Corporation","장르":"게임 제작 플랫폼","플랫폼":"Windows","공개 단계":"공개 베타 출시"},"story":{"significance":"사용자 제작 콘텐츠를 플랫폼의 중심에 두고 제작, 배포, 수익화를 하나의 생태계로 연결해 게임과 소셜 공간의 경계를 흐렸습니다.","legacy":"오늘날 Roblox는 콘솔과 모바일, VR까지 확장됐으며 브랜드 행사와 공연, 교육 콘텐츠가 함께 존재하는 대규모 창작 플랫폼으로 발전했습니다."},"source":{"label":"Roblox 회사 정보","url":"https://en.help.roblox.com/hc/en-us/articles/203313370-Roblox-Company-Information"},"image":{"src":"/images/archive/games/2006-roblox.jpg","alt":"Roblox 대표 이미지","credit":"Roblox publisher","sourceUrl":"https://www.pinterest.com/pin/roblox-logo-png-20062009--333547916165324131/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-986d2de2ea6d', 'brand-986d2de2ea6d', 'Valve', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2007-team-fortress-2', 'game', 'team-fortress-2', 'Team Fortress 2', '역할과 개성이 만난 FPS', '뚜렷한 아홉 병과와 애니메이션풍 미술로 팀 기반 슈팅의 대중성을 넓힌 작품', 'Team Fortress 2는 공격, 방어, 지원 역할이 선명한 아홉 병과가 협력하는 멀티플레이 FPS입니다. 실루엣만으로도 역할을 알아볼 수 있는 캐릭터 디자인과 유머, 지속적인 무료 업데이트로 오랫동안 커뮤니티를 유지했습니다.', 2007, NULL, 'brand-986d2de2ea6d', 'category-game', '#b2633f', 'published', 'verified', 0, '{"highlights":["2007년 Steam 베타","아홉 개의 개성적인 병과","히어로 슈터의 토대"],"specs":{"개발사":"Valve","장르":"팀 기반 FPS","플랫폼":"Windows, Xbox 360, PlayStation 3","공개 단계":"베타·정식 출시"},"story":{"significance":"병과의 기능과 캐릭터성을 동시에 설계해 오늘날 히어로 슈터의 토대를 만들었고, 아이템과 커뮤니티 콘텐츠 중심 운영도 널리 확산시켰습니다.","legacy":"오버워치와 여러 팀 기반 슈터에서 역할 조합과 읽기 쉬운 캐릭터 디자인이라는 유산이 이어지고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2007-team-fortress-2', 2007, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2007-team-fortress-2', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-cec416a958c8', 'tag-cec416a958c8', '팀 기반 FPS', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2007-team-fortress-2', 'tag-cec416a958c8');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-986d2de2ea6d', 'tag-986d2de2ea6d', 'Valve', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2007-team-fortress-2', 'tag-986d2de2ea6d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-aca6d6e0ac7c', 'tag-aca6d6e0ac7c', '2007', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2007-team-fortress-2', 'tag-aca6d6e0ac7c');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-42a9b121cc2a', 'tag-42a9b121cc2a', '베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2007-team-fortress-2', 'tag-42a9b121cc2a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-8a21b53e0220', 'game-2007-team-fortress-2', 'Steam 공식 제품 페이지', 'https://store.steampowered.com/app/440/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2bc0c125a6f5', '/images/archive/games/2007-team-fortress-2.jpg', '/images/archive/games/2007-team-fortress-2.jpg', 'static', '2007-team-fortress-2.jpg', 'image/jpeg', 55689, 'Team Fortress 2 공식 Steam 대표 이미지', 'Team Fortress 2 publisher / Steam', 'https://store.steampowered.com/app/440/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2007-team-fortress-2', 'media-2bc0c125a6f5', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-8a21b53e0220', 'game-2007-team-fortress-2', 2, '{"name":"Team Fortress 2","summary":"뚜렷한 아홉 병과와 애니메이션풍 미술로 팀 기반 슈팅의 대중성을 넓힌 작품","description":"Team Fortress 2는 공격, 방어, 지원 역할이 선명한 아홉 병과가 협력하는 멀티플레이 FPS입니다. 실루엣만으로도 역할을 알아볼 수 있는 캐릭터 디자인과 유머, 지속적인 무료 업데이트로 오랫동안 커뮤니티를 유지했습니다.","specs":{"개발사":"Valve","장르":"팀 기반 FPS","플랫폼":"Windows, Xbox 360, PlayStation 3","공개 단계":"베타·정식 출시"},"story":{"significance":"병과의 기능과 캐릭터성을 동시에 설계해 오늘날 히어로 슈터의 토대를 만들었고, 아이템과 커뮤니티 콘텐츠 중심 운영도 널리 확산시켰습니다.","legacy":"오버워치와 여러 팀 기반 슈터에서 역할 조합과 읽기 쉬운 캐릭터 디자인이라는 유산이 이어지고 있습니다."},"source":{"label":"Steam 공식 제품 페이지","url":"https://store.steampowered.com/app/440/"},"image":{"src":"/images/archive/games/2007-team-fortress-2.jpg","alt":"Team Fortress 2 공식 Steam 대표 이미지","credit":"Team Fortress 2 publisher / Steam","sourceUrl":"https://store.steampowered.com/app/440/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-debf782480e8', 'brand-debf782480e8', 'Valve · Turtle Rock Studios', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2008-left-4-dead', 'game', 'left-4-dead', 'Left 4 Dead', '네 명이 만드는 생존 이야기', 'AI가 매번 다른 위기를 연출하는 4인 협동 구조로 협동 슈팅의 기준을 세운 작품', 'Left 4 Dead는 네 명의 생존자가 감염자 무리를 뚫고 탈출하는 협동 FPS입니다. 플레이 상황에 맞춰 적과 아이템, 긴장도를 조절하는 AI Director를 사용해 같은 지도를 반복해도 다른 이야기가 생기도록 만들었습니다.', 2008, NULL, 'brand-debf782480e8', 'category-game', '#49644a', 'published', 'verified', 0, '{"highlights":["4인 온라인 협동","AI Director","협동 슈팅 장르의 기준"],"specs":{"개발사":"Valve · Turtle Rock Studios","장르":"협동 FPS","플랫폼":"Windows, Xbox 360","공개 단계":"데모·정식 출시"},"story":{"significance":"개인의 점수보다 동료 구조와 속도 조절을 강조해 온라인 협동 플레이의 감정적 긴장과 반복성을 크게 끌어올렸습니다.","legacy":"4인 파티, 특수 적, 동적 난이도를 결합한 구조는 수많은 협동 액션 게임이 따르는 기본 형식으로 남았습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2008-left-4-dead', 2008, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2008-left-4-dead', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7b89c1e57045', 'tag-7b89c1e57045', '협동 FPS', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2008-left-4-dead', 'tag-7b89c1e57045');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-debf782480e8', 'tag-debf782480e8', 'Valve · Turtle Rock Studios', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2008-left-4-dead', 'tag-debf782480e8');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-527dc687fa58', 'tag-527dc687fa58', '2008', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2008-left-4-dead', 'tag-527dc687fa58');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-823cabe03553', 'tag-823cabe03553', '데모·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2008-left-4-dead', 'tag-823cabe03553');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-e51c964ee165', 'game-2008-left-4-dead', 'Left 4 Dead 공식 출시 기록', 'https://www.l4d.com/blog/?p=52', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-9d0f4281862a', '/images/archive/games/2008-left-4-dead.jpg', '/images/archive/games/2008-left-4-dead.jpg', 'static', '2008-left-4-dead.jpg', 'image/jpeg', 57336, 'Left 4 Dead 공식 Steam 대표 이미지', 'Left 4 Dead publisher / Steam', 'https://store.steampowered.com/app/500/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2008-left-4-dead', 'media-9d0f4281862a', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-e51c964ee165', 'game-2008-left-4-dead', 2, '{"name":"Left 4 Dead","summary":"AI가 매번 다른 위기를 연출하는 4인 협동 구조로 협동 슈팅의 기준을 세운 작품","description":"Left 4 Dead는 네 명의 생존자가 감염자 무리를 뚫고 탈출하는 협동 FPS입니다. 플레이 상황에 맞춰 적과 아이템, 긴장도를 조절하는 AI Director를 사용해 같은 지도를 반복해도 다른 이야기가 생기도록 만들었습니다.","specs":{"개발사":"Valve · Turtle Rock Studios","장르":"협동 FPS","플랫폼":"Windows, Xbox 360","공개 단계":"데모·정식 출시"},"story":{"significance":"개인의 점수보다 동료 구조와 속도 조절을 강조해 온라인 협동 플레이의 감정적 긴장과 반복성을 크게 끌어올렸습니다.","legacy":"4인 파티, 특수 적, 동적 난이도를 결합한 구조는 수많은 협동 액션 게임이 따르는 기본 형식으로 남았습니다."},"source":{"label":"Left 4 Dead 공식 출시 기록","url":"https://www.l4d.com/blog/?p=52"},"image":{"src":"/images/archive/games/2008-left-4-dead.jpg","alt":"Left 4 Dead 공식 Steam 대표 이미지","credit":"Left 4 Dead publisher / Steam","sourceUrl":"https://store.steampowered.com/app/500/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-9e995bee1ae0', 'brand-9e995bee1ae0', 'Riot Games', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2009-league-of-legends', 'game', 'league-of-legends', 'League of Legends', '무료 MOBA와 글로벌 리그', '무료 플레이와 꾸준한 업데이트, 지역 리그를 결합해 세계 최대 e스포츠 중 하나가 된 MOBA', 'League of Legends는 다섯 명이 역할을 나눠 상대 기지를 파괴하는 팀 전략 게임입니다. 무료 플레이와 계속 추가되는 챔피언, 짧고 반복 가능한 경기 구조를 바탕으로 세계 각지의 서버와 프로 리그를 성장시켰습니다.', 2009, NULL, 'brand-9e995bee1ae0', 'category-game', '#167b93', 'published', 'verified', 1, '{"highlights":["2009년 오픈 베타","5대5 MOBA","글로벌 리그와 라이브 서비스"],"specs":{"개발사":"Riot Games","장르":"MOBA","플랫폼":"Windows, Mac OS","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"게임 업데이트, 방송, 지역 리그와 세계대회를 하나의 장기 생태계로 묶어 라이브 서비스와 e스포츠 운영의 새로운 표준을 만들었습니다.","legacy":"게임을 넘어 음악, 애니메이션, 다른 장르의 작품으로 세계관을 확장하며 하나의 글로벌 엔터테인먼트 IP로 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2009-league-of-legends', 2009, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2009-league-of-legends', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ede4db75f81b', 'tag-ede4db75f81b', 'MOBA', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2009-league-of-legends', 'tag-ede4db75f81b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9e995bee1ae0', 'tag-9e995bee1ae0', 'Riot Games', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2009-league-of-legends', 'tag-9e995bee1ae0');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7263d678abae', 'tag-7263d678abae', '2009', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2009-league-of-legends', 'tag-7263d678abae');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-905e5537a901', 'tag-905e5537a901', '오픈 베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2009-league-of-legends', 'tag-905e5537a901');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-2a4213c5a4ca', 'game-2009-league-of-legends', 'League of Legends 공식 게임 소개', 'https://www.leagueoflegends.com/en-us/how-to-play/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-2e7534309c17', '/images/archive/games/2009-league-of-legends.png', '/images/archive/games/2009-league-of-legends.png', 'static', '2009-league-of-legends.png', 'image/png', 38285, 'League of Legends 대표 이미지', 'League of Legends contributors', 'https://en.wikipedia.org/wiki/League_of_Legends', '역사 기록용 · 이미지별 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2009-league-of-legends', 'media-2e7534309c17', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-2a4213c5a4ca', 'game-2009-league-of-legends', 2, '{"name":"League of Legends","summary":"무료 플레이와 꾸준한 업데이트, 지역 리그를 결합해 세계 최대 e스포츠 중 하나가 된 MOBA","description":"League of Legends는 다섯 명이 역할을 나눠 상대 기지를 파괴하는 팀 전략 게임입니다. 무료 플레이와 계속 추가되는 챔피언, 짧고 반복 가능한 경기 구조를 바탕으로 세계 각지의 서버와 프로 리그를 성장시켰습니다.","specs":{"개발사":"Riot Games","장르":"MOBA","플랫폼":"Windows, Mac OS","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"게임 업데이트, 방송, 지역 리그와 세계대회를 하나의 장기 생태계로 묶어 라이브 서비스와 e스포츠 운영의 새로운 표준을 만들었습니다.","legacy":"게임을 넘어 음악, 애니메이션, 다른 장르의 작품으로 세계관을 확장하며 하나의 글로벌 엔터테인먼트 IP로 남아 있습니다."},"source":{"label":"League of Legends 공식 게임 소개","url":"https://www.leagueoflegends.com/en-us/how-to-play/"},"image":{"src":"/images/archive/games/2009-league-of-legends.png","alt":"League of Legends 대표 이미지","credit":"League of Legends contributors","sourceUrl":"https://en.wikipedia.org/wiki/League_of_Legends","license":"역사 기록용 · 이미지별 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-cb638148d3e7', 'brand-cb638148d3e7', 'Wargaming', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2010-world-of-tanks', 'game', 'world-of-tanks', 'World of Tanks', '전차 전투의 대중화', '짧은 팀 대전과 수백 종의 전차 수집을 결합해 글로벌 무료 게임 시장을 넓힌 작품', 'World of Tanks는 서로 다른 국가와 시대의 전차를 선택해 팀 단위 전투를 벌이는 온라인 액션 게임입니다. 조작은 비교적 단순하게 만들면서 장갑과 관통, 위치 선정의 깊이를 남겨 역사 소재를 대중적인 경쟁 게임으로 바꿨습니다.', 2010, NULL, 'brand-cb638148d3e7', 'category-game', '#6e745a', 'published', 'verified', 0, '{"highlights":["2010년 공개 테스트","팀 기반 전차 전투","글로벌 무료 플레이 성공"],"specs":{"개발사":"Wargaming","장르":"차량 전투 MMO","플랫폼":"Windows","공개 단계":"오픈 베타·CIS 출시"},"story":{"significance":"무료 플레이, 짧은 세션, 장기적인 차량 연구를 결합한 운영으로 동유럽 개발사의 게임이 세계 시장을 장악할 수 있음을 보여줬습니다.","legacy":"콘솔과 모바일, 다른 함선·항공 전투 작품으로 확장됐으며 차량 수집형 온라인 게임의 대표적인 모델로 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2010-world-of-tanks', 2010, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2010-world-of-tanks', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-cf0b09eef416', 'tag-cf0b09eef416', '차량 전투 MMO', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2010-world-of-tanks', 'tag-cf0b09eef416');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-cb638148d3e7', 'tag-cb638148d3e7', 'Wargaming', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2010-world-of-tanks', 'tag-cb638148d3e7');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-e22cd461c068', 'tag-e22cd461c068', '2010', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2010-world-of-tanks', 'tag-e22cd461c068');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6aafb76593a9', 'tag-6aafb76593a9', '오픈 베타·CIS 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2010-world-of-tanks', 'tag-6aafb76593a9');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-9a2f4e7c512d', 'game-2010-world-of-tanks', 'Wargaming 공식 20주년 기록', 'https://worldoftanks.eu/en/news/general-news/wargaming-20th-anniversary/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8423d660cb97', '/images/archive/games/2010-world-of-tanks.jpg', '/images/archive/games/2010-world-of-tanks.jpg', 'static', '2010-world-of-tanks.jpg', 'image/jpeg', 57956, 'World of Tanks 공식 Steam 대표 이미지', 'World of Tanks publisher / Steam', 'https://store.steampowered.com/app/1407200/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2010-world-of-tanks', 'media-8423d660cb97', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-9a2f4e7c512d', 'game-2010-world-of-tanks', 2, '{"name":"World of Tanks","summary":"짧은 팀 대전과 수백 종의 전차 수집을 결합해 글로벌 무료 게임 시장을 넓힌 작품","description":"World of Tanks는 서로 다른 국가와 시대의 전차를 선택해 팀 단위 전투를 벌이는 온라인 액션 게임입니다. 조작은 비교적 단순하게 만들면서 장갑과 관통, 위치 선정의 깊이를 남겨 역사 소재를 대중적인 경쟁 게임으로 바꿨습니다.","specs":{"개발사":"Wargaming","장르":"차량 전투 MMO","플랫폼":"Windows","공개 단계":"오픈 베타·CIS 출시"},"story":{"significance":"무료 플레이, 짧은 세션, 장기적인 차량 연구를 결합한 운영으로 동유럽 개발사의 게임이 세계 시장을 장악할 수 있음을 보여줬습니다.","legacy":"콘솔과 모바일, 다른 함선·항공 전투 작품으로 확장됐으며 차량 수집형 온라인 게임의 대표적인 모델로 남아 있습니다."},"source":{"label":"Wargaming 공식 20주년 기록","url":"https://worldoftanks.eu/en/news/general-news/wargaming-20th-anniversary/"},"image":{"src":"/images/archive/games/2010-world-of-tanks.jpg","alt":"World of Tanks 공식 Steam 대표 이미지","credit":"World of Tanks publisher / Steam","sourceUrl":"https://store.steampowered.com/app/1407200/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-723ba985328e', 'brand-723ba985328e', 'Mojang', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2011-minecraft', 'game', 'minecraft', 'Minecraft', '블록으로 만드는 무한한 세계', '채집과 건축, 생존을 단순한 블록으로 엮어 전 세계의 창작 도구가 된 샌드박스', 'Minecraft는 블록으로 이루어진 세계에서 자원을 모으고 집과 기계를 만들며 살아가는 샌드박스 게임입니다. 정해진 목표보다 이용자의 상상과 공유를 중심에 두어 어린이부터 전문 창작자까지 각자의 놀이를 만들게 했습니다.', 2011, NULL, 'brand-723ba985328e', 'category-game', '#5d7f45', 'published', 'verified', 1, '{"highlights":["2011년 1.0 정식 공개","절차 생성 블록 세계","창작·교육·영상 문화"],"specs":{"개발사":"Mojang","장르":"샌드박스","플랫폼":"Windows, Mac OS, Linux","공개 단계":"베타 종료·1.0 출시"},"story":{"significance":"개발 중 버전을 판매하고 이용자 반응으로 계속 발전시키는 방식과 영상·모드 커뮤니티의 결합은 독립 게임 유통의 흐름을 바꿨습니다.","legacy":"교육용 버전, 대형 서버, 영상 콘텐츠와 공식 마켓으로 확장돼 게임이면서 동시에 제작 도구이자 사회적 공간으로 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2011-minecraft', 2011, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2011-minecraft', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-98f287b3e980', 'tag-98f287b3e980', '샌드박스', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2011-minecraft', 'tag-98f287b3e980');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-723ba985328e', 'tag-723ba985328e', 'Mojang', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2011-minecraft', 'tag-723ba985328e');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-32a70a32da27', 'tag-32a70a32da27', '2011', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2011-minecraft', 'tag-32a70a32da27');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ee2560a222f0', 'tag-ee2560a222f0', '베타 종료·1.0 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2011-minecraft', 'tag-ee2560a222f0');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-0aabf0e68980', 'game-2011-minecraft', 'Xbox Wire Minecraft 15주년 기록', 'https://news.xbox.com/en-us/2024/05/17/minecraft-15-years-most-important-moments/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-f4ce6b7b2862', '/images/archive/milestones/2011-minecraft-1-0-commons.png', '/images/archive/milestones/2011-minecraft-1-0-commons.png', 'static', '2011-minecraft-1-0-commons.png', 'image/png', 20618, 'Minecraft 대표 이미지', 'Minecraft publisher', '/images/archive/milestones/2011-minecraft-1-0-commons.png', '역사 기록용 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2011-minecraft', 'media-f4ce6b7b2862', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-0aabf0e68980', 'game-2011-minecraft', 2, '{"name":"Minecraft","summary":"채집과 건축, 생존을 단순한 블록으로 엮어 전 세계의 창작 도구가 된 샌드박스","description":"Minecraft는 블록으로 이루어진 세계에서 자원을 모으고 집과 기계를 만들며 살아가는 샌드박스 게임입니다. 정해진 목표보다 이용자의 상상과 공유를 중심에 두어 어린이부터 전문 창작자까지 각자의 놀이를 만들게 했습니다.","specs":{"개발사":"Mojang","장르":"샌드박스","플랫폼":"Windows, Mac OS, Linux","공개 단계":"베타 종료·1.0 출시"},"story":{"significance":"개발 중 버전을 판매하고 이용자 반응으로 계속 발전시키는 방식과 영상·모드 커뮤니티의 결합은 독립 게임 유통의 흐름을 바꿨습니다.","legacy":"교육용 버전, 대형 서버, 영상 콘텐츠와 공식 마켓으로 확장돼 게임이면서 동시에 제작 도구이자 사회적 공간으로 남아 있습니다."},"source":{"label":"Xbox Wire Minecraft 15주년 기록","url":"https://news.xbox.com/en-us/2024/05/17/minecraft-15-years-most-important-moments/"},"image":{"src":"/images/archive/milestones/2011-minecraft-1-0-commons.png","alt":"Minecraft 대표 이미지","credit":"Minecraft publisher","sourceUrl":"/images/archive/milestones/2011-minecraft-1-0-commons.png","license":"역사 기록용 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-62a1ee25c03b', 'brand-62a1ee25c03b', 'Blizzard Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2012-diablo-iii', 'game', 'diablo-iii', 'Diablo III', '액션 RPG의 온라인 전환', '빠른 전투와 온라인 기반 운영으로 대규모 이용자를 다시 던전 파밍에 모은 액션 RPG', 'Diablo III는 전작의 전리품 수집과 캐릭터 빌드를 더 빠른 전투와 온라인 환경으로 옮긴 액션 RPG입니다. 2012년 공개 베타와 세계 동시 출시는 장르의 높은 기대를 보여줬고, 이후 업데이트를 통해 성장 구조를 크게 재정비했습니다.', 2012, NULL, 'brand-62a1ee25c03b', 'category-game', '#8f352d', 'published', 'verified', 0, '{"highlights":["2012년 공개 베타","온라인 협동 액션 RPG","시즌·균열 중심 장기 운영"],"specs":{"개발사":"Blizzard Entertainment","장르":"액션 RPG","플랫폼":"Windows, Mac OS","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"대형 패키지 게임이 출시 이후 시스템을 지속적으로 바꾸고 확장팩과 시즌으로 장기 운영되는 과정을 대표적으로 보여줬습니다.","legacy":"모험 모드와 시즌 여정, 균열 중심 파밍은 후속 액션 RPG의 반복 콘텐츠와 라이브 운영 방식에 직접 이어졌습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2012-diablo-iii', 2012, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2012-diablo-iii', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-b126977fd737', 'tag-b126977fd737', '액션 RPG', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2012-diablo-iii', 'tag-b126977fd737');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-62a1ee25c03b', 'tag-62a1ee25c03b', 'Blizzard Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2012-diablo-iii', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-084b3af47af3', 'tag-084b3af47af3', '2012', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2012-diablo-iii', 'tag-084b3af47af3');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-905e5537a901', 'tag-905e5537a901', '오픈 베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2012-diablo-iii', 'tag-905e5537a901');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-5ec607dc59a3', 'game-2012-diablo-iii', 'Blizzard 공식 출시 발표', 'https://news.blizzard.com/en-gb/article/10039616/diablo-iii-launching-may-15-digital-pre-sales-now-open', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-91a2b6f6e662', '/images/archive/games/2012-diablo-iii.png', '/images/archive/games/2012-diablo-iii.png', 'static', '2012-diablo-iii.png', 'image/png', 2354869, 'Diablo III 대표 이미지', 'Diablo III publisher', 'https://en.wikipedia.org/wiki/Diablo_III', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2012-diablo-iii', 'media-91a2b6f6e662', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-5ec607dc59a3', 'game-2012-diablo-iii', 2, '{"name":"Diablo III","summary":"빠른 전투와 온라인 기반 운영으로 대규모 이용자를 다시 던전 파밍에 모은 액션 RPG","description":"Diablo III는 전작의 전리품 수집과 캐릭터 빌드를 더 빠른 전투와 온라인 환경으로 옮긴 액션 RPG입니다. 2012년 공개 베타와 세계 동시 출시는 장르의 높은 기대를 보여줬고, 이후 업데이트를 통해 성장 구조를 크게 재정비했습니다.","specs":{"개발사":"Blizzard Entertainment","장르":"액션 RPG","플랫폼":"Windows, Mac OS","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"대형 패키지 게임이 출시 이후 시스템을 지속적으로 바꾸고 확장팩과 시즌으로 장기 운영되는 과정을 대표적으로 보여줬습니다.","legacy":"모험 모드와 시즌 여정, 균열 중심 파밍은 후속 액션 RPG의 반복 콘텐츠와 라이브 운영 방식에 직접 이어졌습니다."},"source":{"label":"Blizzard 공식 출시 발표","url":"https://news.blizzard.com/en-gb/article/10039616/diablo-iii-launching-may-15-digital-pre-sales-now-open"},"image":{"src":"/images/archive/games/2012-diablo-iii.png","alt":"Diablo III 대표 이미지","credit":"Diablo III publisher","sourceUrl":"https://en.wikipedia.org/wiki/Diablo_III","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-986d2de2ea6d', 'brand-986d2de2ea6d', 'Valve', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2013-dota-2', 'game', 'dota-2', 'Dota 2', '커뮤니티와 상금이 키운 MOBA', '깊은 팀 전략과 Steam 생태계, 대규모 국제대회로 경쟁 게임의 규모를 확장한 MOBA', 'Dota 2는 각기 다른 영웅을 선택한 두 팀이 복잡한 지형과 자원, 아이템을 활용해 상대 본진을 무너뜨리는 MOBA입니다. 긴 베타 기간 동안 커뮤니티와 함께 완성도를 높이고 Steam을 통해 세계에 무료로 배포됐습니다.', 2013, NULL, 'brand-986d2de2ea6d', 'category-game', '#a44334', 'published', 'verified', 0, '{"highlights":["2년간의 공개 베타","The International","Steam 기반 무료 MOBA"],"specs":{"개발사":"Valve","장르":"MOBA","플랫폼":"Windows, Mac OS, Linux","공개 단계":"베타 종료·정식 출시"},"story":{"significance":"게임 안에서 대회 상금을 공동 조성하는 방식과 관전 기능을 결합해 e스포츠가 게임 서비스 자체와 함께 성장할 수 있음을 보여줬습니다.","legacy":"매년 열리는 The International과 커뮤니티 제작 콘텐츠, 계속 변화하는 메타를 통해 가장 깊이 있는 경쟁 게임 중 하나로 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2013-dota-2', 2013, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2013-dota-2', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ede4db75f81b', 'tag-ede4db75f81b', 'MOBA', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2013-dota-2', 'tag-ede4db75f81b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-986d2de2ea6d', 'tag-986d2de2ea6d', 'Valve', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2013-dota-2', 'tag-986d2de2ea6d');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d08b10a32612', 'tag-d08b10a32612', '2013', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2013-dota-2', 'tag-d08b10a32612');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-bc6c0e7c7e5e', 'tag-bc6c0e7c7e5e', '베타 종료·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2013-dota-2', 'tag-bc6c0e7c7e5e');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-2a308013f80c', 'game-2013-dota-2', 'Steam 공식 제품 페이지', 'https://store.steampowered.com/app/570/Dota_2/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-3f3e852441fd', '/images/archive/games/2013-dota-2.jpg', '/images/archive/games/2013-dota-2.jpg', 'static', '2013-dota-2.jpg', 'image/jpeg', 37878, 'Dota 2 공식 Steam 대표 이미지', 'Dota 2 publisher / Steam', 'https://store.steampowered.com/app/570/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2013-dota-2', 'media-3f3e852441fd', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-2a308013f80c', 'game-2013-dota-2', 2, '{"name":"Dota 2","summary":"깊은 팀 전략과 Steam 생태계, 대규모 국제대회로 경쟁 게임의 규모를 확장한 MOBA","description":"Dota 2는 각기 다른 영웅을 선택한 두 팀이 복잡한 지형과 자원, 아이템을 활용해 상대 본진을 무너뜨리는 MOBA입니다. 긴 베타 기간 동안 커뮤니티와 함께 완성도를 높이고 Steam을 통해 세계에 무료로 배포됐습니다.","specs":{"개발사":"Valve","장르":"MOBA","플랫폼":"Windows, Mac OS, Linux","공개 단계":"베타 종료·정식 출시"},"story":{"significance":"게임 안에서 대회 상금을 공동 조성하는 방식과 관전 기능을 결합해 e스포츠가 게임 서비스 자체와 함께 성장할 수 있음을 보여줬습니다.","legacy":"매년 열리는 The International과 커뮤니티 제작 콘텐츠, 계속 변화하는 메타를 통해 가장 깊이 있는 경쟁 게임 중 하나로 남아 있습니다."},"source":{"label":"Steam 공식 제품 페이지","url":"https://store.steampowered.com/app/570/Dota_2/"},"image":{"src":"/images/archive/games/2013-dota-2.jpg","alt":"Dota 2 공식 Steam 대표 이미지","credit":"Dota 2 publisher / Steam","sourceUrl":"https://store.steampowered.com/app/570/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-62a1ee25c03b', 'brand-62a1ee25c03b', 'Blizzard Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2014-hearthstone', 'game', 'hearthstone', 'Hearthstone', '카드 게임을 터치 화면으로', '짧은 경기와 직관적인 연출로 디지털 수집형 카드 게임을 대중화한 작품', 'Hearthstone은 Warcraft 세계의 캐릭터와 주문을 카드로 구성해 대전하는 디지털 카드 게임입니다. 복잡한 계산을 자동 처리하고 명확한 애니메이션과 짧은 경기 시간을 제공해 카드 게임 경험을 PC와 태블릿, 휴대전화로 넓혔습니다.', 2014, NULL, 'brand-62a1ee25c03b', 'category-game', '#c78b36', 'published', 'verified', 0, '{"highlights":["2014년 오픈 베타","모바일 친화적 카드 대전","디지털 CCG 대중화"],"specs":{"개발사":"Blizzard Entertainment","장르":"디지털 카드 게임","플랫폼":"Windows, Mac OS, iOS, Android","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"무료 진입, 카드 팩, 정기 확장팩과 랭크전을 결합한 운영은 이후 수많은 디지털 카드 게임이 따르는 사업·콘텐츠 구조가 됐습니다.","legacy":"본편뿐 아니라 Battlegrounds 같은 새로운 모드를 더하며 하나의 클라이언트 안에서 카드 기반 전략 경험을 계속 확장하고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2014-hearthstone', 2014, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2014-hearthstone', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-06329565c2a2', 'tag-06329565c2a2', '디지털 카드 게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2014-hearthstone', 'tag-06329565c2a2');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-62a1ee25c03b', 'tag-62a1ee25c03b', 'Blizzard Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2014-hearthstone', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-39e21432a7dc', 'tag-39e21432a7dc', '2014', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2014-hearthstone', 'tag-39e21432a7dc');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-905e5537a901', 'tag-905e5537a901', '오픈 베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2014-hearthstone', 'tag-905e5537a901');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-93464b7ba648', 'game-2014-hearthstone', 'Hearthstone 공식 오픈 베타 발표', 'https://hearthstone.blizzard.com/en-gb/blog/12440010/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-c23673b0296e', '/images/archive/games/2014-hearthstone.png', '/images/archive/games/2014-hearthstone.png', 'static', '2014-hearthstone.png', 'image/png', 894390, 'Hearthstone 대표 이미지', 'Hearthstone publisher', 'https://en.wikipedia.org/wiki/Hearthstone', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2014-hearthstone', 'media-c23673b0296e', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-93464b7ba648', 'game-2014-hearthstone', 2, '{"name":"Hearthstone","summary":"짧은 경기와 직관적인 연출로 디지털 수집형 카드 게임을 대중화한 작품","description":"Hearthstone은 Warcraft 세계의 캐릭터와 주문을 카드로 구성해 대전하는 디지털 카드 게임입니다. 복잡한 계산을 자동 처리하고 명확한 애니메이션과 짧은 경기 시간을 제공해 카드 게임 경험을 PC와 태블릿, 휴대전화로 넓혔습니다.","specs":{"개발사":"Blizzard Entertainment","장르":"디지털 카드 게임","플랫폼":"Windows, Mac OS, iOS, Android","공개 단계":"오픈 베타·정식 출시"},"story":{"significance":"무료 진입, 카드 팩, 정기 확장팩과 랭크전을 결합한 운영은 이후 수많은 디지털 카드 게임이 따르는 사업·콘텐츠 구조가 됐습니다.","legacy":"본편뿐 아니라 Battlegrounds 같은 새로운 모드를 더하며 하나의 클라이언트 안에서 카드 기반 전략 경험을 계속 확장하고 있습니다."},"source":{"label":"Hearthstone 공식 오픈 베타 발표","url":"https://hearthstone.blizzard.com/en-gb/blog/12440010/"},"image":{"src":"/images/archive/games/2014-hearthstone.png","alt":"Hearthstone 대표 이미지","credit":"Hearthstone publisher","sourceUrl":"https://en.wikipedia.org/wiki/Hearthstone","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-6292a7d59f57', 'brand-6292a7d59f57', 'Psyonix', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2015-rocket-league', 'game', 'rocket-league', 'Rocket League', '자동차로 하는 축구', '한 문장으로 이해되는 규칙과 높은 숙련도를 결합해 세계적인 경쟁 스포츠가 된 작품', 'Rocket League는 로켓 엔진을 단 자동차로 거대한 공을 상대 골문에 넣는 스포츠 액션 게임입니다. 규칙은 즉시 이해할 수 있지만 공중 조작과 팀 전술의 깊이가 커서 친구와 즐기는 파티 게임과 전문 e스포츠를 동시에 만족시켰습니다.', 2015, NULL, 'brand-6292a7d59f57', 'category-game', '#267db8', 'published', 'verified', 0, '{"highlights":["자동차와 축구의 결합","짧고 깊은 경쟁전","크로스 플랫폼 e스포츠"],"specs":{"개발사":"Psyonix","장르":"스포츠 액션","플랫폼":"Windows, PlayStation 4","공개 단계":"베타·정식 출시"},"story":{"significance":"단순한 핵심 규칙, 짧은 경기, 높은 실력 상한이라는 조합이 새로운 경쟁 게임도 전통 스포츠처럼 관전되고 학습될 수 있음을 보여줬습니다.","legacy":"무료 플레이 전환과 크로스 플랫폼 경쟁, 글로벌 리그를 통해 여러 기기의 이용자가 함께하는 스포츠형 라이브 서비스로 발전했습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2015-rocket-league', 2015, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2015-rocket-league', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-80f0c141df76', 'tag-80f0c141df76', '스포츠 액션', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2015-rocket-league', 'tag-80f0c141df76');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6292a7d59f57', 'tag-6292a7d59f57', 'Psyonix', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2015-rocket-league', 'tag-6292a7d59f57');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9cdda67ded3f', 'tag-9cdda67ded3f', '2015', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2015-rocket-league', 'tag-9cdda67ded3f');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-42a9b121cc2a', 'tag-42a9b121cc2a', '베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2015-rocket-league', 'tag-42a9b121cc2a');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-1568f19df81d', 'game-2015-rocket-league', 'Rocket League 공식 기념 기록', 'https://www.rocketleague.com/news/rocket-league-anniversary-update-july-5?lang=en', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-d8380b2ecfdf', '/images/archive/games/2015-rocket-league.jpg', '/images/archive/games/2015-rocket-league.jpg', 'static', '2015-rocket-league.jpg', 'image/jpeg', 62028, 'Rocket League 공식 Steam 대표 이미지', 'Rocket League publisher / Steam', 'https://store.steampowered.com/app/252950/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2015-rocket-league', 'media-d8380b2ecfdf', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-1568f19df81d', 'game-2015-rocket-league', 2, '{"name":"Rocket League","summary":"한 문장으로 이해되는 규칙과 높은 숙련도를 결합해 세계적인 경쟁 스포츠가 된 작품","description":"Rocket League는 로켓 엔진을 단 자동차로 거대한 공을 상대 골문에 넣는 스포츠 액션 게임입니다. 규칙은 즉시 이해할 수 있지만 공중 조작과 팀 전술의 깊이가 커서 친구와 즐기는 파티 게임과 전문 e스포츠를 동시에 만족시켰습니다.","specs":{"개발사":"Psyonix","장르":"스포츠 액션","플랫폼":"Windows, PlayStation 4","공개 단계":"베타·정식 출시"},"story":{"significance":"단순한 핵심 규칙, 짧은 경기, 높은 실력 상한이라는 조합이 새로운 경쟁 게임도 전통 스포츠처럼 관전되고 학습될 수 있음을 보여줬습니다.","legacy":"무료 플레이 전환과 크로스 플랫폼 경쟁, 글로벌 리그를 통해 여러 기기의 이용자가 함께하는 스포츠형 라이브 서비스로 발전했습니다."},"source":{"label":"Rocket League 공식 기념 기록","url":"https://www.rocketleague.com/news/rocket-league-anniversary-update-july-5?lang=en"},"image":{"src":"/images/archive/games/2015-rocket-league.jpg","alt":"Rocket League 공식 Steam 대표 이미지","credit":"Rocket League publisher / Steam","sourceUrl":"https://store.steampowered.com/app/252950/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-62a1ee25c03b', 'brand-62a1ee25c03b', 'Blizzard Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2016-overwatch', 'game', 'overwatch', 'Overwatch', '영웅이 된 팀 기반 FPS', '다양한 영웅과 역할 조합, 밝은 세계관으로 히어로 슈터를 세계적인 장르로 만든 작품', 'Overwatch는 고유한 무기와 기술을 가진 영웅을 골라 목표를 수행하는 팀 기반 FPS입니다. 조준 능력뿐 아니라 역할 조합과 궁극기 연계, 전장의 판단을 강조하며 서로 다른 플레이 성향의 이용자를 한 팀에 모았습니다.', 2016, NULL, 'brand-62a1ee25c03b', 'category-game', '#e69138', 'published', 'verified', 1, '{"highlights":["2016년 글로벌 오픈 베타","역할 기반 영웅 조합","히어로 슈터 대중화"],"specs":{"개발사":"Blizzard Entertainment","장르":"히어로 슈터","플랫폼":"Windows, PlayStation 4, Xbox One","공개 단계":"글로벌 오픈 베타·정식 출시"},"story":{"significance":"2016년 글로벌 오픈 베타로 대중의 관심을 집중시키고 캐릭터 중심 서사와 경쟁 슈팅을 결합해 히어로 슈터의 전성기를 열었습니다.","legacy":"후속작 Overwatch 2로 서비스가 전환됐으며 역할 고정, 시즌 콘텐츠, 캐릭터 중심 라이브 운영은 여러 팀 기반 게임에 영향을 줬습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2016-overwatch', 2016, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2016-overwatch', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d9acfeb209bb', 'tag-d9acfeb209bb', '히어로 슈터', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2016-overwatch', 'tag-d9acfeb209bb');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-62a1ee25c03b', 'tag-62a1ee25c03b', 'Blizzard Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2016-overwatch', 'tag-62a1ee25c03b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ab39c5423911', 'tag-ab39c5423911', '2016', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2016-overwatch', 'tag-ab39c5423911');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-19145ce1f653', 'tag-19145ce1f653', '글로벌 오픈 베타·정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2016-overwatch', 'tag-19145ce1f653');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-edf8c922bf06', 'game-2016-overwatch', 'Overwatch 공식 오픈 베타 발표', 'https://overwatch.blizzard.com/blog/20100169/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-44cff75035cd', '/images/archive/games/2016-overwatch.png', '/images/archive/games/2016-overwatch.png', 'static', '2016-overwatch.png', 'image/png', 85081, 'Overwatch 대표 이미지', 'Overwatch publisher', 'https://clipartcraft.com/explore/overwatch-logo-transparent-high-resolution/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2016-overwatch', 'media-44cff75035cd', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-edf8c922bf06', 'game-2016-overwatch', 2, '{"name":"Overwatch","summary":"다양한 영웅과 역할 조합, 밝은 세계관으로 히어로 슈터를 세계적인 장르로 만든 작품","description":"Overwatch는 고유한 무기와 기술을 가진 영웅을 골라 목표를 수행하는 팀 기반 FPS입니다. 조준 능력뿐 아니라 역할 조합과 궁극기 연계, 전장의 판단을 강조하며 서로 다른 플레이 성향의 이용자를 한 팀에 모았습니다.","specs":{"개발사":"Blizzard Entertainment","장르":"히어로 슈터","플랫폼":"Windows, PlayStation 4, Xbox One","공개 단계":"글로벌 오픈 베타·정식 출시"},"story":{"significance":"2016년 글로벌 오픈 베타로 대중의 관심을 집중시키고 캐릭터 중심 서사와 경쟁 슈팅을 결합해 히어로 슈터의 전성기를 열었습니다.","legacy":"후속작 Overwatch 2로 서비스가 전환됐으며 역할 고정, 시즌 콘텐츠, 캐릭터 중심 라이브 운영은 여러 팀 기반 게임에 영향을 줬습니다."},"source":{"label":"Overwatch 공식 오픈 베타 발표","url":"https://overwatch.blizzard.com/blog/20100169/"},"image":{"src":"/images/archive/games/2016-overwatch.png","alt":"Overwatch 대표 이미지","credit":"Overwatch publisher","sourceUrl":"https://clipartcraft.com/explore/overwatch-logo-transparent-high-resolution/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-78bfbf99825a', 'brand-78bfbf99825a', 'Epic Games', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2017-fortnite-battle-royale', 'game', 'fortnite-battle-royale', 'Fortnite Battle Royale', '게임 안에 모인 대중문화', '건축과 100인 생존, 빠른 시즌 변화를 결합해 세계적인 문화 플랫폼이 된 배틀로얄', 'Fortnite Battle Royale은 100명이 한 섬에서 자원을 모으고 건축하며 마지막 생존자가 되는 게임입니다. 무료 공개와 밝은 미술, 짧은 시즌마다 바뀌는 지도와 협업 이벤트를 통해 게임을 계속 방문하는 문화 공간으로 만들었습니다.', 2017, NULL, 'brand-78bfbf99825a', 'category-game', '#6d63cb', 'published', 'verified', 1, '{"highlights":["2017년 무료 공개","건축이 결합된 배틀로얄","시즌·공연·브랜드 협업"],"specs":{"개발사":"Epic Games","장르":"배틀로얄","플랫폼":"Windows, Mac, PlayStation 4, Xbox One","공개 단계":"무료 얼리 액세스"},"story":{"significance":"배틀패스, 시즌 서사, 유명 브랜드와 공연을 게임 안에 결합해 라이브 서비스가 콘텐츠 유통과 사회적 만남의 플랫폼이 될 수 있음을 보여줬습니다.","legacy":"배틀로얄을 넘어 LEGO, 레이싱, 음악과 사용자 제작 경험이 공존하는 플랫폼으로 확장되며 게임의 경계를 계속 넓히고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2017-fortnite-battle-royale', 2017, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2017-fortnite-battle-royale', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-28a92ee73309', 'tag-28a92ee73309', '배틀로얄', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2017-fortnite-battle-royale', 'tag-28a92ee73309');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-78bfbf99825a', 'tag-78bfbf99825a', 'Epic Games', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2017-fortnite-battle-royale', 'tag-78bfbf99825a');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-04e8696e6424', 'tag-04e8696e6424', '2017', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2017-fortnite-battle-royale', 'tag-04e8696e6424');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-7200f08bbb83', 'tag-7200f08bbb83', '무료 얼리 액세스', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2017-fortnite-battle-royale', 'tag-7200f08bbb83');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-fd8369da8663', 'game-2017-fortnite-battle-royale', 'Epic Games 무료 공개 발표', 'https://www.fortnite.com/news/fortnite-battle-royale-goes-free?lang=en-US', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-8fd7cf554974', '/images/archive/milestones/2017-fortnite-mark.svg', '/images/archive/milestones/2017-fortnite-mark.svg', 'static', '2017-fortnite-mark.svg', 'image/svg+xml', 202, 'Fortnite Battle Royale 대표 이미지', 'Fortnite Battle Royale publisher', '/images/archive/milestones/2017-fortnite-mark.svg', '역사 기록용 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2017-fortnite-battle-royale', 'media-8fd7cf554974', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-fd8369da8663', 'game-2017-fortnite-battle-royale', 2, '{"name":"Fortnite Battle Royale","summary":"건축과 100인 생존, 빠른 시즌 변화를 결합해 세계적인 문화 플랫폼이 된 배틀로얄","description":"Fortnite Battle Royale은 100명이 한 섬에서 자원을 모으고 건축하며 마지막 생존자가 되는 게임입니다. 무료 공개와 밝은 미술, 짧은 시즌마다 바뀌는 지도와 협업 이벤트를 통해 게임을 계속 방문하는 문화 공간으로 만들었습니다.","specs":{"개발사":"Epic Games","장르":"배틀로얄","플랫폼":"Windows, Mac, PlayStation 4, Xbox One","공개 단계":"무료 얼리 액세스"},"story":{"significance":"배틀패스, 시즌 서사, 유명 브랜드와 공연을 게임 안에 결합해 라이브 서비스가 콘텐츠 유통과 사회적 만남의 플랫폼이 될 수 있음을 보여줬습니다.","legacy":"배틀로얄을 넘어 LEGO, 레이싱, 음악과 사용자 제작 경험이 공존하는 플랫폼으로 확장되며 게임의 경계를 계속 넓히고 있습니다."},"source":{"label":"Epic Games 무료 공개 발표","url":"https://www.fortnite.com/news/fortnite-battle-royale-goes-free?lang=en-US"},"image":{"src":"/images/archive/milestones/2017-fortnite-mark.svg","alt":"Fortnite Battle Royale 대표 이미지","credit":"Fortnite Battle Royale publisher","sourceUrl":"/images/archive/milestones/2017-fortnite-mark.svg","license":"역사 기록용 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-4754765d9648', 'brand-4754765d9648', 'Innersloth', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2018-among-us', 'game', 'among-us', 'Among Us', '대화가 곧 플레이', '간단한 임무와 거짓말, 추리를 결합해 스트리밍 시대의 세계적 놀이가 된 게임', 'Among Us는 우주선의 승무원 사이에 숨어든 임포스터를 대화와 투표로 찾아내는 소셜 디덕션 게임입니다. 조작과 규칙은 단순하지만 사람의 말과 행동이 매번 다른 이야기를 만들어 친구 모임과 방송에 잘 어울렸습니다.', 2018, NULL, 'brand-4754765d9648', 'category-game', '#c94949', 'published', 'verified', 0, '{"highlights":["소셜 디덕션 대중화","스트리밍을 통한 역주행","3인 개발팀의 글로벌 성공"],"specs":{"개발사":"Innersloth","장르":"소셜 디덕션","플랫폼":"iOS, Android, Windows","공개 단계":"모바일 정식 출시"},"story":{"significance":"출시 당시보다 2020년 스트리밍과 팬 콘텐츠를 통해 폭발적으로 성장하며 작은 독립 게임도 커뮤니티가 발견하면 세계적 현상이 될 수 있음을 보여줬습니다.","legacy":"여러 플랫폼과 새로운 맵, 역할, 애니메이션으로 확장됐고 온라인에서 함께 말하고 의심하는 파티 게임의 대표작으로 남아 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2018-among-us', 2018, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2018-among-us', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-1cf15dd71d89', 'tag-1cf15dd71d89', '소셜 디덕션', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2018-among-us', 'tag-1cf15dd71d89');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4754765d9648', 'tag-4754765d9648', 'Innersloth', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2018-among-us', 'tag-4754765d9648');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-66efd9eefecf', 'tag-66efd9eefecf', '2018', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2018-among-us', 'tag-66efd9eefecf');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-6710c2c2bbbd', 'tag-6710c2c2bbbd', '모바일 정식 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2018-among-us', 'tag-6710c2c2bbbd');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-564e2e0d6c9f', 'game-2018-among-us', 'Innersloth 공식 프레스 키트', 'https://www.innersloth.com/press-kit-among-us/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-592c9c2d5b4c', '/images/archive/games/2018-among-us.jpg', '/images/archive/games/2018-among-us.jpg', 'static', '2018-among-us.jpg', 'image/jpeg', 38862, 'Among Us 공식 Steam 대표 이미지', 'Among Us publisher / Steam', 'https://store.steampowered.com/app/945360/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2018-among-us', 'media-592c9c2d5b4c', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-564e2e0d6c9f', 'game-2018-among-us', 2, '{"name":"Among Us","summary":"간단한 임무와 거짓말, 추리를 결합해 스트리밍 시대의 세계적 놀이가 된 게임","description":"Among Us는 우주선의 승무원 사이에 숨어든 임포스터를 대화와 투표로 찾아내는 소셜 디덕션 게임입니다. 조작과 규칙은 단순하지만 사람의 말과 행동이 매번 다른 이야기를 만들어 친구 모임과 방송에 잘 어울렸습니다.","specs":{"개발사":"Innersloth","장르":"소셜 디덕션","플랫폼":"iOS, Android, Windows","공개 단계":"모바일 정식 출시"},"story":{"significance":"출시 당시보다 2020년 스트리밍과 팬 콘텐츠를 통해 폭발적으로 성장하며 작은 독립 게임도 커뮤니티가 발견하면 세계적 현상이 될 수 있음을 보여줬습니다.","legacy":"여러 플랫폼과 새로운 맵, 역할, 애니메이션으로 확장됐고 온라인에서 함께 말하고 의심하는 파티 게임의 대표작으로 남아 있습니다."},"source":{"label":"Innersloth 공식 프레스 키트","url":"https://www.innersloth.com/press-kit-among-us/"},"image":{"src":"/images/archive/games/2018-among-us.jpg","alt":"Among Us 공식 Steam 대표 이미지","credit":"Among Us publisher / Steam","sourceUrl":"https://store.steampowered.com/app/945360/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-2cc69528d564', 'brand-2cc69528d564', 'Respawn Entertainment', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2019-apex-legends', 'game', 'apex-legends', 'Apex Legends', '분대 중심 배틀로얄', '영웅 능력과 부드러운 이동, 핑 시스템으로 팀 배틀로얄의 기준을 높인 작품', 'Apex Legends는 세 명이 분대를 이루고 각기 다른 능력을 가진 레전드로 싸우는 배틀로얄 FPS입니다. 사전 장기 홍보 없이 공개와 동시에 출시됐으며 빠른 이동과 부활, 음성 없이도 협력할 수 있는 정교한 핑 시스템으로 주목받았습니다.', 2019, NULL, 'brand-2cc69528d564', 'category-game', '#b24a3d', 'published', 'verified', 0, '{"highlights":["2019년 기습 글로벌 출시","분대와 영웅 능력","혁신적인 핑 시스템"],"specs":{"개발사":"Respawn Entertainment","장르":"배틀로얄 FPS","플랫폼":"Windows, PlayStation 4, Xbox One","공개 단계":"글로벌 기습 출시"},"story":{"significance":"캐릭터 역할과 배틀로얄을 자연스럽게 결합하고 접근성 높은 비언어 소통을 제시해 팀 기반 온라인 게임의 사용자 경험을 발전시켰습니다.","legacy":"지속적인 시즌과 e스포츠, 콘솔·PC 간 크로스 플레이를 통해 빠른 전투를 선호하는 대표 배틀로얄로 자리 잡았습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2019-apex-legends', 2019, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2019-apex-legends', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-8ceb0c45e51b', 'tag-8ceb0c45e51b', '배틀로얄 FPS', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2019-apex-legends', 'tag-8ceb0c45e51b');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-2cc69528d564', 'tag-2cc69528d564', 'Respawn Entertainment', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2019-apex-legends', 'tag-2cc69528d564');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-0c422ba64421', 'tag-0c422ba64421', '2019', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2019-apex-legends', 'tag-0c422ba64421');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-4bf4e2f11eb2', 'tag-4bf4e2f11eb2', '글로벌 기습 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2019-apex-legends', 'tag-4bf4e2f11eb2');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-5c42bd617229', 'game-2019-apex-legends', 'EA 공식 출시 발표', 'https://news.ea.com/press-releases/press-releases-details/2019/Respawn-Launches-Apex-Legends-a-Free-to-Play-Battle-Royale-Experience-Available-Now-on-PC-PS4-and-Xbox-One/default.aspx', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-0606e313e030', '/images/archive/games/2019-apex-legends.jpg', '/images/archive/games/2019-apex-legends.jpg', 'static', '2019-apex-legends.jpg', 'image/jpeg', 55418, 'Apex Legends 공식 Steam 대표 이미지', 'Apex Legends publisher / Steam', 'https://store.steampowered.com/app/1172470/', '상표·게임 아트 · 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2019-apex-legends', 'media-0606e313e030', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-5c42bd617229', 'game-2019-apex-legends', 2, '{"name":"Apex Legends","summary":"영웅 능력과 부드러운 이동, 핑 시스템으로 팀 배틀로얄의 기준을 높인 작품","description":"Apex Legends는 세 명이 분대를 이루고 각기 다른 능력을 가진 레전드로 싸우는 배틀로얄 FPS입니다. 사전 장기 홍보 없이 공개와 동시에 출시됐으며 빠른 이동과 부활, 음성 없이도 협력할 수 있는 정교한 핑 시스템으로 주목받았습니다.","specs":{"개발사":"Respawn Entertainment","장르":"배틀로얄 FPS","플랫폼":"Windows, PlayStation 4, Xbox One","공개 단계":"글로벌 기습 출시"},"story":{"significance":"캐릭터 역할과 배틀로얄을 자연스럽게 결합하고 접근성 높은 비언어 소통을 제시해 팀 기반 온라인 게임의 사용자 경험을 발전시켰습니다.","legacy":"지속적인 시즌과 e스포츠, 콘솔·PC 간 크로스 플레이를 통해 빠른 전투를 선호하는 대표 배틀로얄로 자리 잡았습니다."},"source":{"label":"EA 공식 출시 발표","url":"https://news.ea.com/press-releases/press-releases-details/2019/Respawn-Launches-Apex-Legends-a-Free-to-Play-Battle-Royale-Experience-Available-Now-on-PC-PS4-and-Xbox-One/default.aspx"},"image":{"src":"/images/archive/games/2019-apex-legends.jpg","alt":"Apex Legends 공식 Steam 대표 이미지","credit":"Apex Legends publisher / Steam","sourceUrl":"https://store.steampowered.com/app/1172470/","license":"상표·게임 아트 · 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
INSERT INTO brands (id, slug, name, description, status, created_at, updated_at) VALUES ('brand-9e995bee1ae0', 'brand-9e995bee1ae0', 'Riot Games', '', 'published', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, status='published', updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO content_items (id, type, slug, name, eyebrow, summary, body, start_year, end_year, brand_id, category_id, accent, status, quality_status, featured, metadata, content_version, verified_at, published_at, created_at, updated_at) VALUES ('game-2020-valorant', 'game', 'valorant', 'VALORANT', '전술 FPS와 영웅 능력의 결합', '정밀한 사격과 요원 능력, 글로벌 서버 인프라를 결합해 새로운 e스포츠 축이 된 FPS', 'VALORANT는 다섯 명이 공격과 수비로 나뉘어 정밀한 사격과 요원별 능력을 함께 사용하는 전술 FPS입니다. 2020년 스트리밍 연계 베타로 관심을 모은 뒤 낮은 지연 시간과 경쟁 무결성을 강조하며 세계 여러 지역에 출시됐습니다.', 2020, NULL, 'brand-9e995bee1ae0', 'category-game', '#d94f59', 'published', 'verified', 1, '{"highlights":["2020년 글로벌 베타","5대5 전술·요원 조합","VCT 글로벌 e스포츠"],"specs":{"개발사":"Riot Games","장르":"전술 히어로 FPS","플랫폼":"Windows","공개 단계":"클로즈드 베타·글로벌 출시"},"story":{"significance":"전통적인 전술 FPS의 명확한 교전과 히어로 게임의 능력 조합을 절제해 결합하고, 출시 초기부터 지역별 프로 리그를 설계했습니다.","legacy":"VCT와 Game Changers를 중심으로 글로벌 e스포츠를 확장했으며 콘솔 버전까지 더해 장기 경쟁 플랫폼으로 발전하고 있습니다."}}', 2, 1786492800000, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug, name=excluded.name, eyebrow=excluded.eyebrow, summary=excluded.summary, body=excluded.body, start_year=excluded.start_year, brand_id=excluded.brand_id, category_id='category-game', accent=excluded.accent, status='published', quality_status='verified', featured=excluded.featured, metadata=excluded.metadata, content_version=2, verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_years (content_id, year, sort_order) VALUES ('game-2020-valorant', 2020, 0);
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-d7fa83fc0493', 'tag-d7fa83fc0493', '게임', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2020-valorant', 'tag-d7fa83fc0493');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-fe9a2ef146cd', 'tag-fe9a2ef146cd', '전술 히어로 FPS', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2020-valorant', 'tag-fe9a2ef146cd');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-9e995bee1ae0', 'tag-9e995bee1ae0', 'Riot Games', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2020-valorant', 'tag-9e995bee1ae0');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-85568b20c331', 'tag-85568b20c331', '2020', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2020-valorant', 'tag-85568b20c331');
--> statement-breakpoint
INSERT INTO tags (id, slug, name, created_at, updated_at) VALUES ('tag-ef802e268072', 'tag-ef802e268072', '클로즈드 베타·글로벌 출시', 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET name=excluded.name, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_tags (content_id, tag_id) VALUES ('game-2020-valorant', 'tag-ef802e268072');
--> statement-breakpoint
INSERT INTO content_sources (id, content_id, label, url, source_type, is_primary, checked_at, created_at, updated_at) VALUES ('source-v03-e0af04ed2138', 'game-2020-valorant', 'Riot Games 공식 베타 발표', 'https://playvalorant.com/en-us/news/announcements/the-valorant-closed-beta-starts-april-7/', 'official', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET label=excluded.label, url=excluded.url, checked_at=excluded.checked_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT INTO media (id, object_key, public_url, storage_provider, filename, mime_type, byte_size, alt_text, credit, source_url, license, rights_status, attribution_required, verified_at, created_at, updated_at) VALUES ('media-07cb2a97f28b', '/images/archive/games/2020-valorant.png', '/images/archive/games/2020-valorant.png', 'static', '2020-valorant.png', 'image/png', 25591, 'VALORANT 대표 이미지', 'VALORANT contributors', 'https://en.wikipedia.org/wiki/Valorant', '역사 기록용 · 이미지별 원저작자 권리 보유', 'cleared', 1, 1786492800000, 1786492800000, 1786492800000) ON CONFLICT(id) DO UPDATE SET public_url=excluded.public_url, byte_size=excluded.byte_size, alt_text=excluded.alt_text, credit=excluded.credit, source_url=excluded.source_url, license=excluded.license, rights_status='cleared', verified_at=excluded.verified_at, updated_at=excluded.updated_at;
--> statement-breakpoint
INSERT OR IGNORE INTO content_media (content_id, media_id, role, sort_order) VALUES ('game-2020-valorant', 'media-07cb2a97f28b', 'hero', 0);
--> statement-breakpoint
INSERT OR IGNORE INTO content_revisions (id, content_id, version, snapshot, note, created_at) VALUES ('revision-v03-e0af04ed2138', 'game-2020-valorant', 2, '{"name":"VALORANT","summary":"정밀한 사격과 요원 능력, 글로벌 서버 인프라를 결합해 새로운 e스포츠 축이 된 FPS","description":"VALORANT는 다섯 명이 공격과 수비로 나뉘어 정밀한 사격과 요원별 능력을 함께 사용하는 전술 FPS입니다. 2020년 스트리밍 연계 베타로 관심을 모은 뒤 낮은 지연 시간과 경쟁 무결성을 강조하며 세계 여러 지역에 출시됐습니다.","specs":{"개발사":"Riot Games","장르":"전술 히어로 FPS","플랫폼":"Windows","공개 단계":"클로즈드 베타·글로벌 출시"},"story":{"significance":"전통적인 전술 FPS의 명확한 교전과 히어로 게임의 능력 조합을 절제해 결합하고, 출시 초기부터 지역별 프로 리그를 설계했습니다.","legacy":"VCT와 Game Changers를 중심으로 글로벌 e스포츠를 확장했으며 콘솔 버전까지 더해 장기 경쟁 플랫폼으로 발전하고 있습니다."},"source":{"label":"Riot Games 공식 베타 발표","url":"https://playvalorant.com/en-us/news/announcements/the-valorant-closed-beta-starts-april-7/"},"image":{"src":"/images/archive/games/2020-valorant.png","alt":"VALORANT 대표 이미지","credit":"VALORANT contributors","sourceUrl":"https://en.wikipedia.org/wiki/Valorant","license":"역사 기록용 · 이미지별 원저작자 권리 보유"}}', 'v0.3 global game archive', 1786492800000);
--> statement-breakpoint
UPDATE media SET object_key='/images/archive/milestones/2007-iphone.webp', public_url='/images/archive/milestones/2007-iphone.webp', filename='2007-iphone.webp', mime_type='image/webp', byte_size=32388, alt_text='2007년 Apple iPhone 전면과 후면 제품 이미지', credit='사용자 제공 이미지', source_url='', license='원저작자 권리 보유', rights_status='review', verified_at=NULL, updated_at=1786492800000 WHERE id IN (SELECT media_id FROM content_media WHERE content_id='milestone-2007-iphone' AND role='hero');
--> statement-breakpoint
PRAGMA optimize;
