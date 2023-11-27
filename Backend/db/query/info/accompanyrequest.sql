-- name: CreateAccompanyRequest :one
INSERT INTO accompanyrequest (
    user_id,
    era,
    city,
    gender,
    speaklanguage,
    find_type,
    find_target,
    sociability,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9
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
    speaklanguage = $5,
    find_type = $6,
    find_target = $7,
    sociability = $8,
    certification = $9
WHERE user_id = $1
RETURNING *;

-- name: DeleteUserAccompany :exec
DELETE FROM accompanyrequest 
WHERE user_id = $1;