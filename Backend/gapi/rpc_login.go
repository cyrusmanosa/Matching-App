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

func (server *Server) loginUser(ctx context.Context, req *pb.LoginUserRequest) (*pb.LoginUserResponse, error) {

	user, err := server.store.LoginAtEmail(ctx, req.GetEmail())
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to find user")
	}

	err = util.CheckPassword(req.Password, user.HashedPassword)
	if err != nil {
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

	sessions, err := server.store.CreateSession(ctx, db.CreateSessionParams{
		ID:          payload.ID,
		Email:       Validate.Email,
		AccessToken: accessToken,
		IsBlocked:   false,
		ExpiresAt:   payload.ExpiredAt,
	})

	rsp := &pb.LoginUserResponse{
		SessionsID:           sessions.ID.String(),
		UserID:               user.UserID,
		Email:                sessions.Email,
		CreateAt:             timestamppb.New(user.CreatedAt.Time),
		AccessToken:          accessToken,
		AccessTokenExpiresAt: timestamppb.New(payload.ExpiredAt),
	}

	return rsp, nil
}
