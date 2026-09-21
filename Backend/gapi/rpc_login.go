package gapi

import (
	db "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) LoginUser(ctx context.Context, req *pb.LoginUserRequest) (*pb.LoginUserResponse, error) {
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
