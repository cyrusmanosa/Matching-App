package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateLoverRequest(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomLoverRequest(t, arg)
}

func CreateRandomLoverRequest(t *testing.T, user Fixinformation) Lover {
	address := []string{util.RandomAddress(user.Country), util.RandomAddress(user.Country), util.RandomAddress(user.Country)}
	Lover := CreateLoverParams{
		UserID:        user.UserID,
		MinAge:        int32(gofakeit.Number(20, 60)),
		MaxAge:        int32(gofakeit.Number(20, 60)),
		City:          util.SwitchLanguage(user.Country),
		Gender:        util.RandomGender(),
		Sexual:        util.RandomSexual(),
		Speaklanguage: address,
	}

	L, err := testinfoQueries.CreateLover(context.Background(), Lover)
	require.NoError(t, err)
	require.NotEmpty(t, L)
	require.Equal(t, L.UserID, Lover.UserID)
	require.Equal(t, L.MinAge, Lover.MinAge)
	require.Equal(t, L.MaxAge, Lover.MaxAge)
	require.Equal(t, L.City, Lover.City)
	require.Equal(t, L.Gender, Lover.Gender)
	require.Equal(t, L.Sexual, Lover.Sexual)
	require.Equal(t, L.Speaklanguage, Lover.Speaklanguage)
	require.NotZero(t, L.InfoChangedAt)

	return L
}

func TestUpdateUserLover(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	old := CreateRandomLoverRequest(t, arg)
	Naddress := []string{util.RandomAddress(arg.Country), util.RandomAddress(arg.Country), util.RandomAddress(arg.Country)}
	Lover := UpdateLoverParams{
		UserID:        arg.UserID,
		MinAge:        int32(gofakeit.Number(20, 60)),
		MaxAge:        int32(gofakeit.Number(20, 60)),
		City:          Naddress,
		Gender:        util.RandomGender(),
		Sexual:        util.RandomSexual(),
		Speaklanguage: util.SwitchLanguage(arg.Country),
	}

	UpdateL, err := testinfoQueries.UpdateLover(context.Background(), Lover)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateL)
	require.Equal(t, UpdateL.UserID, Lover.UserID)
	require.Equal(t, UpdateL.MinAge, Lover.MinAge)
	require.Equal(t, UpdateL.MaxAge, Lover.MaxAge)
	require.Equal(t, UpdateL.City, Lover.City)
	require.Equal(t, UpdateL.Gender, Lover.Gender)
	require.Equal(t, UpdateL.Sexual, Lover.Sexual)
	require.Equal(t, UpdateL.Speaklanguage, Lover.Speaklanguage)
	require.NotEqual(t, UpdateL.InfoChangedAt, old.InfoChangedAt)
}

func TestGetUserLover(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	Lover := CreateRandomLoverRequest(t, arg)

	GetL, err := testinfoQueries.GetLover(context.Background(), Lover.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetL)
	require.Equal(t, GetL.UserID, Lover.UserID)
	require.Equal(t, GetL.MinAge, Lover.MinAge)
	require.Equal(t, GetL.MaxAge, Lover.MaxAge)
	require.Equal(t, GetL.City, Lover.City)
	require.Equal(t, GetL.Gender, Lover.Gender)
	require.Equal(t, GetL.Sexual, Lover.Sexual)
	require.Equal(t, GetL.Speaklanguage, Lover.Speaklanguage)
	require.Equal(t, GetL.InfoChangedAt, Lover.InfoChangedAt)
}

func TestListUserLover(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomLoverRequest(t, arg)
	}

	ListL, err := testinfoQueries.ListLover(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListL)

}

func TestDeleteUserLover(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	Lover := CreateRandomLoverRequest(t, arg)
	DelL := testinfoQueries.DeleteLover(context.Background(), Lover.UserID)

	require.Empty(t, DelL)
}
