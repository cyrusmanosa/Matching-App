package db

//TODO: Update Target List function

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestTargetUserList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	arg3 := CreateRandomUserFixInformaion(t)

	CretaRandomTargetUserList(t, user, arg1, arg2, arg3)
}

func CretaRandomTargetUserList(t *testing.T, user, arg1, arg2, arg3 Fixinformation) Targetlist {
	Targetlist := TargetUserListParams{
		UserID:    user.UserID,
		Target1ID: arg1.UserID,
		T1Type:    util.RandomTT(),
		Target2ID: arg2.UserID,
		T2Type:    util.RandomTT(),
		Target3ID: arg3.UserID,
		T3Type:    util.RandomTT(),
	}

	Target, err := testinfoQueries.TargetUserList(context.Background(), Targetlist)
	require.NoError(t, err)
	require.NotEmpty(t, Target)
	require.Equal(t, Target.UserID, Targetlist.UserID)
	require.Equal(t, Target.Target1ID, Targetlist.Target1ID)
	require.Equal(t, Target.T1Type, Targetlist.T1Type)
	require.Equal(t, Target.Target2ID, Targetlist.Target2ID)
	require.Equal(t, Target.T2Type, Targetlist.T2Type)
	require.Equal(t, Target.Target3ID, Targetlist.Target3ID)
	require.Equal(t, Target.T3Type, Targetlist.T3Type)
	require.NotZero(t, Target.UpdatedAt)

	return Target
}

func TestGetTargetUserList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	arg3 := CreateRandomUserFixInformaion(t)

	tl := CretaRandomTargetUserList(t, user, arg1, arg2, arg3)

	GetTL, err := testinfoQueries.GetTargetUserList(context.Background(), tl.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetTL)

	require.Equal(t, GetTL.UserID, tl.UserID)
	require.Equal(t, GetTL.Target1ID, tl.Target1ID)
	require.Equal(t, GetTL.T1Type, tl.T1Type)
	require.Equal(t, GetTL.Target2ID, tl.Target2ID)
	require.Equal(t, GetTL.T2Type, tl.T2Type)
	require.Equal(t, GetTL.Target3ID, tl.Target3ID)
	require.Equal(t, GetTL.T3Type, tl.T3Type)
	require.Equal(t, GetTL.UpdatedAt, tl.UpdatedAt)
}

func TestAllTargetUserList(t *testing.T) {
	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		arg1 := CreateRandomUserFixInformaion(t)
		arg2 := CreateRandomUserFixInformaion(t)
		arg3 := CreateRandomUserFixInformaion(t)

		CretaRandomTargetUserList(t, user, arg1, arg2, arg3)

	}

	ListTL, err := testinfoQueries.AllTargetUserList(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListTL)
}

func TestDeleteTargetList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	arg3 := CreateRandomUserFixInformaion(t)

	tl := CretaRandomTargetUserList(t, user, arg1, arg2, arg3)

	err := testinfoQueries.DeleteTargetList(context.Background(), tl.UserID)
	require.NoError(t, err)
}

func TestUpdateTargetList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	arg3 := CreateRandomUserFixInformaion(t)

	tl := CretaRandomTargetUserList(t, user, arg1, arg2, arg3)

	Narg1 := CreateRandomUserFixInformaion(t)
	Narg2 := CreateRandomUserFixInformaion(t)
	Narg3 := CreateRandomUserFixInformaion(t)

	ntl := UpdateTargetListParams{
		UserID:    tl.UserID,
		Target1ID: Narg1.UserID,
		T1Type:    util.RandomTT(),
		Target2ID: Narg2.UserID,
		T2Type:    util.RandomTT(),
		Target3ID: Narg3.UserID,
		T3Type:    util.RandomTT(),
	}

	UpTL, err := testinfoQueries.UpdateTargetList(context.Background(), ntl)
	require.NoError(t, err)
	require.NotEmpty(t, UpTL)
	require.NotEqual(t, UpTL.UpdatedAt, tl.UpdatedAt)
}
