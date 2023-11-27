-- name: recodeTest :one
INSERT INTO recordtest (
    user_id,
    target_id,
    message,
    images
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: Getrecode :one
SELECT * FROM recordtest
WHERE user_id = $1;

-- name: Listrecode :many
SELECT * FROM recordtest
ORDER BY created_at;