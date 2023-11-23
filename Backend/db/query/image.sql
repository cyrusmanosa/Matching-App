-- name: CreateImage :one
INSERT INTO image (
    user_id,
    qr,
    icon
) VALUES (
    $1,$2,$3
) RETURNING *;

-- name: GetUserimageData :one
SELECT * FROM image
WHERE user_id = $1;

-- name: ListimagesList :many
SELECT * FROM image
ORDER BY user_id;

-- name: UpdateImage :one
UPDATE image
SET icon = $2
WHERE user_id = $1
RETURNING *;

-- name: DeleteImage :exec
DELETE FROM image 
WHERE user_id = $1;