package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/Pallinder/go-randomdata"
	"github.com/stretchr/testify/require"
)

func TestCreateAccompanyRequest(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateAccompanyRequest(t, arg)
}

func CreateAccompanyRequest(t *testing.T, user Fixinformation) Accompanyrequest {

	arg := CreateAccompanyRequestParams{
		UserID:        user.UserID,
		Era:           util.RandomEra(),
		City:          randomdata.City(),
		Gender:        util.RandomGender(),
		FindType:      util.RandomAccompantType(),
		FindTarget:    util.RandomAccompantType(),
		Sociability:   util.RandomSociability(),
		Certification: randomdata.Boolean(),
	}

	Accompany, err := testQueries.CreateAccompanyRequest(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, Accompany)
	require.Equal(t, Accompany.UserID, arg.UserID)
	require.Equal(t, Accompany.Era, arg.Era)
	require.Equal(t, Accompany.City, arg.City)
	require.Equal(t, Accompany.Gender, arg.Gender)
	require.Equal(t, Accompany.FindType, arg.FindType)
	require.Equal(t, Accompany.FindTarget, arg.FindTarget)
	require.Equal(t, Accompany.Sociability, arg.Sociability)
	require.Equal(t, Accompany.Certification, arg.Certification)

	require.NotZero(t, Accompany.InfoChangedAt)

	return Accompany

}

func TestUpdateUserAccompany(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateAccompanyRequest(t, arg)

	Nac := UpdateUserAccompanyParams{
		UserID:        ac.UserID,
		Era:           util.RandomEra(),
		City:          randomdata.City(),
		Gender:        util.RandomGender(),
		FindType:      util.RandomAccompantType(),
		FindTarget:    util.RandomAccompantType(),
		Sociability:   util.RandomSociability(),
		Certification: randomdata.Boolean(),
	}

	user, err := testQueries.UpdateUserAccompany(context.Background(), Nac)
	require.NoError(t, err)
	require.NotEmpty(t, user)
	require.Equal(t, user.InfoChangedAt, ac.InfoChangedAt)
}

func TestGetUserAccompany(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateAccompanyRequest(t, arg)
	user, err := testQueries.GetUserAccompany(context.Background(), ac.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, user)
}

func TestListUserAccompany(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateAccompanyRequest(t, arg)
	}

	user, err := testQueries.ListUserAccompany(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, user)

}

func TestDeleteUserAccompany(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateAccompanyRequest(t, arg)
	user := testQueries.DeleteUserAccompany(context.Background(), ac.UserID)

	require.Empty(t, user)
}
