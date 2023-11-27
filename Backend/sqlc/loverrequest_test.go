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

func CreateRandomLoverRequest(t *testing.T, user Fixinformation) Loverrequest {
	Lover := CreateLoverRequestParams{
		UserID:        user.UserID,
		MinAge:        int32(gofakeit.Number(20, 60)),
		MaxAge:        int32(gofakeit.Number(20, 60)),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Constellation: util.RandomConstellation(),
		Sexual:        util.RandomSexual(),
		Height:        int32(gofakeit.Number(140, 200)),
		Weight:        int32(gofakeit.Number(40, 150)),
		Speaklanguage: gofakeit.Language(),
		Job:           gofakeit.JobTitle(),
		AnnualSalary:  int32(gofakeit.Number(300, 4000)),
		Sociability:   util.RandomSociability(),
		Religious:     util.RandomReligious(),
		Certification: gofakeit.Bool(),
	}

	L, err := testQueries.CreateLoverRequest(context.Background(), Lover)
	require.NoError(t, err)
	require.NotEmpty(t, L)
	require.Equal(t, L.UserID, Lover.UserID)
	require.Equal(t, L.MinAge, Lover.MinAge)
	require.Equal(t, L.MaxAge, Lover.MaxAge)
	require.Equal(t, L.City, Lover.City)
	require.Equal(t, L.Gender, Lover.Gender)
	require.Equal(t, L.Constellation, Lover.Constellation)
	require.Equal(t, L.Sexual, Lover.Sexual)
	require.Equal(t, L.Height, Lover.Height)
	require.Equal(t, L.Weight, Lover.Weight)
	require.Equal(t, L.Speaklanguage, Lover.Speaklanguage)
	require.Equal(t, L.Job, Lover.Job)
	require.Equal(t, L.AnnualSalary, Lover.AnnualSalary)
	require.Equal(t, L.Sociability, Lover.Sociability)
	require.Equal(t, L.Religious, Lover.Religious)
	require.Equal(t, L.Certification, Lover.Certification)
	require.NotZero(t, L.InfoChangedAt)

	return L
}

func TestUpdateUserLover(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	old := CreateRandomLoverRequest(t, arg)

	Lover := UpdateUserLoverParams{
		UserID:        old.UserID,
		MinAge:        int32(gofakeit.Number(20, 60)),
		MaxAge:        int32(gofakeit.Number(20, 60)),
		City:          gofakeit.City(),
		Gender:        gofakeit.Gender(),
		Constellation: util.RandomConstellation(),
		Sexual:        util.RandomSexual(),
		Height:        int32(gofakeit.Number(140, 200)),
		Weight:        int32(gofakeit.Number(40, 150)),
		Speaklanguage: gofakeit.Language(),
		Job:           gofakeit.JobTitle(),
		AnnualSalary:  int32(gofakeit.Number(300, 4000)),
		Sociability:   util.RandomSociability(),
		Religious:     util.RandomReligious(),
		Certification: gofakeit.Bool(),
	}

	UpdateL, err := testQueries.UpdateUserLover(context.Background(), Lover)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateL)
	require.Equal(t, UpdateL.UserID, Lover.UserID)
	require.Equal(t, UpdateL.MinAge, Lover.MinAge)
	require.Equal(t, UpdateL.MaxAge, Lover.MaxAge)
	require.Equal(t, UpdateL.City, Lover.City)
	require.Equal(t, UpdateL.Gender, Lover.Gender)
	require.Equal(t, UpdateL.Constellation, Lover.Constellation)
	require.Equal(t, UpdateL.Sexual, Lover.Sexual)
	require.Equal(t, UpdateL.Height, Lover.Height)
	require.Equal(t, UpdateL.Weight, Lover.Weight)
	require.Equal(t, UpdateL.Speaklanguage, Lover.Speaklanguage)
	require.Equal(t, UpdateL.Job, Lover.Job)
	require.Equal(t, UpdateL.AnnualSalary, Lover.AnnualSalary)
	require.Equal(t, UpdateL.Sociability, Lover.Sociability)
	require.Equal(t, UpdateL.Religious, Lover.Religious)
	require.Equal(t, UpdateL.Certification, Lover.Certification)
	require.NotEqual(t, UpdateL.InfoChangedAt, old.InfoChangedAt)
}

func TestGetUserLover(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	Lover := CreateRandomLoverRequest(t, arg)

	GetL, err := testQueries.GetUserLover(context.Background(), Lover.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetL)
	require.Equal(t, GetL.UserID, Lover.UserID)
	require.Equal(t, GetL.MinAge, Lover.MinAge)
	require.Equal(t, GetL.MaxAge, Lover.MaxAge)
	require.Equal(t, GetL.City, Lover.City)
	require.Equal(t, GetL.Gender, Lover.Gender)
	require.Equal(t, GetL.Constellation, Lover.Constellation)
	require.Equal(t, GetL.Sexual, Lover.Sexual)
	require.Equal(t, GetL.Height, Lover.Height)
	require.Equal(t, GetL.Weight, Lover.Weight)
	require.Equal(t, GetL.Speaklanguage, Lover.Speaklanguage)
	require.Equal(t, GetL.Job, Lover.Job)
	require.Equal(t, GetL.AnnualSalary, Lover.AnnualSalary)
	require.Equal(t, GetL.Sociability, Lover.Sociability)
	require.Equal(t, GetL.Religious, Lover.Religious)
	require.Equal(t, GetL.Certification, Lover.Certification)
	require.Equal(t, GetL.InfoChangedAt, Lover.InfoChangedAt)
}

func TestListUserLover(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomLoverRequest(t, arg)
	}

	ListL, err := testQueries.ListUserLover(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListL)

}

func TestDeleteUserLover(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	Lover := CreateRandomLoverRequest(t, arg)
	DelL := testQueries.DeleteUserLoverRequest(context.Background(), Lover.UserID)

	require.Empty(t, DelL)
}
