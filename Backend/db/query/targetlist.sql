-- name: TargetUserList :one
INSERT INTO targetlist (
    user_id,
    target_1_id,
    target_2_id,
    target_3_id
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: GetTargetUserList :one
SELECT * FROM targetlist
WHERE user_id = $1;

-- name: AllTargetUserList :many
SELECT * FROM targetlist
ORDER BY user_id;

-- name: UpdateTargetList :one
UPDATE targetlist
SET target_1_id = $2 OR
    target_2_id = $3 OR
    target_3_id = $4
WHERE user_id = $1
RETURNING *;

-- name: DeleteTargetList :exec
DELETE FROM targetlist 
WHERE user_id = $1;