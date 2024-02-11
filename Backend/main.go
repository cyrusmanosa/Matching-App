package main

import (
	chdb "Backend/db/sqlc/chat"
	indb "Backend/db/sqlc/info"
	"Backend/gapi"
	"Backend/pb"
	"Backend/util"
	"context"
	"net"
	"os"

	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"

	_ "github.com/golang/mock/mockgen/model"
	"github.com/jackc/pgx/v5/pgxpool"
	_ "github.com/lib/pq"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	config, err := util.LoadConfig("./")
	if err != nil {
		log.Fatal().Msg("cannot load config:")
	}

	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})

	// Info
	info_conn, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal().Msg("cannot connect to Info indb")
	}
	defer info_conn.Close()
	instore := indb.NewInfoStore(info_conn)

	// Chat
	chat_conn, err := pgxpool.New(context.Background(), config.DBSourceChat)
	if err != nil {
		log.Fatal().Msg("cannot connect to Info chdb")
	}
	defer info_conn.Close()
	chstore := chdb.NewChatStore(chat_conn)

	runGrpcServer(config, instore, chstore)
}

// Grpc
func runGrpcServer(config util.Config, inStore indb.InfoStore, chStore chdb.ChatStore) {
	InfoServer, err := gapi.NewInfoServer(config, inStore)
	if err != nil {
		log.Print(err)
	}
	ChatServer, err := gapi.NewChatServer(config, chStore)
	if err != nil {
		log.Print(err)
	}

	// Logger
	grpcLogger := grpc.UnaryInterceptor(gapi.GprcLogger)
	grpcServer := grpc.NewServer(grpcLogger)

	pb.RegisterInformationServer(grpcServer, InfoServer)
	pb.RegisterChatServer(grpcServer, ChatServer)
	reflection.Register(grpcServer)

	listener, err := net.Listen("tcp", config.GRPCServerAddress)
	if err != nil {
		log.Print(err)
	}

	log.Info().Msgf("Connecting to Grpc Server at %s", listener.Addr().String())

	err = grpcServer.Serve(listener)
	if err != nil {
		log.Fatal().Msg("error connecting to GRPC")
	}
}
