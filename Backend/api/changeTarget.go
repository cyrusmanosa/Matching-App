package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

// Create
type CreateChangeTargetRequest struct {
	SessionID    uuid.UUID `json:"session_id" binding:"required"`
	ChangeUserID int32     `json:"change_user_id" binding:"required"`
	Reason       string    `json:"reason"`
}

func (server *Server) CreateChangeTarget(ctx *gin.Context) {
	var req CreateChangeTargetRequest
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

	arg := info.CreateChangeTargetUserParams{
		UserID:       token.UserID,
		ChangeUserID: req.ChangeUserID,
		Reason:       req.Reason,
	}

	Row, Rerr := server.store.GetRowCount(ctx, arg.UserID)
	if Rerr != nil {
		arg.Frequency = 1
	} else {
		arg.Frequency = Row + 1
	}

	CreateCT, err := server.store.CreateChangeTargetUser(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, CreateCT)
}

// Get
type GetChangeTargetRequest struct {
	SessionID uuid.UUID `json:"session_id" binding:"required"`
}

func (server *Server) GetChangeTarget(ctx *gin.Context) {
	var req GetChangeTargetRequest
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

	GetCT, err := server.store.GetChangeTargetUserList(ctx, token.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, GetCT)
}

// list
func (server Server) ShowListChangeTarget(ctx *gin.Context) {
	ListCT, err := server.store.AllChangeTargetUserList(ctx)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, ListCT)
}
