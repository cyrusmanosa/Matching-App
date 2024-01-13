package db

import (
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateChangeTargetUser(t *testing.T) {
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	CreateRandomChangeTargetUser(t, arg1, arg2)
}

func CreateRandomChangeTargetUser(t *testing.T, arg1, arg2 Fixinformation) Changetargetuser {
	CTU := CreateChangeTargetUserParams{
		UserID:       arg1.UserID,
		ChangeUserID: arg2.UserID,
		Reason:       gofakeit.HackerPhrase(),
	}

	Row, err1 := testinfoQueries.GetRowCount(context.Background(), arg1.UserID)
	if err1 != nil {
		CTU.Frequency = Row + 1
	} else {
		CTU.Frequency = 1
	}

	C, err := testinfoQueries.CreateChangeTargetUser(context.Background(), CTU)
	require.NoError(t, err)
	require.NotEmpty(t, C)
	require.Equal(t, C.UserID, CTU.UserID)
	require.Equal(t, C.ChangeUserID, CTU.ChangeUserID)
	require.Equal(t, C.Reason, CTU.Reason)
	require.NotZero(t, C.ChangeTime)

	return C
}

func TestGetChangeTargetUserList(t *testing.T) {
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	Get := CreateRandomChangeTargetUser(t, arg1, arg2)

	GetC, err := testinfoQueries.GetChangeTargetUserList(context.Background(), Get.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetC)
	require.Equal(t, GetC.UserID, Get.UserID)
	require.Equal(t, GetC.ChangeUserID, Get.ChangeUserID)
	require.Equal(t, GetC.Reason, Get.Reason)
	require.Equal(t, GetC.Frequency, Get.Frequency)
	require.Equal(t, GetC.ChangeTime, Get.ChangeTime)
}

func TestAllChangeTargetUserList(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg1 := CreateRandomUserFixInformaion(t)
		arg2 := CreateRandomUserFixInformaion(t)
		CreateRandomChangeTargetUser(t, arg1, arg2)
	}
	ListC, err := testinfoQueries.AllChangeTargetUserList(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListC)
}

func TestDeleteData(t *testing.T) {
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	CreateRandomChangeTargetUser(t, arg1, arg2)

	err := testinfoQueries.DeleteChangeTargetUser(context.Background(), arg1.UserID)
	require.NoError(t, err)
}
