package gapi

import (
	chdb "Backend/db/sqlc/chat"
	indb "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/token"
	"Backend/util"
	"fmt"
)

type Server struct {
	pb.UnimplementedInformationServer
	pb.UnimplementedChatServer
	config     util.Config
	infoStore  indb.InfoStore
	chatStore  chdb.ChatStore
	tokenMaker token.Maker
}

func NewInfoServer(config util.Config, infoStore indb.InfoStore) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}
	server := &Server{
		config:     config,
		infoStore:  infoStore,
		tokenMaker: tokenMaker,
	}

	return server, nil
}

func NewChatServer(config util.Config, chatStore chdb.ChatStore) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		config:     config,
		chatStore:  chatStore,
		tokenMaker: tokenMaker,
	}

	return server, nil
}
