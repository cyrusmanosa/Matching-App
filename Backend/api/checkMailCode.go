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

var returnData checkEmailResponse

func (server *Server) CheckEmail(ctx *gin.Context) {
	var CE EmailRequset
	if err := ctx.ShouldBindJSON(&CE); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	if err := checkmail.ValidateFormat(CE.Email); err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	}

	_, err := server.store.LoginAtEmail(ctx, CE.Email)
	if err == nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	} else {
		returnData.Email = CE.Email
		returnData.CheckCode = util.RandomCheckCode()
		sended := util.SendValidateCodeOnEmail(returnData.CheckCode, []string{returnData.Email})

		if sended {
			time.AfterFunc(300*time.Second, func() {
				returnData.CheckCode = ""
			})
		}

		ctx.JSON(http.StatusOK, returnData)
	}
}

type CodeRequest struct {
	CheckCode string `json:"checkcode" binding:"required"`
}
type successResponse struct {
	Email  string `json:"email"`
	Status string `json:"status"`
}

func (server *Server) CheckEmailCode(ctx *gin.Context) {
	var CC CodeRequest
	if err := ctx.ShouldBindJSON(&CC); err != nil {
		log.Fatal(returnData)
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}
	if CC.CheckCode == returnData.CheckCode {
		rsp := successResponse{
			Email:  returnData.Email,
			Status: "OK",
		}
		ctx.JSON(http.StatusOK, rsp)
	}
}
