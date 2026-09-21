package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateHobby(ctx context.Context, req *pb.CreateHobbyRequest) (*pb.CreateHobbyResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	H := info.CreateHobbyParams{
		UserID:        token.UserID,
		Era:           req.GetEra(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		Experience:    req.GetExperience(),
	}
	hobby, err := server.infoStore.CreateHobby(ctx, H)
	if err != nil {
		if missingRecord(err) {
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
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	hobby, err := server.infoStore.GetHobby(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
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
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	H := info.UpdateHobbyParams{
		UserID:        token.UserID,
		Era:           req.GetEra(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		Experience:    req.GetExperience(),
	}
	hobby, err := server.infoStore.UpdateHobby(ctx, H)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateHobbyResponse{
		H: convertHobby(hobby),
	}
	return rsp, nil
}

func (server *Server) DeleteHobby(ctx context.Context, req *pb.DeleteHobbyRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteHobby(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
