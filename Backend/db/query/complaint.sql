-- name: CreateComplaint :one
INSERT INTO complaint (
    user_id,
    cp_target_id,
    cp_tpye,
    cp_message,
    status
) VALUES (
    $1,$2,$3,$4,$5
) RETURNING *;

-- name: GetUserComplaintList :one
SELECT * FROM complaint
WHERE user_id = $1;

-- name: AllComplaintList :many
SELECT * FROM complaint
ORDER BY user_id;

-- name: DeleteComplaint :exec
DELETE FROM complaint
WHERE user_id = $1;