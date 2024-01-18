-- name: CreateLover :one
INSERT INTO lover (
    user_id,
    min_age,
    max_age,
    city,
    gender,
    sexual,
    speaklanguage
) VALUES (
    $1,$2,$3,$4,$5,$6,$7
) RETURNING *;

-- name: GetLover :one
SELECT * FROM lover
WHERE user_id = $1 LIMIT 1;

-- name: ListLover :many
SELECT * FROM lover
ORDER BY user_id;

-- name: UpdateLover :one
UPDATE lover
SET min_age = $2,
    max_age = $3,
    city = $4,
    gender = $5,
    sexual = $6,
    speaklanguage = $7
WHERE user_id = $1
RETURNING *;

-- name: DeleteLover :exec
DELETE FROM lover 
WHERE user_id = $1;


