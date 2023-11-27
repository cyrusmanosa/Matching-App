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

func CreateRandomHobbyRequest(t *testing.T, user Fixinformation) Hobbyrequest {
	hobby := CreateHobbyRequestParams{
		UserID:        user.UserID,
		Era:           util.RandomEra(),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Height:        int32(gofakeit.Number(140, 200)),
		Weight:        int32(gofakeit.Number(40, 150)),
		Speaklanguage: gofakeit.Language(),
		FindType:      util.RandomHobbyType(),
		FindTarget:    util.RandomHobbyType(),
		Experience:    int32(gofakeit.Number(0, 30)),
		Sociability:   util.RandomSociability(),
		Certification: gofakeit.Bool(),
	}

	HobbyList, err := testQueries.CreateHobbyRequest(context.Background(), hobby)
	require.NoError(t, err)
	require.NotEmpty(t, HobbyList)
	require.Equal(t, HobbyList.UserID, hobby.UserID)
	require.Equal(t, HobbyList.Era, hobby.Era)
	require.Equal(t, HobbyList.City, hobby.City)
	require.Equal(t, HobbyList.Gender, hobby.Gender)
	require.Equal(t, HobbyList.Height, hobby.Height)
	require.Equal(t, HobbyList.Weight, hobby.Weight)
	require.Equal(t, HobbyList.FindType, hobby.FindType)
	require.Equal(t, HobbyList.FindTarget, hobby.FindTarget)
	require.Equal(t, HobbyList.Experience, hobby.Experience)
	require.Equal(t, HobbyList.Certification, hobby.Certification)
	require.NotZero(t, HobbyList.InfoChangedAt)

	return HobbyList
}

func TestUpdateUserHobby(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	H := CreateRandomHobbyRequest(t, arg)

	NH := UpdateUserHobbyParams{
		UserID:        H.UserID,
		Era:           util.RandomEra(),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Height:        int32(gofakeit.Number(140, 200)),
		Weight:        int32(gofakeit.Number(40, 150)),
		Speaklanguage: gofakeit.Language(),
		FindType:      util.RandomHobbyType(),
		FindTarget:    util.RandomHobbyType(),
		Experience:    int32(gofakeit.Number(0, 30)),
		Sociability:   util.RandomSociability(),
		Certification: gofakeit.Bool(),
	}
	HobbyList, err := testQueries.UpdateUserHobby(context.Background(), NH)
	require.NoError(t, err)
	require.NotEmpty(t, HobbyList)
	require.Equal(t, HobbyList.UserID, NH.UserID)
	require.Equal(t, HobbyList.Era, NH.Era)
	require.Equal(t, HobbyList.City, NH.City)
	require.Equal(t, HobbyList.Gender, NH.Gender)
	require.Equal(t, HobbyList.Height, NH.Height)
	require.Equal(t, HobbyList.Weight, NH.Weight)
	require.Equal(t, HobbyList.FindType, NH.FindType)
	require.Equal(t, HobbyList.FindTarget, NH.FindTarget)
	require.Equal(t, HobbyList.Experience, NH.Experience)
	require.Equal(t, HobbyList.Certification, NH.Certification)
	require.NotEmpty(t, HobbyList.InfoChangedAt, H.InfoChangedAt)
}

func TestGetUserHobby(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	Hobby := CreateRandomHobbyRequest(t, arg)

	HobbyList, err := testQueries.GetUserHobby(context.Background(), Hobby.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, HobbyList)
	require.Equal(t, HobbyList.UserID, Hobby.UserID)
	require.Equal(t, HobbyList.Era, Hobby.Era)
	require.Equal(t, HobbyList.City, Hobby.City)
	require.Equal(t, HobbyList.Gender, Hobby.Gender)
	require.Equal(t, HobbyList.Height, Hobby.Height)
	require.Equal(t, HobbyList.Weight, Hobby.Weight)
	require.Equal(t, HobbyList.FindType, Hobby.FindType)
	require.Equal(t, HobbyList.FindTarget, Hobby.FindTarget)
	require.Equal(t, HobbyList.Experience, Hobby.Experience)
	require.Equal(t, HobbyList.Certification, Hobby.Certification)
	require.Equal(t, HobbyList.InfoChangedAt, Hobby.InfoChangedAt)
}

func TestListUserHobby(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomHobbyRequest(t, arg)
	}

	user, err := testQueries.ListUserHobby(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, user)

}

func TestDeleteUserHobby(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateRandomHobbyRequest(t, arg)
	user := testQueries.DeleteUserHobby(context.Background(), ac.UserID)

	require.Empty(t, user)
}
