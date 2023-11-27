package db

import (
	"Backend/util"
	"context"
	"log"
	"os"
	"testing"

	"github.com/jackc/pgx/v5/pgxpool"
)

var testinfoQueries *Queries
var testchatQueries *Queries

func TestMain(m *testing.M) {
	config, err := util.LoadConfig("..")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	info_connPool, err := pgxpool.New(context.Background(), config.DBSourceInfo)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	chat_connPool, err := pgxpool.New(context.Background(), config.DBSourceChat)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testinfoQueries = New(info_connPool)
	testchatQueries = New(chat_connPool)
	os.Exit(m.Run())
}
