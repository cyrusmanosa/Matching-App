// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0
// source: record.sql

package db

import (
	"context"
	"fmt"
	"time"
)



func (q *Queries) CreateChatTable(ctx context.Context, tablename string) error {
	createTable := fmt.Sprintf(`CREATE TABLE %s (
		"target_id" INT UNIQUE NOT NULL,
		"role_type" VARCHAR NOT NULL,
		"media_type" VARCHAR NOT NULL,
		"message" VARCHAR,
		"media" VARCHAR,
		"created_at" TIMESTAMPTZ NOT NULL DEFAULT (now())
	);`, tablename)

	_, err := q.db.Exec(ctx, createTable)
	return err
}


type CreateRecordParams struct {
	TargetID  int32       `json:"target_id"`
	RoleType  string      `json:"role_type"`
	MediaType string      `json:"media_type"`
	Message   string `json:"message"`
	Media     string `json:"media"`
}

func (q *Queries) CreateRecord(ctx context.Context, arg CreateRecordParams, tablename string) (Record, error) {
	
	createRecord := fmt.Sprintf(`-- name: CreateRecord :one
	INSERT INTO "%s (
		target_id,
		role_type,
		media_type,
		message,
		media
	) VALUES (
		$1,$2,$3,$4,$5
	) RETURNING target_id, role_type, media_type, message, media, created_at
	`,tablename)
	
	row := q.db.QueryRow(ctx, createRecord,
		arg.TargetID,
		arg.RoleType,
		arg.MediaType,
		arg.Message,
		arg.Media,
	)
	var i Record
	err := row.Scan(
		&i.TargetID,
		&i.RoleType,
		&i.MediaType,
		&i.Message,
		&i.Media,
		&i.CreatedAt,
	)
	return i, err
}

type DeleteRecordParams struct {
	TargetID  int32     `json:"target_id"`
	CreatedAt time.Time `json:"created_at"`
}

func (q *Queries) DeleteRecord(ctx context.Context, arg DeleteRecordParams, tablename string) error {
	deleteRecord := fmt.Sprintf(`-- name: DeleteRecord :exec
	DELETE FROM %s
	WHERE target_id = $1
	AND created_at = $2
	`,tablename)
	
	_, err := q.db.Exec(ctx, deleteRecord, arg.TargetID, arg.CreatedAt)
	return err
}

func (q *Queries) Getrecord(ctx context.Context, targetID int32, tablename string) ([]Record, error) {	
	getRecord := fmt.Sprintf(`-- name: GetRecord :many
	SELECT target_id, role_type, media_type, message, media, created_at FROM %s
	WHERE target_id = $1
	ORDER BY created_at
	`,tablename)
	
	rows, err := q.db.Query(ctx, getRecord, targetID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Record{}
	for rows.Next() {
		var i Record
		if err := rows.Scan(
			&i.TargetID,
			&i.RoleType,
			&i.MediaType,
			&i.Message,
			&i.Media,
			&i.CreatedAt,
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


type UpdateRecordParams struct {
	TargetID  int32         `json:"target_id"`
	MediaType string        `json:"media_type"`
	Message   string        `json:"message"`
	CreatedAt time.Time 	`json:"created_at"`
}

func (q *Queries) UpdateRecord(ctx context.Context, arg UpdateRecordParams, tablename string) (Record, error) {
	
	updateRecord := fmt.Sprintf(`-- name: UpdateRecord :one
	UPDATE %s
	SET message = $4
	WHERE target_id = $1
	AND media_type = $2
	AND created_at = $3
	RETURNING target_id, role_type, media_type, message, media, created_at
	`,tablename)

	row := q.db.QueryRow(ctx, updateRecord,
		arg.TargetID,
		arg.MediaType,
		arg.CreatedAt,
		arg.Message,
	)
	var i Record
	err := row.Scan(
		&i.TargetID,
		&i.RoleType,
		&i.MediaType,
		&i.Message,
		&i.Media,
		&i.CreatedAt,
	)
	return i, err
}
