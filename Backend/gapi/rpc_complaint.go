package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateComplaint(ctx context.Context, req *pb.CreateComplaintRequest) (*pb.CreateComplaintResponse, error) {
	cp := info.CreateComplaintParams{
		UserID:     req.GetUserID(),
		CpTargetID: req.GetCpTargetID(),
		CpType:     req.GetCpType(),
		CpMessage:  req.GetCpMessage(),
	}
	complaint, err := server.store.CreateComplaint(ctx, cp)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateComplaintResponse{
		Cp: convertComplaint(complaint),
	}
	return rsp, nil
}

func (server *Server) GetComplaint(ctx context.Context, req *pb.GetComplaintRequest) (*pb.GetComplaintResponse, error) {
	complaint, err := server.store.GetUserComplaintList(ctx, req.GetCpID())
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input CpID: %s", err)
	}

	rsp := &pb.GetComplaintResponse{
		Cp: convertComplaint(complaint),
	}
	return rsp, nil
}

func (server *Server) UpdateComplaint(ctx context.Context, req *pb.UpdateComplaintRequest) (*pb.UpdateComplaintResponse, error) {
	cp := info.UpdateUserComplaintParams{
		CpID:   req.GetCpID(),
		Status: req.GetStatus(),
	}
	complaint, err := server.store.UpdateUserComplaint(ctx, cp)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input CpID: %s", err)
	}

	rsp := &pb.UpdateComplaintResponse{
		Cp: convertComplaint(complaint),
	}
	return rsp, nil
}
