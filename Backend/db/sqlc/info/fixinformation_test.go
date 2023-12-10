package db

import (
	"Backend/util"
	"context"
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateRandomUserFixInformaion(t *testing.T) {
	CreateRandomUserFixInformaion(t)
}

func CreateRandomUserFixInformaion(t *testing.T) Fixinformation {
	Y := rand.Intn(70) + 1923
	M := rand.Intn(12) + 1
	D := rand.Intn(31) + 1
	birthday := strconv.Itoa(Y) + "-" + strconv.Itoa(M) + "-" + strconv.Itoa(D)

	age := int32(time.Now().Year() - Y)

	hashed, err := util.HashPassword(util.RandomPassword(20))
	require.NoError(t, err)

	arg := CreateUserFixInformationParams{
		FirstName:      gofakeit.FirstName(),
		LastName:       gofakeit.LastName(),
		Email:          gofakeit.Email(),
		HashedPassword: hashed,
		Birth:          birthday,
		Country:        gofakeit.Country(),
		Gender:         gofakeit.Gender(),
		Blood:          util.RandomBlood(),
		Age:            age,
		Constellation:  util.SwitchConstellation(M, D),
		Certification:  gofakeit.Bool(),
	}
	fix, err := testinfoQueries.CreateUserFixInformation(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, fix)

	require.Equal(t, fix.FirstName, arg.FirstName)
	require.Equal(t, fix.LastName, arg.LastName)
	require.Equal(t, fix.Email, arg.Email)
	require.Equal(t, fix.HashedPassword, arg.HashedPassword)
	require.Equal(t, fix.Birth, arg.Birth)
	require.Equal(t, fix.Country, arg.Country)
	require.Equal(t, fix.Gender, arg.Gender)
	require.Equal(t, fix.Blood, arg.Blood)
	require.Equal(t, fix.Age, arg.Age)
	require.Equal(t, fix.Constellation, arg.Constellation)
	require.Equal(t, fix.Certification, arg.Certification)

	require.NotZero(t, fix.UserID)
	require.NotZero(t, fix.CreatedAt)

	return fix
}

func TestGetUserFixInformation(t *testing.T) {
	user1 := CreateRandomUserFixInformaion(t)

	user2, err := testinfoQueries.GetUserFixInformation(context.Background(), user1.Email)
	require.NoError(t, err)
	require.NotEmpty(t, user2)

	require.Equal(t, user1.FirstName, user2.FirstName)
	require.Equal(t, user1.LastName, user2.LastName)
	require.Equal(t, user1.Email, user2.Email)
	require.Equal(t, user1.HashedPassword, user2.HashedPassword)
	require.Equal(t, user1.Birth, user2.Birth)
	require.Equal(t, user1.Country, user2.Country)
	require.Equal(t, user1.Gender, user2.Gender)
	require.Equal(t, user1.Blood, user2.Blood)
	require.Equal(t, user1.Age, user2.Age)
	require.Equal(t, user1.Constellation, user2.Constellation)
	require.Equal(t, user1.Certification, user2.Certification)
	require.Equal(t, user1.UserID, user2.UserID)
	require.Equal(t, user1.CreatedAt, user2.CreatedAt)
	require.Equal(t, user1.PasswordChangedAt, user2.PasswordChangedAt)
}

func TestListFixInformation(t *testing.T) {
	for i := 0; i < 10; i++ {
		CreateRandomUserFixInformaion(t)
	}

	user, err := testinfoQueries.ListFixInformation(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, user)

}

func TestUpdatePassword(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)

	NewPW, err := util.HashPassword(util.RandomPassword(20))
	require.NoError(t, err)

	Nhashed := UpdatePasswordParams{
		Email:          user.Email,
		HashedPassword: NewPW,
	}

	New, err := testinfoQueries.UpdatePassword(context.Background(), Nhashed)
	require.NoError(t, err)
	require.NotEmpty(t, New)
	require.NotEqual(t, New.HashedPassword, user.HashedPassword)
	require.NotEqual(t, New.PasswordChangedAt, user.PasswordChangedAt)
}

func TestDeleteUser(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)

	user1 := testinfoQueries.DeleteUser(context.Background(), user.UserID)
	require.Empty(t, user1)
}
