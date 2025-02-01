-- name: CreateUserFixInformation :one
INSERT INTO FIXINFORMATION (
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    HASHED_PASSWORD,
    BIRTH,
    COUNTRY,
    GENDER,
    BLOOD,
    AGE,
    CONSTELLATION,
    CERTIFICATION
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
    $11
) RETURNING *;

-- name: GetUserFixInformation :one
SELECT
    *
FROM
    FIXINFORMATION
WHERE
    USER_ID = $1;

-- name: LoginAtEmail :one
SELECT
    *
FROM
    FIXINFORMATION
WHERE
    EMAIL = $1;

-- name: ListFixInformation :many
SELECT
    *
FROM
    FIXINFORMATION
ORDER BY
    USER_ID;

-- name: UpdatePassword :one
UPDATE FIXINFORMATION
SET
    HASHED_PASSWORD = $2
WHERE
    USER_ID = $1 RETURNING *;

-- name: DeleteUser :exec
DELETE FROM FIXINFORMATION
WHERE
    USER_ID = $1;

-- name: FixSearchHobby :many
SELECT
    *
FROM
    FIXINFORMATION
WHERE
    USER_ID != $1
    AND (AGE >= $2
    OR $2 IS NULL)
    AND (AGE < $3
    OR $3 IS NULL)
    AND (GENDER = $4
    OR $4 IS NULL);

-- name: FixSearchAccompany :many
SELECT
    *
FROM
    FIXINFORMATION
WHERE
    USER_ID = $1
    AND (AGE >= $2
    OR $2 IS NULL)
    AND (AGE < $3
    OR $3 IS NULL);

-- name: FixSearchLover :many
SELECT
    *
FROM
    FIXINFORMATION
WHERE
    USER_ID != $1
    AND (AGE >= $2
    OR $2 IS NULL)
    AND (AGE < $3
    OR $3 IS NULL)
    AND (GENDER = $4
    OR $4 IS NULL);