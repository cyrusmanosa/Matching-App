package api

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func (inserver *InfoServer) GetUserFixInformation(c echo.Context) error {
	ctx := c.Request().Context()
	email := c.FormValue("email")

	result, err := inserver.store.GetUserFixInformation(ctx, email)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
	}
	return c.JSON(http.StatusOK, result)
}
