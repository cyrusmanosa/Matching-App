package controllers

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"net/http"

	"github.com/gin-gonic/gin"
)

type createCanChangeInfoRequest struct {
	UserID        int32  `json:"user_id",binding:"required"`
	Nickname      string `json:"nickname" binding:"required"`
	City          string `json:"city" binding:"required,alpha"`
	Sexual        string `json:"sexual" binding:"required,alpha"`
	Height        int32  `json:"height" binding:"required,numeric"`
	Weight        int32  `json:"weight" binding:"required,numeric"`
	Speaklanguage string `json:"speaklanguage" binding:"required"`
	Education     string `json:"education" binding:"required,alpha"`
	Job           string `json:"job" binding:"required"`
	AnnualSalary  int32  `json:"annualsalary" binding:"required"`
	Sociability   string `json:"sociability" binding:"required,alpha"`
	Religious     string `json:"religious" binding:"required,alpha"`
	Introduce     string `json:"introduce" binding:"required"`
}

func (server *Server) CreateUserCanChangeInformationControllers(ctx *gin.Context) {
	var req createCanChangeInfoRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}
	arg := info.CreateUserCanChangeInformationParams{
		Nickname:      req.Nickname,
		City:          req.City,
		Sexual:        req.Sexual,
		Height:        req.Height,
		Weight:        req.Weight,
		Speaklanguage: req.Speaklanguage,
		Education:     req.Education,
		Job:           req.Job,
		AnnualSalary:  req.AnnualSalary,
		Sociability:   req.Sociability,
		Religious:     req.Religious,
		Introduce:     req.Introduce,
	}
	user, err := server.store.CreateUserCanChangeInformation(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, user)
}
