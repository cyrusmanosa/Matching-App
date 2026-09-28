package db

import (
	"context"
	"time"
)

const savePendingSignup = `
INSERT INTO pending_signups (code, email, provider, verified, expires_at)
VALUES ($1, $2, $3, $4, $5)
ON CONFLICT (code) DO UPDATE
SET email = EXCLUDED.email,
    provider = EXCLUDED.provider,
    verified = EXCLUDED.verified,
    expires_at = EXCLUDED.expires_at
`

func (q *Queries) SavePendingSignup(ctx context.Context, code, email, provider string, verified bool, expiresAt time.Time) error {
	_, err := q.db.Exec(ctx, savePendingSignup, code, email, provider, verified, expiresAt)
	return err
}

const getPendingSignup = `
SELECT email, provider, verified, expires_at
FROM pending_signups
WHERE code = $1
`

func (q *Queries) GetPendingSignup(ctx context.Context, code string) (email, provider string, verified bool, expiresAt time.Time, err error) {
	err = q.db.QueryRow(ctx, getPendingSignup, code).Scan(&email, &provider, &verified, &expiresAt)
	return
}

const markPendingSignupVerified = `
UPDATE pending_signups
SET verified = true
WHERE code = $1 AND expires_at > now()
`

func (q *Queries) MarkPendingSignupVerified(ctx context.Context, code string) error {
	_, err := q.db.Exec(ctx, markPendingSignupVerified, code)
	return err
}

const deletePendingSignup = `DELETE FROM pending_signups WHERE code = $1`

func (q *Queries) DeletePendingSignup(ctx context.Context, code string) error {
	_, err := q.db.Exec(ctx, deletePendingSignup, code)
	return err
}
