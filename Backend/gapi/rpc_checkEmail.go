package gapi

import (
	"Backend/pb"
	"Backend/util"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CheckEmail(ctx context.Context, req *pb.CheckEmailRequest) (*pb.CheckEmailResponse, error) {
	_, err := server.infoStore.LoginAtEmail(ctx, req.GetEmail())
	if err == nil {
		return nil, status.Error(codes.AlreadyExists, "email already registered")
	}
	if !missingRecord(err) {
		return nil, status.Error(codes.Internal, "failed to check email")
	}

	sendEmail := req.GetEmail()
	checkRandomCode := util.RandomCheckCode()
	if err = server.savePending(ctx, checkRandomCode, sendEmail, "email", false); err != nil {
		return nil, status.Error(codes.Internal, "failed to save verification code")
	}
	if !util.SendValidateCodeOnEmail(server.config.SMTP(), checkRandomCode, []string{sendEmail}) {
		return nil, status.Error(codes.Unavailable, "failed to send verification email")
	}

	return &pb.CheckEmailResponse{Email: sendEmail}, nil
}

func (server *Server) CheckEmailCode(ctx context.Context, req *pb.SendEmailRequest) (*pb.CheckedEmailResponse, error) {
	item, ok := server.verifyPending(ctx, req.GetCheckCode())
	if !ok {
		return nil, status.Error(codes.InvalidArgument, "invalid verification code")
	}

	return &pb.CheckedEmailResponse{
		Email:  item.Email,
		Status: "OK",
	}, nil
}
