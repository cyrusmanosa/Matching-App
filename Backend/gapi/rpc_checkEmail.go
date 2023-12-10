package gapi

import (
	"Backend/pb"
	"Backend/util"
	"context"

	"github.com/badoux/checkmail"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

var Validate *pb.CheckEmailResponse

func (server *Server) CheckEmail(ctx context.Context, req *pb.CheckEmailRequest) (*pb.CheckEmailResponse, error) {
	if err := checkmail.ValidateFormat(req.GetEmail()); err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create user: %s", err)
	}

	_, err := server.store.GetUserFixInformation(ctx, req.GetEmail())
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
	if req.GetCheckCode() != Code {
		return nil, status.Errorf(codes.Internal, "No Work at %s not max this :%s", req.GetCheckCode(), Code)
	}
	aToken, err := server.tokenMaker.CreateToken(
		Validate.Email,
		util.DepositorRole,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed Code: %s", err)
	}

	rsp := &pb.CheckedEmailResponse{
		Email:       Validate.Email,
		AccessToken: aToken,
	}
	return rsp, nil

}
