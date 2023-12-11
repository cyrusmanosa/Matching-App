// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.24.0
// source: session.sql

package db

import (
	"context"
	"time"

	"github.com/google/uuid"
)

const createSession = `-- name: CreateSession :one
INSERT INTO sessions (
  id,
  email,
  access_token,
  is_blocked,
  expires_at
) VALUES (
  $1, $2, $3, $4, $5
) RETURNING id, email, access_token, is_blocked, expires_at, created_at
`

type CreateSessionParams struct {
	ID          uuid.UUID          `json:"id"`
	Email       string             `json:"email"`
	AccessToken string             `json:"access_token"`
	IsBlocked   bool               `json:"is_blocked"`
	ExpiresAt   time.Time `json:"expires_at"`
}

func (q *Queries) CreateSession(ctx context.Context, arg CreateSessionParams) (Session, error) {
	row := q.db.QueryRow(ctx, createSession,
		arg.ID,
		arg.Email,
		arg.AccessToken,
		arg.IsBlocked,
		arg.ExpiresAt,
	)
	var i Session
	err := row.Scan(
		&i.ID,
		&i.Email,
		&i.AccessToken,
		&i.IsBlocked,
		&i.ExpiresAt,
		&i.CreatedAt,
	)
	return i, err
}

const getSession = `-- name: GetSession :one
SELECT id, email, access_token, is_blocked, expires_at, created_at FROM sessions
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetSession(ctx context.Context, id uuid.UUID) (Session, error) {
	row := q.db.QueryRow(ctx, getSession, id)
	var i Session
	err := row.Scan(
		&i.ID,
		&i.Email,
		&i.AccessToken,
		&i.IsBlocked,
		&i.ExpiresAt,
		&i.CreatedAt,
	)
	return i, err
}
