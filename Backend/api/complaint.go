package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"database/sql"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

type CreateComplaint struct {
	SessionID  uuid.UUID `json:"session_id" binding:"required"`
	CpTargetID int32     `json:"cp_target_id" binding:"required"`
	CpType     string    `json:"cp_type" binding:"alpha"`
	CpMessage  string    `json:"cp_message" binding:"required"`
}

func (server *Server) CreateComplaint(ctx *gin.Context) {
	var req CreateComplaint
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	token, err := server.store.GetSession(ctx, req.SessionID)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	CP := info.CreateComplaintParams{
		UserID:     token.UserID,
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
	SessionID uuid.UUID `json:"session_id" binding:"required"`
	CpID      int32     `json:"cp_id" binding:"required"`
}

func (server *Server) GetComplaint(ctx *gin.Context) {
	var req GetComplaint
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	token, err := server.store.GetSession(ctx, req.SessionID)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	GetCP, err := server.store.GetUserComplaintList(ctx, req.CpID)
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
	SessionID uuid.UUID `json:"session_id" binding:"required"`
	CpID      int32     `json:"cp_id" binding:"required"`
	Cpstatus  string    `json:"cp_Status"`
}

func (server *Server) UpdateComplaint(ctx *gin.Context) {
	var req UpdateComplaint
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	token, err := server.store.GetSession(ctx, req.SessionID)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	Up := info.UpdateUserComplaintParams{
		CpID:   req.CpID,
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
