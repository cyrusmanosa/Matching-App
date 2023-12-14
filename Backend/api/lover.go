package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"database/sql"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

// Create
type CreateLoverRequest struct {
	SessionID     uuid.UUID `json:"session_id" binding:"required"`
	MinAge        int32     `json:"min_age" binding:"numeric"`
	MaxAge        int32     `json:"max_age" binding:"numeric"`
	City          string    `json:"city" binding:"required"`
	Gender        string    `json:"gender" binding:"required"`
	Constellation string    `json:"constellation" binding:"required"`
	Sexual        string    `json:"sexual" binding:"required"`
	Height        int32     `json:"height"`
	Weight        int32     `json:"weight"`
	Speaklanguage string    `json:"speak_language"`
	Job           string    `json:"job" binding:"required"`
	AnnualSalary  int32     `json:"annual_salary" binding:"required"`
	Sociability   string    `json:"sociability"`
	Religious     string    `json:"religious" `
	Certification bool      `json:"certification"`
}

func (server *Server) CreateLover(ctx *gin.Context) {
	var req CreateLoverRequest
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

	L := info.CreateLoverRequestParams{
		UserID:        token.UserID,
		MinAge:        req.MinAge,
		MaxAge:        req.MaxAge,
		City:          req.City,
		Gender:        req.Gender,
		Constellation: req.Constellation,
		Sexual:        req.Sexual,
		Height:        req.Height,
		Weight:        req.Weight,
		Speaklanguage: req.Speaklanguage,
		Job:           req.Job,
		AnnualSalary:  req.AnnualSalary,
		Sociability:   req.Sociability,
		Religious:     req.Religious,
		Certification: req.Certification,
	}
	lover, err := server.store.CreateLoverRequest(ctx, L)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, lover)
}

// Get
type GetLoverRequest struct {
	SessionID uuid.UUID `json:"session_id" binding:"required"`
}

func (server *Server) GetLover(ctx *gin.Context) {
	var req GetLoverRequest
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

	GetHobby, err := server.store.GetUserLover(ctx, token.UserID)
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
func (server *Server) ShowListLover(ctx *gin.Context) {
	list, err := server.store.ListUserLover(ctx)
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
type UpdateLoverRequest struct {
	SessionID     uuid.UUID `json:"session_id" binding:"required"`
	MinAge        int32     `json:"min_age" binding:"numeric"`
	MaxAge        int32     `json:"max_age" binding:"numeric"`
	City          string    `json:"city" binding:"required"`
	Gender        string    `json:"gender" binding:"required"`
	Constellation string    `json:"constellation" binding:"required"`
	Sexual        string    `json:"sexual" binding:"required"`
	Height        int32     `json:"height"`
	Weight        int32     `json:"weight"`
	Speaklanguage string    `json:"speaklanguage"`
	Job           string    `json:"job" binding:"required"`
	AnnualSalary  int32     `json:"annual_salary" binding:"required"`
	Sociability   string    `json:"sociability"`
	Religious     string    `json:"religious" `
	Certification bool      `json:"certification"`
}

func (server *Server) UpdateLover(ctx *gin.Context) {
	var req UpdateLoverRequest
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

	L := info.UpdateUserLoverParams{
		UserID:        token.UserID,
		MinAge:        req.MinAge,
		MaxAge:        req.MaxAge,
		City:          req.City,
		Gender:        req.Gender,
		Constellation: req.Constellation,
		Sexual:        req.Sexual,
		Height:        req.Height,
		Weight:        req.Weight,
		Speaklanguage: req.Speaklanguage,
		Job:           req.Job,
		AnnualSalary:  req.AnnualSalary,
		Sociability:   req.Sociability,
		Religious:     req.Religious,
		Certification: req.Certification,
	}
	UpdateLover, err := server.store.UpdateUserLover(ctx, L)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, UpdateLover)
}
