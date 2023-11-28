package db

import (
	"context"
	"testing"

	info "Backend/db/sqlc/info"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func Testgetrecord(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	RandomRecordTest(t, user, arg)
}

func RandomRecordTest(t *testing.T, arg, user info.Fixinformation) Recordtest {
	RT := recordTestParams{
		UserID:   user.UserID,
		TargetID: arg.UserID,
		Message:  gofakeit.HackerPhrase(),
		Images:   gofakeit.ImageURL(200, 300),
	}
	RecodeT, err := testchatQueries.recordTest(context.Background(), RT)
	require.NoError(t, err)
	require.NotEmpty(t, RecodeT)
	require.Equal(t, RecodeT.UserID, RT.UserID)
	require.Equal(t, RecodeT.TargetID, RT.TargetID)
	require.Equal(t, RecodeT.Message, RT.Message)
	require.Equal(t, RecodeT.Images, RT.Images)
	require.NotZero(t, RecodeT.CreatedAt)

	return RecodeT
}

func TestListrecord(t *testing.T) {
	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		arg := CreateRandomUserFixInformaion(t)
		RandomRecordTest(t, user, arg)
	}

	listR, err := testchatQueries.Listrecord(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, listR)
}

func TestGetrecord(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	Gr := RandomRecordTest(t, user, arg)

	Getr, err := testchatQueries.Getrecord(context.Background(), Gr.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, Getr)
	require.Equal(t, Getr.UserID, Gr.UserID)
	require.Equal(t, Getr.TargetID, Gr.TargetID)
	require.Equal(t, Getr.Message, Gr.Message)
	require.Equal(t, Getr.Images, Gr.Images)
	require.Equal(t, Getr.CreatedAt, Gr.CreatedAt)
}
