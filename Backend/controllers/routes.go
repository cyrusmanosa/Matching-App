package controllers

import (
	"Backend/token"
	"Backend/util"
	"fmt"
	"net/http"

	db "Backend/db/sqlc/info"

	"github.com/labstack/echo"
)

type Server struct {
	config     util.Config
	store      db.InfoStore
	tokenMaker token.Maker
	router 		*echo.Echo
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
	server.router = echo.New()

	server.router.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Selamat Data di Echo")
	})
	server.router.POST("/test", server.CreateUserFixInformationControllers)
}

// start runs the HTTP server on specific address
func (server *Server) Run(address string) error {
	return server.router.Start(address)
}

