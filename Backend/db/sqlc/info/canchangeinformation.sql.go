// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: canchangeinformation.sql

package db

import (
	"context"
)

const createUserCanChangeInformation = `-- name: CreateUserCanChangeInformation :one
INSERT INTO canchangeinformation (
    user_id,
    nickname,
    city,
    sexual,
    height,
    weight,
    speaklanguage,
    Education,
    job,
    annual_salary,
    sociability,
    religious,
    introduce
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13
) RETURNING user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, religious, introduce, info_changed_at
`

type CreateUserCanChangeInformationParams struct {
	UserID        int32       `json:"user_id"`
	Nickname      string`json:"nickname"`
	City          string`json:"city"`
	Sexual        string`json:"sexual"`
	Height        int32 `json:"height"`
	Weight        int32 `json:"weight"`
	Speaklanguage string`json:"speaklanguage"`
	Education     string`json:"education"`
	Job           string`json:"job"`
	AnnualSalary  int32 `json:"annual_salary"`
	Sociability   string`json:"sociability"`
	Religious     string`json:"religious"`
	Introduce     string`json:"introduce"`
}

func (q *Queries) CreateUserCanChangeInformation(ctx context.Context, arg CreateUserCanChangeInformationParams) (Canchangeinformation, error) {
	row := q.db.QueryRow(ctx, createUserCanChangeInformation,
		arg.UserID,
		arg.Nickname,
		arg.City,
		arg.Sexual,
		arg.Height,
		arg.Weight,
		arg.Speaklanguage,
		arg.Education,
		arg.Job,
		arg.AnnualSalary,
		arg.Sociability,
		arg.Religious,
		arg.Introduce,
	)
	var i Canchangeinformation
	err := row.Scan(
		&i.UserID,
		&i.Nickname,
		&i.City,
		&i.Sexual,
		&i.Height,
		&i.Weight,
		&i.Speaklanguage,
		&i.Education,
		&i.Job,
		&i.AnnualSalary,
		&i.Sociability,
		&i.Religious,
		&i.Introduce,
		&i.InfoChangedAt,
	)
	return i, err
}

const deleteCanChangeInformation = `-- name: DeleteCanChangeInformation :exec
DELETE FROM canchangeinformation 
WHERE user_id = $1
`

func (q *Queries) DeleteCanChangeInformation(ctx context.Context, userID int32) error {
	_, err := q.db.Exec(ctx, deleteCanChangeInformation, userID)
	return err
}

const getUserCanChangeInformation = `-- name: GetUserCanChangeInformation :one
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, religious, introduce, info_changed_at FROM canchangeinformation
WHERE user_id = $1 LIMIT 1
`

func (q *Queries) GetUserCanChangeInformation(ctx context.Context, userID int32) (Canchangeinformation, error) {
	row := q.db.QueryRow(ctx, getUserCanChangeInformation, userID)
	var i Canchangeinformation
	err := row.Scan(
		&i.UserID,
		&i.Nickname,
		&i.City,
		&i.Sexual,
		&i.Height,
		&i.Weight,
		&i.Speaklanguage,
		&i.Education,
		&i.Job,
		&i.AnnualSalary,
		&i.Sociability,
		&i.Religious,
		&i.Introduce,
		&i.InfoChangedAt,
	)
	return i, err
}

const listCanChangeInformation = `-- name: ListCanChangeInformation :many
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, religious, introduce, info_changed_at FROM canchangeinformation
ORDER BY user_id
`

func (q *Queries) ListCanChangeInformation(ctx context.Context) ([]Canchangeinformation, error) {
	rows, err := q.db.Query(ctx, listCanChangeInformation)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Canchangeinformation{}
	for rows.Next() {
		var i Canchangeinformation
		if err := rows.Scan(
			&i.UserID,
			&i.Nickname,
			&i.City,
			&i.Sexual,
			&i.Height,
			&i.Weight,
			&i.Speaklanguage,
			&i.Education,
			&i.Job,
			&i.AnnualSalary,
			&i.Sociability,
			&i.Religious,
			&i.Introduce,
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

const updateInformation = `-- name: UpdateInformation :one
UPDATE canchangeinformation
SET nickname = $2,
    city = $3,
    sexual = $4,
    height = $5,
    weight = $6,
    speaklanguage = $7,
    Education = $8,
    job = $9,
    annual_salary = $10,
    sociability = $11,
    religious = $12,
    introduce = $13
WHERE user_id = $1
RETURNING user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, religious, introduce, info_changed_at
`

type UpdateInformationParams struct {
	UserID        int32       `json:"user_id"`
	Nickname      string`json:"nickname"`
	City          string`json:"city"`
	Sexual        string`json:"sexual"`
	Height        int32 `json:"height"`
	Weight        int32 `json:"weight"`
	Speaklanguage string`json:"speaklanguage"`
	Education     string`json:"education"`
	Job           string`json:"job"`
	AnnualSalary  int32 `json:"annual_salary"`
	Sociability   string`json:"sociability"`
	Religious     string`json:"religious"`
	Introduce     string`json:"introduce"`
}

func (q *Queries) UpdateInformation(ctx context.Context, arg UpdateInformationParams) (Canchangeinformation, error) {
	row := q.db.QueryRow(ctx, updateInformation,
		arg.UserID,
		arg.Nickname,
		arg.City,
		arg.Sexual,
		arg.Height,
		arg.Weight,
		arg.Speaklanguage,
		arg.Education,
		arg.Job,
		arg.AnnualSalary,
		arg.Sociability,
		arg.Religious,
		arg.Introduce,
	)
	var i Canchangeinformation
	err := row.Scan(
		&i.UserID,
		&i.Nickname,
		&i.City,
		&i.Sexual,
		&i.Height,
		&i.Weight,
		&i.Speaklanguage,
		&i.Education,
		&i.Job,
		&i.AnnualSalary,
		&i.Sociability,
		&i.Religious,
		&i.Introduce,
		&i.InfoChangedAt,
	)
	return i, err
}
