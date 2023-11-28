package db

import (
	"Backend/util"
	"context"
	"log"
	"os"
	"testing"

	"github.com/jackc/pgx/v5/pgxpool"
)

var testinfoQueries InfoStore

func TestMain(m *testing.M) {
	config, err := util.LoadConfig("../../")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	info_connPool, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testinfoQueries = NewInfoStore(info_connPool)
	os.Exit(m.Run())
}
