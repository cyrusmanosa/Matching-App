package db

import (
	"context"
	"fmt"
	"time"
)

func (q *Queries) CreateChatTable(ctx context.Context, ownerID int32) error {
	if ownerID <= 0 {
		return fmt.Errorf("invalid chat owner")
	}
	return nil
}

type CreateRecordParams struct {
	TargetID  int32  `json:"target_id"`
	RoleType  string `json:"role_type"`
	MediaType string `json:"media_type"`
	Media     []byte `json:"media"`
	Isread    bool   `json:"isread"`
}

func (q *Queries) CreateRecord(ctx context.Context, arg CreateRecordParams, ownerID int32) (Record, error) {
	row := q.db.QueryRow(ctx, `
INSERT INTO chat_records (owner_id, target_id, role_type, media_type, media, isread)
VALUES ($1, $2, $3, $4, $5, $6)
RETURNING target_id, role_type, media_type, media, isread, created_at
`, ownerID, arg.TargetID, arg.RoleType, arg.MediaType, arg.Media, arg.Isread)
	var record Record
	err := row.Scan(&record.TargetID, &record.RoleType, &record.MediaType, &record.Media, &record.Isread, &record.CreatedAt)
	return record, err
}

type DeleteRecordParams struct {
	TargetID  int32     `json:"target_id"`
	CreatedAt time.Time `json:"created_at"`
}

func (q *Queries) DeleteRecord(ctx context.Context, arg DeleteRecordParams, ownerID int32) error {
	_, err := q.db.Exec(ctx, `
DELETE FROM chat_records
WHERE owner_id = $1 AND target_id = $2 AND created_at = $3
`, ownerID, arg.TargetID, arg.CreatedAt)
	return err
}

func (q *Queries) GetRecord(ctx context.Context, targetID int32, ownerID int32) ([]Record, error) {
	rows, err := q.db.Query(ctx, `
SELECT target_id, role_type, media_type, media, isread, created_at
FROM chat_records
WHERE owner_id = $1 AND target_id = $2
ORDER BY created_at
`, ownerID, targetID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Record
	for rows.Next() {
		var record Record
		if err = rows.Scan(&record.TargetID, &record.RoleType, &record.MediaType, &record.Media, &record.Isread, &record.CreatedAt); err != nil {
			return nil, err
		}
		items = append(items, record)
	}
	return items, rows.Err()
}

func (q *Queries) GetTargetID(ctx context.Context, ownerID int32) ([]int32, error) {
	rows, err := q.db.Query(ctx, `
SELECT DISTINCT target_id
FROM chat_records
WHERE owner_id = $1
`, ownerID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []int32
	for rows.Next() {
		var targetID int32
		if err = rows.Scan(&targetID); err != nil {
			return nil, err
		}
		items = append(items, targetID)
	}
	return items, rows.Err()
}

type GetLastMsgRow struct {
	Media     []byte `json:"media"`
	MediaType string `json:"media_type"`
	Isread    bool   `json:"isread"`
}

func (q *Queries) GetLastMsg(ctx context.Context, targetID int32, ownerID int32) (GetLastMsgRow, error) {
	row := q.db.QueryRow(ctx, `
SELECT media, media_type, isread
FROM chat_records
WHERE owner_id = $1 AND target_id = $2
ORDER BY created_at DESC
LIMIT 1
`, ownerID, targetID)
	var message GetLastMsgRow
	err := row.Scan(&message.Media, &message.MediaType, &message.Isread)
	return message, err
}

func (q *Queries) GetChatRow(ctx context.Context, ownerID int32) (int32, error) {
	row := q.db.QueryRow(ctx, `
SELECT COUNT(*)
FROM chat_records
WHERE owner_id = $1 AND role_type = 'sender'
`, ownerID)
	var count int32
	err := row.Scan(&count)
	return count, err
}

type UpdateRecordParams struct {
	TargetID  int32     `json:"target_id"`
	MediaType string    `json:"media_type"`
	Media     []byte    `json:"message"`
	CreatedAt time.Time `json:"created_at"`
}

func (q *Queries) UpdateRecord(ctx context.Context, arg UpdateRecordParams, ownerID int32) (Record, error) {
	row := q.db.QueryRow(ctx, `
UPDATE chat_records
SET media = $4
WHERE owner_id = $5 AND target_id = $1 AND media_type = $2 AND created_at = $3
RETURNING target_id, role_type, media_type, media, isread, created_at
`, arg.TargetID, arg.MediaType, arg.CreatedAt, arg.Media, ownerID)
	var record Record
	err := row.Scan(&record.TargetID, &record.RoleType, &record.MediaType, &record.Media, &record.Isread, &record.CreatedAt)
	return record, err
}

func (q *Queries) UpdateRead(ctx context.Context, targetID int32, ownerID int32) error {
	_, err := q.db.Exec(ctx, `
UPDATE chat_records
SET isread = true
WHERE owner_id = $1 AND target_id = $2 AND role_type = 'receiver'
`, ownerID, targetID)
	return err
}
