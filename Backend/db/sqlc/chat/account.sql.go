package db

import (
	"context"
	"fmt"
)

func (q *Queries) DropUserChat(ctx context.Context, userID int32) error {
	if _, err := q.db.Exec(ctx, `DELETE FROM chat_records WHERE owner_id = $1 OR target_id = $1`, userID); err != nil {
		return err
	}
	if _, err := q.db.Exec(ctx, fmt.Sprintf(`DROP TABLE IF EXISTS u%d`, userID)); err != nil {
		return err
	}
	_, err := q.db.Exec(ctx, `DELETE FROM socialmedia WHERE user_id = $1 OR target_id = $1`, userID)
	return err
}
