package gapi

import (
	"Backend/pb"
	"Backend/util"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

var Validate *pb.CheckEmailResponse

func (server *Server) CheckEmail(ctx context.Context, req *pb.CheckEmailRequest) (*pb.CheckEmailResponse, error) {
	_, err := server.infoStore.LoginAtEmail(ctx, req.GetEmail())
	if err == nil {
		return nil, status.Errorf(codes.AlreadyExists, "failed to create user: %s", err)
	}

	sendEmail := req.GetEmail()
	checkRandomCode := util.RandomCheckCode()
	sended := util.SendValidateCodeOnEmail(checkRandomCode, []string{sendEmail})

	if sended {
		Validate = &pb.CheckEmailResponse{
			Email:     sendEmail,
			CheckCode: checkRandomCode,
		}
	}

	return Validate, nil
}

func (server *Server) CheckEmailCode(ctx context.Context, req *pb.SendEmailRequest) (*pb.CheckedEmailResponse, error) {
	Code := Validate.CheckCode
	Mail := Validate.Email
	if req.GetCheckCode() != Code {
		return nil, status.Errorf(codes.Internal, "No Work at %s not max this :%s", req.GetCheckCode(), Code)
	}

	rsp := &pb.CheckedEmailResponse{
		Email:  Mail,
		Status: "OK",
	}

	return rsp, nil

}
