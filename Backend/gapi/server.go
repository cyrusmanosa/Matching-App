package gapi

import (
	db "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/token"
	"Backend/util"
	"fmt"
)

type Server struct {
	pb.UnimplementedBackendServer
	config     util.Config
	store      db.InfoStore
	tokenMaker token.Maker
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

	return server, nil
}
