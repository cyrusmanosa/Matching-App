package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) CreateFix(ctx context.Context, req *pb.CreateFixRequest) (*pb.CreateFixResponse, error) {
	md, _ := metadata.FromIncomingContext(ctx)
	codesMD := md.Get("signup-code")
	if len(codesMD) == 0 || codesMD[0] == "" {
		return nil, status.Error(codes.FailedPrecondition, "signup verification is required")
	}
	pending, ok := server.takeVerifiedSignup(ctx, codesMD[0])
	if !ok || pending.Email == "" {
		return nil, status.Error(codes.FailedPrecondition, "signup verification expired")
	}
	Mail := pending.Email

	aToken, payload, err := server.tokenMaker.CreateToken(
		Mail,
		util.DepositorRole,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed Code: %s", err)
	}

	B, Berr := util.BirthStringToInt(req.GetBirth())
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

	fix, err := server.infoStore.CreateUserFixInformation(ctx, arg)
	if err != nil {
		if db.ErrorCode(err) == db.UniqueViolation {
			return nil, status.Errorf(codes.AlreadyExists, err.Error())
		}
		return nil, status.Errorf(codes.Internal, "failed to create user: %s", err)
	}
	if pending.Provider != "" {
		if err = server.infoStore.SetLoginProvider(ctx, fix.UserID, pending.Provider); err != nil {
			return nil, status.Error(codes.Internal, "failed to save login provider")
		}
	}

	sessions, err := server.infoStore.CreateSession(ctx, info.CreateSessionParams{
		ID:          payload.ID,
		UserID:      fix.UserID,
		AccessToken: aToken,
		Status:      sessionStatusSignUp,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create session")
	}

	rsp := &pb.CreateFixResponse{
		SessionsID:           sessions.ID.String(),
		Email:                fix.Email,
		CreateAt:             timestamppb.New(fix.CreatedAt.Time),
		AccessTokenExpiresAt: timestamppb.New(sessions.ExpiresAt.Time),
	}

	return rsp, nil
}

func (server *Server) GetFix(ctx context.Context, req *pb.GetFixRequest) (*pb.GetFixResponse, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}
	if err = server.canReadUser(ctx, session, req.GetUserID()); err != nil {
		return nil, err
	}

	getFix, err := server.infoStore.GetUserFixInformation(ctx, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetFixResponse{
		Fix: convertFix(getFix),
	}
	return rsp, nil
}

func (server *Server) Deletefix(ctx context.Context, req *pb.DeleteFixRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteAccountData(ctx, token.UserID)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to delete account")
	}
	if server.chatStore != nil {
		_ = server.chatStore.DropUserChat(ctx, token.UserID)
	}

	return &emptypb.Empty{}, nil
}
