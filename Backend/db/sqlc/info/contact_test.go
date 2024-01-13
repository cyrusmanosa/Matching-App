package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateComplaint(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	CreateRandomContact(t, user)
}

func CreateRandomContact(t *testing.T, user Fixinformation) Contact {
	Contact := CreateContactParams{
		UserID:      user.UserID,
		ContactType: util.RandomRole(),
		Message:     gofakeit.HackerPhrase(),
		Status:      gofakeit.State(),
	}

	C, err := testinfoQueries.CreateContact(context.Background(), Contact)
	require.NoError(t, err)
	require.NotEmpty(t, C)
	require.Equal(t, C.UserID, Contact.UserID)
	require.Equal(t, C.ContactType, Contact.ContactType)
	require.Equal(t, C.Message, Contact.Message)
	require.Equal(t, C.Status, Contact.Status)
	require.NotZero(t, C.ContactID)
	// require.NotZero(t, C.ContactAt.Time)

	return C
}

func TestGetUserComplaintList(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Cp := CreateRandomContact(t, user)

	GetCp, err := testinfoQueries.GetUserContactList(context.Background(), Cp.ContactID)
	require.NoError(t, err)
	require.NotEmpty(t, GetCp)
	require.Equal(t, Cp.ContactID, Cp.ContactID)
	require.Equal(t, Cp.UserID, Cp.UserID)
	require.Equal(t, Cp.ContactType, Cp.ContactType)
	require.Equal(t, Cp.Message, Cp.Message)
	require.Equal(t, Cp.Status, Cp.Status)
	require.Equal(t, Cp.ContactAt, Cp.ContactAt)
}

func TestUpdateUserComplaint(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Cp := CreateRandomContact(t, user)

	NCP := UpdateUserContactParams{
		ContactID: Cp.ContactID,
		Status:    gofakeit.HackerPhrase(),
	}

	UpdateCP, err := testinfoQueries.UpdateUserContact(context.Background(), NCP)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateCP)
	require.Equal(t, UpdateCP.ContactID, Cp.ContactID)
	require.Equal(t, UpdateCP.UserID, Cp.UserID)
	require.Equal(t, UpdateCP.ContactType, Cp.ContactType)
	require.Equal(t, UpdateCP.Message, Cp.Message)
	require.NotEqual(t, UpdateCP.Status, Cp.Status)
	require.NotEqual(t, UpdateCP.ContactAt, Cp.ContactAt)
}

func TestListComplaint(t *testing.T) {

	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		CreateRandomContact(t, user)
	}

	ListCp, err := testinfoQueries.ListContact(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListCp)
}

func TestDeleteComplaint(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	CP := CreateRandomContact(t, user)

	err := testinfoQueries.DeleteContact(context.Background(), CP.ContactID)
	require.NoError(t, err)
}
