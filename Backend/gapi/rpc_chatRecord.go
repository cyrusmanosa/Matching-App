package gapi

import (
	ch "Backend/db/sqlc/chat"
	"Backend/pb"
	"context"
	"time"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateChatTable(ctx context.Context, req *pb.CreateChatTableRequest) (*emptypb.Empty, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	err := server.chatStore.CreateChatTable(ctx, req.GetUserID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create table: %s", err)
	}
	return &emptypb.Empty{}, nil
}

func (server *Server) CreateChatRecord(ctx context.Context, req *pb.CreateChatRecordRequest) (*pb.CreateChatRecordResponse, error) {
	session, err := server.sessionFromMetadata(ctx)
	if err != nil {
		return nil, err
	}
	ownTable := req.GetUserID() == session.UserID
	deliverCopy := req.GetUserID() != session.UserID && req.GetTargetID() == session.UserID && req.GetRoleType() == "receiver"
	if !ownTable && !deliverCopy {
		return nil, status.Error(codes.PermissionDenied, "cannot write this chat")
	}
	if err = server.ensureNotBlocked(ctx, session.UserID, otherChatUser(session.UserID, req.GetUserID(), req.GetTargetID())); err != nil {
		return nil, err
	}

	chat := ch.CreateRecordParams{
		TargetID:  req.GetTargetID(),
		RoleType:  req.GetRoleType(),
		MediaType: req.GetMediaType(),
		Media:     req.GetMedia(),
	}

	chatR, err := server.chatStore.CreateRecord(ctx, chat, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "chat record not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input table: %s", err)
	}

	rsp := &pb.CreateChatRecordResponse{
		ChatRecord: convertChat(chatR),
	}

	return rsp, nil
}

func (server *Server) GetChatRecord(ctx context.Context, req *pb.GetChatRecordRequest) (*pb.GetChatRecordResponse, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	if err := server.ensureNotBlocked(ctx, req.GetUserID(), req.GetTargetID()); err != nil {
		return nil, err
	}
	GetC, err := server.chatStore.GetRecord(ctx, req.GetTargetID(), req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "chat record not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to get chat record: %s", err)
	}

	rsp := &pb.GetChatRecordResponse{
		ChatRecordNoID: convertChatList(GetC),
	}

	return rsp, nil
}

func (server *Server) GetTargetID(ctx context.Context, req *pb.GetTargetIDRequest) (*pb.GetTargetIDResponse, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	tid, err := server.chatStore.GetTargetID(ctx, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to get data: %s", err)
	}

	rsp := &pb.GetTargetIDResponse{
		TargetID: tid,
	}

	return rsp, nil
}

func (server *Server) GetLastMsg(ctx context.Context, req *pb.GetLastMsgRequest) (*pb.GetLastMsgResponse, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	if err := server.ensureNotBlocked(ctx, req.GetUserID(), req.GetTargetID()); err != nil {
		return nil, err
	}
	lmsg, err := server.chatStore.GetLastMsg(ctx, req.GetTargetID(), req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to get data: %s", err)
	}

	rsp := &pb.GetLastMsgResponse{
		MediaType: lmsg.MediaType,
		Media:     lmsg.Media,
		IsRead:    lmsg.Isread,
	}

	return rsp, nil
}

func (server *Server) GetChatRow(ctx context.Context, req *pb.GetChatRowRequest) (*pb.GetChatRowResponse, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	row, err := server.chatStore.GetChatRow(ctx, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to get data: %s", err)
	}
	rsp := &pb.GetChatRowResponse{
		Row: row,
	}

	return rsp, nil
}

func (server *Server) UpdateRead(ctx context.Context, req *pb.UpdateReadRequest) (*emptypb.Empty, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	err := server.chatStore.UpdateRead(ctx, req.GetTargetID(), req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to update table: %s", err)
	}
	return &emptypb.Empty{}, nil
}

func (server *Server) UpdateChatRecord(ctx context.Context, req *pb.UpdateChatRecordRequest) (*pb.UpdateChatRecordResponse, error) {
	if err := server.requireOwnChat(ctx, req.GetUserID()); err != nil {
		return nil, err
	}
	pbTimestamp := req.GetCreateAt()
	timeValue := time.Unix(pbTimestamp.GetSeconds(), int64(pbTimestamp.GetNanos()))

	chat := ch.UpdateRecordParams{
		TargetID:  req.GetTargetID(),
		MediaType: req.GetMediaType(),
		Media:     req.GetMedia(),
		CreatedAt: timeValue,
	}

	Updatechat, err := server.chatStore.UpdateRecord(ctx, chat, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to update table: %s", err)
	}

	rsp := &pb.UpdateChatRecordResponse{
		ChatRecord: convertChat(Updatechat),
	}

	return rsp, nil
}
