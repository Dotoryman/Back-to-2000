-- BACK TO 2000 v0.4.1 · first-party accounts and session-backed collection sync
ALTER TABLE users ADD COLUMN username TEXT;
--> statement-breakpoint
ALTER TABLE users ADD COLUMN password_hash TEXT;
--> statement-breakpoint
ALTER TABLE users ADD COLUMN password_salt TEXT;
--> statement-breakpoint
ALTER TABLE users ADD COLUMN password_iterations INTEGER NOT NULL DEFAULT 600000;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS uq_users_username ON users(username) WHERE username IS NOT NULL;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS uq_collections_user_id ON collections(user_id) WHERE user_id IS NOT NULL;
--> statement-breakpoint
CREATE TABLE user_sessions (
  token_hash TEXT PRIMARY KEY NOT NULL,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  expires_at INTEGER NOT NULL,
  created_at INTEGER NOT NULL,
  last_seen_at INTEGER NOT NULL
);
--> statement-breakpoint
CREATE INDEX idx_user_sessions_user_id ON user_sessions(user_id);
--> statement-breakpoint
CREATE INDEX idx_user_sessions_expires_at ON user_sessions(expires_at);
--> statement-breakpoint
CREATE TABLE auth_rate_limits (
  key TEXT PRIMARY KEY NOT NULL,
  attempts INTEGER NOT NULL DEFAULT 0,
  window_started_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);
--> statement-breakpoint
PRAGMA optimize;
