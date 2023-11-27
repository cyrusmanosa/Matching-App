-- name: CreateHobbyRequest :one
INSERT INTO hobbyrequest (
    user_id,
    era,
    city,
    gender,
    height,
    weight,
    speaklanguage,
    find_type,
    find_target,
    experience,
    sociability,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12
) RETURNING *;

-- name: GetUserHobby :one
SELECT * FROM hobbyrequest
WHERE user_id = $1;

-- name: ListUserHobby :many
SELECT * FROM hobbyrequest
ORDER BY user_id;

-- name: UpdateUserHobby :one
UPDATE hobbyrequest
SET era = $2,
    city = $3,
    gender = $4,
    height = $5,
    weight = $6,
    speaklanguage = $7,
    find_type = $8,
    find_target = $9,
    experience = $10,
    sociability = $11,
    certification = $12
WHERE user_id = $1
RETURNING *;

-- name: DeleteUserHobby :exec
DELETE FROM hobbyrequest 
WHERE user_id = $1;