package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) InputPassword(ctx context.Context, req *pb.InputPasswordRequest) (*pb.InputPasswordResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	Hash, _ := util.HashPassword(req.GetPassword())
	arg := info.UpdatePasswordParams{
		UserID:         token.UserID,
		HashedPassword: Hash,
	}

	_, err = server.infoStore.UpdatePassword(ctx, arg)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "failed to input password")
	}

	user, err := server.infoStore.GetUserFixInformation(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "failed to input Email")
	}

	rsp := &pb.InputPasswordResponse{
		Message:           "Success to setup password",
		PasswordChangedAt: timestamppb.New(user.PasswordChangedAt.Time),
	}

	return rsp, nil
}

func (server *Server) ResetPassword(ctx context.Context, req *pb.ResetPasswordRequest) (*pb.ResetPasswordResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	Hash, _ := util.HashPassword(req.GetPassword())

	arg := info.UpdatePasswordParams{
		UserID:         token.UserID,
		HashedPassword: Hash,
	}
	_, err = server.infoStore.UpdatePassword(ctx, arg)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "failed to reset password")
	}

	user, err := server.infoStore.GetUserFixInformation(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "failed to input Email")
	}

	rsp := &pb.ResetPasswordResponse{
		Message:           "Success to reset password",
		PasswordChangedAt: timestamppb.New(user.PasswordChangedAt.Time),
	}

	return rsp, nil
}
