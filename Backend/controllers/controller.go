package controllers

import (
	db "Backend/db/sqlc/info"
	"Backend/util"
	"net/http"

	"github.com/labstack/echo"
)

// insert
func (server *Server)CreateUserFixInformationControllers(c echo.Context) error {
	ctx := c.Request().Context()

	age := 23
	password := c.FormValue("password")
	Hashed,_ := util.HashPassword(password)

	arg := db.CreateUserFixInformationParams{
		FirstName: c.FormValue("first_name"),
		LastName: c.FormValue("last_name"),
		Email: c.FormValue("email"),
		HashedPassword: Hashed,
		Birth: c.FormValue("birth"),
		Country: c.FormValue("country"),
		Gender: c.FormValue("gender"),
		Blood: c.FormValue("blood"),
		Age: int32(age),
		Constellation: c.FormValue("constellation"),
		Certification: false,
	}

	result,err := server.store.CreateUserFixInformation(ctx,arg)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"message": err.Error()})
	}

	return c.JSON(http.StatusOK, result)
}

