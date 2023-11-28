-- name: recordTest :one
INSERT INTO recordtest (
    user_id,
    target_id,
    message,
    images
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: Getrecord :one
SELECT * FROM recordtest
WHERE user_id = $1;

-- name: Listrecord :many
SELECT * FROM recordtest
ORDER BY created_at;