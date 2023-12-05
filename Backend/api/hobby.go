package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"database/sql"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// Create
type CreateHobbyRequest struct {
	UserID        int32  `json:"user_id" binding:"required"`
	Era           int32  `json:"era" binding:"numeric"`
	City          string `json:"city" binding:"required"`
	Gender        string `json:"gender" binding:"required"`
	Height        int32  `json:"height"`
	Weight        int32  `json:"weight"`
	Speaklanguage string `json:"speak_language"`
	FindType      string `json:"find_type" binding:"required"`
	FindTarget    string `json:"find_target" binding:"required"`
	Experience    int32  `json:"experience"`
	Sociability   string `json:"sociability"`
	Certification bool   `json:"certification"`
}

func (server *Server) CreateHobby(ctx *gin.Context) {
	var req CreateHobbyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	H := info.CreateHobbyRequestParams{
		UserID:        req.UserID,
		Era:           req.Era,
		City:          req.City,
		Gender:        req.Gender,
		Height:        req.Height,
		Weight:        req.Weight,
		Speaklanguage: req.Speaklanguage,
		FindType:      req.FindType,
		FindTarget:    req.FindTarget,
		Experience:    req.Experience,
		Sociability:   req.Sociability,
		Certification: req.Certification,
	}
	hobby, err := server.store.CreateHobbyRequest(ctx, H)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, hobby)
}

// Get
type GetHobbyRequest struct {
	UserID int32 `json:"user_id" binding:"required"`
}

func (server *Server) GetHobby(ctx *gin.Context) {
	var req GetHobbyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	GetHobby, err := server.store.GetUserHobby(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, GetHobby)
}

// List
func (server *Server) ShowListHobby(ctx *gin.Context) {
	list, err := server.store.ListUserHobby(ctx)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, list)
}

// Update
type UpdateHobbyRequest struct {
	UserID        int32  `json:"user_id" binding:"required"`
	Era           int32  `json:"era" binding:"numeric"`
	City          string `json:"city" binding:"required"`
	Gender        string `json:"gender" binding:"required"`
	Height        int32  `json:"height"`
	Weight        int32  `json:"weight"`
	Speaklanguage string `json:"speaklanguage"`
	FindType      string `json:"find_type" binding:"required"`
	FindTarget    string `json:"find_target" binding:"required"`
	Experience    int32  `json:"experience"`
	Sociability   string `json:"sociability"`
	Certification bool   `json:"certification"`
}

func (server *Server) UpdateHobby(ctx *gin.Context) {
	var req UpdateHobbyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	H := info.UpdateUserHobbyParams{
		UserID:        req.UserID,
		Era:           req.Era,
		City:          req.City,
		Gender:        req.Gender,
		Height:        req.Height,
		Weight:        req.Weight,
		Speaklanguage: req.Speaklanguage,
		FindType:      req.FindType,
		FindTarget:    req.FindTarget,
		Experience:    req.Experience,
		Sociability:   req.Sociability,
		Certification: req.Certification,
	}
	UpdateHobby, err := server.store.UpdateUserHobby(ctx, H)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, UpdateHobby)
}
