CREATE TABLE u1 (
  "target_id" INT NOT NULL,
  "role_type" VARCHAR NOT NULL,
  "media_type" VARCHAR NOT NULL,
  "media" BYTEA,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);
