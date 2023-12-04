# 建立PSQL
dockernetwork:
	docker network create datingDate

# 建立PSQL
postgres:
	docker run --name postgres --network datingDate -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest

# 建立DB information
createdb_info:
	docker exec -it postgres createdb --username=root --owner=root dating_date_info
# 移除DB information
dropdb_info:
	docker exec -it postgres dropdb dating_date_info

# 建立DB chat box
createdb_chat:
	docker exec -it postgres createdb --username=root --owner=root dating_date_chat
# 移除DB chat box
dropdb_chat:
	docker exec -it postgres dropdb dating_date_chat

# Create Migrate file  
createmigrate_info:
	migrate create -ext sql -dir db/migration/info -seq init_info_schema
createmigrate_chat:
	migrate create -ext sql -dir db/migration/chat -seq init_info_schema

# info 
info_migrateup:
	migrate -path db/migration/info -database "postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable" -verbose up
info_migratedown:
	migrate -path db/migration/info -database "postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable" -verbose down
info_migrateup1:
	migrate -path db/migration/info -database "postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable" -verbose up 1
info_migratedown1:
	migrate -path db/migration/info -database "postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable" -verbose down 1
info_migrateup2:
	migrate -path db/migration/info -database "postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable" -verbose up 2
info_migratedown2:
	migrate -path db/migration/info -database "postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable" -verbose down 2


# chat 
chat_migrateup:
	migrate -path db/migration/chat -database "postgresql://root:secret@localhost:5432/dating_date_chat?sslmode=disable" -verbose up
chat_migratedown:
	migrate -path db/migration/chat -database "postgresql://root:secret@localhost:5432/dating_date_chat?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -destination mock/store.go  Backend/db/sqlc/info InfoStore

.PHONY: dockernetwork postgres createdb_info dropdb_info createdb_chat dropdb_chat test sqlc server 
		createmigrate_info info_migrateup info_migrateup1 info_migrateup2 info_migratedown info_migratedown1 info_migratedown2
		createmigrate_chat chat_migrateup chat_migratedown mock
