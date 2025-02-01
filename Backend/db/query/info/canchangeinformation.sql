-- name: CreateUserCanChangeInformation :one
INSERT INTO CANCHANGEINFORMATION (
    USER_ID,
    NICKNAME,
    CITY,
    SEXUAL,
    HEIGHT,
    WEIGHT,
    SPEAKLANGUAGE,
    EDUCATION,
    JOB,
    ANNUAL_SALARY,
    SOCIABILITY,
    HOBBY_TYPE,
    EXPERIENCE,
    ACCOMPANY_TYPE,
    RELIGIOUS,
    INTRODUCE
) VALUES (
    $1,
    $2,
    $3,
    $4,
    $5,
    $6,
    $7,
    $8,
    $9,
    $10,
    $11,
    $12,
    $13,
    $14,
    $15,
    $16
) RETURNING *;

-- name: GetUserCanChangeInformation :one
SELECT
    *
FROM
    CANCHANGEINFORMATION
WHERE
    USER_ID = $1 LIMIT 1;

-- name: ListCanChangeInformation :many
SELECT
    *
FROM
    CANCHANGEINFORMATION
ORDER BY
    USER_ID;

-- name: UpdateInformation :one
UPDATE CANCHANGEINFORMATION
SET
    NICKNAME = $2,
    CITY = $3,
    SEXUAL = $4,
    HEIGHT = $5,
    WEIGHT = $6,
    SPEAKLANGUAGE = $7,
    EDUCATION = $8,
    JOB = $9,
    ANNUAL_SALARY = $10,
    SOCIABILITY = $11,
    RELIGIOUS = $12,
    HOBBY_TYPE = $13,
    EXPERIENCE = $14,
    ACCOMPANY_TYPE = $15,
    INTRODUCE = $16
WHERE
    USER_ID = $1 RETURNING *;

-- name: DeleteCanChangeInformation :exec
DELETE FROM CANCHANGEINFORMATION
WHERE
    USER_ID = $1;

-- name: CanChangeSearchHobby :many
SELECT
    *
FROM
    CANCHANGEINFORMATION
WHERE
    USER_ID != $1
    AND (CITY = $2
    OR $2 IS NULL)
    AND (SPEAKLANGUAGE = $3
    OR $3 IS NULL)
    AND (HOBBY_TYPE = $4
    OR $4 IS NULL)
    AND (EXPERIENCE >= $5
    OR $5 IS NULL);

-- name: CanChangeSearchAccompany :many
SELECT
    *
FROM
    CANCHANGEINFORMATION
WHERE
    USER_ID != $1
    AND (SPEAKLANGUAGE = $2
    OR $2 IS NULL)
    AND (ACCOMPANY_TYPE = $3
    OR $3 IS NULL)
    AND (SOCIABILITY = $4
    OR $4 IS NULL);

-- name: CanChangeSearchLover :many
SELECT
    *
FROM
    CANCHANGEINFORMATION
WHERE
    USER_ID != $1
    AND (SEXUAL = $2
    OR $2 IS NULL)
    AND (SPEAKLANGUAGE = $3
    OR $3 IS NULL)
    AND (CITY = $4
    OR $4 IS NULL);