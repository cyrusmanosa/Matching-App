package main

import (
	"Backend/util"
	"context"

	"github.com/rs/zerolog/log"

	"github.com/jackc/pgx/v5/pgxpool"
	_ "github.com/lib/pq"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal().Err(err).Msg("cannot load config")
	}

	info_conn, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal().Err(err).Msg("cannot connect to Info db")
	}

	defer info_conn.Close()

	chat_conn, err := pgxpool.New(context.Background(), config.DBSourceChat)
	if err != nil {
		log.Fatal().Err(err).Msg("cannot connect to Chat db")
	}

	defer chat_conn.Close()

}
