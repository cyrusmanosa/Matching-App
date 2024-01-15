-- name: CreateHobby :one
INSERT INTO hobby (
    user_id,
    era,
    city,
    gender,
    speaklanguage,
    find_type,
    experience
) VALUES (
    $1,$2,$3,$4,$5,$6,$7
) RETURNING *;

-- name: GetHobby :one
SELECT * FROM hobby
WHERE user_id = $1;

-- name: ListHobby :many
SELECT * FROM hobby
ORDER BY user_id;

-- name: UpdateHobby :one
UPDATE hobby
SET era = $2,
    city = $3,
    gender = $4,
    speaklanguage = $5,
    find_type = $6,
    experience = $7
WHERE user_id = $1
RETURNING *;

-- name: DeleteHobby :exec
DELETE FROM hobby 
WHERE user_id = $1;