package api

import (
	db "Backend/db/sqlc/info"
	"Backend/token"
	"Backend/util"
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
)

type InfoServer struct {
	config     util.Config
	store      db.InfoStore
	tokenMaker token.Maker
	router     *echo.Echo
}

func errorResponse(err error) map[string]interface{} {
	return map[string]interface{}{"error": err.Error()}
}

func NewServer(config util.Config) (*InfoServer, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}
	inserver := &InfoServer{
		config:     config,
		tokenMaker: tokenMaker,
	}

	inserver.setupRouter()
	return inserver, nil
}

func (inserver *InfoServer) setupRouter() {
	router := echo.New()
	router.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "OK")
	})

	router.POST("/test1", inserver.GetUserFixInformation)

	// router.Use(middleware.Logger())
	// router.Use(middleware.Recover())

	inserver.router = router
}

func (inserver *InfoServer) Start(address string) error {
	return inserver.router.Start(address)
}
