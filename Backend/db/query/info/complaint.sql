-- name: CreateComplaint :one
INSERT INTO complaint (
    user_id,
    cp_target_id,
    cp_type,
    cp_message
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: GetUserComplaintList :one
SELECT * FROM complaint
WHERE cp_id = $1;

-- name: UpdateUserComplaint :one
UPDATE complaint
SET status = $2
WHERE cp_id = $1
RETURNING *;

-- name: ListComplaint :many
SELECT * FROM complaint
ORDER BY cp_id;

-- name: DeleteComplaint :exec
DELETE FROM complaint
WHERE cp_id = $1;