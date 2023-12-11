package main

import (
	"Backend/api"
	db "Backend/db/sqlc/info"
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

	// Information
	info_conn, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal().Msg("cannot connect to Info db")
	}
	defer info_conn.Close()

	store := db.NewInfoStore(info_conn)

	runGrpcServer(config, store)
	// runGinServer(config, store)
}

// Grpc
func runGrpcServer(config util.Config, store db.InfoStore) {
	server, err := gapi.NewServer(config, store)
	if err != nil {
		log.Print(err)
	}

	// Logger
	grpcLogger := grpc.UnaryInterceptor(gapi.GprcLogger)

	grpcServer := grpc.NewServer(grpcLogger)
	pb.RegisterBackendServer(grpcServer, server)
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

func runGinServer(config util.Config, store db.InfoStore) {
	server, err := api.NewServer(config, store)
	if err != nil {
		log.Fatal().Err(err).Msg("cannot create server")
	}

	err = server.Start(config.HTTPServerAddress)
	if err != nil {
		log.Fatal().Err(err).Msg("cannot start server")
	}
}
