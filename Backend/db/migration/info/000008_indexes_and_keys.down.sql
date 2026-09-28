ALTER TABLE user_blocks DROP CONSTRAINT IF EXISTS user_blocks_target_id_fkey;
ALTER TABLE user_blocks DROP CONSTRAINT IF EXISTS user_blocks_user_id_fkey;
ALTER TABLE sessions DROP CONSTRAINT IF EXISTS sessions_user_id_fkey;

DROP INDEX IF EXISTS changetargetuser_user_idx;
DROP INDEX IF EXISTS pending_signups_email_idx;
DROP INDEX IF EXISTS contact_user_id_idx;
DROP INDEX IF EXISTS sessions_user_id_idx;
