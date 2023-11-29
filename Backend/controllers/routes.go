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

	// before login
	router.POST("/CreateUser", server.CreateUserFixInformationControllers)
	router.GET("/Login", server.GetUserFixInformatioControllers)

	// transition
	authRoutes := router.Group("/").Use(authMiddleware(server.tokenMaker))

	// after login
	authRoutes.POST("/CreateCanChangeInfo", server.CreateUserCanChangeInformationControllers)
	authRoutes.GET("/UserList", server.ListFixInformaionControllers)
	server.router = router
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}
func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
