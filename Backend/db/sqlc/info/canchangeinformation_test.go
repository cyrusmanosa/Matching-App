package db

import (
	"Backend/util"
	"context"
	"math/rand"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateUserCanChangeInformation(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomUserCanChangeInformation(t, arg)
}

func CreateRandomUserCanChangeInformation(t *testing.T, user Fixinformation) Canchangeinformation {

	exp := rand.Int31n(20) + 1
	Can := CreateUserCanChangeInformationParams{
		UserID:        user.UserID,
		Nickname:      gofakeit.FirstName(),
		City:          util.RandomAddress(user.Country),
		Sexual:        util.RandomSexual(),
		Height:        int32(gofakeit.Number(140, 200)),
		Weight:        int32(gofakeit.Number(40, 150)),
		Speaklanguage: util.SwitchLanguage(user.Country),
		Education:     util.RandomEducation(),
		Job:           util.RandomJob(),
		AnnualSalary:  int32(gofakeit.Number(200, 600)),
		HobbyType:     util.RandomHobbyType(),
		AccompanyType: util.RandomAccompantType(),
		Experience:    exp,
		Sociability:   util.RandomSociability(),
		Religious:     util.RandomReligious(),
		Introduce:     gofakeit.HackerPhrase(),
	}

	CanInformation, err := testinfoQueries.CreateUserCanChangeInformation(context.Background(), Can)
	require.NoError(t, err)
	require.NotEmpty(t, CanInformation)

	require.Equal(t, CanInformation.Nickname, Can.Nickname)
	require.Equal(t, CanInformation.City, Can.City)
	require.Equal(t, CanInformation.Sexual, Can.Sexual)
	require.Equal(t, CanInformation.Height, Can.Height)
	require.Equal(t, CanInformation.Weight, Can.Weight)
	require.Equal(t, CanInformation.Speaklanguage, Can.Speaklanguage)
	require.Equal(t, CanInformation.Education, Can.Education)
	require.Equal(t, CanInformation.Job, Can.Job)
	require.Equal(t, CanInformation.AnnualSalary, Can.AnnualSalary)
	require.Equal(t, CanInformation.Sociability, Can.Sociability)
	require.Equal(t, CanInformation.Religious, Can.Religious)
	require.Equal(t, CanInformation.Introduce, Can.Introduce)
	require.NotZero(t, CanInformation.InfoChangedAt)

	return CanInformation
}

func TestUpdateInformation(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	user := CreateRandomUserCanChangeInformation(t, arg)
	exp := rand.Int31n(20) + 1

	Can := UpdateInformationParams{
		UserID:        user.UserID,
		Nickname:      gofakeit.FirstName(),
		City:          util.RandomAddress(arg.Country),
		Sexual:        util.RandomSexual(),
		Height:        int32(gofakeit.Number(140, 200)),
		Weight:        int32(gofakeit.Number(40, 150)),
		Speaklanguage: util.SwitchLanguage(arg.Country),
		Education:     util.RandomEducation(),
		Job:           util.RandomJob(),
		AnnualSalary:  int32(gofakeit.Number(200, 600)),
		HobbyType:     util.RandomHobbyType(),
		AccompanyType: util.RandomAccompantType(),
		Experience:    exp,
		Sociability:   util.RandomSociability(),
		Religious:     util.RandomReligious(),
		Introduce:     gofakeit.HackerPhrase(),
	}
	UpdateCan, err := testinfoQueries.UpdateInformation(context.Background(), Can)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateCan)
	require.Equal(t, UpdateCan.Nickname, Can.Nickname)
	require.Equal(t, UpdateCan.City, Can.City)
	require.Equal(t, UpdateCan.Sexual, Can.Sexual)
	require.Equal(t, UpdateCan.Height, Can.Height)
	require.Equal(t, UpdateCan.Weight, Can.Weight)
	require.Equal(t, UpdateCan.Speaklanguage, Can.Speaklanguage)
	require.Equal(t, UpdateCan.Education, Can.Education)
	require.Equal(t, UpdateCan.Job, Can.Job)
	require.Equal(t, UpdateCan.AnnualSalary, Can.AnnualSalary)
	require.Equal(t, UpdateCan.Sociability, Can.Sociability)
	require.Equal(t, UpdateCan.Religious, Can.Religious)
	require.Equal(t, UpdateCan.Introduce, Can.Introduce)
	require.NotEqual(t, UpdateCan.InfoChangedAt, user.InfoChangedAt)

}

func TestGetUserCanChangeInformation(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	user1 := CreateRandomUserCanChangeInformation(t, arg)

	GetCan, err := testinfoQueries.GetUserCanChangeInformation(context.Background(), user1.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetCan)

	require.Equal(t, user1.Nickname, GetCan.Nickname)
	require.Equal(t, user1.City, GetCan.City)
	require.Equal(t, user1.Sexual, GetCan.Sexual)
	require.Equal(t, user1.Height, GetCan.Height)
	require.Equal(t, user1.Weight, GetCan.Weight)
	require.Equal(t, user1.Education, GetCan.Education)
	require.Equal(t, user1.Job, GetCan.Job)
	require.Equal(t, user1.AnnualSalary, GetCan.AnnualSalary)
	require.Equal(t, user1.Sociability, GetCan.Sociability)
	require.Equal(t, user1.Religious, GetCan.Religious)
	require.Equal(t, user1.Introduce, GetCan.Introduce)
	require.Equal(t, user1.InfoChangedAt, GetCan.InfoChangedAt)
}

func TestListCanChangeInformation(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateRandomUserFixInformaion(t)
		CreateRandomUserCanChangeInformation(t, arg)
	}

	ListCan, err := testinfoQueries.ListCanChangeInformation(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListCan)

}

func TestDeleteInformation(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Can := CreateRandomUserCanChangeInformation(t, user)

	err := testinfoQueries.DeleteCanChangeInformation(context.Background(), Can.UserID)
	require.NoError(t, err)
}

func TestCanChangeSearchAccompany(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Can := CreateRandomUserCanChangeInformation(t, user)

	se := CanChangeSearchAccompanyParams{
		UserID:        Can.UserID,
		Speaklanguage: &Can.Speaklanguage,
		AccompanyType: &Can.AccompanyType,
		Sociability:   &Can.Sociability,
	}

	cc, err := testinfoQueries.CanChangeSearchAccompany(context.Background(), se)
	require.NoError(t, err)
	require.NotEmpty(t, cc)
}

func TestCanChangeSearchHobby(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Can := CreateRandomUserCanChangeInformation(t, user)

	se := CanChangeSearchHobbyParams{
		UserID:        Can.UserID,
		Speaklanguage: &Can.Speaklanguage,
		HobbyType:     &Can.HobbyType,
		City:          &Can.City,
		Experience:    &Can.Experience,
	}

	cc, err := testinfoQueries.CanChangeSearchHobby(context.Background(), se)
	require.NoError(t, err)
	require.NotEmpty(t, cc)
}

func TestCanChangeSearchLover(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Can := CreateRandomUserCanChangeInformation(t, user)
	se := CanChangeSearchLoverParams{
		UserID:        user.UserID,
		Speaklanguage: &Can.Speaklanguage,
		City:          &Can.City,
		Sexual:        &Can.Sexual,
	}
	cc, err := testinfoQueries.CanChangeSearchLover(context.Background(), se)
	require.NoError(t, err)
	require.NotEmpty(t, cc)
}
