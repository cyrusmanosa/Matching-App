package db

import (
	"context"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateImage(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomImage(t, arg)
}

func CreateRandomImage(t *testing.T, arg Fixinformation) Image {
	Img := CreateImageParams{
		UserID: arg.UserID,
		Qr:     gofakeit.URL(),
		Img1:   gofakeit.URL(),
		Img2:   gofakeit.URL(),
		Img3:   gofakeit.URL(),
		Img4:   gofakeit.URL(),
		Icon:   gofakeit.URL(),
	}

	image, err := testinfoQueries.CreateImage(context.Background(), Img)
	require.NoError(t, err)
	require.NotEmpty(t, image)
	require.Equal(t, image.UserID, arg.UserID)
	require.Equal(t, image.Qr, Img.Qr)
	require.Equal(t, image.Img1, Img.Img1)
	require.Equal(t, image.Img2, Img.Img2)
	require.Equal(t, image.Img3, Img.Img3)
	require.Equal(t, image.Img4, Img.Img4)
	require.Equal(t, image.Icon, Img.Icon)

	return image
}

func TestUpdateImage(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Img := CreateRandomImage(t, user)

	NewImg := UpdateImageParams{
		UserID: Img.UserID,
		Img1:   gofakeit.ImageURL(200, 300),
		Img2:   gofakeit.ImageURL(200, 300),
		Img3:   gofakeit.ImageURL(200, 300),
		Img4:   gofakeit.ImageURL(200, 300),
		Icon:   gofakeit.ImageURL(200, 300),
	}
	UpdateImg, err := testinfoQueries.UpdateImage(context.Background(), NewImg)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateImg)
}

func TestGetUserimageData(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Img := CreateRandomImage(t, user)

	GetImg, err := testinfoQueries.GetUserimageData(context.Background(), Img.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetImg)
	require.Equal(t, GetImg.UserID, Img.UserID)
	require.Equal(t, GetImg.Qr, Img.Qr)
	require.Equal(t, GetImg.Img1, Img.Img1)
	require.Equal(t, GetImg.Img2, Img.Img2)
	require.Equal(t, GetImg.Img3, Img.Img3)
	require.Equal(t, GetImg.Img4, Img.Img4)
	require.Equal(t, GetImg.Icon, Img.Icon)
}

func TestListimagesList(t *testing.T) {
	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		CreateRandomImage(t, user)
	}

	ListImg, err := testinfoQueries.ListimagesList(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListImg)
}

func TestDeleteImage(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Img := CreateRandomImage(t, user)
	err := testinfoQueries.DeleteImage(context.Background(), Img.UserID)
	require.NoError(t, err)
}
