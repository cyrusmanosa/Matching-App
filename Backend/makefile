# 建立PSQL
dockernetwork:
	docker network create datingDate

# 建立PSQL
postgres:
	docker run --name postgres --network datingDate -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest

# 建立DB
createdb:
	docker exec -it postgres createdb --username=root --owner=root dating_date

# 移除DB
dropdb:
	docker exec -it postgres dropdb dating_date

createmigrate:
	migrate create -ext sql -dir db/migrate -seq init_schema

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/dating_date?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/dating_date?sslmode=disable" -verbose down


.PHONY: dockernetwork postgres createdb dropdb createmigrate migrateup migratedown
