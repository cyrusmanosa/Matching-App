package db

import (
	"Backend/util"
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestRandomCreateAccompanyRequest(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomAccompanyRequest(t, arg)
}

func CreateRandomAccompanyRequest(t *testing.T, user Fixinformation) Accompanyrequest {

	arg := CreateAccompanyRequestParams{
		UserID:        user.UserID,
		Era:           util.RandomEra(),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Speaklanguage: gofakeit.Language(),
		FindType:      util.RandomAccompantType(),
		FindTarget:    util.RandomAccompantType(),
		Sociability:   util.RandomSociability(),
		Certification: gofakeit.Bool(),
	}

	Accompany, err := testQueries.CreateAccompanyRequest(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, Accompany)
	require.Equal(t, Accompany.UserID, arg.UserID)
	require.Equal(t, Accompany.Era, arg.Era)
	require.Equal(t, Accompany.City, arg.City)
	require.Equal(t, Accompany.Gender, arg.Gender)
	require.Equal(t, Accompany.Speaklanguage, arg.Speaklanguage)
	require.Equal(t, Accompany.FindType, arg.FindType)
	require.Equal(t, Accompany.FindTarget, arg.FindTarget)
	require.Equal(t, Accompany.Sociability, arg.Sociability)
	require.Equal(t, Accompany.Certification, arg.Certification)

	require.NotZero(t, Accompany.InfoChangedAt)

	return Accompany

}

func TestUpdateUserAccompany(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateRandomAccompanyRequest(t, arg)

	Nac := UpdateUserAccompanyParams{
		UserID:        ac.UserID,
		Era:           util.RandomEra(),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Speaklanguage: gofakeit.Language(),
		FindType:      util.RandomAccompantType(),
		FindTarget:    util.RandomAccompantType(),
		Sociability:   util.RandomSociability(),
		Certification: gofakeit.Bool(),
	}

	UpdateAC, err := testQueries.UpdateUserAccompany(context.Background(), Nac)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateAC)
	require.Equal(t, UpdateAC.UserID, Nac.UserID)
	require.Equal(t, UpdateAC.Era, Nac.Era)
	require.Equal(t, UpdateAC.City, Nac.City)
	require.Equal(t, UpdateAC.Gender, Nac.Gender)
	require.Equal(t, UpdateAC.Speaklanguage, Nac.Speaklanguage)
	require.Equal(t, UpdateAC.FindType, Nac.FindType)
	require.Equal(t, UpdateAC.FindTarget, Nac.FindTarget)
	require.Equal(t, UpdateAC.Sociability, Nac.Sociability)
	require.Equal(t, UpdateAC.Certification, Nac.Certification)
	require.NotEqual(t, UpdateAC.InfoChangedAt, ac.InfoChangedAt)
}

func TestGetUserAccompany(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateRandomAccompanyRequest(t, arg)
	GetAC, err := testQueries.GetUserAccompany(context.Background(), ac.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetAC)
	require.Equal(t, GetAC.UserID, ac.UserID)
	require.Equal(t, GetAC.Era, ac.Era)
	require.Equal(t, GetAC.City, ac.City)
	require.Equal(t, GetAC.Gender, ac.Gender)
	require.Equal(t, GetAC.Speaklanguage, ac.Speaklanguage)
	require.Equal(t, GetAC.FindType, ac.FindType)
	require.Equal(t, GetAC.FindTarget, ac.FindTarget)
	require.Equal(t, GetAC.Sociability, ac.Sociability)
	require.Equal(t, GetAC.Certification, ac.Certification)
	require.Equal(t, GetAC.InfoChangedAt, ac.InfoChangedAt)
}

func TestListUserAccompany(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomAccompanyRequest(t, arg)
	}

	ListAC, err := testQueries.ListUserAccompany(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListAC)

}

func TestDeleteUserAccompany(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	ac := CreateRandomAccompanyRequest(t, arg)
	DelAC := testQueries.DeleteUserAccompany(context.Background(), ac.UserID)

	require.Empty(t, DelAC)
}
