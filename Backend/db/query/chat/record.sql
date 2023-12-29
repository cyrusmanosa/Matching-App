-- name: CreateRecord :one
INSERT INTO "record" (
    target_id,
    msg_type,
    message,
    images
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: Getrecord :many
SELECT * FROM "record"
WHERE target_id = $1
ORDER BY created_at

-- name: UpdateRecord :one
UPDATE "record"
SET message = $4
WHERE target_id = $1
  AND msg_type = $2
  AND created_at = $3
RETURNING *;

-- name: DeleteRecord :exec
DELETE FROM "record"
WHERE target_id = $1
AND created_at = $2;