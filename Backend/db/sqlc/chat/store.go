package db

import (
	"github.com/jackc/pgx/v5/pgxpool"
)

// Store defines all functions to execute db queries and transactions
type ChatStore interface {
	ChatQuerier
}

// SQLStore provides all functions to execute SQL queries and transactions
type SQLStore struct {
	connPool *pgxpool.Pool
	*Queries
}

// NewStore creates a new store
func NewChatStore(connPool *pgxpool.Pool) ChatStore {
	return &SQLStore{
		connPool: connPool,
		Queries:  New(connPool),
	}
}
