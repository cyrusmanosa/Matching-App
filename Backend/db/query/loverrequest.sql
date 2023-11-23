-- name: CreateLoverRequest :one
INSERT INTO loverrequest (
    user_id,
    min_age,
    max_age,
    country,
    city,
    age,
    gender,
    constellation,
    blood,
    sexual,
    height,
    weight,
    Education,
    job,
    annual_salary,
    sociability,
    religious,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18
) RETURNING *;

-- name: GetUserLover :one
SELECT * FROM loverrequest
WHERE user_id = $1 LIMIT 1;

-- name: ListUserLover :many
SELECT * FROM loverrequest
ORDER BY user_id;

-- name: UpdateUserLover :one
UPDATE loverrequest
SET min_age = $2,
    max_age = $3,
    country = $4,
    city = $5,
    age = $6,
    gender = $7,
    constellation = $8,
    blood = $9,
    sexual = $10,
    height = $11,
    weight = $12,
    Education = $13,
    job = $14,
    annual_salary = $15,
    sociability = $16,
    religious = $17,
    certification = $18
WHERE user_id = $1
RETURNING *;

-- name: DeleteUserLoverRequest :exec
DELETE FROM loverrequest 
WHERE user_id = $1;