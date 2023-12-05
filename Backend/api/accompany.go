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
type CreateAccompanyRequest struct {
	UserID        int32  `json:"user_id" binding:"required"`
	Era           int32  `json:"era" binding:"numeric"`
	City          string `json:"city" binding:"required"`
	Gender        string `json:"gender" binding:"required"`
	Speaklanguage string `json:"speak_language"`
	FindType      string `json:"find_type" binding:"required"`
	FindTarget    string `json:"find_target" binding:"required"`
	Sociability   string `json:"sociability"`
	Certification bool   `json:"certification"`
}

func (server *Server) CreateAccompany(ctx *gin.Context) {
	var req CreateAccompanyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	Ac := info.CreateAccompanyRequestParams{
		UserID:        req.UserID,
		Era:           req.Era,
		City:          req.City,
		Gender:        req.Gender,
		Speaklanguage: req.Speaklanguage,
		FindType:      req.FindType,
		FindTarget:    req.FindTarget,
		Sociability:   req.Sociability,
		Certification: req.Certification,
	}
	accompany, err := server.store.CreateAccompanyRequest(ctx, Ac)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, accompany)
}

// Get
type GetAccompanyRequest struct {
	UserID int32 `json:"user_id" binding:"required"`
}

func (server *Server) GetAccompany(ctx *gin.Context) {
	var req GetAccompanyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	GetAccompany, err := server.store.GetUserAccompany(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, GetAccompany)
}

// List
func (server *Server) ShowListAccompany(ctx *gin.Context) {
	list, err := server.store.ListUserAccompany(ctx)
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
type UpdateAccompanyRequest struct {
	UserID        int32  `json:"user_id" binding:"required"`
	Era           int32  `json:"era" binding:"numeric"`
	City          string `json:"city" binding:"required"`
	Gender        string `json:"gender" binding:"required"`
	Speaklanguage string `json:"speaklanguage"`
	FindType      string `json:"find_type" binding:"required"`
	FindTarget    string `json:"find_target" binding:"required"`
	Sociability   string `json:"sociability"`
	Certification bool   `json:"certification"`
}

func (server *Server) UpdateAccompany(ctx *gin.Context) {
	var req UpdateHobbyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	Ac := info.UpdateUserAccompanyParams{
		UserID:        req.UserID,
		Era:           req.Era,
		City:          req.City,
		Gender:        req.Gender,
		Speaklanguage: req.Speaklanguage,
		FindType:      req.FindType,
		FindTarget:    req.FindTarget,
		Sociability:   req.Sociability,
		Certification: req.Certification,
	}
	UpdateAccompany, err := server.store.UpdateUserAccompany(ctx, Ac)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, UpdateAccompany)
}
