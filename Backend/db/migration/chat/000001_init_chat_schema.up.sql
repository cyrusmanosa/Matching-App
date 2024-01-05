CREATE TABLE u1 (
  "target_id" INT UNIQUE NOT NULL,
  "role_type" VARCHAR NOT NULL,
  "media_type" VARCHAR NOT NULL,
  "message" VARCHAR,
  "media" VARCHAR,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);
