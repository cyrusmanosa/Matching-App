package gapi

import (
	"context"
	"fmt"

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
		if missingRecord(err) {
			return &pb.ResetPwEmailResponse{Link: "", Status: "no this user"}, status.Error(codes.NotFound, "user not found")
		}
		return &pb.ResetPwEmailResponse{Link: "", Status: "no this user"}, status.Error(codes.Internal, "failed to find user")
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
		if missingRecord(err) {
			return &emptypb.Empty{}, status.Error(codes.NotFound, "user not found")
		}
		return &emptypb.Empty{}, status.Error(codes.Internal, "failed to reset password")
	}

	arg := info.UpdatePasswordParams{
		UserID:         data.UserID,
		HashedPassword: hashedPassword,
	}
	_, err = server.infoStore.UpdatePassword(ctx, arg)
	if err != nil {
		if missingRecord(err) {
			return &emptypb.Empty{}, status.Error(codes.NotFound, "user not found")
		}
		return &emptypb.Empty{}, status.Error(codes.Internal, "failed to reset password")
	}

	return &emptypb.Empty{}, nil
}
