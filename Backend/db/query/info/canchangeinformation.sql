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
    hobby_type,
    experience,
    accompany_type,
    religious,
    introduce
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16
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
    hobby_type = $13,
    experience = $14,
    accompany_type = $15,
    introduce = $16
WHERE user_id = $1
RETURNING *;

-- name: DeleteCanChangeInformation :exec
DELETE FROM canchangeinformation 
WHERE user_id = $1;


-- name: CanChangeSearchHobby :many
SELECT * FROM canchangeinformation
WHERE user_id != $1
    AND (city = $2 OR $2 IS NULL)
    AND (speaklanguage = $3 OR $3 IS NULL)
    AND (hobby_type = $4 OR $4 IS NULL)
    AND (experience >= $5 OR $5 IS NULL);


-- name: CanChangeSearchAccompany :many
SELECT * FROM canchangeinformation
WHERE user_id != $1
    AND (speaklanguage = $2 OR $2 IS NULL)
    AND (accompany_type = $3 OR $3 IS NULL)
    AND (sociability = $4 OR $4 IS NULL);


-- name: CanChangeSearchLover :many
SELECT * FROM canchangeinformation
WHERE user_id != $1  
    AND (sexual = $2 OR $2 IS NULL)
    AND (speaklanguage = $3 OR $3 IS NULL)
    AND (city = $4 OR $4 IS NULL);