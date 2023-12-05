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
type inputTargetUser struct {
	UserID    int32 `json:"user_id" binding:"required"`
	Target1ID int32 `json:"target_1_id" binding:"required"`
	Target2ID int32 `json:"target_2_id" binding:"required"`
	Target3ID int32 `json:"target_3_id" binding:"required"`
}

func (server *Server) CreateTargetList(ctx *gin.Context) {
	var req inputTargetUser
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	arg := info.TargetUserListParams{
		UserID:    req.UserID,
		Target1ID: req.Target1ID,
		Target2ID: req.Target2ID,
		Target3ID: req.Target3ID,
	}

	CreateTL, err := server.store.TargetUserList(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, CreateTL)
}

// Get
type GetTargetUser struct {
	UserID int32 `json:"user_id" binding:"required"`
}

func (server *Server) GetTargetList(ctx *gin.Context) {
	var req GetTargetUser
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	GetTL, err := server.store.GetTargetUserList(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, GetTL)
}

// List
func (server *Server) ShowListTargetList(ctx *gin.Context) {
	list, err := server.store.AllTargetUserList(ctx)
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
type UpdateTargetUser struct {
	UserID    int32 `json:"user_id" binding:"required"`
	Target1ID int32 `json:"target_1_id" binding:"required"`
	Target2ID int32 `json:"target_2_id" binding:"required"`
	Target3ID int32 `json:"target_3_id" binding:"required"`
}

func (server *Server) UpdateTargetList(ctx *gin.Context) {
	var req inputTargetUser
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	arg := info.UpdateTargetListParams{
		UserID:    req.UserID,
		Target1ID: req.Target1ID,
		Target2ID: req.Target2ID,
		Target3ID: req.Target3ID,
	}

	UpdateTL, err := server.store.UpdateTargetList(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, UpdateTL)
}
