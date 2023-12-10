package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateChangeTarget(ctx context.Context, req *pb.CreateChangeTargetRequest) (*pb.CreateChangeTargetResponse, error) {
	Ct := info.CreateChangeTargetUserParams{
		UserID:       req.GetUserID(),
		ChangeUserID: req.GetChangeUserID(),
		Reason:       req.GetReason(),
	}
	changeTarget, err := server.store.CreateChangeTargetUser(ctx, Ct)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
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
	changeTarget, err := server.store.GetChangeTargetUserList(ctx, req.GetUserID())
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetChangeTargetResponse{
		Ct: convertChangeTarget(changeTarget),
	}
	return rsp, nil
}
