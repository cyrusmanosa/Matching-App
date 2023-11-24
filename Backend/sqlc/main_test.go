package db

import (
	"Backend/util"
	"context"
	"log"
	"os"
	"testing"

	"github.com/jackc/pgx/v5/pgxpool"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	config, err := util.LoadConfig("..")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	connPool, err := pgxpool.New(context.Background(), config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testQueries = New(connPool)
	os.Exit(m.Run())
}
