package main

import (
	"Backend/util"
	"context"
	"log"

	controllers "Backend/controllers"
	db "Backend/db/sqlc/info"

	"github.com/jackc/pgx/v5/pgxpool"
	_ "github.com/lib/pq"
)

func main(){
	config, err := util.LoadConfig("./")
	if err != nil {
		log.Fatal("cannot load config:",err)
	}

	// Information
	info_conn, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal("cannot connect to Info db",err)
	}
	defer info_conn.Close()

	store := db.NewInfoStore(info_conn)
	server, err := controllers.NewServer(config, store)
	if err != nil {
		log.Fatal("cannot create server:", err)
	}

	err = server.Run(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
	
