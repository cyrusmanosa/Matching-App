package db

import (
	"Backend/util"
	"context"
	"log"
	"os"
	"testing"

	"github.com/jackc/pgx/v5/pgxpool"
)

var testchatQueries ChatStore

func TestMain(m *testing.M) {
	config, err := util.LoadConfig("../../")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	chat_connPool, err := pgxpool.New(context.Background(), config.DBSourceChat)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testchatQueries = NewChatStore(chat_connPool)
	os.Exit(m.Run())
}
