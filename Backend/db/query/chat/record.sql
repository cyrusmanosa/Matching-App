-- Chat rows live in chat_records. owner_id is the account that owns the copy.

-- name: CreateRecord :one
INSERT INTO chat_records (
    owner_id,
    target_id,
    role_type,
    media_type,
    media,
    isread
) VALUES (
    $1, $2, $3, $4, $5, $6
) RETURNING target_id, role_type, media_type, media, isread, created_at;

-- name: GetRecord :many
SELECT target_id, role_type, media_type, media, isread, created_at
FROM chat_records
WHERE owner_id = $1 AND target_id = $2
ORDER BY created_at;

-- name: GetTargetID :many
SELECT DISTINCT target_id
FROM chat_records
WHERE owner_id = $1;

-- name: GetChatRow :one
SELECT COUNT(*)
FROM chat_records
WHERE owner_id = $1 AND role_type = 'sender';

-- name: GetLastMsg :one
SELECT media, media_type, isread
FROM chat_records
WHERE owner_id = $1 AND target_id = $2
ORDER BY created_at DESC
LIMIT 1;

-- name: UpdateRecord :one
UPDATE chat_records
SET media = $4
WHERE owner_id = $5
  AND target_id = $1
  AND media_type = $2
  AND created_at = $3
RETURNING target_id, role_type, media_type, media, isread, created_at;

-- name: UpdateRead :exec
UPDATE chat_records
SET isread = true
WHERE owner_id = $1
  AND target_id = $2
  AND role_type = 'receiver';

-- name: DeleteRecord :exec
DELETE FROM chat_records
WHERE owner_id = $1
  AND target_id = $2
  AND created_at = $3;
