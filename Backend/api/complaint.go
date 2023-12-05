package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"database/sql"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type CreateComplaint struct {
	UserID     int32  `json:"user_id" binding:"required"`
	CpTargetID int32  `json:"cp_target_id" binding:"required"`
	CpType     string `json:"cp_type" binding:"alpha"`
	CpMessage  string `json:"cp_message" binding:"required"`
}

func (server *Server) CreateComplaint(ctx *gin.Context) {
	var req CreateComplaint
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	CP := info.CreateComplaintParams{
		UserID:     req.UserID,
		CpTargetID: req.CpTargetID,
		CpType:     req.CpType,
		CpMessage:  req.CpMessage,
	}
	complaint, err := server.store.CreateComplaint(ctx, CP)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, complaint)
}

// Get
type GetComplaint struct {
	UserID int32 `json:"user_id" binding:"numeric,required"`
}

func (server *Server) GetComplaint(ctx *gin.Context) {
	var req GetComplaint
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	GetCP, err := server.store.GetUserComplaintList(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, GetCP)
}

// Update
type UpdateComplaint struct {
	UserID   int32  `json:"user_id" binding:"numeric,required"`
	Cpstatus string `json:"cp_Status"`
}

func (server *Server) UpdateComplaint(ctx *gin.Context) {
	var req UpdateComplaint
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	Up := info.UpdateUserComplaintParams{
		CpID:   req.UserID,
		Status: req.Cpstatus,
	}

	UpdateCP, err := server.store.UpdateUserComplaint(ctx, Up)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, UpdateCP)
}

// List
func (server *Server) ShowListComplaint(ctx *gin.Context) {
	list, err := server.store.ListComplaint(ctx)
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
