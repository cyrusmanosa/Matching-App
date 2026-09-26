package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateTargetList(ctx context.Context, req *pb.CreateTargetListRequest) (*pb.CreateTargetListResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	tl := info.TargetUserListParams{
		UserID:    token.UserID,
		Target1ID: req.GetTarget1ID(),
		T1Type:    req.GetT1Type(),
		Target2ID: req.GetTarget2ID(),
		T2Type:    req.GetT2Type(),
		Target3ID: req.GetTarget3ID(),
		T3Type:    req.GetT3Type(),
	}
	targetlist, err := server.infoStore.TargetUserList(ctx, tl)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateTargetListResponse{
		Tl: convertTargetList(targetlist),
	}
	return rsp, nil
}

func (server *Server) GetTargetList(ctx context.Context, req *pb.GetTargetListRequest) (*pb.GetTargetListResponse, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	targetlist, err := server.infoStore.GetTargetUserList(ctx, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	converted := convertTargetList(targetlist)
	if req.GetUserID() != session.UserID {
		converted.Target1ID = maskSlot(converted.Target1ID, session.UserID)
		converted.Target2ID = maskSlot(converted.Target2ID, session.UserID)
		converted.Target3ID = maskSlot(converted.Target3ID, session.UserID)
		if converted.Target1ID == -1 {
			converted.T1Type = ""
		}
		if converted.Target2ID == -1 {
			converted.T2Type = ""
		}
		if converted.Target3ID == -1 {
			converted.T3Type = ""
		}
	}

	return &pb.GetTargetListResponse{Tl: converted}, nil
}

func (server *Server) UpdateTargetList(ctx context.Context, req *pb.UpdateTargetListRequest) (*pb.UpdateTargetListResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	tl := info.UpdateTargetListParams{
		UserID:    token.UserID,
		Target1ID: req.GetTarget1ID(),
		T1Type:    req.GetT1Type(),
		Target2ID: req.GetTarget2ID(),
		T2Type:    req.GetT2Type(),
		Target3ID: req.GetTarget3ID(),
		T3Type:    req.GetT3Type(),
	}
	targetlist, err := server.infoStore.UpdateTargetList(ctx, tl)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateTargetListResponse{
		Tl: convertTargetList(targetlist),
	}
	return rsp, nil
}

func (server *Server) DeleteTargetList(ctx context.Context, req *pb.DeleteTargetListRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteTargetList(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
