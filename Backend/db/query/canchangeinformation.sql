-- name: CreateUserCanChangeInformation :one
INSERT INTO canchangeinformation (
    user_id,
    nickname,
    city,
    sexual,
    height,
    weight,
    Education,
    job,
    annual_salary,
    sociability,
    religious,
    introduce
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12
) RETURNING *;

-- name: GetUserCanChangeInformation :one
SELECT * FROM canchangeinformation
WHERE user_id = $1 LIMIT 1;

-- name: ListUserFixInformaion :many
SELECT * FROM canchangeinformation
ORDER BY user_id;

-- name: UpdateInformation :one
UPDATE canchangeinformation
SET nickname = $2,
    city = $3,
    sexual = $4,
    height = $5,
    weight = $6,
    Education = $7,
    job = $8,
    annual_salary = $9,
    sociability = $10,
    religious = $11,
    introduce = $12
WHERE user_id = $1
RETURNING *;

-- name: DeleteInformation :exec
DELETE FROM canchangeinformation 
WHERE user_id = $1;