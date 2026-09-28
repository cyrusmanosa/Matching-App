package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"strconv"
	"strings"

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
	if req.GetContactType() == "ブロック" {
		if targetID, ok := targetIDFromMessage(req.GetMessage()); ok && targetID != token.UserID {
			reason := req.GetMessage()
			if parts := strings.SplitN(req.GetMessage(), "\n", 2); len(parts) == 2 {
				reason = parts[1]
			}
			if err = server.infoStore.CreateUserBlock(ctx, token.UserID, targetID, reason); err != nil {
				return nil, status.Error(codes.Internal, "failed to block user")
			}
		}
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

func targetIDFromMessage(message string) (int32, bool) {
	line := strings.SplitN(message, "\n", 2)[0]
	if !strings.HasPrefix(line, "target:") {
		return 0, false
	}
	number, err := strconv.Atoi(strings.TrimPrefix(line, "target:"))
	if err != nil || number <= 0 {
		return 0, false
	}
	return int32(number), true
}
