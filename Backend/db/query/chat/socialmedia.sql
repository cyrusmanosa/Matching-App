-- name: Createsocialmedia :one
INSERT INTO socialmedia (
    user_id,
    target_id,
    image,
    contact,
    location,
    appointment,
    sns
) VALUES (
    $1,$2,$3,$4,$5,$6,$7
) RETURNING *;

-- name: Getsocialmedia :one
SELECT * FROM socialmedia
WHERE user_id = $1 AND target_id = $2 
LIMIT 1;

-- name: Listsocialmedia :many
SELECT * FROM socialmedia
ORDER BY user_id;

-- name: Updatesocialmedia :one
UPDATE socialmedia
SET target_id = $2,
    image = $3,
    contact = $4,
    location = $5,
    appointment = $6,
    sns  = $7
WHERE user_id = $1
RETURNING *;

-- name: Deletesocialmedia :exec
DELETE FROM socialmedia 
WHERE user_id = $1;


