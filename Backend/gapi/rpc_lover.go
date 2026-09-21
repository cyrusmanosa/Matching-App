package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateLover(ctx context.Context, req *pb.CreateLoverRequest) (*pb.CreateLoverResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	L := info.CreateLoverParams{
		UserID:        token.UserID,
		MinAge:        req.GetMinAge(),
		MaxAge:        req.GetMaxAge(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Sexual:        req.GetSexual(),
		Speaklanguage: req.GetSpeaklanguage(),
	}
	Lover, err := server.infoStore.CreateLover(ctx, L)
	if err != nil {
		if missingRecord(err) {
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
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	Lover, err := server.infoStore.GetLover(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
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
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	L := info.UpdateLoverParams{
		UserID:        token.UserID,
		MinAge:        req.GetMinAge(),
		MaxAge:        req.GetMaxAge(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Sexual:        req.GetSexual(),
		Speaklanguage: req.GetSpeaklanguage(),
	}
	Lover, err := server.infoStore.UpdateLover(ctx, L)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateLoverResponse{
		L: convertLover(Lover),
	}
	return rsp, nil
}
func (server *Server) DeleteLover(ctx context.Context, req *pb.DeleteLoverRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteLover(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
