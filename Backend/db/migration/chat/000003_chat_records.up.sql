CREATE TABLE chat_records (
  "owner_id" INT NOT NULL,
  "target_id" INT NOT NULL,
  "role_type" VARCHAR NOT NULL,
  "media_type" VARCHAR NOT NULL,
  "media" BYTEA,
  "isread" BOOLEAN NOT NULL DEFAULT false,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
);

CREATE INDEX chat_records_pair_created_idx
  ON chat_records (owner_id, target_id, created_at DESC);

CREATE INDEX chat_records_owner_idx
  ON chat_records (owner_id);

DO $$
DECLARE
  old_table text;
  owner_id integer;
  has_read boolean;
BEGIN
  FOR old_table IN
    SELECT c.relname
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE n.nspname = 'public'
      AND c.relkind = 'r'
      AND c.relname ~ '^u[0-9]+$'
  LOOP
    owner_id := substring(old_table FROM 2)::integer;
    SELECT EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = 'public'
        AND table_name = old_table
        AND column_name = 'isread'
    ) INTO has_read;

    IF has_read THEN
      EXECUTE format(
        'INSERT INTO chat_records (owner_id, target_id, role_type, media_type, media, isread, created_at)
         SELECT %s, target_id, role_type, media_type, media, COALESCE(isread, false), created_at FROM %I',
        owner_id, old_table
      );
    ELSE
      EXECUTE format(
        'INSERT INTO chat_records (owner_id, target_id, role_type, media_type, media, isread, created_at)
         SELECT %s, target_id, role_type, media_type, media, false, created_at FROM %I',
        owner_id, old_table
      );
    END IF;

    EXECUTE format('DROP TABLE %I', old_table);
  END LOOP;
END $$;

DELETE FROM socialmedia a
USING socialmedia b
WHERE a.ctid < b.ctid
  AND a.user_id = b.user_id
  AND a.target_id = b.target_id;

ALTER TABLE socialmedia ADD PRIMARY KEY (user_id, target_id);
