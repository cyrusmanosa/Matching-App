BACKEND = Backend
DB_INFO_URL = postgresql://root:secret@localhost:5432/dating_date_info?sslmode=disable
DB_CHAT_URL = postgresql://root:secret@localhost:5432/dating_date_chat?sslmode=disable
COMPOSE = docker compose

# 啟動 Postgres、遷移和 Backend
up:
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down

# 只建立 Docker image
build:
	$(COMPOSE) build

# 不使用快取重新建立 image，並重啟容器
rebuild:
	$(COMPOSE) build --no-cache
	$(COMPOSE) up -d --force-recreate

logs:
	$(COMPOSE) logs -f api

# 啟動 Flutter。run-android 會先開 AVD dating_phone，再等模擬器連上。
ANDROID_AVD ?= dating_phone

run-chrome:
	cd frontend && flutter run -d chrome

run-android:
	powershell -NoProfile -ExecutionPolicy Bypass -Command "$$env:ANDROID_AVD='$(ANDROID_AVD)'; & '$(CURDIR)/scripts/run-android.ps1'"

# 本機直接跑 Backend（資料庫仍用 compose 公佈的 localhost:5432）
server:
	cd $(BACKEND) && go run main.go

sqlc:
	cd $(BACKEND) && sqlc generate

test:
	cd $(BACKEND) && go test -v -cover ./...

test-flutter:
	cd frontend && flutter test

db_docs:
	cd $(BACKEND) && dbdocs build doc/db.dbml

db_schema:
	cd $(BACKEND) && dbml2sql --postgres -o doc/schema.sql doc/db.dbml

mock:
	cd $(BACKEND) && mockgen -destination mock/store.go Backend/db/sqlc/info InfoStore

protob:
	cd $(BACKEND) && rm -f pb/*.go doc/swagger/*.swagger.json && protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
	--go-grpc_out=pb --go-grpc_opt=paths=source_relative \
	--grpc-gateway_out=pb --grpc-gateway_opt paths=source_relative \
	--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=Backend \
	proto/*.proto

# Frontend protobuf 由 Backend/proto 產生，不要手改 frontend/lib/pb。
# 需要已安裝 protoc，以及 dart pub global activate protoc_plugin。
proto-dart:
	protoc --proto_path=$(BACKEND)/proto --dart_out=grpc:frontend/lib/pb $(BACKEND)/proto/*.proto google/protobuf/timestamp.proto google/protobuf/empty.proto

proto: protob proto-dart

evans:
	evans --host localhost --port 19090 -r repl

createmigrate_info:
	migrate create -ext sql -dir $(BACKEND)/db/migration/info -seq init_info_schema
createmigrate_chat:
	migrate create -ext sql -dir $(BACKEND)/db/migration/chat -seq init_chat_schema

info_migrateup:
	migrate -path $(BACKEND)/db/migration/info -database "$(DB_INFO_URL)" -verbose up
info_migratedown:
	migrate -path $(BACKEND)/db/migration/info -database "$(DB_INFO_URL)" -verbose down
info_migrateup1:
	migrate -path $(BACKEND)/db/migration/info -database "$(DB_INFO_URL)" -verbose up 1
info_migratedown1:
	migrate -path $(BACKEND)/db/migration/info -database "$(DB_INFO_URL)" -verbose down 1
info_migrateup2:
	migrate -path $(BACKEND)/db/migration/info -database "$(DB_INFO_URL)" -verbose up 2
info_migratedown2:
	migrate -path $(BACKEND)/db/migration/info -database "$(DB_INFO_URL)" -verbose down 2

chat_migrateup:
	migrate -path $(BACKEND)/db/migration/chat -database "$(DB_CHAT_URL)" -verbose up
chat_migratedown:
	migrate -path $(BACKEND)/db/migration/chat -database "$(DB_CHAT_URL)" -verbose down
chat_migrateup1:
	migrate -path $(BACKEND)/db/migration/chat -database "$(DB_CHAT_URL)" -verbose up 1
chat_migratedown1:
	migrate -path $(BACKEND)/db/migration/chat -database "$(DB_CHAT_URL)" -verbose down 1

.PHONY: up down build rebuild logs run-chrome run-android server sqlc test test-flutter db_docs db_schema mock proto protob proto-dart evans \
	createmigrate_info createmigrate_chat \
	info_migrateup info_migratedown info_migrateup1 info_migratedown1 info_migrateup2 info_migratedown2 \
	chat_migrateup chat_migratedown chat_migrateup1 chat_migratedown1
