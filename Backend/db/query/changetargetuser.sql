-- name: CreateChangeTargetUser :one
INSERT INTO changetargetuser (
    user_id,
    change_user_id,
    reason,
    reply_user_id
) VALUES (
    $1,$2,$3,$4
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