-- name: CreateChangeTargetUser :one
INSERT INTO changetargetuser (
    user_id,
    change_user_id,
    reason,
    frequency
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: GetRowCount :one
SELECT COUNT(*) AS row_count FROM changetargetuser
WHERE user_id = $1;

-- name: GetChangeTargetUserList :one
SELECT * FROM changetargetuser
WHERE user_id = $1
AND change_time = (
    SELECT MAX(change_time)
    FROM changetargetuser
    WHERE user_id = $1
);

-- name: AllChangeTargetUserList :many
SELECT * FROM changetargetuser
ORDER BY user_id;

-- name: DeleteChangeTargetUser :exec
DELETE FROM changetargetuser
WHERE user_id = $1;