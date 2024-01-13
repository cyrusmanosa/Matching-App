package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/brianvoe/gofakeit"
	"github.com/stretchr/testify/require"
)

const TId = 1
const TN = "u47"

func TestCreateRecord(t *testing.T) {
	CreateRandomRecord(t)
}

func CreateRandomRecord(t *testing.T) Record {
	arg := CreateRecordParams{
		TargetID:  TId,
		RoleType:  util.RandomRole(),
		MediaType: util.Randomstring(3),
		Media:     gofakeit.HackerPhrase(),
		Isread:    gofakeit.Bool(),
	}

	InsertR, err := testChatQueries.CreateRecord(context.Background(), arg, TN)
	require.NoError(t, err)
	require.NotEmpty(t, InsertR)
	require.Equal(t, InsertR.TargetID, arg.TargetID)
	require.Equal(t, InsertR.RoleType, arg.RoleType)
	require.Equal(t, InsertR.MediaType, arg.MediaType)
	require.Equal(t, InsertR.Media, arg.Media)
	require.Equal(t, InsertR.Isread, arg.Isread)
	require.NotEmpty(t, InsertR.CreatedAt)
	return InsertR
}

func TestGetrecord(t *testing.T) {
	getR, err := testChatQueries.GetRecord(context.Background(), TId, TN)
	require.NoError(t, err)
	require.NotEmpty(t, getR)
}

func TestGetTargetID(t *testing.T) {
	tid, err := testChatQueries.GetTargetID(context.Background(), TN)
	require.NoError(t, err)
	require.NotEmpty(t, tid)
}

func TestGetLastMsg(t *testing.T) {
	lmsg, err := testChatQueries.GetLastMsg(context.Background(), TId, TN)
	require.NoError(t, err)
	require.NotEmpty(t, lmsg)
}

func TestUpdateRead(t *testing.T) {
	err := testChatQueries.UpdateRead(context.Background(), TId, TN)
	require.NoError(t, err)
}

func TestUpdateRecord(t *testing.T) {
	arg := CreateRandomRecord(t)
	New := UpdateRecordParams{
		TargetID:  arg.TargetID,
		MediaType: arg.MediaType,
		Media:     gofakeit.HackerPhrase(),
		CreatedAt: arg.CreatedAt,
	}

	UpR, err := testChatQueries.UpdateRecord(context.Background(), New, TN)
	require.NoError(t, err)
	require.NotEmpty(t, UpR)
	require.NotEqual(t, UpR.Media, arg.Media)
}

func TestDeleteRecord(t *testing.T) {
	R := CreateRandomRecord(t)

	arg := DeleteRecordParams{
		TargetID:  TId,
		CreatedAt: R.CreatedAt,
	}

	err := testChatQueries.DeleteRecord(context.Background(), arg, TN)
	require.NoError(t, err)
}
