package db

import "context"

const getLoginProvider = `SELECT login_provider FROM fixinformation WHERE email = $1`

func (q *Queries) GetLoginProvider(ctx context.Context, email string) (string, error) {
	var provider string
	err := q.db.QueryRow(ctx, getLoginProvider, email).Scan(&provider)
	return provider, err
}

const setLoginProvider = `UPDATE fixinformation SET login_provider = $2 WHERE user_id = $1`

func (q *Queries) SetLoginProvider(ctx context.Context, userID int32, provider string) error {
	_, err := q.db.Exec(ctx, setLoginProvider, userID, provider)
	return err
}
