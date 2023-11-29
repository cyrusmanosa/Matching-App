package controllers

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/util"
	"database/sql"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)
// Create user
// Json input
type createUserRequest struct {
	FirstName      string      `json:"first_name" binding:"required"`
	LastName       string      `json:"last_name" binding:"required"`
	Email          string      `json:"email" binding:"required,email"`
	Password	   string      `json:"password" binding:"required,min=6"`
	Birth          string      `json:"birth" binding:"required"`
	Country        string      `json:"country" binding:"required"`
	Gender         string      `json:"gender" binding:"required"`
	Blood          string      `json:"blood" binding:"required"`
	Age            int32       `json:"age" binding:"required,numeric"`
	Constellation  string      `json:"constellation" binding:"required"`
}
type userResponse struct {
	user_id          int32    `json:"user_id`
	Email             string    `json:"email"`
	CreatedAt         time.Time `json:"created_at"`
}

func newUserResponse(user info.Fixinformation) userResponse {
	return userResponse{
		user_id: user.UserID,
		Email: user.Email,
		CreatedAt: user.CreatedAt.Time,
	}
}

func (server *Server)CreateUserFixInformationControllers(ctx *gin.Context){
	var req createUserRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}
	Hash,_ := util.HashPassword(req.Password)
	arg := info.CreateUserFixInformationParams{
		FirstName: req.FirstName,
		LastName: req.LastName,
		Email: req.Email,
		HashedPassword: Hash,
		Birth: req.Birth,
		Country: req.Country,
		Gender: req.Gender,
		Blood: req.Gender,
		Constellation: req.Constellation,
	}

	user, err := server.store.CreateUserFixInformation(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	rsq := newUserResponse(user)
	ctx.JSON(http.StatusOK, rsq)
}

// Login
type loginUserRequest struct {
	Email string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=6"`
}
type loginUserResponse struct {
	AccessToken string       `json:"access_token"`
	User        userResponse `json:"user"`
}

func (server *Server) GetUserFixInformatioControllers(ctx *gin.Context) {
	var req loginUserRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	user, err := server.store.GetUserFixInformation(ctx, req.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}

		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	err = util.CheckPassword(req.Password, user.HashedPassword)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		return
	}

	accessToken, err := server.tokenMaker.CreateToken(
		user.Email,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	rsp := loginUserResponse{
		AccessToken: accessToken,
		User:        newUserResponse(user),
	}
	ctx.JSON(http.StatusOK, rsp)
}

// List
func (server *Server) ListFixInformaionControllers(ctx *gin.Context){
	list, err := server.store.ListFixInformaion(ctx)
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
// TODO: Delete User by after session