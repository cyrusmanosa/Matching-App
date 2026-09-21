package gapi

import (
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) GetUserID(ctx context.Context, req *pb.GetUserIDRequest) (*pb.GetUserIDResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}
	return &pb.GetUserIDResponse{
		UserID: token.UserID,
	}, nil
}

func (server *Server) LogoutUser(ctx context.Context, req *pb.GetUserIDRequest) (*emptypb.Empty, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}
	if err = server.infoStore.LogoutSession(ctx, session.ID); err != nil {
		return nil, status.Error(codes.Internal, "failed to logout")
	}
	return &emptypb.Empty{}, nil
}
