ALTER TABLE u1 ADD COLUMN "isread" BOOLEAN NOT NULL DEFAULT false;

CREATE TABLE "socialmedia" (
  "user_id" INT NOT NULL,
  "target_id" INT NOT NULL,
  "image" boolean DEFAULT false,
  "contact" boolean DEFAULT false,
  "location" boolean DEFAULT false,
  "appointment" boolean DEFAULT false,
  "sns" boolean DEFAULT false
);