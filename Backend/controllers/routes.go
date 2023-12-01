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
	router.GET("/Login", server.UserLoginControllers)      // OK

	// transition

	// after take the access token
	authRoutes.POST("/CreateFixInfo", server.CreateUserFixInformationControllers)
	authRoutes.POST("/CreateCanChangeInfo", server.CreateUserCanChangeInformationControllers)

	// for inside
	authRoutes.GET("/UserList", server.ShowListFixInfo)
	authRoutes.POST("/UserDel", server.DeleteUser)
	server.router = router
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}
func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
