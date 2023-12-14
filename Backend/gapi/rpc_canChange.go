package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"fmt"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateCanChange(ctx context.Context, req *pb.CreateCanChangeRequest) (*pb.CreateCanChangeResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.store.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	CC := info.CreateUserCanChangeInformationParams{
		UserID:        token.UserID,
		Nickname:      req.GetNickName(),
		City:          req.GetCity(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Education:     req.GetEducation(),
		Job:           req.GetJob(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Introduce:     req.GetIntroduce(),
	}

	// 寫入DataBase
	canChange, err := server.store.CreateUserCanChangeInformation(ctx, CC)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}

func (server *Server) GetCanChange(ctx context.Context, req *pb.GetCanChangeRequest) (*pb.GetCanChangeResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.store.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	canChange, err := server.store.GetUserCanChangeInformation(ctx, token.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}

func (server *Server) UpdateCanChange(ctx context.Context, req *pb.UpdateCanChangeRequest) (*pb.UpdateCanChangeResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.store.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	CC := info.UpdateInformationParams{
		UserID:        token.UserID,
		Nickname:      req.GetNickName(),
		City:          req.GetCity(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Education:     req.GetEducation(),
		Job:           req.GetJob(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Introduce:     req.GetIntroduce(),
	}
	canChange, err := server.store.UpdateInformation(ctx, CC)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}
