package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

var GlobalSessionID uuid.UUID

func (server *Server) CreateFix(ctx context.Context, req *pb.CreateFixRequest) (*pb.CreateFixResponse, error) {
	Mail := Validate.Email

	aToken, payload, err := server.tokenMaker.CreateToken(
		Mail,
		util.DepositorRole,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed Code: %s", err)
	}

	B, Berr := util.BirthstringtoInt(req.GetBirth())
	if Berr != nil {
		return nil, status.Errorf(codes.Internal, "Birth Error: %s", Berr)
	}

	a := util.SwitchAge(B["year"], B["month"], B["day"])
	Con := util.SwitchConstellation(B["month"], B["day"])

	arg := info.CreateUserFixInformationParams{
		FirstName:     req.GetFirstName(),
		LastName:      req.GetLastName(),
		Email:         payload.Email,
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
	} else {
		Validate.Email = ""
		Validate.CheckCode = ""
	}

	sessions, err := server.store.CreateSession(ctx, info.CreateSessionParams{
		ID:          payload.ID,
		UserID:      fix.UserID,
		AccessToken: aToken,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})

	rsp := &pb.CreateFixResponse{
		SessionsID:           sessions.ID.String(),
		Email:                fix.Email,
		CreateAt:             timestamppb.New(fix.CreatedAt.Time),
		AccessTokenExpiresAt: timestamppb.New(sessions.ExpiresAt.Time),
	}

	GlobalSessionID = sessions.ID

	return rsp, nil
}
