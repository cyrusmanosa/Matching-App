package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"fmt"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateHobby(ctx context.Context, req *pb.CreateHobbyRequest) (*pb.CreateHobbyResponse, error) {
	// change GlobalSessionID after login
	token, err := server.store.GetSession(ctx, GlobalSessionID)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	H := info.CreateHobbyRequestParams{
		UserID:        req.GetUserID(),
		Era:           req.GetEra(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		FindTarget:    req.GetFindTarget(),
		Experience:    req.GetExperience(),
		Sociability:   req.GetSociability(),
		Certification: req.GetCertification(),
	}
	hobby, err := server.store.CreateHobbyRequest(ctx, H)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateHobbyResponse{
		H: convertHobby(hobby),
	}
	return rsp, nil
}

func (server *Server) GetHobby(ctx context.Context, req *pb.GetHobbyRequest) (*pb.GetHobbyResponse, error) {
	hobby, err := server.store.GetUserHobby(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetHobbyResponse{
		H: convertHobby(hobby),
	}
	return rsp, nil
}

func (server *Server) UpdateHobby(ctx context.Context, req *pb.UpdateHobbyRequest) (*pb.UpdateHobbyResponse, error) {
	H := info.UpdateUserHobbyParams{
		UserID:        req.GetUserID(),
		Era:           req.GetEra(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		FindTarget:    req.GetFindTarget(),
		Experience:    req.GetExperience(),
		Sociability:   req.GetSociability(),
		Certification: req.GetCertification(),
	}
	hobby, err := server.store.UpdateUserHobby(ctx, H)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateHobbyResponse{
		H: convertHobby(hobby),
	}
	return rsp, nil
}
