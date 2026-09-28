CREATE TABLE "user_blocks" (
  "user_id" INT NOT NULL,
  "target_id" INT NOT NULL,
  "reason" varchar NOT NULL DEFAULT '',
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  PRIMARY KEY ("user_id", "target_id")
);
