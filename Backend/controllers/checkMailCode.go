package controllers

import (
	"Backend/util"
	"net/http"

	"github.com/gin-gonic/gin"
)

type EmailRequset struct {
	Email string `json:"email"`
}

type checkEmailResponse struct {
	Email     string `json:"email"`
	CheckCode string `json:"check_code"`
}

var req checkEmailResponse

func (server *Server) CheckEmail(ctx *gin.Context) {
	var CE EmailRequset
	if err := ctx.ShouldBindJSON(&CE); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
	}
	req.Email = CE.Email
	req.CheckCode = util.RandomCheckCode()

	util.SendMail(req.CheckCode, []string{req.Email})
	ctx.JSON(http.StatusOK, req)
}

type CodeRequest struct {
	CheckCode string `json:"check_code"`
}
type successResponse struct {
	AccessToken string `json:"access_token"`
	Email       string `json:"email"`
}

func (server *Server) CheckEmailCode(ctx *gin.Context) {
	var CC CodeRequest
	if err := ctx.ShouldBindJSON(&CC); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
	}
	if CC.CheckCode == req.CheckCode {
		accessToken, err := server.tokenMaker.CreateToken(
			req.Email,
			server.config.AccessTokenDuration,
		)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, errorResponse(err))
			return
		}
		rsp := successResponse{
			AccessToken: accessToken,
			Email:       req.Email,
		}
		ctx.JSON(http.StatusOK, rsp)
	}
}
