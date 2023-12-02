package controllers

import (
	"Backend/token"
	"Backend/util"
	"fmt"

	db "Backend/db/sqlc/info"

	"github.com/gin-gonic/gin"
)

type Server struct {
	config     util.Config
	store      db.InfoStore
	tokenMaker token.Maker
	router     *gin.Engine
}

func NewServer(config util.Config, store db.InfoStore) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		config:     config,
		store:      store,
		tokenMaker: tokenMaker,
	}

	server.setupRouter()
	return server, nil
}

func (server *Server) setupRouter() {
	router := gin.Default()
	authRoutes := router.Group("/").Use(authMiddleware(server.tokenMaker))

	// before login
	router.POST("/SignUp", server.CheckEmail)              // OK
	router.POST("/SignUpCheckCode", server.CheckEmailCode) // OK
	router.GET("/Login", server.UserLogin)                 // OK

	// transition

	// --------------after take the access token--------------
	// Create
	authRoutes.POST("/CreateFixInfo", server.CreateUserFixInfo)
	authRoutes.POST("/CreateCanChangeInfo", server.CreateUserCanChangeInfo)
	authRoutes.POST("/CreateHobby", server.CreateHobby)
	authRoutes.POST("/CreateLover", server.CreateLover)
	authRoutes.POST("/CreateAccompant", server.CreateAccompany)
	authRoutes.POST("/CreateComplaint", server.CreateComplaint)

	// Update
	authRoutes.POST("/ChangePassword", server.ResetPassword)
	authRoutes.POST("/UpdateCanChangeInfo", server.UpdateCanChangeInfo)
	authRoutes.POST("/UpdateHobby", server.UpdateHobby)
	authRoutes.POST("/UpdateLover", server.UpdateLover)
	authRoutes.POST("/UpdateAccompany", server.UpdateAccompany)
	authRoutes.POST("/UpdateComplaint", server.UpdateComplaint)

	// --------------for staff--------------
	// List
	authRoutes.GET("/FixList", server.ShowListFixInfo)
	authRoutes.GET("/CanChangeList", server.ShowListCanChangeInfo)
	authRoutes.GET("/HobbyList", server.ShowListHobby)
	authRoutes.GET("/LoverList", server.ShowListLover)
	authRoutes.GET("/AccompanyList", server.ShowListAccompany)
	authRoutes.GET("/ComplaintList", server.ShowListComplaint)

	// Del
	authRoutes.POST("/UserDel", server.DeleteUser)
	server.router = router
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}
func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
