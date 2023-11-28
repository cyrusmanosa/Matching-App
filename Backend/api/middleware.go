package api

import (
	"Backend/token"
	"errors"
	"fmt"
	"net/http"
	"strings"

	"github.com/labstack/echo"
)

const (
	authorizationHeaderKey  = "authorization"
	authorizationTypeBearer = "bearer"
	authorizationPayloadKey = "authorization_payload"
)

func authMiddleware(tokenMaker token.Maker) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c echo.Context) error {
			authorizationHeader := c.Request().Header.Get("Authorization")
			if len(authorizationHeader) == 0 {
				err := errors.New("authorization header is not provided")
				return c.JSON(http.StatusUnauthorized, errorResponse(err))
			}

			fields := strings.Fields(authorizationHeader)
			if len(fields) < 2 {
				err := errors.New("invalid authorization header format")
				return c.JSON(http.StatusUnauthorized, errorResponse(err))
			}

			authorizationType := strings.ToLower(fields[0])
			if authorizationType != authorizationTypeBearer {
				err := fmt.Errorf("unsupported authorization type %s", authorizationType)
				return c.JSON(http.StatusUnauthorized, errorResponse(err))
			}

			accessToken := fields[1]
			payload, err := tokenMaker.VerifyToken(accessToken)
			if err != nil {
				return c.JSON(http.StatusUnauthorized, errorResponse(err))
			}

			c.Set(authorizationPayloadKey, payload)
			return next(c)
		}
	}
}
