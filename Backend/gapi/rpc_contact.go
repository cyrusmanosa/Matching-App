package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateContact(ctx context.Context, req *pb.CreateContactRequest) (*pb.CreateContactResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	cp := info.CreateContactParams{
		UserID:      token.UserID,
		ContactType: req.GetContactType(),
		Message:     req.GetMessage(),
		Status:      req.GetStatus(),
	}
	contact, err := server.infoStore.CreateContact(ctx, cp)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateContactResponse{
		C: convertContact(contact),
	}
	return rsp, nil
}

func (server *Server) GetContact(ctx context.Context, req *pb.GetContactRequest) (*pb.GetContactResponse, error) {
	_, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	contact, err := server.infoStore.GetUserContactList(ctx, req.GetContactID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input CpID: %s", err)
	}

	rsp := &pb.GetContactResponse{
		C: convertContact(contact),
	}
	return rsp, nil
}

func (server *Server) UpdateContact(ctx context.Context, req *pb.UpdateContactRequest) (*pb.UpdateContactResponse, error) {
	_, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	cp := info.UpdateUserContactParams{
		ContactID: req.GetContactID(),
		Status:    req.GetStatus(),
	}
	contact, err := server.infoStore.UpdateUserContact(ctx, cp)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input CpID: %s", err)
	}

	rsp := &pb.UpdateContactResponse{
		C: convertContact(contact),
	}
	return rsp, nil
}

func (server *Server) DeleteContact(ctx context.Context, req *pb.DeleteContactRequest) (*emptypb.Empty, error) {
	_, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteContact(ctx, req.GetContactID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
