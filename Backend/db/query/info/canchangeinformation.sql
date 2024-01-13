-- name: CreateUserCanChangeInformation :one
INSERT INTO canchangeinformation (
    user_id,
    nickname,
    city,
    sexual,
    height,
    weight,
    speaklanguage,
    Education,
    job,
    annual_salary,
    sociability,
    religious,
    introduce
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13
) RETURNING *;

-- name: GetUserCanChangeInformation :one
SELECT * FROM canchangeinformation
WHERE user_id = $1 LIMIT 1;

-- name: ListCanChangeInformation :many
SELECT * FROM canchangeinformation
ORDER BY user_id;

-- name: UpdateInformation :one
UPDATE canchangeinformation
SET nickname = $2,
    city = $3,
    sexual = $4,
    height = $5,
    weight = $6,
    speaklanguage = $7,
    Education = $8,
    job = $9,
    annual_salary = $10,
    sociability = $11,
    religious = $12,
    introduce = $13
WHERE user_id = $1
RETURNING *;

-- name: DeleteCanChangeInformation :exec
DELETE FROM canchangeinformation 
WHERE user_id = $1;