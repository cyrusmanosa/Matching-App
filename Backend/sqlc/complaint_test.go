package db

import (
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateComplaint(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomComplaint(t, user, arg)
}

func CreateRandomComplaint(t *testing.T, user, arg Fixinformation) Complaint {
	Complaint := CreateComplaintParams{
		UserID:     user.UserID,
		CpTargetID: arg.UserID,
		CpType:     gofakeit.ConnectiveComplaint(),
		CpMessage:  gofakeit.HackerPhrase(),
		Status:     gofakeit.HackerPhrase(),
	}

	Cp, err := testinfoQueries.CreateComplaint(context.Background(), Complaint)
	require.NoError(t, err)
	require.NotEmpty(t, Cp)
	require.Equal(t, Cp.UserID, Complaint.UserID)
	require.Equal(t, Cp.CpTargetID, Complaint.CpTargetID)
	require.Equal(t, Cp.CpType, Complaint.CpType)
	require.Equal(t, Cp.Status, Complaint.Status)
	require.NotZero(t, Cp.CpID)
	require.NotZero(t, Cp.ComplaintTime)

	return Cp
}

func TestGetUserComplaintList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	Cp := CreateRandomComplaint(t, user, arg)

	GetCp, err := testinfoQueries.GetUserComplaintList(context.Background(), Cp.CpID)
	require.NoError(t, err)
	require.NotEmpty(t, GetCp)
	require.Equal(t, Cp.CpID, Cp.CpID)
	require.Equal(t, Cp.UserID, Cp.UserID)
	require.Equal(t, Cp.CpTargetID, Cp.CpTargetID)
	require.Equal(t, Cp.CpType, Cp.CpType)
	require.Equal(t, Cp.Status, Cp.Status)
	require.Equal(t, Cp.CpID, Cp.CpID)
	require.Equal(t, Cp.ComplaintTime, Cp.ComplaintTime)
}

func TestUpdateUserComplaint(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	Cp := CreateRandomComplaint(t, user, arg)

	NCP := UpdateUserComplaintParams{
		CpID:      Cp.CpID,
		CpType:    gofakeit.ConnectiveComplaint(),
		CpMessage: gofakeit.HackerPhrase(),
		Status:    gofakeit.HackerPhrase(),
	}

	UpdateCP, err := testinfoQueries.UpdateUserComplaint(context.Background(), NCP)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateCP)
	require.Equal(t, UpdateCP.CpID, Cp.CpID)
	require.Equal(t, UpdateCP.UserID, Cp.UserID)
	require.Equal(t, UpdateCP.CpTargetID, Cp.CpTargetID)
	require.NotEqual(t, UpdateCP.ComplaintTime, Cp.ComplaintTime)
}

func TestListComplaint(t *testing.T) {

	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomComplaint(t, user, arg)
	}

	ListCp, err := testinfoQueries.ListComplaint(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListCp)
}

func TestDeleteComplaint(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	arg := CreateRandomUserFixInformaion(t)
	CP := CreateRandomComplaint(t, user, arg)

	err := testinfoQueries.DeleteComplaint(context.Background(), CP.CpID)
	require.NoError(t, err)
}
