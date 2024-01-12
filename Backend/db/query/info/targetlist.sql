-- name: TargetUserList :one
INSERT INTO targetlist (
    user_id,
    target_1_id,
    "t1_Type",
    target_2_id,
    "t2_Type",
    target_3_id,
    "t3_Type"
) VALUES (
    $1,$2,$3,$4,$5,$6,$7
) RETURNING *;

-- name: GetTargetUserList :one
SELECT * FROM targetlist
WHERE user_id = $1;

-- name: AllTargetUserList :many
SELECT * FROM targetlist
ORDER BY user_id;

-- name: UpdateTargetList :one
UPDATE targetlist
SET target_1_id = $2,
    "t1_Type" = $3,
    target_2_id = $4,
    "t2_Type" = $5,
    target_3_id = $6,
    "t3_Type" = $7
WHERE user_id = $1 
RETURNING *;

-- name: DeleteTargetList :exec
DELETE FROM targetlist 
WHERE user_id = $1;