package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"

	"Backend/pb"
	"context"
	"fmt"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreatePayment(ctx context.Context, req *pb.CreatePaymentRequest) (*pb.CreatePaymentResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}

	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}

	user, err := server.infoStore.GetUserFixInformation(ctx, token.UserID)
	if err != nil {
		return nil, fmt.Errorf("have not user about this: %v", err)
	}

	id, _ := uuid.NewRandom()

	pay := info.CreatePaymentParams{
		PayID:       id,
		Fullname:    user.FirstName + user.LastName,
		PaymentType: req.GetPaymentType(),
		Amount:      req.GetAmount(),
		Product:     req.GetProduct(),
	}

	payment, err := server.infoStore.CreatePayment(ctx, pay)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to input payment record: %s", err)
	}

	rsp := &pb.CreatePaymentResponse{
		Payment: convertPay(payment),
	}

	return rsp, nil
}

func (server *Server) GetPayment(ctx context.Context, req *pb.GetPaymentRequest) (*pb.GetPaymentResponse, error) {
	payid, err := uuid.Parse(req.GetPayID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	GetP, err := server.infoStore.GetPayment(ctx, payid)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}
	rsp := &pb.GetPaymentResponse{
		Payment: convertPay(GetP),
	}
	return rsp, nil
}
