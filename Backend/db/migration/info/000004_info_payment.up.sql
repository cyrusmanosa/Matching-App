CREATE TABLE "payment" (
  "pay_id" uuid PRIMARY KEY,
  "fullname" varchar NOT NULL,
  "payment_type" varchar NOT NULL,
  "amount" int NOT NULL,
  "product" varchar NOT NULL,
  "pay_at" timestamptz NOT NULL DEFAULT (now())
);
