package api

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
	router.POST("/SignUpEmail", server.CheckEmail)
	router.POST("/SignUpCheckCode", server.CheckEmailCode)
	router.POST("/UserLogin", server.UserLogin)
	router.POST("/CreateFixInfo", server.CreateUserFixInfo)

	// --------------after take the access token--------------
	// Create
	authRoutes.POST("/CreateCanChangeInfo", server.CreateUserCanChangeInfo)
	authRoutes.POST("/CreateHobby", server.CreateHobby)
	authRoutes.POST("/CreateLover", server.CreateLover)
	authRoutes.POST("/CreateAccompany", server.CreateAccompany)
	authRoutes.POST("/CreateComplaint", server.CreateComplaint)
	authRoutes.POST("/CreateTargetList", server.CreateTargetList)
	authRoutes.POST("/CreateChangeTarget", server.CreateChangeTarget)
	authRoutes.POST("/CreateImg", server.CreateImage)

	// Get
	authRoutes.GET("/GetCanChange", server.GetCanChangeInfo)
	authRoutes.GET("/GetAccompany", server.GetAccompany)
	authRoutes.GET("/GetHobby", server.GetHobby)
	authRoutes.GET("/GetLover", server.GetLover)
	authRoutes.GET("/GetComplaint", server.GetComplaint)
	authRoutes.GET("/GetTargetList", server.GetTargetList)
	authRoutes.GET("/GetImg", server.GetImages)

	// Update
	authRoutes.PUT("/InputPassword", server.inputPassword)
	authRoutes.PUT("/ChangePassword", server.ResetPassword)
	authRoutes.PUT("/UpdateCanChangeInfo", server.UpdateCanChangeInfo)
	authRoutes.PUT("/UpdateHobby", server.UpdateHobby)
	authRoutes.PUT("/UpdateLover", server.UpdateLover)
	authRoutes.PUT("/UpdateAccompany", server.UpdateAccompany)
	authRoutes.PUT("/UpdateComplaint", server.UpdateComplaint)
	authRoutes.PUT("/UpdateTargetList", server.UpdateTargetList)
	authRoutes.PUT("/UpdateImg", server.UpdateImg)

	// --------------for staff--------------
	// List
	authRoutes.GET("/FixInfoList", server.ShowListFixInfo)
	authRoutes.GET("/CanChangeInfoList", server.ShowListCanChangeInfo)
	authRoutes.GET("/HobbyList", server.ShowListHobby)
	authRoutes.GET("/LoverList", server.ShowListLover)
	authRoutes.GET("/AccompanyList", server.ShowListAccompany)
	authRoutes.GET("/ComplaintList", server.ShowListComplaint)
	authRoutes.GET("/TargetList", server.ShowListTargetList)
	authRoutes.GET("/ChangeTargetList", server.ShowListChangeTarget)
	authRoutes.GET("/ImgList", server.ShowListImg)

	// Del
	authRoutes.DELETE("/UserDel", server.DeleteUser)
	server.router = router
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}
func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
