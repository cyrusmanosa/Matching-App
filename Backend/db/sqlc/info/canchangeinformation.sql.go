// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: canchangeinformation.sql

package db

import (
	"context"

)

const canChangeSearchAccompany = `-- name: CanChangeSearchAccompany :many
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at FROM canchangeinformation
WHERE user_id != $1
    AND (speaklanguage = $2 OR $2 IS NULL)
    AND (accompany_type = $3 OR $3 IS NULL)
    AND (sociability = $4 OR $4 IS NULL)
`

type CanChangeSearchAccompanyParams struct {
	UserID        int32       `json:"user_id"`
	Speaklanguage *[]string    `json:"speaklanguage"`
	AccompanyType string `json:"accompany_type"`
	Sociability   string `json:"sociability"`
}

func (q *Queries) CanChangeSearchAccompany(ctx context.Context, arg CanChangeSearchAccompanyParams) ([]Canchangeinformation, error) {
	rows, err := q.db.Query(ctx, canChangeSearchAccompany,
		arg.UserID,
		arg.Speaklanguage,
		arg.AccompanyType,
		arg.Sociability,
	)
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
			&i.HobbyType,
			&i.Experience,
			&i.AccompanyType,
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

const canChangeSearchHobby = `-- name: CanChangeSearchHobby :many
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at FROM canchangeinformation
WHERE user_id != $1
    AND (city = $2 OR $2 IS NULL)
    AND (speaklanguage = $3 OR $3 IS NULL)
    AND (hobby_type = $4 OR $4 IS NULL)
    AND (experience >= $5 OR $5 IS NULL)
`

type CanChangeSearchHobbyParams struct {
	UserID        int32       `json:"user_id"`
	City          *string `json:"city"`
	Speaklanguage *[]string    `json:"speaklanguage"`
	HobbyType     string `json:"hobby_type"`
	Experience    int32 `json:"experience"`
}

func (q *Queries) CanChangeSearchHobby(ctx context.Context, arg CanChangeSearchHobbyParams) ([]Canchangeinformation, error) {
	rows, err := q.db.Query(ctx, canChangeSearchHobby,
		arg.UserID,
		arg.City,
		arg.Speaklanguage,
		arg.HobbyType,
		arg.Experience,
	)
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
			&i.HobbyType,
			&i.Experience,
			&i.AccompanyType,
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

const canChangeSearchLover = `-- name: CanChangeSearchLover :many
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at FROM canchangeinformation
WHERE user_id != $1  
    AND (sexual = $2 OR $2 IS NULL)
    AND (speaklanguage = $3 OR $3 IS NULL)
    AND (city = $4 OR $4 IS NULL)
`

type CanChangeSearchLoverParams struct {
	UserID        int32       `json:"user_id"`
	Sexual       *string `json:"sexual"`
	Speaklanguage *[]string    `json:"speaklanguage"`
	City          *string `json:"city"`
}

func (q *Queries) CanChangeSearchLover(ctx context.Context, arg CanChangeSearchLoverParams) ([]Canchangeinformation, error) {
	rows, err := q.db.Query(ctx, canChangeSearchLover,
		arg.UserID,
		arg.Sexual,
		arg.Speaklanguage,
		arg.City,
	)
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
			&i.HobbyType,
			&i.Experience,
			&i.AccompanyType,
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
    hobby_type,
    experience,
    accompany_type,
    religious,
    introduce
) VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16
) RETURNING user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at
`

type CreateUserCanChangeInformationParams struct {
	UserID        int32       `json:"user_id"`
	Nickname      string `json:"nickname"`
	City          string `json:"city"`
	Sexual        string `json:"sexual"`
	Height        int32 `json:"height"`
	Weight        int32 `json:"weight"`
	Speaklanguage []string    `json:"speaklanguage"`
	Education     string `json:"education"`
	Job           string `json:"job"`
	AnnualSalary  int32 `json:"annual_salary"`
	Sociability   string `json:"sociability"`
	HobbyType     string `json:"hobby_type"`
	Experience    int32 `json:"experience"`
	AccompanyType string `json:"accompany_type"`
	Religious     string `json:"religious"`
	Introduce     string `json:"introduce"`
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
		arg.HobbyType,
		arg.Experience,
		arg.AccompanyType,
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
		&i.HobbyType,
		&i.Experience,
		&i.AccompanyType,
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
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at FROM canchangeinformation
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
		&i.HobbyType,
		&i.Experience,
		&i.AccompanyType,
		&i.Religious,
		&i.Introduce,
		&i.InfoChangedAt,
	)
	return i, err
}

const listCanChangeInformation = `-- name: ListCanChangeInformation :many
SELECT user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at FROM canchangeinformation
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
			&i.HobbyType,
			&i.Experience,
			&i.AccompanyType,
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
    hobby_type = $13,
    experience = $14,
    accompany_type = $15,
    introduce = $16
WHERE user_id = $1
RETURNING user_id, nickname, city, sexual, height, weight, speaklanguage, education, job, annual_salary, sociability, hobby_type, experience, accompany_type, religious, introduce, info_changed_at
`

type UpdateInformationParams struct {
	UserID        int32       `json:"user_id"`
	Nickname      string `json:"nickname"`
	City          string `json:"city"`
	Sexual        string `json:"sexual"`
	Height        int32 `json:"height"`
	Weight        int32 `json:"weight"`
	Speaklanguage []string    `json:"speaklanguage"`
	Education     string `json:"education"`
	Job           string `json:"job"`
	AnnualSalary  int32 `json:"annual_salary"`
	Sociability   string `json:"sociability"`
	Religious     string `json:"religious"`
	HobbyType     string `json:"hobby_type"`
	Experience    int32 `json:"experience"`
	AccompanyType string `json:"accompany_type"`
	Introduce     string `json:"introduce"`
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
		arg.HobbyType,
		arg.Experience,
		arg.AccompanyType,
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
		&i.HobbyType,
		&i.Experience,
		&i.AccompanyType,
		&i.Religious,
		&i.Introduce,
		&i.InfoChangedAt,
	)
	return i, err
}
