-- name: CreateAccompanyRequest :one
INSERT INTO accompanyrequest (
    user_id,
    era,
    city,
    gender,
    find_type,
    find_target,
    sociability,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8
) RETURNING *;

-- name: GetUserAccompany :one
SELECT * FROM accompanyrequest
WHERE user_id = $1 LIMIT 1;

-- name: ListUserAccompany :many
SELECT * FROM accompanyrequest
ORDER BY user_id;

-- name: UpdateUserAccompany :one
UPDATE accompanyrequest
SET era = $2,
    city = $3,
    gender = $4,
    find_type = $5,
    find_target = $6,
    sociability = $7,
    certification = $8
WHERE user_id = $1
RETURNING *;

-- name: DeleteUserAccompany :exec
DELETE FROM accompanyrequest 
WHERE user_id = $1;