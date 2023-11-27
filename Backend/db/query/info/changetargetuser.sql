-- name: CreateChangeTargetUser :one
INSERT INTO changetargetuser (
    user_id,
    change_user_id,
    reason,
    reply_user_id,
    frequency
) VALUES (
    $1,$2,$3,$4,$5
) RETURNING *;

-- name: GetChangeTargetUserList :one
SELECT * FROM changetargetuser
WHERE user_id = $1;

-- name: AllChangeTargetUserList :many
SELECT * FROM changetargetuser
ORDER BY user_id;

-- name: DeleteData :exec
DELETE FROM changetargetuser
WHERE user_id = $1;