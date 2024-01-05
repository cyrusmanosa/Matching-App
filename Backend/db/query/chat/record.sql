-- name: CreateRecord :one
INSERT INTO "u1" (
    target_id,
    role_type,
    media_type,
    message,
    media
) VALUES (
    $1,$2,$3,$4,$5
) RETURNING *;

-- name: GetRecord :many
SELECT * FROM "u1"
WHERE target_id = $1
ORDER BY created_at;

-- name: GetTargetID :many
SELECT target_id FROM "u1"
GROUP BY target_id
HAVING COUNT(*) > 1;

-- name: UpdateRecord :one
UPDATE "u1"
SET message = $4
WHERE target_id = $1
  AND media_type = $2
  AND created_at = $3
RETURNING *;

-- name: DeleteRecord :exec
DELETE FROM "u1"
WHERE target_id = $1
AND created_at = $2;

