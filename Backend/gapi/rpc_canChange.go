package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateCanChange(ctx context.Context, req *pb.CreateCanChangeRequest) (*pb.CreateCanChangeResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	CC := info.CreateUserCanChangeInformationParams{
		UserID:        token.UserID,
		Nickname:      req.GetNickName(),
		City:          req.GetCity(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Education:     req.GetEducation(),
		Job:           req.GetJob(),
		HobbyType:     req.GetHobbyType(),
		Experience:    req.GetExperience(),
		AccompanyType: req.GetAccompanyType(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Introduce:     req.GetIntroduce(),
	}

	// 寫入DataBase
	canChange, err := server.infoStore.CreateUserCanChangeInformation(ctx, CC)
	if err != nil {
		if missingRecord(err) {
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
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}
	if err = server.canReadUser(ctx, session, req.GetUserID()); err != nil {
		return nil, err
	}

	canChange, err := server.infoStore.GetUserCanChangeInformation(ctx, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
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
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	CC := info.UpdateInformationParams{
		UserID:        token.UserID,
		Nickname:      req.GetNickName(),
		City:          req.GetCity(),
		Sexual:        req.GetSexual(),
		Height:        req.GetHeight(),
		Weight:        req.GetWeight(),
		Speaklanguage: req.GetSpeaklanguage(),
		Education:     req.GetEducation(),
		Job:           req.GetJob(),
		HobbyType:     req.GetHobbyType(),
		Experience:    req.GetExperience(),
		AccompanyType: req.GetAccompanyType(),
		AnnualSalary:  req.GetAnnualSalary(),
		Sociability:   req.GetSociability(),
		Religious:     req.GetReligious(),
		Introduce:     req.GetIntroduce(),
	}
	canChange, err := server.infoStore.UpdateInformation(ctx, CC)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateCanChangeResponse{
		CanChangeInfo: convertCanChange(canChange),
	}
	return rsp, nil
}

func (server *Server) DeleteCanChange(ctx context.Context, req *pb.DeleteCanChangeRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteCanChangeInformation(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
