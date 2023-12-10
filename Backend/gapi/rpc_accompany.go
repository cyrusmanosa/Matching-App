package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateAccompany(ctx context.Context, req *pb.CreateAccompanyRequest) (*pb.CreateAccompanyResponse, error) {
	Ac := info.CreateAccompanyRequestParams{
		UserID:        req.GetUserID(),
		Era:           req.GetEra(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		FindTarget:    req.GetFindTarget(),
		Sociability:   req.GetSociability(),
		Certification: req.GetCertification(),
	}
	accompany, err := server.store.CreateAccompanyRequest(ctx, Ac)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateAccompanyResponse{
		Ac: convertAccompany(accompany),
	}
	return rsp, nil
}

func (server *Server) GetAccompany(ctx context.Context, req *pb.GetAccompanyRequest) (*pb.GetAccompanyResponse, error) {
	accompany, err := server.store.GetUserAccompany(ctx, req.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetAccompanyResponse{
		Ac: convertAccompany(accompany),
	}
	return rsp, nil
}

func (server *Server) UpdateAccompany(ctx context.Context, req *pb.UpdateAccompanyRequest) (*pb.UpdateAccompanyResponse, error) {
	Ac := info.UpdateUserAccompanyParams{
		UserID:        req.GetUserID(),
		Era:           req.GetEra(),
		City:          req.GetCity(),
		Gender:        req.GetGender(),
		Speaklanguage: req.GetSpeaklanguage(),
		FindType:      req.GetFindType(),
		FindTarget:    req.GetFindTarget(),
		Sociability:   req.GetSociability(),
		Certification: req.GetCertification(),
	}
	accompany, err := server.store.UpdateUserAccompany(ctx, Ac)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateAccompanyResponse{
		Ac: convertAccompany(accompany),
	}
	return rsp, nil
}
