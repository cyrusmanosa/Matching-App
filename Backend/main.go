package main

import (
	"Backend/api"
	db "Backend/db/sqlc/info"
	"Backend/gapi"
	"Backend/pb"
	"Backend/util"
	"context"
	"log"
	"net"
	"net/http"

	_ "github.com/golang/mock/mockgen/model"
	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"github.com/jackc/pgx/v5/pgxpool"
	_ "github.com/lib/pq"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"google.golang.org/protobuf/encoding/protojson"
)

func main() {
	config, err := util.LoadConfig("./")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	// Information
	info_conn, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal("cannot connect to Info db", err)
	}
	defer info_conn.Close()

	store := db.NewInfoStore(info_conn)

	go runGatewayServer(config, store)
	runGrpcServer(config, store)
}

// Grpc
func runGrpcServer(config util.Config, store db.InfoStore) {
	server, err := gapi.NewServer(config, store)
	if err != nil {
		log.Print(err)
	}
	grpcServer := grpc.NewServer()
	pb.RegisterBackendServer(grpcServer, server)
	reflection.Register(grpcServer)

	listener, err := net.Listen("tcp", config.GRPCServerAddress)
	if err != nil {
		log.Print(err)
	}

	log.Printf("Connecting to Grpc Server at %s", listener.Addr().String())
	err = grpcServer.Serve(listener)
	if err != nil {
		log.Fatal("error connecting to GRPC", err)
	}
}

// Gateway
func runGatewayServer(config util.Config, store db.InfoStore) {
	server, err := gapi.NewServer(config, store)
	if err != nil {
		log.Print(err)
	}

	jsonOption := runtime.WithMarshalerOption(runtime.MIMEWildcard, &runtime.JSONPb{
		MarshalOptions: protojson.MarshalOptions{
			UseProtoNames: true,
		},
		UnmarshalOptions: protojson.UnmarshalOptions{
			DiscardUnknown: true,
		},
	})

	grpcMux := runtime.NewServeMux(jsonOption)

	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	err = pb.RegisterBackendHandlerServer(ctx, grpcMux, server)
	if err != nil {
		log.Fatal("Cannot register handler server", err)
	}

	mux := http.NewServeMux()
	mux.Handle("/", grpcMux)

	listener, err := net.Listen("tcp", config.HTTPServerAddress)
	if err != nil {
		log.Print(err)
	}

	log.Printf("Start Http gateway server at %s", listener.Addr().String())
	err = http.Serve(listener, mux)
	if err != nil {
		log.Fatal("error connecting to Http", err)
	}
}

func runGinServer(config util.Config, store db.InfoStore) {
	server, err := api.NewServer(config, store)
	if err != nil {
		log.Fatal("Cannot create server:", err)
	}

	err = server.Start(config.HTTPServerAddress)
	if err != nil {
		log.Fatal("Cannot start server:", err)
	}
}
