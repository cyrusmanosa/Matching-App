CREATE TABLE "recordtest" (
  "user_id" INT UNIQUE PRIMARY KEY NOT NULL,
  "target_id" INT UNIQUE NOT NULL,
  "message" VARCHAR,
  "images" BYTEA,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);
