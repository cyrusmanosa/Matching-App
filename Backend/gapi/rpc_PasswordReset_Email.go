package gapi

import (
	"context"
	"fmt"

	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

var resetPasswordEmail string

func (server *Server) EmailResetPassword(ctx context.Context, req *pb.ResetPwEmailRequest) (*pb.ResetPwEmailResponse, error) {
	data, err := server.infoStore.LoginAtEmail(ctx, req.GetEmail())
	if err != nil {
		return &pb.ResetPwEmailResponse{
			Link:   "",
			Status: "no this user",
		}, err
	}

	resetPasswordEmail = data.Email
	checkRandomCode := util.RandomCheckCode() + util.RandomCheckCode()
	link := fmt.Sprintf("DatingDate://%s", checkRandomCode)
	util.SendResetPWEmail(link, []string{data.Email})

	return &pb.ResetPwEmailResponse{
		Link:   checkRandomCode,
		Status: "ok",
	}, nil
}

func (server *Server) ResetPwEmailConfirm(ctx context.Context, req *pb.ResetPwEmailConfirmRequest) (*emptypb.Empty, error) {
	hashedPassword, _ := util.HashPassword(req.GetPassword())
	data, err := server.infoStore.LoginAtEmail(ctx, resetPasswordEmail)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return &emptypb.Empty{}, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return &emptypb.Empty{}, status.Errorf(codes.Internal, "failed to reset password: %s", err)
	}

	arg := info.UpdatePasswordParams{
		UserID:         data.UserID,
		HashedPassword: hashedPassword,
	}
	_, _ = server.infoStore.UpdatePassword(ctx, arg)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return &emptypb.Empty{}, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return &emptypb.Empty{}, status.Errorf(codes.Internal, "failed to reset password: %s", err)
	}

	return &emptypb.Empty{}, nil
}
