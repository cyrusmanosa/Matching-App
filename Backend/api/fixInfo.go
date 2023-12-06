package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/token"
	"Backend/util"
	"database/sql"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// Create
type createUserRequest struct {
	FirstName     string `json:"first_name" binding:"required"`
	LastName      string `json:"last_name" binding:"required"`
	Birth         string `json:"birth" binding:"required"`
	Country       string `json:"country" binding:"required"`
	Gender        string `json:"gender" binding:"required"`
	Blood         string `json:"blood" binding:"required"`
	Age           int32  `json:"age" binding:"required,numeric"`
	Constellation string `json:"constellation" binding:"required"`
}
type userResponse struct {
	UserID    int32     `json:"user_id"`
	Email     string    `json:"email"`
	CreatedAt time.Time `json:"created_at"`
}

func newUserResponse(user info.Fixinformation) userResponse {
	return userResponse{
		UserID:    user.UserID,
		Email:     user.Email,
		CreatedAt: user.CreatedAt.Time,
	}
}
func (server *Server) CreateUserFixInfo(ctx *gin.Context) {
	var req createUserRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	authPayload := ctx.MustGet(authorizationPayloadKey).(*token.Payload)

	arg := info.CreateUserFixInformationParams{
		FirstName:     req.FirstName,
		LastName:      req.LastName,
		Email:         authPayload.Email,
		Birth:         req.Birth,
		Country:       req.Country,
		Gender:        req.Gender,
		Blood:         req.Blood,
		Age:           req.Age,
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

type passwordRequest struct {
	UserID   int32  `json:"user_id" binding:"required"`
	Password string `json:"password" binding:"required,min=6"`
}

// input password
func (server *Server) inputPassword(ctx *gin.Context) {
	var req passwordRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	Hash, _ := util.HashPassword(req.Password)
	arg := info.UpdatePasswordParams{
		UserID:         req.UserID,
		HashedPassword: Hash,
	}

	inputPW, err := server.store.UpdatePassword(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, inputPW)
}

// Reset Password
type ResetPasswordRequset struct {
	UserID   int32  `json:"user_id" binding:"required"`
	Password string `json:"password" binding:"required"`
}

func (server *Server) ResetPassword(ctx *gin.Context) {
	var req ResetPasswordRequset
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	hash, err := util.HashPassword(req.Password)
	if err != nil {
		return
	}

	NewPassword := info.UpdatePasswordParams{
		UserID:         req.UserID,
		HashedPassword: hash,
	}

	ResetPW, err := server.store.UpdatePassword(ctx, NewPassword)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, ResetPW)
}

// Login
type loginUserRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=6"`
}
type loginUserResponse struct {
	AccessToken string       `json:"access_token"`
	User        userResponse `json:"user"`
}

func (server *Server) UserLogin(ctx *gin.Context) {
	var req loginUserRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}

	// Check Email
	user, err := server.store.GetUserFixInformation(ctx, req.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			log.Println(err)
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	}
	// Password
	err = util.CheckPassword(req.Password, user.HashedPassword)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		log.Println(err)

		return
	}

	accessToken, err := server.tokenMaker.CreateToken(
		user.Email,
		user.Role,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	}

	rsp := loginUserResponse{
		AccessToken: accessToken,
		User:        newUserResponse(user),
	}
	ctx.JSON(http.StatusOK, rsp)
}

// List
func (server *Server) ShowListFixInfo(ctx *gin.Context) {
	list, err := server.store.ListFixInformation(ctx)
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

// Delete
type DeleteController struct {
	UserID int32 `json:"user_id" binding:"required"`
}

func (server *Server) DeleteUser(ctx *gin.Context) {
	var req DeleteController
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		println(" ")
		log.Println(err)
		println(" ")
		return
	}
	// Fix
	err := server.store.DeleteUser(ctx, req.UserID)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	// Can
	err = server.store.DeleteInformation(ctx, req.UserID)
	// Hobby
	err = server.store.DeleteUserHobby(ctx, req.UserID)
	// Lover
	err = server.store.DeleteUserLoverRequest(ctx, req.UserID)
	// Accompany
	err = server.store.DeleteUserAccompany(ctx, req.UserID)
	// Image
	err = server.store.DeleteImage(ctx, req.UserID)
	// Target List
	err = server.store.DeleteTargetList(ctx, req.UserID)
	// Change Target
	err = server.store.DeleteData(ctx, req.UserID)
}
