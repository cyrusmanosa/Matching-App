package api

import (
	"Backend/util"
	"os"
	"testing"
	"time"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	"github.com/sethvargo/go-password/password"
	"github.com/stretchr/testify/require"
)

func TestMain(m *testing.M) {
	e := echo.New()
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	code := m.Run()
	os.Exit(code)
}

func newTestServer(t *testing.T) *InfoServer {
	key, _ := password.Generate(32, 10, 10, false, false)
	config := util.Config{
		TokenSymmetricKey:   key,
		AccessTokenDuration: time.Minute,
	}
	server, err := NewServer(config)
	require.NoError(t, err)

	return server
}
