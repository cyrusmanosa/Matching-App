package gapi

import (
	db "Backend/db/sqlc"
	"errors"

	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

// missingRecord 代表資料庫沒有這筆資料，或外鍵／唯一鍵對不上。
// pgx 的「沒有資料」和 database/sql 的錯誤不是同一個值，要用 errors.Is 判斷。
func missingRecord(err error) bool {
	if err == nil {
		return false
	}
	code := db.ErrorCode(err)
	return errors.Is(err, db.ErrRecordNotFound) ||
		code == db.ForeignKeyViolation ||
		code == db.UniqueViolation
}

func fieldViolation(field string, err error) *errdetails.BadRequest_FieldViolation {
	return &errdetails.BadRequest_FieldViolation{
		Field:       field,
		Description: err.Error(),
	}
}

func invalidArgumentError(violations []*errdetails.BadRequest_FieldViolation) error {
	badRequest := &errdetails.BadRequest{FieldViolations: violations}
	statusInvalid := status.New(codes.InvalidArgument, "invalid parameters")

	statusDetails, err := statusInvalid.WithDetails(badRequest)
	if err != nil {
		return statusInvalid.Err()
	}

	return statusDetails.Err()
}

func unauthenticatedError(err error) error {
	return status.Errorf(codes.Unauthenticated, "unauthorized: %s", err)
}
