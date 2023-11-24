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

	conn, err := pgxpool.New(context.Background(), config.DBSource)
	if err != nil {
		log.Fatal().Err(err).Msg("cannot connect to db")
	}

	defer conn.Close()

}
