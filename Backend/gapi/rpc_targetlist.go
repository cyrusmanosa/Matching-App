package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateTargetList(ctx context.Context, req *pb.CreateTargetListRequest) (*pb.CreateTargetListResponse, error) {
	tl := info.TargetUserListParams{
		UserID:    req.GetUserID(),
		Target1ID: req.GetTarget1ID(),
		Target2ID: req.GetTarget2ID(),
		Target3ID: req.GetTarget3ID(),
	}
	targetlist, err := server.store.TargetUserList(ctx, tl)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
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
	targetlist, err := server.store.GetTargetUserList(ctx, req.GetUserID())
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetTargetListResponse{
		Tl: convertTargetList(targetlist),
	}
	return rsp, nil
}

func (server *Server) UpdateTargetList(ctx context.Context, req *pb.UpdateTargetListRequest) (*pb.UpdateTargetListResponse, error) {
	tl := info.UpdateTargetListParams{
		UserID:    req.GetUserID(),
		Target1ID: req.GetTarget1ID(),
		Target2ID: req.GetTarget2ID(),
		Target3ID: req.GetTarget3ID(),
	}
	targetlist, err := server.store.UpdateTargetList(ctx, tl)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateTargetListResponse{
		Tl: convertTargetList(targetlist),
	}
	return rsp, nil
}
