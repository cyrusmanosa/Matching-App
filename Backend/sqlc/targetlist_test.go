package db

//TODO: Update Target List function

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestTargetUserList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	RandomTargetUserList(t, user)
}

func RandomTargetUserList(t *testing.T, user Fixinformation) Targetlist {
	arg1 := CreateRandomUserFixInformaion(t)
	arg2 := CreateRandomUserFixInformaion(t)
	arg3 := CreateRandomUserFixInformaion(t)

	Targetlist := TargetUserListParams{
		UserID:    user.UserID,
		Target1ID: arg1.UserID,
		Target2ID: arg2.UserID,
		Target3ID: arg3.UserID,
	}

	Target, err := testinfoQueries.TargetUserList(context.Background(), Targetlist)
	require.NoError(t, err)
	require.NotEmpty(t, Target)
	require.Equal(t, Target.UserID, Targetlist.UserID)
	require.Equal(t, Target.Target1ID, Targetlist.Target1ID)
	require.Equal(t, Target.Target2ID, Targetlist.Target2ID)
	require.Equal(t, Target.Target3ID, Targetlist.Target3ID)
	require.NotZero(t, Target.UpdatedAt)

	return Target
}

func TestGetTargetUserList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	tl := RandomTargetUserList(t, user)

	GetTL, err := testinfoQueries.GetTargetUserList(context.Background(), tl.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetTL)

	require.Equal(t, GetTL.UserID, tl.UserID)
	require.Equal(t, GetTL.Target1ID, tl.Target1ID)
	require.Equal(t, GetTL.Target1ID, tl.Target1ID)
	require.Equal(t, GetTL.Target2ID, tl.Target2ID)
	require.Equal(t, GetTL.Target3ID, tl.Target3ID)
	require.Equal(t, GetTL.UpdatedAt, tl.UpdatedAt)
}

func TestAllTargetUserList(t *testing.T) {
	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		RandomTargetUserList(t, user)
	}

	ListTL, err := testinfoQueries.AllTargetUserList(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListTL)
}

func TestDeleteTargetList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	tl := RandomTargetUserList(t, user)

	err := testinfoQueries.DeleteTargetList(context.Background(), tl.UserID)
	require.NoError(t, err)
}

func TestUpdateTargetList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	tl := RandomTargetUserList(t, user)

	Narg1 := CreateRandomUserFixInformaion(t)
	Narg2 := CreateRandomUserFixInformaion(t)
	Narg3 := CreateRandomUserFixInformaion(t)

	ntl := UpdateTargetListParams{
		UserID:    tl.UserID,
		Target1ID: Narg1.UserID,
		Target2ID: Narg2.UserID,
		Target3ID: Narg3.UserID,
	}

	UpTL, err := testinfoQueries.UpdateTargetList(context.Background(), ntl)
	require.NoError(t, err)
	require.NotEmpty(t, UpTL)
	require.NotEqual(t, UpTL.UpdatedAt, tl.UpdatedAt)
}
