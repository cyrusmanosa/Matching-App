package api

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/util"
	"database/sql"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

// Create
type createUserRequest struct {
	FirstName string `json:"first_name" binding:"required"`
	LastName  string `json:"last_name" binding:"required"`
	Birth     string `json:"birth" binding:"required"`
	Country   string `json:"country" binding:"required"`
	Gender    string `json:"gender" binding:"required"`
	Blood     string `json:"blood" binding:"required"`
}
type userResponse struct {
	UserID    int32     `json:"user_id"`
	Email     string    `json:"email"`
	CreatedAt time.Time `json:"created_at"`
}

func (server *Server) CreateUserFixInfo(ctx *gin.Context) {
	var req createUserRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	B, Berr := util.BirthstringtoInt(req.Birth)
	if Berr != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(Berr))
		return
	}
	a := util.SwitchAge(B["year"], B["month"], B["day"])
	Con := util.SwitchConstellation(B["month"], B["day"])

	accessToken, payload, err := server.tokenMaker.CreateToken(
		returnData.Email,
		util.DepositorRole,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	arg := info.CreateUserFixInformationParams{
		FirstName:     req.FirstName,
		LastName:      req.LastName,
		Email:         payload.Email,
		Birth:         req.Birth,
		Country:       req.Country,
		Gender:        req.Gender,
		Blood:         req.Blood,
		Age:           a,
		Constellation: Con,
	}

	user, err := server.store.CreateUserFixInformation(ctx, arg)
	if err != nil {
		log.Print(arg)
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			ctx.JSON(http.StatusForbidden, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	sessions, err := server.store.CreateSession(ctx, info.CreateSessionParams{
		ID:          payload.ID,
		UserID:      user.UserID,
		AccessToken: accessToken,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	rsq := userResponse{
		UserID:    sessions.UserID,
		Email:     user.Email,
		CreatedAt: user.CreatedAt.Time,
	}
	ctx.JSON(http.StatusOK, rsq)
}

// input password
type passwordRequest struct {
	SessionID uuid.UUID `json:"session_id" binding:"required"`
	Password  string    `json:"password" binding:"required,min=8"`
}

func (server *Server) inputPassword(ctx *gin.Context) {
	var req passwordRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		log.Print(err)
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

	Hash, _ := util.HashPassword(req.Password)
	arg := info.UpdatePasswordParams{
		UserID:         token.UserID,
		HashedPassword: Hash,
	}

	inputPW, err := server.store.UpdatePassword(ctx, arg)
	if err != nil {
		println(" ")
		log.Println(err)
		println(" ")
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
	SessionID uuid.UUID `json:"session_id" binding:"required"`
	Password  string    `json:"password" binding:"required"`
}

func (server *Server) ResetPassword(ctx *gin.Context) {
	var req ResetPasswordRequset
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

	hash, err := util.HashPassword(req.Password)
	if err != nil {
		return
	}

	NewPassword := info.UpdatePasswordParams{
		UserID:         token.UserID,
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
	SessionsID           uuid.UUID `json:"sessionsid" binding:"required"`
	Email                string    `json:"email" binding:"required,email"`
	AccessTokenExpiresAt time.Time `json:"access_token_expires_at"`
}

func (server *Server) UserLogin(ctx *gin.Context) {
	var req loginUserRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	// Check Email
	user, err := server.store.LoginAtEmail(ctx, req.Email)
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
	Check := util.CheckPassword(req.Password, user.HashedPassword)
	if Check != nil {
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		log.Println(err)

		return
	}

	accessToken, payload, err := server.tokenMaker.CreateToken(
		user.Email,
		user.Role,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		log.Println(err)
		return
	}

	sessions, err := server.store.CreateSession(ctx, info.CreateSessionParams{
		ID:          payload.ID,
		UserID:      user.UserID,
		AccessToken: accessToken,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})

	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	rsp := loginUserResponse{
		SessionsID:           sessions.ID,
		Email:                user.Email,
		AccessTokenExpiresAt: payload.ExpiredAt,
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
	SessionID uuid.UUID `json:"session_id" binding:"required"`
}

func (server *Server) DeleteUser(ctx *gin.Context) {
	var req DeleteController
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

	// Fix
	err = server.store.DeleteUser(ctx, token.UserID)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}
	// Can
	err = server.store.DeleteCanChangeInformation(ctx, token.UserID)
	// Hobby
	err = server.store.DeleteUserHobby(ctx, token.UserID)
	// Lover
	err = server.store.DeleteUserLoverRequest(ctx, token.UserID)
	// Accompany
	err = server.store.DeleteUserAccompany(ctx, token.UserID)
	// Image
	err = server.store.DeleteImage(ctx, token.UserID)
	// Target List
	err = server.store.DeleteTargetList(ctx, token.UserID)
	// Change Target
	err = server.store.DeleteChangeTargetUser(ctx, token.UserID)
}