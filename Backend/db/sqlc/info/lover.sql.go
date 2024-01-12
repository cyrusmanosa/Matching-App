// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: lover.sql

package db

import (
	"context"
)

const createLover = `-- name: CreateLover :one
INSERT INTO lover (
    user_id,
    min_age,
    max_age,
    city,
    gender,
    sexual,
    speaklanguage
) VALUES (
    $1,$2,$3,$4,$5,$6,$7
) RETURNING user_id, min_age, max_age, city, gender, sexual, speaklanguage, info_changed_at
`

type CreateLoverParams struct {
	UserID        int32  `json:"user_id"`
	MinAge        int32  `json:"min_age"`
	MaxAge        int32  `json:"max_age"`
	City          string `json:"city"`
	Gender        string `json:"gender"`
	Sexual        string `json:"sexual"`
	Speaklanguage string `json:"speaklanguage"`
}

func (q *Queries) CreateLover(ctx context.Context, arg CreateLoverParams) (Lover, error) {
	row := q.db.QueryRow(ctx, createLover,
		arg.UserID,
		arg.MinAge,
		arg.MaxAge,
		arg.City,
		arg.Gender,
		arg.Sexual,
		arg.Speaklanguage,
	)
	var i Lover
	err := row.Scan(
		&i.UserID,
		&i.MinAge,
		&i.MaxAge,
		&i.City,
		&i.Gender,
		&i.Sexual,
		&i.Speaklanguage,
		&i.InfoChangedAt,
	)
	return i, err
}

const deleteLover = `-- name: DeleteLover :exec
DELETE FROM lover 
WHERE user_id = $1
`

func (q *Queries) DeleteLover(ctx context.Context, userID int32) error {
	_, err := q.db.Exec(ctx, deleteLover, userID)
	return err
}

const getLover = `-- name: GetLover :one
SELECT user_id, min_age, max_age, city, gender, sexual, speaklanguage, info_changed_at FROM lover
WHERE user_id = $1 LIMIT 1
`

func (q *Queries) GetLover(ctx context.Context, userID int32) (Lover, error) {
	row := q.db.QueryRow(ctx, getLover, userID)
	var i Lover
	err := row.Scan(
		&i.UserID,
		&i.MinAge,
		&i.MaxAge,
		&i.City,
		&i.Gender,
		&i.Sexual,
		&i.Speaklanguage,
		&i.InfoChangedAt,
	)
	return i, err
}

const listLover = `-- name: ListLover :many
SELECT user_id, min_age, max_age, city, gender, sexual, speaklanguage, info_changed_at FROM lover
ORDER BY user_id
`

func (q *Queries) ListLover(ctx context.Context) ([]Lover, error) {
	rows, err := q.db.Query(ctx, listLover)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Lover{}
	for rows.Next() {
		var i Lover
		if err := rows.Scan(
			&i.UserID,
			&i.MinAge,
			&i.MaxAge,
			&i.City,
			&i.Gender,
			&i.Sexual,
			&i.Speaklanguage,
			&i.InfoChangedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const updateLover = `-- name: UpdateLover :one
UPDATE lover
SET min_age = $2,
    max_age = $3,
    city = $4,
    gender = $5,
    sexual = $6,
    speaklanguage = $7
WHERE user_id = $1
RETURNING user_id, min_age, max_age, city, gender, sexual, speaklanguage, info_changed_at
`

type UpdateLoverParams struct {
	UserID        int32  `json:"user_id"`
	MinAge        int32  `json:"min_age"`
	MaxAge        int32  `json:"max_age"`
	City          string `json:"city"`
	Gender        string `json:"gender"`
	Sexual        string `json:"sexual"`
	Speaklanguage string `json:"speaklanguage"`
}

func (q *Queries) UpdateLover(ctx context.Context, arg UpdateLoverParams) (Lover, error) {
	row := q.db.QueryRow(ctx, updateLover,
		arg.UserID,
		arg.MinAge,
		arg.MaxAge,
		arg.City,
		arg.Gender,
		arg.Sexual,
		arg.Speaklanguage,
	)
	var i Lover
	err := row.Scan(
		&i.UserID,
		&i.MinAge,
		&i.MaxAge,
		&i.City,
		&i.Gender,
		&i.Sexual,
		&i.Speaklanguage,
		&i.InfoChangedAt,
	)
	return i, err
}
