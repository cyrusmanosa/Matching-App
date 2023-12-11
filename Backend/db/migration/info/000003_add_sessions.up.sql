CREATE TABLE "sessions" (
  "id" uuid PRIMARY KEY,
  "email" varchar NOT NULL,
  "access_token" varchar NOT NULL,
  "is_blocked" boolean NOT NULL DEFAULT false,
  "expires_at" timestamptz NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "fixinformation" ADD COLUMN "role" varchar NOT NULL DEFAULT 'depositor';
