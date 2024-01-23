package gapi

import (
	db "Backend/db/sqlc"
	ch "Backend/db/sqlc/chat"

	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateSocialMedia(ctx context.Context, req *pb.CreateSocialMediaRequest) (*pb.CreateSocialMediaResponse, error) {
	sm := ch.CreatesocialmediaParams{
		UserID:      req.GetUserID(),
		TargetID:    req.GetTargetID(),
		Image:       req.GetImage(),
		Contact:     req.GetContact(),
		Location:    req.GetLocation(),
		Appointment: req.GetAppointment(),
		Sns:         req.GetSns(),
	}

	creSM, err := server.chatStore.Createsocialmedia(ctx, sm)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "userID not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input table: %s", err)
	}

	rsp := &pb.CreateSocialMediaResponse{
		Sm: convertSocialMedia(creSM),
	}

	return rsp, nil
}

func (server *Server) DeleteSocialMedia(ctx context.Context, req *pb.DeleteSocialMediaRequest) (*emptypb.Empty, error) {
	err := server.chatStore.Deletesocialmedia(ctx, req.GetUserID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create table: %s", err)
	}
	return &emptypb.Empty{}, nil
}

func (server *Server) GetSocialMedia(ctx context.Context, req *pb.GetSocialMediaRequest) (*pb.GetSocialMediaResponse, error) {
	sm := ch.GetsocialmediaParams{
		UserID:   req.GetUserID(),
		TargetID: req.GetTargetID(),
	}

	Get, err := server.chatStore.Getsocialmedia(ctx, sm)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "userID not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input table: %s", err)
	}
	rsp := &pb.GetSocialMediaResponse{
		Sm: convertSocialMedia(Get),
	}
	return rsp, nil
}

func (server *Server) UpdateSocialMedia(ctx context.Context, req *pb.UpdateSocialMediaRequest) (*pb.UpdateSocialMediaResponse, error) {
	sm := ch.UpdatesocialmediaParams{
		UserID:      req.GetUserID(),
		TargetID:    req.GetTargetID(),
		Image:       req.GetImage(),
		Contact:     req.GetContact(),
		Location:    req.GetLocation(),
		Appointment: req.GetAppointment(),
		Sns:         req.GetSns(),
	}

	creSM, err := server.chatStore.Updatesocialmedia(ctx, sm)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "userID not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input table: %s", err)
	}

	rsp := &pb.UpdateSocialMediaResponse{
		Sm: convertSocialMedia(creSM),
	}

	return rsp, nil
}
