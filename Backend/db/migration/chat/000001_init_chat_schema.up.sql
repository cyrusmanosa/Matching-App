CREATE TABLE u1 (
  "target_id" INT NOT NULL,
  "msg_type" VARCHAR NOT NULL,
  "message" VARCHAR,
  "images" VARCHAR,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);
