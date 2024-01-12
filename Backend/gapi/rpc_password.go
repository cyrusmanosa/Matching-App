package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"
	"database/sql"
	"fmt"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) InputPassword(ctx context.Context, req *pb.InputPasswordRequest) (*pb.InputPasswordResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}
	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	Hash, _ := util.HashPassword(req.GetPassword())
	arg := info.UpdatePasswordParams{
		UserID:         token.UserID,
		HashedPassword: Hash,
	}

	_, err = server.infoStore.UpdatePassword(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return nil, status.Errorf(codes.Internal, "failed to input password: %s", err)
	}

	user, err := server.infoStore.GetUserFixInformation(ctx, token.UserID)
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
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	Hash, _ := util.HashPassword(req.GetPassword())

	arg := info.UpdatePasswordParams{
		UserID:         token.UserID,
		HashedPassword: Hash,
	}
	_, err = server.infoStore.UpdatePassword(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return nil, status.Errorf(codes.Internal, "failed to reset password: %s", err)
	}

	user, err := server.infoStore.GetUserFixInformation(ctx, token.UserID)
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
