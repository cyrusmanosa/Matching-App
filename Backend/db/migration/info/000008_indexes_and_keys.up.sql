CREATE INDEX IF NOT EXISTS sessions_user_id_idx ON sessions (user_id);
CREATE INDEX IF NOT EXISTS contact_user_id_idx ON contact (user_id);
CREATE INDEX IF NOT EXISTS pending_signups_email_idx ON pending_signups (email);
CREATE INDEX IF NOT EXISTS changetargetuser_user_idx ON changetargetuser (user_id);

DELETE FROM sessions AS s
WHERE NOT EXISTS (
  SELECT 1 FROM fixinformation AS f WHERE f.user_id = s.user_id
);

ALTER TABLE sessions
  ADD CONSTRAINT sessions_user_id_fkey
  FOREIGN KEY (user_id) REFERENCES fixinformation (user_id);

DELETE FROM user_blocks AS b
WHERE NOT EXISTS (SELECT 1 FROM fixinformation AS f WHERE f.user_id = b.user_id)
   OR NOT EXISTS (SELECT 1 FROM fixinformation AS f WHERE f.user_id = b.target_id);

ALTER TABLE user_blocks
  ADD CONSTRAINT user_blocks_user_id_fkey
  FOREIGN KEY (user_id) REFERENCES fixinformation (user_id);

ALTER TABLE user_blocks
  ADD CONSTRAINT user_blocks_target_id_fkey
  FOREIGN KEY (target_id) REFERENCES fixinformation (user_id);
