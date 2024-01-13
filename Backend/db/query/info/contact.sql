-- name: CreateContact :one
INSERT INTO contact (
    user_id,
    contact_type,
    message,
    status
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: GetUserContactList :one
SELECT * FROM contact
WHERE contact_id = $1;

-- name: UpdateUserContact :one
UPDATE contact
SET status = $2
WHERE contact_id = $1
RETURNING *;

-- name: ListContact :many
SELECT * FROM contact
ORDER BY contact_id;

-- name: DeleteContact :exec
DELETE FROM contact
WHERE contact_id = $1;