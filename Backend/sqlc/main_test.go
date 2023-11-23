package db

// import (
// 	"Backend/util"
// 	"database/sql"
// 	"log"
// 	"os"
// 	"testing"

// 	_ "github.com/lib/pq"
// )

// var testQueries *Queries
// var testDB *sql.DB

// func TestMain(m *testing.M) {
// 	var err error
// 	config, err := util.LoadConfig("../..")
// 	if err != nil {
// 		log.Fatal("cannot connect to config file: ", err)
// 	}

// 	testDB, err = sql.Open(config.DBDriver, config.DBSource)
// 	if err != nil {
// 		log.Fatal("cannot connect to database:", err)
// 	}

// 	testQueries = New(testDB)
// 	os.Exit(m.Run())
// }
