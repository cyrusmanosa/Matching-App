package db

import (
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestGetrecode(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	RandomRecodeTest(t, user, arg)
}

func RandomRecodeTest(t *testing.T, arg, user Fixinformation) Recordtest {
	RT := RecordTestParams{
		UserID:   user.UserID,
		TargetID: arg.UserID,
		Message:  gofakeit.HackerPhrase(),
		Images:   gofakeit.ImageURL(200, 300),
	}
	RecodeT, err := testchatQueries.RecodeTest(context.Background(), RT)
	require.NoError(t, err)
	require.NotEmpty(t, RecodeT)
	require.Equal(t, RecodeT.UserID, RT.UserID)
	require.Equal(t, RecodeT.TargetID, RT.TargetID)
	require.Equal(t, RecodeT.Message, RT.Message)
	require.Equal(t, RecodeT.Images, RT.Images)
	require.NotZero(t, RecodeT.CreatedAt)

	return RecodeT
}

func TestListrecode(t *testing.T) {
	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		arg := CreateRandomUserFixInformaion(t)
		RandomRecodeTest(t, user, arg)
	}

	listR, err := testchatQueries.Listrecord(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, listR)
}

func TestGetrecord(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	Gr := RandomRecodeTest(t, user, arg)

	Getr, err := testchatQueries.Getrecord(context.Background(), Gr.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, Getr)
	require.Equal(t, Getr.UserID, Gr.UserID)
	require.Equal(t, Getr.TargetID, Gr.TargetID)
	require.Equal(t, Getr.Message, Gr.Message)
	require.Equal(t, Getr.Images, Gr.Images)
	require.Equal(t, Getr.CreatedAt, Gr.CreatedAt)
}
