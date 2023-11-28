-- name: CreateUserFixInformation :one
INSERT INTO fixinformation (
    first_name,
    last_name,
    email,
    hashed_password,
    birth,
    country,
    gender,
    blood,
    age,
    constellation,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11
) RETURNING *;

-- name: GetUserFixInformation :one
SELECT * FROM fixinformation
WHERE Email = $1;

-- name: ListFixInformaion :many
SELECT * FROM fixinformation
ORDER BY user_id;

-- name: UpdatePassword :one
UPDATE fixinformation
SET hashed_password = $2
WHERE user_id = $1
RETURNING *;

-- name: DeleteUser :exec
DELETE FROM fixinformation 
WHERE user_id = $1;