package gapi

import (
	db "Backend/db/sqlc"
	"errors"
	"testing"
)

func TestMissingRecord(t *testing.T) {
	if missingRecord(nil) {
		t.Fatal("nil error is not a missing record")
	}
	if !missingRecord(db.ErrRecordNotFound) {
		t.Fatal("pgx no rows should be a missing record")
	}
	if missingRecord(errors.New("connection reset")) {
		t.Fatal("unrelated errors should stay internal")
	}
}
