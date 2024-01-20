package db

import (
	"Backend/util"
	"context"
	"strconv"
	"testing"

	"github.com/stretchr/testify/require"
)

const TId = 1
const TN = "u3"

func TestCreateRecordTable(t *testing.T) {
	for i := 402; i <= 611; i++ {
		tablename := "u" + strconv.Itoa(int(i))
		err := testChatQueries.CreateChatTable(context.Background(), tablename)
		require.NoError(t, err)
	}
}

func TestCreateRecord(t *testing.T) {
	CreateRandomRecord(t)
}

func CreateRandomRecord(t *testing.T) Record {
	arg := CreateRecordParams{
		TargetID:  TId,
		RoleType:  util.RandomRole(),
		MediaType: util.RandomMediaType(),
		Media:     util.RandomString(10),
		Isread:    util.RandomBool(),
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
		Media:     util.RandomString(10),
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
