-- name: CreateImage :one
INSERT INTO image (
    user_id,
    qr,
    img1,
    img2,
    img3,
    img4,
    icon
) VALUES (
    $1,$2,$3,$4,$5,$6,$7
) RETURNING *;

-- name: GetUserimageData :one
SELECT * FROM image
WHERE user_id = $1;

-- name: ListimagesList :many
SELECT * FROM image
ORDER BY user_id;

-- name: UpdateImage :one
UPDATE image
SET img1 = $2,
    img2 = $3,
    img3 = $4,
    img4 = $5,
    icon = $6
WHERE user_id = $1
RETURNING *;

-- name: DeleteImage :exec
DELETE FROM image 
WHERE user_id = $1;