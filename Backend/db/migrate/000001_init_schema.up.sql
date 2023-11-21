CREATE TABLE "fixinformation" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "first_name" VARCHAR NOT NULL,
  "last_name" VARCHAR NOT NULL,
  "email" VARCHAR UNIQUE NOT NULL,
  "birth" DATE NOT NULL,
  "country" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "blood" VARCHAR NOT NULL,
  "ago" INT NOT NULL,
  "constellation" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "password" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "hashed_password" VARCHAR NOT NULL,
  "password_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "canchangeinformation" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "nickname" VARCHAR NOT NULL,
  "city" VARCHAR NOT NULL,
  "sexual" VARCHAR NOT NULL,
  "height" INT NOT NULL,
  "weight" INT NOT NULL,
  "Education" VARCHAR NOT NULL,
  "job" VARCHAR NOT NULL,
  "annual_salary" INT NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "religious" VARCHAR NOT NULL,
  "introduce" VARCHAR NOT NULL,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "loverrequest" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "min_ago" INT NOT NULL,
  "max_ago" INT NOT NULL,
  "country" VARCHAR NOT NULL,
  "city" VARCHAR NOT NULL,
  "ago" INT NOT NULL,
  "gender" VARCHAR NOT NULL,
  "constellation" VARCHAR NOT NULL,
  "blood" VARCHAR NOT NULL,
  "sexual" VARCHAR NOT NULL,
  "height" INT NOT NULL,
  "weight" VARCHAR NOT NULL,
  "Education" VARCHAR NOT NULL,
  "job" VARCHAR NOT NULL,
  "annual_salary" int NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "religious" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "hobbyrequest" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "era" INI NOT NULL,
  "country" VARCHAR NOT NULL,
  "city" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "height" INT NOT NULL,
  "weight" VARCHAR NOT NULL,
  "type" VARCHAR NOT NULL,
  "findtarget" VARCHAR NOT NULL,
  "experience" INT NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "accompanyrequest" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "era" INI NOT NULL,
  "country" VARCHAR NOT NULL,
  "city" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "type" VARCHAR NOT NULL,
  "findtarget" VARCHAR NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "image" (
  "user_id" VARCHAR PRIMARY KEY,
  "qr" VARCHAR UNIQUE NOT NULL,
  "icon" VARCHAR NOT NULL
);

CREATE TABLE "targetlist" (
  "user_id" BIGSERIAL,
  "target_1_id" INT NOT NULL,
  "target_2_id" INT NOT NULL,
  "target_3_id" INT NOT NULL,
  "update_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "changetargetuser" (
  "user_id" BIGSERIAL,
  "change_user_id" INT NOT NULL,
  "reason" VARCHAR NOT NULL,
  "target_user_reply" VARCHAR NOT NULL,
  "change_time" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "message" (
  "msg_id" BIGSERIAL PRIMARY KEY,
  "conversation_id" VARCHAR UNIQUE NOT NULL,
  "sender_id" INT NOT NULL,
  "receiver_id" INT NOT NULL,
  "message_content" VARCHAR NOT NULL,
  "send_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "mediaunlock" (
  "user_id" BIGSERIAL,
  "receiver_id" INT NOT NULL,
  "un_img" BOOLEAN DEFAULT false,
  "un_context" BOOLEAN DEFAULT false,
  "un_location" BOOLEAN DEFAULT false,
  "un_dating" BOOLEAN DEFAULT false,
  "un_sns" BOOLEAN DEFAULT false
);

CREATE TABLE "complaint" (
  "user_id" BIGSERIAL,
  "cp_target_id" INT NOT NULL,
  "cp_tpye" VARCHAR NOT NULL,
  "message" VARCHAR NOT NULL,
  "status" VARCHAR NOT NULL,
  "complaint_time" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "payrecord" (
  "pay_id" BIGSERIAL PRIMARY KEY,
  "user_id" BIGSERIAL,
  "method" VARCHAR NOT NULL,
  "payment" INT NOT NULL,
  "amount" INT NOT NULL,
  "status" VARCHAR NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE INDEX ON "password" ("user_id");

CREATE INDEX ON "canchangeinformation" ("user_id");

CREATE INDEX ON "loverrequest" ("user_id");

CREATE INDEX ON "hobbyrequest" ("user_id");

CREATE INDEX ON "accompanyrequest" ("user_id");

CREATE INDEX ON "image" ("user_id");

CREATE INDEX ON "image" ("icon");

CREATE INDEX ON "targetlist" ("user_id");

CREATE INDEX ON "changetargetuser" ("user_id");

CREATE INDEX ON "message" ("msg_id");

CREATE INDEX ON "complaint" ("user_id");

CREATE INDEX ON "payrecord" ("pay_id");

CREATE UNIQUE INDEX ON "payrecord" ("user_id", "created_at");

COMMENT ON COLUMN "image"."icon" IS 'must';

COMMENT ON COLUMN "payrecord"."payment" IS 'must be positive';

COMMENT ON COLUMN "payrecord"."amount" IS 'must be positive';

ALTER TABLE "password" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "canchangeinformation" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "loverrequest" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "hobbyrequest" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "accompanyrequest" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "targetlist" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "changetargetuser" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "mediaunlock" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "complaint" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");

ALTER TABLE "payrecord" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
