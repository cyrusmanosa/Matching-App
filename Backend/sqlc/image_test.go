package db

import (
	"Backend/util"
	"context"
	"fmt"
	"testing"

	"github.com/brianvoe/gofakeit/v6"
	"github.com/stretchr/testify/require"
)

func TestCreateImage(t *testing.T) {
	arg := CreateRandomUserFixInformaion(t)
	CreateRandomImage(t, arg)
}

func CreateRandomImage(t *testing.T, arg Fixinformation) Image {

	filename := fmt.Sprintf("%d_%s", arg.UserID, arg.FirstName)
	path, _ := util.CreateQR(filename, gofakeit.URL())

	Img := CreateImageParams{
		UserID: arg.UserID,
		Qr:     path,
		Img1:   gofakeit.ImageURL(200, 300),
		Img2:   gofakeit.ImageURL(200, 300),
		Img3:   gofakeit.ImageURL(200, 300),
		Img4:   gofakeit.ImageURL(200, 300),
		Img5:   gofakeit.ImageURL(200, 300),
	}

	image, err := testQueries.CreateImage(context.Background(), Img)
	require.NoError(t, err)
	require.NotEmpty(t, image)
	require.Equal(t, image.UserID, arg.UserID)
	require.Equal(t, image.Qr, Img.Qr)
	require.Equal(t, image.Img1, Img.Img1)
	require.Equal(t, image.Img2, Img.Img2)
	require.Equal(t, image.Img3, Img.Img3)
	require.Equal(t, image.Img4, Img.Img4)
	require.Equal(t, image.Img5, Img.Img5)

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
		Img5:   gofakeit.ImageURL(200, 300),
	}
	UpdateImg, err := testQueries.UpdateImage(context.Background(), NewImg)
	require.NoError(t, err)
	require.NotEmpty(t, UpdateImg)
}

func TestGetUserimageData(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Img := CreateRandomImage(t, user)

	GetImg, err := testQueries.GetUserimageData(context.Background(), Img.UserID)
	require.NoError(t, err)
	require.NotEmpty(t, GetImg)
	require.Equal(t, GetImg.UserID, Img.UserID)
	require.Equal(t, GetImg.Qr, Img.Qr)
	require.Equal(t, GetImg.Img1, Img.Img1)
	require.Equal(t, GetImg.Img2, Img.Img2)
	require.Equal(t, GetImg.Img3, Img.Img3)
	require.Equal(t, GetImg.Img4, Img.Img4)
	require.Equal(t, GetImg.Img5, Img.Img5)
}

func TestListimagesList(t *testing.T) {
	for i := 0; i < 10; i++ {
		user := CreateRandomUserFixInformaion(t)
		CreateRandomImage(t, user)
	}

	ListImg, err := testQueries.ListimagesList(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, ListImg)
}

func TestDeleteImage(t *testing.T) {
	user := CreateRandomUserFixInformaion(t)
	Img := CreateRandomImage(t, user)
	err := testQueries.DeleteImage(context.Background(), Img.UserID)
	require.NoError(t, err)
}
