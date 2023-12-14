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

func (server *Server) CreateLover(ctx context.Context, req *pb.CreateLoverRequest) (*pb.CreateLoverResponse, error) {
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

	L := info.CreateLoverRequestParams{
		UserID:        token.UserID,
		MinAge:        req.GetMinAge(),
		MaxAge:        req.GetMaxAge(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Constellation: req.GetConstellation(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Job:           req.GetJob(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Certification: req.GetCertification(),
	}
	Lover, err := server.store.CreateLoverRequest(ctx, L)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateLoverResponse{
		L: convertLover(Lover),
	}
	return rsp, nil
}

func (server *Server) GetLover(ctx context.Context, req *pb.GetLoverRequest) (*pb.GetLoverResponse, error) {
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

	Lover, err := server.store.GetUserLover(ctx, token.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetLoverResponse{
		L: convertLover(Lover),
	}
	return rsp, nil
}

func (server *Server) UpdateLover(ctx context.Context, req *pb.UpdateLoverRequest) (*pb.UpdateLoverResponse, error) {
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

	L := info.UpdateUserLoverParams{
		UserID:        token.UserID,
		MinAge:        req.GetMinAge(),
		MaxAge:        req.GetMaxAge(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Constellation: req.GetConstellation(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Job:           req.GetJob(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Certification: req.GetCertification(),
	}
	Lover, err := server.store.UpdateUserLover(ctx, L)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateLoverResponse{
		L: convertLover(Lover),
	}
	return rsp, nil
}
