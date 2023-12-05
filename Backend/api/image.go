package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// Create
type CreateImageRequset struct {
	UserID int32  `json:"user_id" binding:"required"`
	Img1   string `json:"img1"`
	Img2   string `json:"img2"`
	Img3   string `json:"img3"`
	Img4   string `json:"img4"`
	Img5   string `json:"img5"`
}

func (server Server) CreateImage(ctx *gin.Context) {
	var req CreateImageRequset
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	arg := info.CreateImageParams{
		UserID: req.UserID,
		Img1:   req.Img1,
		Img2:   req.Img2,
		Img3:   req.Img3,
		Img4:   req.Img4,
		Img5:   req.Img5,
	}

	CreateImg, err := server.store.CreateImage(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, CreateImg)
}

// GET
type GetImageRequset struct {
	UserID int32 `json:"user_id" binding:"required numeric"`
}

func (server Server) GetImages(ctx *gin.Context) {
	var req GetImageRequset
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	GetImg, err := server.store.GetUserimageData(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, GetImg)
}

// List
func (server *Server) ShowListImg(ctx *gin.Context) {
	ListImg, err := server.store.ListimagesList(ctx)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, ListImg)
}

// Update
type UpdateImageRequest struct {
	UserID int32  `json:"user_id" binding:"required numeric"`
	Img1   string `json:"img1" binding:"URL"`
	Img2   string `json:"img2" binding:"URL"`
	Img3   string `json:"img3" binding:"URL"`
	Img4   string `json:"img4" binding:"URL"`
	Img5   string `json:"img5" binding:"URL"`
}

func (server *Server) UpdateImg(ctx *gin.Context) {
	var req UpdateImageRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	arg := info.UpdateImageParams{
		UserID: req.UserID,
		Img1:   req.Img1,
		Img2:   req.Img2,
		Img3:   req.Img3,
		Img4:   req.Img4,
		Img5:   req.Img5,
	}

	UpdateImg, err := server.store.UpdateImage(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, UpdateImg)
}
