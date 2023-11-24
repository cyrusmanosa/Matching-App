CREATE TABLE "fixinformation" (
  "user_id" INT GENERATED BY DEFAULT AS IDENTITY UNIQUE PRIMARY KEY,
  "first_name" VARCHAR NOT NULL,
  "last_name" VARCHAR NOT NULL,
  "email" VARCHAR UNIQUE NOT NULL,
  "hashed_password" VARCHAR NOT NULL,
  "birth" DATE NOT NULL,
  "country" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "blood" VARCHAR NOT NULL,
  "age" INT NOT NULL,
  "constellation" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now()),
  "password_changed_at" TIMESTAMPTZ NOT NULL
);

CREATE TABLE "canchangeinformation" (
  "user_id" INT PRIMARY KEY,
  "nickname" VARCHAR NOT NULL,
  "city" VARCHAR NOT NULL,
  "sexual" VARCHAR NOT NULL,
  "height" FLOAT NOT NULL,
  "weight" FLOAT NOT NULL,
  "education" VARCHAR NOT NULL,
  "job" VARCHAR NOT NULL,
  "annual_salary" INT NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "religious" VARCHAR NOT NULL,
  "introduce" VARCHAR NOT NULL,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "loverrequest" (
  "user_id" INT PRIMARY KEY,
  "min_age" INT NOT NULL,
  "max_age" INT NOT NULL,
  "country" VARCHAR NOT NULL,
  "city" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "constellation" VARCHAR NOT NULL,
  "sexual" VARCHAR NOT NULL,
  "height" FLOAT NOT NULL,
  "weight" FLOAT NOT NULL,
  "job" VARCHAR NOT NULL,
  "annual_salary" INT NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "religious" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "hobbyrequest" (
  "user_id" INT PRIMARY KEY,
  "era" INT NOT NULL,
  "city" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "height" INT NOT NULL,
  "weight" INT NOT NULL,
  "find_type" VARCHAR NOT NULL,
  "find_target" VARCHAR NOT NULL,
  "experience" INT NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "accompanyrequest" (
  "user_id" INT PRIMARY KEY,
  "era" INT NOT NULL,
  "city" VARCHAR NOT NULL,
  "gender" VARCHAR NOT NULL,
  "find_type" VARCHAR NOT NULL,
  "find_target" VARCHAR NOT NULL,
  "sociability" VARCHAR NOT NULL,
  "certification" BOOLEAN DEFAULT false,
  "info_changed_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "image" (
  "user_id" INT PRIMARY KEY,
  "qr" VARCHAR UNIQUE NOT NULL,
  "icon" VARCHAR NOT NULL
);

CREATE TABLE "targetlist" (
  "user_id" INT PRIMARY KEY,
  "target_1_id" INT,
  "target_2_id" INT,
  "target_3_id" INT,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "changetargetuser" (
  "user_id" INT PRIMARY KEY,
  "change_user_id" INT NOT NULL,
  "reason" VARCHAR NOT NULL,
  "reply_user_id" INT NOT NULL,
  "change_time" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE TABLE "complaint" (
  "user_id" INT PRIMARY KEY,
  "cp_target_id" INT NOT NULL,
  "cp_tpye" VARCHAR NOT NULL,
  "cp_message" VARCHAR NOT NULL,
  "status" VARCHAR NOT NULL,
  "complaint_time" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE INDEX ON "complaint" ("user_id");
ALTER TABLE "canchangeinformation" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "loverrequest" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "hobbyrequest" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "accompanyrequest" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "image" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "targetlist" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "changetargetuser" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
ALTER TABLE "complaint" ADD FOREIGN KEY ("user_id") REFERENCES "fixinformation" ("user_id");
