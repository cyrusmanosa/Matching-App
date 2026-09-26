package gapi

import (
	info "Backend/db/sqlc/info"

	"Backend/pb"
	"context"
	"fmt"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreatePayment(ctx context.Context, req *pb.CreatePaymentRequest) (*pb.CreatePaymentResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
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
	if _, err := server.sessionFromMetadata(ctx); err != nil {
		return nil, err
	}

	payid, err := uuid.Parse(req.GetPayID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}

	GetP, err := server.infoStore.GetPayment(ctx, payid)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}
	rsp := &pb.GetPaymentResponse{
		Payment: convertPay(GetP),
	}
	return rsp, nil
}
