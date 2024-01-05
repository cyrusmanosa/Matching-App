package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/brianvoe/gofakeit"
	"github.com/stretchr/testify/require"
)

const TId = 1
const TableId = "u32"

func TestCreateRecord(t *testing.T) {
	CreateRandomRecord(t)
}

func CreateRandomRecord(t *testing.T) Record {
	arg := CreateRecordParams{
		TargetID:  TId,
		RoleType:  util.RandomRole(),
		MediaType: util.Randomstring(3),
		Message:   gofakeit.HackerPhrase(),
		Media:     gofakeit.URL(),
	}

	InsertR, err := testChatQueries.CreateRecord(context.Background(), arg, TableId)
	require.NoError(t, err)
	require.NotEmpty(t, InsertR)
	require.Equal(t, InsertR.TargetID, arg.TargetID)
	require.Equal(t, InsertR.RoleType, arg.RoleType)
	require.Equal(t, InsertR.MediaType, arg.MediaType)
	require.Equal(t, InsertR.Message, arg.Message)
	require.Equal(t, InsertR.Media, arg.Media)
	require.NotEmpty(t, InsertR.CreatedAt)
	return InsertR
}

func TestGetrecord(t *testing.T) {
	getR, err := testChatQueries.GetRecord(context.Background(), TId, TableId)
	require.NoError(t, err)
	require.NotEmpty(t, getR)
}

func TestUpdateRecord(t *testing.T) {
	arg := CreateRandomRecord(t)
	New := UpdateRecordParams{
		TargetID:  arg.TargetID,
		MediaType: arg.MediaType,
		Message:   gofakeit.HackerPhrase(),
		CreatedAt: arg.CreatedAt,
	}

	UpR, err := testChatQueries.UpdateRecord(context.Background(), New, TableId)
	require.NoError(t, err)
	require.NotEmpty(t, UpR)
	require.NotEqual(t, UpR.Message, arg.Message)
}

func TestDeleteRecord(t *testing.T) {
	R := CreateRandomRecord(t)

	arg := DeleteRecordParams{
		TargetID:  TId,
		CreatedAt: R.CreatedAt,
	}

	err := testChatQueries.DeleteRecord(context.Background(), arg, TableId)
	require.NoError(t, err)
}
