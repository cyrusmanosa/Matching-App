package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateHobbyRequest(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomHobbyRequest(t, arg)
}

func CreateRandomHobbyRequest(t *testing.T, user Fixinformation) Hobby {
	hobby := CreateHobbyParams{
		UserID:        user.UserID,
		Era:           util.RandomEra(),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Speaklanguage: gofakeit.Language(),
		FindType:      util.RandomHobbyType(),
		Experience:    int32(gofakeit.Number(0, 30)),
	}

	HobbyList, err := testinfoQueries.CreateHobby(context.Background(), hobby)
	require.NoError(t, err)
	require.NotEmpty(t, HobbyList)
	require.Equal(t, HobbyList.UserID, hobby.UserID)
	require.Equal(t, HobbyList.Era, hobby.Era)
	require.Equal(t, HobbyList.City, hobby.City)
	require.Equal(t, HobbyList.Gender, hobby.Gender)
	require.Equal(t, HobbyList.FindType, hobby.FindType)
	require.Equal(t, HobbyList.Experience, hobby.Experience)
	require.NotZero(t, HobbyList.InfoChangedAt)

	return HobbyList
}

func TestUpdateUserHobby(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	H := CreateRandomHobbyRequest(t, arg)

	NH := UpdateHobbyParams{
		UserID:        H.UserID,
		Era:           util.RandomEra(),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Speaklanguage: gofakeit.Language(),
		FindType:      util.RandomHobbyType(),
		Experience:    int32(gofakeit.Number(0, 30)),
	}
	HobbyList, err := testinfoQueries.UpdateHobby(context.Background(), NH)
	require.NoError(t, err)
	require.NotEmpty(t, HobbyList)
	require.Equal(t, HobbyList.UserID, NH.UserID)
	require.Equal(t, HobbyList.Era, NH.Era)
	require.Equal(t, HobbyList.City, NH.City)
	require.Equal(t, HobbyList.Gender, NH.Gender)
	require.Equal(t, HobbyList.FindType, NH.FindType)
	require.Equal(t, HobbyList.Experience, NH.Experience)
	require.NotEmpty(t, HobbyList.InfoChangedAt, H.InfoChangedAt)
}

func TestGetUserHobby(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	Hobby := CreateRandomHobbyRequest(t, arg)

	HobbyList, err := testinfoQueries.GetHobby(context.Background(), Hobby.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, HobbyList)
	require.Equal(t, HobbyList.UserID, Hobby.UserID)
	require.Equal(t, HobbyList.Era, Hobby.Era)
	require.Equal(t, HobbyList.City, Hobby.City)
	require.Equal(t, HobbyList.Gender, Hobby.Gender)
	require.Equal(t, HobbyList.FindType, Hobby.FindType)
	require.Equal(t, HobbyList.Experience, Hobby.Experience)
	require.Equal(t, HobbyList.InfoChangedAt, Hobby.InfoChangedAt)
}

func TestListUserHobby(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomHobbyRequest(t, arg)
	}

	user, err := testinfoQueries.ListHobby(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, user)

}

func TestDeleteUserHobby(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateRandomHobbyRequest(t, arg)
	user := testinfoQueries.DeleteHobby(context.Background(), ac.UserID)

	require.Empty(t, user)
}
