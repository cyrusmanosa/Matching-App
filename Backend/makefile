DB_INFO_URL = postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable
DB_CHAT_URL = postgresql://root:secret@localhost:5432/dating_date_chat?sslmode=disable

# 建立PSQL
dockernetwork:
	docker network create datingDate

# 建立PSQL
postgres:
	docker run --name postgres --network datingDate -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest

# 建立DB
createdb_info:
	docker exec -it postgres createdb --username=root --owner=root dating_date_info
createdb_chat:
	docker exec -it postgres createdb --username=root --owner=root dating_date_chat


# 刪除DB
dropdb_chat:
	docker exec -it postgres dropdb dating_date_chat
dropdb_info:
	docker exec -it postgres dropdb dating_date_info


# Create Migrate file  
createmigrate_info:
	migrate create -ext sql -dir db/migration/info -seq init_info_schema
createmigrate_chat:
	migrate create -ext sql -dir db/migration/chat -seq init_info_schema

# info 
info_migrateup:
	migrate -path db/migration/info -database "${DB_INFO_URL}" -verbose up
info_migratedown:
	migrate -path db/migration/info -database "${DB_INFO_URL}" -verbose down
info_migrateup1:
	migrate -path db/migration/info -database "${DB_INFO_URL}" -verbose up 1
info_migratedown1:
	migrate -path db/migration/info -database "${DB_INFO_URL}" -verbose down 1
info_migrateup2:
	migrate -path db/migration/info -database "${DB_INFO_URL}" -verbose up 2
info_migratedown2:
	migrate -path db/migration/info -database "${DB_INFO_URL}" -verbose down 2


# chat 
chat_migrateup:
	migrate -path db/migration/chat -database "${DB_CHAT_URL}" -verbose up
chat_migratedown:
	migrate -path db/migration/chat -database "${DB_CHAT_URL}" -verbose down
chat_migrateup1:
	migrate -path db/migration/chat -database "${DB_CHAT_URL}" -verbose up 1
chat_migratedown1:
	migrate -path db/migration/chat -database "${DB_CHAT_URL}" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

db_docs:
	dbdocs build doc/db.dbml  

db_schema:
	dbml2sql --postgres -o doc/schema.sql doc/db.dbml

server:
	go run main.go

mock:
	mockgen -destination mock/store.go  Backend/db/sqlc/info InfoStore

protob:
	rm -f pb/*.go
	rm -f doc/swagger/*.swagger.json
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
	--go-grpc_out=pb --go-grpc_opt=paths=source_relative \
	--grpc-gateway_out=pb --grpc-gateway_opt paths=source_relative \
	--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=Backend\
    proto/*.proto

# DartProtob:
# rm -f lib/pb/*.dart
# protoc --proto_path=lib/proto --dart_out=grpc:lib/pb lib/proto/*.proto google/protobuf/timestamp.proto google/protobuf/empty.proto

evans: 
	evans --host localhost --port 9090 -r repl

# inside:
# package pb
# service Backend

resetdb_info:
	make dropdb_info 
	make createdb_info 
	make info_migrateup
resetdb_chat:
	make dropdb_chat
	make createdb_chat
	make chat_migrateup



.PHONY: dockernetwork postgres createdb_info dropdb_info createdb_chat dropdb_chat test sqlc server 
		createmigrate_info info_migrateup info_migrateup1 info_migrateup2 info_migratedown info_migratedown1 info_migratedown2
		createmigrate_chat chat_migrateup chat_migratedown mock db_docs db_schema protob resetdb_info resetdb_chat
