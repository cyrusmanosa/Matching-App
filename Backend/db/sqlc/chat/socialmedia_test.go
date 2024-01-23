package db

import (
	"context"
	"math/rand"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreatesocialmedia(t *testing.T) {
	CreateRandomSocialmedia(t)
}

func CreateRandomSocialmedia(t *testing.T) Socialmedium {
	ta := CreatesocialmediaParams{
		UserID:      rand.Int31n(100) + 1,
		TargetID:    rand.Int31n(100) + 1,
		Image:       gofakeit.Bool(),
		Contact:     gofakeit.Bool(),
		Location:    gofakeit.Bool(),
		Appointment: gofakeit.Bool(),
		Sns:         gofakeit.Bool(),
	}

	sm, err := testChatQueries.Createsocialmedia(context.Background(), ta)
	require.NoError(t, err)
	require.NotEmpty(t, sm)
	require.Equal(t, sm.UserID, ta.UserID)
	require.Equal(t, sm.TargetID, ta.TargetID)
	require.Equal(t, sm.Image, ta.Image)
	require.Equal(t, sm.Contact, ta.Contact)
	require.Equal(t, sm.Location, ta.Location)
	require.Equal(t, sm.Appointment, ta.Appointment)
	require.Equal(t, sm.Sns, ta.Sns)

	return sm
}

func TestDeletesocialmedia(t *testing.T) {
	arg := CreateRandomSocialmedia(t)
	err := testChatQueries.Deletesocialmedia(context.Background(), arg.UserID)
	require.NoError(t, err)
}

func TestGetsocialmedia(t *testing.T) {
	arg := CreateRandomSocialmedia(t)

	sm := GetsocialmediaParams{
		UserID:   arg.UserID,
		TargetID: arg.TargetID,
	}

	getsm, err := testChatQueries.Getsocialmedia(context.Background(), sm)
	require.NoError(t, err)
	require.NotEmpty(t, getsm)
}

func TestListsocialmedia(t *testing.T) {
	for i := 0; i < 5; i++ {
		CreateRandomSocialmedia(t)
	}

	list, err := testChatQueries.Listsocialmedia(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, list)
}

func TestUpdateSocialmedia(t *testing.T) {
	old := CreateRandomSocialmedia(t)

	ta := UpdatesocialmediaParams{
		UserID:      old.UserID,
		TargetID:    old.UserID,
		Image:       gofakeit.Bool(),
		Contact:     gofakeit.Bool(),
		Location:    gofakeit.Bool(),
		Appointment: gofakeit.Bool(),
		Sns:         gofakeit.Bool(),
	}

	sm, err := testChatQueries.Updatesocialmedia(context.Background(), ta)
	require.NoError(t, err)
	require.NotEmpty(t, sm)
}
