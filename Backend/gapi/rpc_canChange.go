package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateCanChange(ctx context.Context, req *pb.CreateCanChangeRequest) (*pb.CreateCanChangeResponse, error) {
	CC := info.CreateUserCanChangeInformationParams{
		UserID:        req.GetUserID(),
		Nickname:      req.GetNickName(),
		City:          req.GetCity(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Education:     req.GetEducation(),
		Job:           req.GetJob(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Introduce:     req.GetIntroduce(),
	}
	canChange, err := server.store.CreateUserCanChangeInformation(ctx, CC)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}

func (server *Server) GetCanChange(ctx context.Context, req *pb.GetCanChangeRequest) (*pb.GetCanChangeResponse, error) {
	canChange, err := server.store.GetUserCanChangeInformation(ctx, req.GetUserID())
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}

func (server *Server) UpdateCanChange(ctx context.Context, req *pb.UpdateCanChangeRequest) (*pb.UpdateCanChangeResponse, error) {
	CC := info.UpdateInformationParams{
		UserID:        req.GetUserID(),
		Nickname:      req.GetNickName(),
		City:          req.GetCity(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Education:     req.GetEducation(),
		Job:           req.GetJob(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Introduce:     req.GetIntroduce(),
	}
	canChange, err := server.store.UpdateInformation(ctx, CC)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}
