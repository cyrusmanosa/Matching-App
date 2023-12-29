CREATE TABLE "userID" (
  "target_id" INT UNIQUE NOT NULL,
  "msg_type" VARCHAR NOT NULL,
  "message" VARCHAR,
  "images" img,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);
