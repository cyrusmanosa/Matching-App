ALTER TABLE socialmedia DROP CONSTRAINT IF EXISTS socialmedia_pkey;

CREATE TABLE IF NOT EXISTS u1 (
  "target_id" INT NOT NULL,
  "role_type" VARCHAR NOT NULL,
  "media_type" VARCHAR NOT NULL,
  "media" BYTEA,
  "isread" BOOLEAN NOT NULL DEFAULT false,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

INSERT INTO u1 (target_id, role_type, media_type, media, isread, created_at)
SELECT target_id, role_type, media_type, media, isread, created_at
FROM chat_records
WHERE owner_id = 1;

DROP TABLE IF EXISTS chat_records;
