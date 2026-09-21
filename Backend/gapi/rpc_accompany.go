package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateAccompany(ctx context.Context, req *pb.CreateAccompanyRequest) (*pb.CreateAccompanyResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	Ac := info.CreateAccompanyParams{
		UserID:        token.UserID,
		Era:           req.GetEra(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		Sociability:   req.GetSociability(),
	}
	accompany, err := server.infoStore.CreateAccompany(ctx, Ac)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateAccompanyResponse{
		Ac: convertAccompany(accompany),
	}
	return rsp, nil
}

func (server *Server) GetAccompany(ctx context.Context, req *pb.GetAccompanyRequest) (*pb.GetAccompanyResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	accompany, err := server.infoStore.GetAccompany(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetAccompanyResponse{
		Ac: convertAccompany(accompany),
	}
	return rsp, nil
}

func (server *Server) UpdateAccompany(ctx context.Context, req *pb.UpdateAccompanyRequest) (*pb.UpdateAccompanyResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	Ac := info.UpdateAccompanyParams{
		UserID:        token.UserID,
		Era:           req.GetEra(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		Sociability:   req.GetSociability(),
	}
	accompany, err := server.infoStore.UpdateAccompany(ctx, Ac)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateAccompanyResponse{
		Ac: convertAccompany(accompany),
	}
	return rsp, nil
}

func (server *Server) DeleteAccompany(ctx context.Context, req *pb.DeleteAccompanyRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteAccompany(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
