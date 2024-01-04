-- name: CreateLover :one
INSERT INTO loverrequest (
    user_id,
    min_age,
    max_age,
    city,
    gender,
    constellation,
    sexual,
    height,
    weight,
    speaklanguage,
    job,
    annual_salary,
    sociability,
    religious,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15
) RETURNING *;

-- name: GetLover :one
SELECT * FROM loverrequest
WHERE user_id = $1 LIMIT 1;

-- name: ListLover :many
SELECT * FROM loverrequest
ORDER BY user_id;

-- name: UpdateLover :one
UPDATE loverrequest
SET min_age = $2,
    max_age = $3,
    city = $4,
    gender = $5,
    constellation = $6,
    sexual = $7,
    height = $8,
    weight = $9,
    speaklanguage = $10,
    job = $11,
    annual_salary = $12,
    sociability = $13,
    religious = $14,
    certification = $15
WHERE user_id = $1
RETURNING *;

-- name: DeleteLover :exec
DELETE FROM loverrequest 
WHERE user_id = $1;