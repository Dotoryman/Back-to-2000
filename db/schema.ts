import { index, integer, primaryKey, sqliteTable, text, uniqueIndex } from "drizzle-orm/sqlite-core";

const audit = {
  createdAt: integer("created_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
  updatedAt: integer("updated_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
};

export const brands = sqliteTable("brands", {
  id: text("id").primaryKey(),
  slug: text("slug").notNull(),
  name: text("name").notNull(),
  description: text("description").notNull().default(""),
  websiteUrl: text("website_url"),
  countryCode: text("country_code"),
  status: text("status", { enum: ["draft", "published", "archived"] }).notNull().default("draft"),
  ...audit,
}, (t) => [uniqueIndex("uq_brands_slug").on(t.slug), index("idx_brands_status_name").on(t.status, t.name)]);

export const eras = sqliteTable("eras", {
  id: text("id").primaryKey(),
  year: integer("year").notNull(),
  title: text("title").notNull(),
  summary: text("summary").notNull().default(""),
  accent: text("accent").notNull().default("#9bcbe2"),
  status: text("status", { enum: ["draft", "published"] }).notNull().default("draft"),
  ...audit,
}, (t) => [uniqueIndex("uq_eras_year").on(t.year), index("idx_eras_status_year").on(t.status, t.year)]);

export const categories = sqliteTable("categories", {
  id: text("id").primaryKey(),
  slug: text("slug").notNull(),
  name: text("name").notNull(),
  description: text("description").notNull().default(""),
  sortOrder: integer("sort_order").notNull().default(0),
  ...audit,
}, (t) => [uniqueIndex("uq_categories_slug").on(t.slug)]);

export const contentItems = sqliteTable("content_items", {
  id: text("id").primaryKey(),
  type: text("type", { enum: ["website", "phone", "product", "service", "event", "game", "program"] }).notNull(),
  slug: text("slug").notNull(),
  name: text("name").notNull(),
  eyebrow: text("eyebrow").notNull().default(""),
  summary: text("summary").notNull().default(""),
  body: text("body").notNull().default(""),
  startYear: integer("start_year").notNull(),
  endYear: integer("end_year"),
  brandId: text("brand_id").references(() => brands.id, { onDelete: "set null" }),
  categoryId: text("category_id").references(() => categories.id, { onDelete: "set null" }),
  accent: text("accent").notNull().default("#9bcbe2"),
  status: text("status", { enum: ["draft", "review", "published", "archived"] }).notNull().default("draft"),
  qualityStatus: text("quality_status", { enum: ["incomplete", "needs_review", "verified"] }).notNull().default("incomplete"),
  featured: integer("featured", { mode: "boolean" }).notNull().default(false),
  metadata: text("metadata", { mode: "json" }).$type<Record<string, unknown>>().notNull().default({}),
  contentVersion: integer("content_version").notNull().default(1),
  verifiedAt: integer("verified_at", { mode: "timestamp_ms" }),
  publishedAt: integer("published_at", { mode: "timestamp_ms" }),
  ...audit,
}, (t) => [
  uniqueIndex("uq_content_type_slug").on(t.type, t.slug),
  index("idx_content_year_status").on(t.startYear, t.status),
  index("idx_content_type_status_year").on(t.type, t.status, t.startYear),
  index("idx_content_quality_status").on(t.qualityStatus, t.status),
  index("idx_content_brand_id").on(t.brandId),
]);

export const contentYears = sqliteTable("content_years", {
  contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }),
  year: integer("year").notNull(),
  sortOrder: integer("sort_order").notNull().default(0),
}, (t) => [primaryKey({ columns: [t.contentId, t.year] }), index("idx_content_years_year").on(t.year, t.sortOrder)]);

export const media = sqliteTable("media", {
  id: text("id").primaryKey(),
  objectKey: text("object_key").notNull(),
  publicUrl: text("public_url"),
  storageProvider: text("storage_provider", { enum: ["static", "r2", "external"] }).notNull().default("r2"),
  filename: text("filename").notNull(),
  mimeType: text("mime_type").notNull(),
  byteSize: integer("byte_size").notNull(),
  width: integer("width"),
  height: integer("height"),
  altText: text("alt_text").notNull().default(""),
  credit: text("credit"),
  sourceUrl: text("source_url"),
  license: text("license"),
  rightsStatus: text("rights_status", { enum: ["unknown", "review", "cleared", "restricted"] }).notNull().default("review"),
  attributionRequired: integer("attribution_required", { mode: "boolean" }).notNull().default(true),
  verifiedAt: integer("verified_at", { mode: "timestamp_ms" }),
  ...audit,
}, (t) => [uniqueIndex("uq_media_object_key").on(t.objectKey), index("idx_media_rights_status").on(t.rightsStatus)]);

export const contentMedia = sqliteTable("content_media", {
  contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }),
  mediaId: text("media_id").notNull().references(() => media.id, { onDelete: "cascade" }),
  role: text("role", { enum: ["hero", "gallery", "thumbnail"] }).notNull().default("gallery"),
  sortOrder: integer("sort_order").notNull().default(0),
  caption: text("caption"),
}, (t) => [primaryKey({ columns: [t.contentId, t.mediaId, t.role] }), index("idx_content_media_content_role").on(t.contentId, t.role, t.sortOrder)]);

export const contentSources = sqliteTable("content_sources", {
  id: text("id").primaryKey(),
  contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }),
  label: text("label").notNull(),
  url: text("url").notNull(),
  sourceType: text("source_type", { enum: ["official", "archive", "reference", "community"] }).notNull().default("reference"),
  isPrimary: integer("is_primary", { mode: "boolean" }).notNull().default(false),
  checkedAt: integer("checked_at", { mode: "timestamp_ms" }),
  ...audit,
}, (t) => [index("idx_content_sources_content_primary").on(t.contentId, t.isPrimary)]);

export const galleries = sqliteTable("galleries", { id: text("id").primaryKey(), contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }), title: text("title").notNull(), sortOrder: integer("sort_order").notNull().default(0), ...audit }, (t) => [index("idx_galleries_content_id").on(t.contentId)]);
export const galleryMedia = sqliteTable("gallery_media", { galleryId: text("gallery_id").notNull().references(() => galleries.id, { onDelete: "cascade" }), mediaId: text("media_id").notNull().references(() => media.id, { onDelete: "cascade" }), sortOrder: integer("sort_order").notNull().default(0), caption: text("caption") }, (t) => [primaryKey({ columns: [t.galleryId, t.mediaId] })]);
export const websiteSnapshots = sqliteTable("website_snapshots", { id: text("id").primaryKey(), contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }), year: integer("year").notNull(), title: text("title").notNull(), description: text("description").notNull().default(""), sourceUrl: text("source_url"), mediaId: text("media_id").references(() => media.id, { onDelete: "set null" }), ...audit }, (t) => [uniqueIndex("uq_snapshot_content_year").on(t.contentId, t.year)]);
export const phoneProfiles = sqliteTable("phone_profiles", { contentId: text("content_id").primaryKey().references(() => contentItems.id, { onDelete: "cascade" }), releasePrice: integer("release_price"), carrier: text("carrier"), colors: text("colors", { mode: "json" }).$type<string[]>().notNull().default([]), specifications: text("specifications", { mode: "json" }).$type<Record<string, string>>().notNull().default({}), ...audit });
export const tags = sqliteTable("tags", { id: text("id").primaryKey(), slug: text("slug").notNull(), name: text("name").notNull(), ...audit }, (t) => [uniqueIndex("uq_tags_slug").on(t.slug)]);
export const contentTags = sqliteTable("content_tags", { contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }), tagId: text("tag_id").notNull().references(() => tags.id, { onDelete: "cascade" }) }, (t) => [primaryKey({ columns: [t.contentId, t.tagId] }), index("idx_content_tags_tag_id").on(t.tagId)]);

export const contentRevisions = sqliteTable("content_revisions", {
  id: text("id").primaryKey(),
  contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }),
  version: integer("version").notNull(),
  snapshot: text("snapshot", { mode: "json" }).$type<Record<string, unknown>>().notNull(),
  actorId: text("actor_id"),
  note: text("note"),
  createdAt: integer("created_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
}, (t) => [uniqueIndex("uq_content_revision_version").on(t.contentId, t.version), index("idx_content_revisions_content_created").on(t.contentId, t.createdAt)]);

export const users = sqliteTable("users", {
  id: text("id").primaryKey(),
  username: text("username"),
  email: text("email"),
  displayName: text("display_name").notNull(),
  passwordHash: text("password_hash"),
  passwordSalt: text("password_salt"),
  passwordIterations: integer("password_iterations").notNull().default(100000),
  role: text("role", { enum: ["member", "editor", "admin"] }).notNull().default("member"),
  ...audit,
}, (t) => [uniqueIndex("uq_users_username").on(t.username), uniqueIndex("uq_users_email").on(t.email)]);
export const contentReviewEvents = sqliteTable("content_review_events", {
  id: text("id").primaryKey(),
  contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }),
  actorId: text("actor_id").references(() => users.id, { onDelete: "set null" }),
  action: text("action", { enum: ["created", "edited", "submitted", "published", "returned", "verified", "archived", "media_replaced"] }).notNull(),
  fromStatus: text("from_status"),
  toStatus: text("to_status"),
  note: text("note"),
  createdAt: integer("created_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
}, (t) => [index("idx_review_events_content_created").on(t.contentId, t.createdAt), index("idx_review_events_actor_created").on(t.actorId, t.createdAt)]);
export const userSessions = sqliteTable("user_sessions", {
  tokenHash: text("token_hash").primaryKey(),
  userId: text("user_id").notNull().references(() => users.id, { onDelete: "cascade" }),
  expiresAt: integer("expires_at", { mode: "timestamp_ms" }).notNull(),
  createdAt: integer("created_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
  lastSeenAt: integer("last_seen_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
}, (t) => [index("idx_user_sessions_user_id").on(t.userId), index("idx_user_sessions_expires_at").on(t.expiresAt)]);
export const authRateLimits = sqliteTable("auth_rate_limits", {
  key: text("key").primaryKey(),
  attempts: integer("attempts").notNull().default(0),
  windowStartedAt: integer("window_started_at", { mode: "timestamp_ms" }).notNull(),
  updatedAt: integer("updated_at", { mode: "timestamp_ms" }).notNull(),
});
export const collections = sqliteTable("collections", { id: text("id").primaryKey(), userId: text("user_id").references(() => users.id, { onDelete: "cascade" }), deviceKey: text("device_key"), name: text("name").notNull().default("내 추억 컬렉션"), isPublic: integer("is_public", { mode: "boolean" }).notNull().default(false), ...audit }, (t) => [uniqueIndex("uq_collections_user_id").on(t.userId), uniqueIndex("uq_collections_device_key").on(t.deviceKey)]);
export const collectionItems = sqliteTable("collection_items", {
  collectionId: text("collection_id").notNull().references(() => collections.id, { onDelete: "cascade" }),
  contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }),
  reaction: text("reaction", { enum: ["used", "remembered", "wanted"] }).notNull().default("used"),
  createdAt: integer("created_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
  updatedAt: integer("updated_at", { mode: "timestamp_ms" }).notNull().$defaultFn(() => new Date()),
}, (t) => [primaryKey({ columns: [t.collectionId, t.contentId] }), index("idx_collection_items_content_reaction").on(t.contentId, t.reaction)]);
export const memories = sqliteTable("memories", { id: text("id").primaryKey(), userId: text("user_id").references(() => users.id, { onDelete: "set null" }), contentId: text("content_id").notNull().references(() => contentItems.id, { onDelete: "cascade" }), body: text("body").notNull(), status: text("status", { enum: ["pending", "published", "hidden"] }).notNull().default("pending"), ...audit }, (t) => [index("idx_memories_content_status").on(t.contentId, t.status)]);
