package gapi

import (
	db "Backend/db/sqlc"
	ch "Backend/db/sqlc/chat"
	"Backend/pb"
	"context"
	"strconv"
	"time"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateChatTable(ctx context.Context, req *pb.CreateChatTableRequest) (*emptypb.Empty, error) {
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	err := server.chatStore.CreateChatTable(ctx, tablename)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create table: %s", err)
	}
	return &emptypb.Empty{}, nil
}

func (server *Server) CreateChatRecord(ctx context.Context, req *pb.CreateChatRecordRequest) (*pb.CreateChatRecordResponse, error) {

	tablename := "u" + strconv.Itoa(int(req.GetUserID()))
	chat := ch.CreateRecordParams{
		TargetID:  req.GetTargetID(),
		RoleType:  req.GetRoleType(),
		MediaType: req.GetMediaType(),
		Media:     req.GetMedia(),
	}

	chatR, err := server.chatStore.CreateRecord(ctx, chat, tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input table: %s", err)
	}

	rsp := &pb.CreateChatRecordResponse{
		ChatRecord: convertChat(chatR),
	}

	return rsp, nil
}

func (server *Server) GetChatRecord(ctx context.Context, req *pb.GetChatRecordRequest) (*pb.GetChatRecordResponse, error) {
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	GetC, err := server.chatStore.GetRecord(ctx, req.GetTargetID(), tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "chat record not found")
		}
		return nil, status.Errorf(codes.Internal, "failed: %s And tablename %s at targetid %d", err, tablename, req.GetTargetID())
	}

	rsp := &pb.GetChatRecordResponse{
		ChatRecordNoID: convertChatList(GetC),
	}

	return rsp, nil
}

func (server *Server) GetTargetID(ctx context.Context, req *pb.GetTargetIDRequest) (*pb.GetTargetIDResponse, error) {
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	tid, err := server.chatStore.GetTargetID(ctx, tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
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
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	lmsg, err := server.chatStore.GetLastMsg(ctx, req.GetTargetID(), tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to get data: %s", err)
	}

	rsp := &pb.GetLastMsgResponse{
		MediaType: lmsg.MediaType,
		Media:     lmsg.Media,
		Isread:    lmsg.Isread,
	}

	return rsp, nil
}

func (server *Server) GetChatRow(ctx context.Context, req *pb.GetChatRowRequest) (*pb.GetChatRowResponse, error) {
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	row, err := server.chatStore.GetChatRow(ctx, tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
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
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))
	err := server.chatStore.UpdateRead(ctx, req.GetTargetID(), tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to update table: %s", err)
	}
	return &emptypb.Empty{}, nil
}

func (server *Server) UpdateChatRecord(ctx context.Context, req *pb.UpdateChatRecordRequest) (*pb.UpdateChatRecordResponse, error) {
	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	pbTimestamp := req.GetCreateAt()
	timeValue := time.Unix(pbTimestamp.GetSeconds(), int64(pbTimestamp.GetNanos()))

	chat := ch.UpdateRecordParams{
		TargetID:  req.GetTargetID(),
		MediaType: req.GetMediaType(),
		Media:     req.GetMedia(),
		CreatedAt: timeValue,
	}

	Updatechat, err := server.chatStore.UpdateRecord(ctx, chat, tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "table not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to update table: %s", err)
	}

	rsp := &pb.UpdateChatRecordResponse{
		ChatRecord: convertChat(Updatechat),
	}

	return rsp, nil
}

func (server *Server) DeleteChatRecord(ctx context.Context, req *pb.DeleteChatRecordRequest) (*emptypb.Empty, error) {

	tablename := "u" + strconv.Itoa(int(req.GetUserID()))

	d := ch.DeleteRecordParams{
		TargetID:  req.GetTargetID(),
		CreatedAt: req.GetCreateAt().AsTime(),
	}

	err := server.chatStore.DeleteRecord(ctx, d, tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
