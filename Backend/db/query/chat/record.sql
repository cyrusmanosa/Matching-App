-- name: CreateRecord :one
INSERT INTO "u1" (
    target_id,
    role_type,
    media_type,
    media,
    isread
) VALUES (
    $1,$2,$3,$4,$5,$6
) RETURNING *;

-- name: GetRecord :many
SELECT * FROM "u1"
WHERE target_id = $1
ORDER BY created_at;

-- name: GetTargetID :many
SELECT DISTINCT target_id FROM u1;

-- name: GetLastMsg :one
SELECT media,media_type,isread FROM "u1"
WHERE target_id = $1
ORDER BY created_at DESC
LIMIT 1;


-- name: UpdateRecord :one
UPDATE "u1"
SET media = $4
WHERE target_id = $1
  AND media_type = $2
  AND created_at = $3
RETURNING *;

-- name: DeleteRecord :exec
DELETE FROM "u1"
WHERE target_id = $1
AND created_at = $2;

