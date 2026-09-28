package db

import "context"

const createUserBlock = `
INSERT INTO user_blocks (user_id, target_id, reason)
VALUES ($1, $2, $3)
ON CONFLICT (user_id, target_id) DO UPDATE SET reason = EXCLUDED.reason
`

func (q *Queries) CreateUserBlock(ctx context.Context, userID, targetID int32, reason string) error {
	_, err := q.db.Exec(ctx, createUserBlock, userID, targetID, reason)
	return err
}

const isEitherBlocked = `
SELECT EXISTS (
  SELECT 1 FROM user_blocks
  WHERE (user_id = $1 AND target_id = $2) OR (user_id = $2 AND target_id = $1)
)
`

func (q *Queries) IsEitherBlocked(ctx context.Context, userID, targetID int32) (bool, error) {
	var blocked bool
	err := q.db.QueryRow(ctx, isEitherBlocked, userID, targetID).Scan(&blocked)
	return blocked, err
}

const listBlockedWith = `
SELECT target_id FROM user_blocks WHERE user_id = $1
UNION
SELECT user_id FROM user_blocks WHERE target_id = $1
`

func (q *Queries) ListBlockedWith(ctx context.Context, userID int32) ([]int32, error) {
	rows, err := q.db.Query(ctx, listBlockedWith, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var ids []int32
	for rows.Next() {
		var id int32
		if err = rows.Scan(&id); err != nil {
			return nil, err
		}
		ids = append(ids, id)
	}
	return ids, rows.Err()
}

func (q *Queries) DeleteAccountData(ctx context.Context, userID int32) error {
	statements := []string{
		`DELETE FROM sessions WHERE user_id = $1`,
		`DELETE FROM user_blocks WHERE user_id = $1 OR target_id = $1`,
		`DELETE FROM contact WHERE user_id = $1`,
		`DELETE FROM changetargetuser WHERE user_id = $1 OR change_user_id = $1`,
		`UPDATE targetlist SET target_1_id = 0, "t1_Type" = '' WHERE target_1_id = $1`,
		`UPDATE targetlist SET target_2_id = NULL, "t2_Type" = NULL WHERE target_2_id = $1`,
		`UPDATE targetlist SET target_3_id = NULL, "t3_Type" = NULL WHERE target_3_id = $1`,
		`DELETE FROM targetlist WHERE user_id = $1`,
		`DELETE FROM image WHERE user_id = $1`,
		`DELETE FROM hobby WHERE user_id = $1`,
		`DELETE FROM lover WHERE user_id = $1`,
		`DELETE FROM accompany WHERE user_id = $1`,
		`DELETE FROM canchangeinformation WHERE user_id = $1`,
		`DELETE FROM pending_signups WHERE email = (SELECT email FROM fixinformation WHERE user_id = $1)`,
		`DELETE FROM fixinformation WHERE user_id = $1`,
	}
	for _, statement := range statements {
		if _, err := q.db.Exec(ctx, statement, userID); err != nil {
			return err
		}
	}
	return nil
}
