package gapi

import (
	db "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"
	"strings"

	"github.com/google/uuid"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func snsProvider(marker string) (string, bool) {
	switch marker {
	case "sns:google", "sns:facebook", "sns:twitter":
		return strings.TrimPrefix(marker, "sns:"), true
	default:
		return "", false
	}
}

func (server *Server) continueWithSns(ctx context.Context, provider, email string) (*pb.LoginUserResponse, error) {
	email = strings.TrimSpace(email)
	if !strings.Contains(email, "@") || !strings.Contains(email, ".") {
		return nil, status.Error(codes.InvalidArgument, "invalid email")
	}

	user, err := server.infoStore.LoginAtEmail(ctx, email)
	if err != nil {
		if !missingRecord(err) {
			return nil, status.Error(codes.Internal, "failed to find user")
		}
		code := uuid.NewString()
		if err = server.savePending(ctx, code, email, provider, true); err != nil {
			return nil, status.Error(codes.Internal, "failed to start signup")
		}
		return &pb.LoginUserResponse{SessionsID: "signup:" + code, Email: email}, nil
	}

	loginProvider, err := server.infoStore.GetLoginProvider(ctx, email)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to find user")
	}
	if loginProvider == "" || loginProvider == "email" {
		return nil, status.Error(codes.PermissionDenied, "use password")
	}
	if loginProvider != provider {
		return nil, status.Error(codes.FailedPrecondition, "different sns")
	}

	accessToken, payload, err := server.tokenMaker.CreateToken(user.Email, user.Role, server.config.AccessTokenDuration)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create access token")
	}
	if err = server.infoStore.LogoutActiveSessions(ctx, user.UserID); err != nil {
		return nil, status.Error(codes.Internal, "failed to close other sessions")
	}
	sessions, err := server.infoStore.CreateSession(ctx, db.CreateSessionParams{
		ID:          payload.ID,
		UserID:      user.UserID,
		AccessToken: accessToken,
		Status:      sessionStatusLogin,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create session")
	}
	return &pb.LoginUserResponse{
		SessionsID:           sessions.ID.String(),
		Email:                user.Email,
		AccessTokenExpiresAt: timestamppb.New(payload.ExpiredAt),
	}, nil
}

func (server *Server) LoginUser(ctx context.Context, req *pb.LoginUserRequest) (*pb.LoginUserResponse, error) {
	if provider, ok := snsProvider(req.GetPassword()); ok {
		return server.continueWithSns(ctx, provider, req.GetEmail())
	}

	user, err := server.infoStore.LoginAtEmail(ctx, req.GetEmail())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Error(codes.Unauthenticated, "incorrect email or password")
		}
		return nil, status.Error(codes.Internal, "failed to find user")
	}

	if err = util.CheckPassword(req.GetPassword(), user.HashedPassword); err != nil {
		return nil, status.Error(codes.Unauthenticated, "incorrect email or password")
	}

	// payload 的 ID 就是 session id。加密後的 access token 存進 sessions，之後用 session id 取出來驗證。
	accessToken, payload, err := server.tokenMaker.CreateToken(
		user.Email,
		user.Role,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create access token")
	}

	if err = server.infoStore.LogoutActiveSessions(ctx, user.UserID); err != nil {
		return nil, status.Error(codes.Internal, "failed to close other sessions")
	}

	sessions, err := server.infoStore.CreateSession(ctx, db.CreateSessionParams{
		ID:          payload.ID,
		UserID:      user.UserID,
		AccessToken: accessToken,
		Status:      sessionStatusLogin,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create session")
	}

	rsp := &pb.LoginUserResponse{
		SessionsID:           sessions.ID.String(),
		Email:                user.Email,
		AccessTokenExpiresAt: timestamppb.New(payload.ExpiredAt),
	}

	return rsp, nil
}
