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
)

func (server *Server) CreateChatRecord(ctx context.Context, req *pb.CreateChatRecordRequest) (*pb.CreateChatRecordResponse, error) {
	// Gid, err := uuid.Parse(req.GetSessionID())
	// if err != nil {
	// 	return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	// }

	// token, err := server.infoStore.GetSession(ctx, Gid)
	// if err != nil {
	// 	return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	// }

	// _, err = server.tokenMaker.VerifyToken(token.AccessToken)
	// if err != nil {
	// 	return nil, fmt.Errorf("invalid access token: %v", err)
	// }

	tablename := "U" + strconv.Itoa(int(req.GetUserID()))

	chat := ch.CreateRecordParams{
		TargetID: req.GetTargetID(),
		MsgType:  req.GetMsgType(),
		Message:  req.GetMessage(),
		Images:   req.GetImages(),
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
	// Gid, err := uuid.Parse(req.GetSessionID())
	// if err != nil {
	// 	return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	// }

	// token, err := server.infoStore.GetSession(ctx, Gid)
	// if err != nil {
	// 	return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	// }

	// _, err = server.tokenMaker.VerifyToken(token.AccessToken)
	// if err != nil {
	// 	return nil, fmt.Errorf("invalid access token: %v", err)
	// }

	tablename := "U" + strconv.Itoa(int(req.GetUserID()))

	GetC, err := server.chatStore.Getrecord(ctx, req.TargetID, tablename)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "chat record not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to find UserID: %s", err)
	}

	rsp := &pb.GetChatRecordResponse{
		ChatRecord: convertChatList(GetC),
	}

	return rsp, nil
}

func (server *Server) UpdateChatRecord(ctx context.Context, req *pb.UpdateChatRecordRequest) (*pb.UpdateChatRecordResponse, error) {
	// Gid, err := uuid.Parse(req.GetSessionID())
	// if err != nil {
	// 	return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	// }

	// token, err := server.infoStore.GetSession(ctx, Gid)
	// if err != nil {
	// 	return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	// }

	// _, err = server.tokenMaker.VerifyToken(token.AccessToken)
	// if err != nil {
	// 	return nil, fmt.Errorf("invalid access token: %v", err)
	// }

	tablename := "U" + strconv.Itoa(int(req.GetUserID()))

	pbTimestamp := req.GetCreateAt()
	timeValue := time.Unix(pbTimestamp.GetSeconds(), int64(pbTimestamp.GetNanos()))

	chat := ch.UpdateRecordParams{
		TargetID:  req.GetTargetID(),
		MsgType:   req.GetMsgType(),
		Message:   req.GetMessage(),
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
