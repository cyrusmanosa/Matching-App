package gapi

import (
	db "Backend/db/sqlc/info"
	"Backend/pb"
	"Backend/util"
	"context"
	"database/sql"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) LoginUser(ctx context.Context, req *pb.LoginUserRequest) (*pb.LoginUserResponse, error) {
	user, err := server.infoStore.LoginAtEmail(ctx, req.GetEmail())
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to find user")
	}

	CheckErr := util.CheckPassword(req.GetPassword(), user.HashedPassword)
	if CheckErr != nil {
		return nil, status.Errorf(codes.Internal, "incorrect password")
	}

	accessToken, payload, err := server.tokenMaker.CreateToken(
		user.Email,
		user.Role,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create access token")
	}

	sessions, err := server.infoStore.CreateSession(ctx, db.CreateSessionParams{
		ID:          payload.ID,
		UserID:      user.UserID,
		AccessToken: accessToken,
		Status:      "Login",
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})

	rsp := &pb.LoginUserResponse{
		SessionsID:           sessions.ID.String(),
		Email:                user.Email,
		AccessTokenExpiresAt: timestamppb.New(payload.ExpiredAt),
	}

	return rsp, nil
}
