CREATE TABLE "pending_signups" (
  "code" varchar PRIMARY KEY,
  "email" varchar NOT NULL,
  "provider" varchar NOT NULL DEFAULT 'email',
  "verified" boolean NOT NULL DEFAULT false,
  "expires_at" timestamptz NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);
