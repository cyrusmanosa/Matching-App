package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"
	"database/sql"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) InputPassword(ctx context.Context, req *pb.InputPasswordRequest) (*pb.InputPasswordResponse, error) {
	Hash, _ := util.HashPassword(req.GetPassword())
	arg := info.UpdatePasswordParams{
		Email:          req.GetEmail(),
		HashedPassword: Hash,
	}
	_, err := server.store.UpdatePassword(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return nil, status.Errorf(codes.Internal, "failed to input password: %s", err)
	}

	user, err := server.store.GetUserFixInformation(ctx, req.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input Email: %s", err)
	}

	rsp := &pb.InputPasswordResponse{
		Message:           "Success to setup password",
		PasswordChangedAt: timestamppb.New(user.PasswordChangedAt.Time),
	}

	return rsp, nil
}

func (server *Server) ResetPassword(ctx context.Context, req *pb.ResetPasswordRequest) (*pb.ResetPasswordResponse, error) {
	Hash, _ := util.HashPassword(req.GetPassword())

	arg := info.UpdatePasswordParams{
		Email:          req.GetEmail(),
		HashedPassword: Hash,
	}
	_, err := server.store.UpdatePassword(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return nil, status.Errorf(codes.Internal, "failed to reset password: %s", err)
	}

	user, err := server.store.GetUserFixInformation(ctx, req.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input Email: %s", err)
	}

	rsp := &pb.ResetPasswordResponse{
		Message:           "Success to reset password",
		PasswordChangedAt: timestamppb.New(user.PasswordChangedAt.Time),
	}

	return rsp, nil
}
