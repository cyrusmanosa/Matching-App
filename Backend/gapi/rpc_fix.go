package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) CreateFix(ctx context.Context, req *pb.CreateFixRequest) (*pb.CreateFixResponse, error) {

	B, Berr := util.BirthStringtoInt(req.GetBirth())
	if Berr != nil {
		return nil, status.Errorf(codes.Internal, "Birth Error: %s", Berr)
	}

	a := util.SwitchAge(B["year"], B["month"], B["day"])
	Con := util.SwitchConstellation(B["month"], B["day"])

	arg := info.CreateUserFixInformationParams{
		FirstName: req.GetFirstName(),
		LastName:  req.GetLastName(),
		// Email:         authPayload.Email,
		Birth:         req.GetBirth(),
		Country:       req.GetCountry(),
		Gender:        req.GetGender(),
		Blood:         req.GetBlood(),
		Age:           a,
		Constellation: Con,
		Certification: false,
	}

	fix, err := server.store.CreateUserFixInformation(ctx, arg)
	if err != nil {
		if db.ErrorCode(err) == db.UniqueViolation {
			return nil, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return nil, status.Errorf(codes.Internal, "failed to create user: %s", err)
	}

	rsp := &pb.CreateFixResponse{
		UserID:   fix.UserID,
		Email:    fix.Email,
		CreateAt: timestamppb.New(fix.CreatedAt.Time),
	}

	return rsp, nil
}
