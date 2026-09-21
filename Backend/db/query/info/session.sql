-- name: CreateSession :one
INSERT INTO sessions (
  id,
  user_id,
  access_token,
  status,
  is_blocked,
  expires_at
) VALUES (
  $1, $2, $3, $4, $5, $6
) RETURNING *;

-- name: GetSession :one
SELECT * FROM sessions
WHERE id = $1 LIMIT 1;

-- name: LogoutActiveSessions :exec
UPDATE sessions
SET status = 'Logout',
    is_blocked = true
WHERE user_id = $1
  AND is_blocked = false;

-- name: LogoutSession :exec
UPDATE sessions
SET status = 'Logout',
    is_blocked = true
WHERE id = $1;
