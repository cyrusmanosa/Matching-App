package api

import (
	"Backend/util"
	"log"
	"net/http"
	"time"

	"github.com/badoux/checkmail"
	"github.com/gin-gonic/gin"
)

type EmailRequset struct {
	Email string `json:"email" binding:"required"`
}

type checkEmailResponse struct {
	Email     string `json:"email" binding:"required"`
	CheckCode string `json:"check_code"`
}

var req checkEmailResponse

func (server *Server) CheckEmail(ctx *gin.Context) {
	var CE EmailRequset
	if err := ctx.ShouldBindJSON(&CE); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	if err := checkmail.ValidateFormat(CE.Email); err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	}

	_, err := server.store.GetUserFixInformation(ctx, CE.Email)
	if err == nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	} else {
		req.Email = CE.Email
		req.CheckCode = util.RandomCheckCode()
		sended := util.SendValidateCodeOnMail(req.CheckCode, []string{req.Email})

		if sended {
			time.AfterFunc(300*time.Second, func() {
				req.CheckCode = ""
			})
		}

		ctx.JSON(http.StatusOK, req)
	}
}

type CodeRequest struct {
	CheckCode string `json:"checkcode" binding:"required"`
}
type successResponse struct {
	AccessToken string `json:"access_token"`
	Email       string `json:"email"`
}

func (server *Server) CheckEmailCode(ctx *gin.Context) {
	var CC CodeRequest
	if err := ctx.ShouldBindJSON(&CC); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	if CC.CheckCode == req.CheckCode {
		accessToken, err := server.tokenMaker.CreateToken(
			req.Email,
			"",
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
