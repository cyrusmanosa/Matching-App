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
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateTargetList(ctx context.Context, req *pb.CreateTargetListRequest) (*pb.CreateTargetListResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	tl := info.TargetUserListParams{
		UserID:    token.UserID,
		Target1ID: req.GetTarget1ID(),
		Target2ID: req.GetTarget2ID(),
		Target3ID: req.GetTarget3ID(),
	}
	targetlist, err := server.infoStore.TargetUserList(ctx, tl)
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
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	targetlist, err := server.infoStore.GetTargetUserList(ctx, token.UserID)
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
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	tl := info.UpdateTargetListParams{
		UserID:    token.UserID,
		Target1ID: req.GetTarget1ID(),
		Target2ID: req.GetTarget2ID(),
		Target3ID: req.GetTarget3ID(),
	}
	targetlist, err := server.infoStore.UpdateTargetList(ctx, tl)
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

func (server *Server) DeleteTargetList(ctx context.Context, req *pb.DeleteTargetListRequest) (*emptypb.Empty, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	err = server.infoStore.DeleteTargetList(ctx, token.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
