-- name: CreateAccompany :one
INSERT INTO accompany (
    user_id,
    era,
    speaklanguage,
    find_type,
    sociability
) VALUES (
    $1,$2,$3,$4,$5
) RETURNING *;

-- name: GetAccompany :one
SELECT * FROM accompany
WHERE user_id = $1 LIMIT 1;

-- name: ListAccompany :many
SELECT * FROM accompany
ORDER BY user_id;

-- name: UpdateAccompany :one
UPDATE accompany
SET era = $2,
    speaklanguage= $3,
    find_type= $4,
    sociability= $5
WHERE user_id = $1
RETURNING *;

-- name: DeleteAccompany :exec
DELETE FROM accompany 
WHERE user_id = $1;