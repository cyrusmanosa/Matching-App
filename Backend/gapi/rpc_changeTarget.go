package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateChangeTarget(ctx context.Context, req *pb.CreateChangeTargetRequest) (*pb.CreateChangeTargetResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	Ct := info.CreateChangeTargetUserParams{
		UserID:       token.UserID,
		ChangeUserID: req.GetChangeUserID(),
		Reason:       req.GetReason(),
	}
	Row, Rerr := server.infoStore.GetRowCount(ctx, token.UserID)
	if Rerr != nil {
		Ct.Frequency = 1
	} else {
		Ct.Frequency = Row + 1
	}

	changeTarget, err := server.infoStore.CreateChangeTargetUser(ctx, Ct)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateChangeTargetResponse{
		Ct: convertChangeTarget(changeTarget),
	}
	return rsp, nil
}

func (server *Server) GetChangeTarget(ctx context.Context, req *pb.GetChangeTargetRequest) (*pb.GetChangeTargetResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	changeTarget, err := server.infoStore.GetChangeTargetUserList(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetChangeTargetResponse{
		Ct: convertChangeTarget(changeTarget),
	}
	return rsp, nil
}

func (server *Server) DeleteChangeTarget(ctx context.Context, req *pb.DeleteChangeTargetRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteChangeTargetUser(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
