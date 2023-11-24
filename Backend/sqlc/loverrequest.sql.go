// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.24.0
// source: loverrequest.sql

package db

import (
	"context"

	"github.com/jackc/pgx/v5/pgtype"
)

const createLoverRequest = `-- name: CreateLoverRequest :one
INSERT INTO loverrequest (
    user_id,
    min_age,
    max_age,
    city,
    gender,
    constellation,
    sexual,
    height,
    weight,
    job,
    annual_salary,
    sociability,
    religious,
    certification
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14
) RETURNING user_id, min_age, max_age, country, city, gender, constellation, sexual, height, weight, job, annual_salary, sociability, religious, certification, info_changed_at
`

type CreateLoverRequestParams struct {
	UserID        int32       `json:"user_id"`
	MinAge        int32       `json:"min_age"`
	MaxAge        int32       `json:"max_age"`
	City          string      `json:"city"`
	Gender        string      `json:"gender"`
	Constellation string      `json:"constellation"`
	Sexual        string      `json:"sexual"`
	Height        float64     `json:"height"`
	Weight        float64     `json:"weight"`
	Job           string      `json:"job"`
	AnnualSalary  int32       `json:"annual_salary"`
	Sociability   string      `json:"sociability"`
	Religious     string      `json:"religious"`
	Certification pgtype.Bool `json:"certification"`
}

func (q *Queries) CreateLoverRequest(ctx context.Context, arg CreateLoverRequestParams) (Loverrequest, error) {
	row := q.db.QueryRow(ctx, createLoverRequest,
		arg.UserID,
		arg.MinAge,
		arg.MaxAge,
		arg.City,
		arg.Gender,
		arg.Constellation,
		arg.Sexual,
		arg.Height,
		arg.Weight,
		arg.Job,
		arg.AnnualSalary,
		arg.Sociability,
		arg.Religious,
		arg.Certification,
	)
	var i Loverrequest
	err := row.Scan(
		&i.UserID,
		&i.MinAge,
		&i.MaxAge,
		&i.Country,
		&i.City,
		&i.Gender,
		&i.Constellation,
		&i.Sexual,
		&i.Height,
		&i.Weight,
		&i.Job,
		&i.AnnualSalary,
		&i.Sociability,
		&i.Religious,
		&i.Certification,
		&i.InfoChangedAt,
	)
	return i, err
}

const deleteUserLoverRequest = `-- name: DeleteUserLoverRequest :exec
DELETE FROM loverrequest 
WHERE user_id = $1
`

func (q *Queries) DeleteUserLoverRequest(ctx context.Context, userID int32) error {
	_, err := q.db.Exec(ctx, deleteUserLoverRequest, userID)
	return err
}

const getUserLover = `-- name: GetUserLover :one
SELECT user_id, min_age, max_age, country, city, gender, constellation, sexual, height, weight, job, annual_salary, sociability, religious, certification, info_changed_at FROM loverrequest
WHERE user_id = $1 LIMIT 1
`

func (q *Queries) GetUserLover(ctx context.Context, userID int32) (Loverrequest, error) {
	row := q.db.QueryRow(ctx, getUserLover, userID)
	var i Loverrequest
	err := row.Scan(
		&i.UserID,
		&i.MinAge,
		&i.MaxAge,
		&i.Country,
		&i.City,
		&i.Gender,
		&i.Constellation,
		&i.Sexual,
		&i.Height,
		&i.Weight,
		&i.Job,
		&i.AnnualSalary,
		&i.Sociability,
		&i.Religious,
		&i.Certification,
		&i.InfoChangedAt,
	)
	return i, err
}

const listUserLover = `-- name: ListUserLover :many
SELECT user_id, min_age, max_age, country, city, gender, constellation, sexual, height, weight, job, annual_salary, sociability, religious, certification, info_changed_at FROM loverrequest
ORDER BY user_id
`

func (q *Queries) ListUserLover(ctx context.Context) ([]Loverrequest, error) {
	rows, err := q.db.Query(ctx, listUserLover)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Loverrequest{}
	for rows.Next() {
		var i Loverrequest
		if err := rows.Scan(
			&i.UserID,
			&i.MinAge,
			&i.MaxAge,
			&i.Country,
			&i.City,
			&i.Gender,
			&i.Constellation,
			&i.Sexual,
			&i.Height,
			&i.Weight,
			&i.Job,
			&i.AnnualSalary,
			&i.Sociability,
			&i.Religious,
			&i.Certification,
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

const updateUserLover = `-- name: UpdateUserLover :one
UPDATE loverrequest
SET min_age = $2,
    max_age = $3,
    city = $4,
    gender = $5,
    constellation = $6,
    sexual = $7,
    height = $8,
    weight = $9,
    job = $10,
    annual_salary = $11,
    sociability = $12,
    religious = $13,
    certification = $14
WHERE user_id = $1
RETURNING user_id, min_age, max_age, country, city, gender, constellation, sexual, height, weight, job, annual_salary, sociability, religious, certification, info_changed_at
`

type UpdateUserLoverParams struct {
	UserID        int32       `json:"user_id"`
	MinAge        int32       `json:"min_age"`
	MaxAge        int32       `json:"max_age"`
	City          string      `json:"city"`
	Gender        string      `json:"gender"`
	Constellation string      `json:"constellation"`
	Sexual        string      `json:"sexual"`
	Height        float64     `json:"height"`
	Weight        float64     `json:"weight"`
	Job           string      `json:"job"`
	AnnualSalary  int32       `json:"annual_salary"`
	Sociability   string      `json:"sociability"`
	Religious     string      `json:"religious"`
	Certification pgtype.Bool `json:"certification"`
}

func (q *Queries) UpdateUserLover(ctx context.Context, arg UpdateUserLoverParams) (Loverrequest, error) {
	row := q.db.QueryRow(ctx, updateUserLover,
		arg.UserID,
		arg.MinAge,
		arg.MaxAge,
		arg.City,
		arg.Gender,
		arg.Constellation,
		arg.Sexual,
		arg.Height,
		arg.Weight,
		arg.Job,
		arg.AnnualSalary,
		arg.Sociability,
		arg.Religious,
		arg.Certification,
	)
	var i Loverrequest
	err := row.Scan(
		&i.UserID,
		&i.MinAge,
		&i.MaxAge,
		&i.Country,
		&i.City,
		&i.Gender,
		&i.Constellation,
		&i.Sexual,
		&i.Height,
		&i.Weight,
		&i.Job,
		&i.AnnualSalary,
		&i.Sociability,
		&i.Religious,
		&i.Certification,
		&i.InfoChangedAt,
	)
	return i, err
}
