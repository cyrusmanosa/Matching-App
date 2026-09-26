package gapi

import (
	info "Backend/db/sqlc/info"
	"context"
	"strconv"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

func (server *Server) sessionFromMetadata(ctx context.Context) (info.Session, error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return info.Session{}, status.Error(codes.Unauthenticated, "session is required")
	}
	values := md.Get("session-id")
	if len(values) == 0 || values[0] == "" {
		return info.Session{}, status.Error(codes.Unauthenticated, "session is required")
	}
	return server.userFromSession(ctx, values[0])
}

func containsID(ids []int32, userID int32) bool {
	for _, id := range ids {
		if id == userID {
			return true
		}
	}
	return false
}

func listIncludes(list info.Targetlist, userID int32) bool {
	return list.Target1ID == userID || list.Target2ID == userID || list.Target3ID == userID
}

func (server *Server) canReadUser(ctx context.Context, session info.Session, otherID int32) error {
	if otherID == session.UserID {
		return nil
	}
	if otherID == 0 {
		return status.Error(codes.PermissionDenied, "cannot view this user")
	}
	mine, err := server.infoStore.GetTargetUserList(ctx, session.UserID)
	if err == nil && listIncludes(mine, otherID) {
		return nil
	}
	theirs, err := server.infoStore.GetTargetUserList(ctx, otherID)
	if err == nil && listIncludes(theirs, session.UserID) {
		return nil
	}
	if server.chatStore != nil {
		ids, chatErr := server.chatStore.GetTargetID(ctx, "u"+strconv.Itoa(int(session.UserID)))
		if chatErr == nil && containsID(ids, otherID) {
			return nil
		}
	}
	return status.Error(codes.PermissionDenied, "cannot view this user")
}

func (server *Server) requireOwnChat(ctx context.Context, userID int32) error {
	session, err := server.sessionFromMetadata(ctx)
	if err != nil {
		return err
	}
	if userID != session.UserID {
		return status.Error(codes.PermissionDenied, "cannot access another user's chat")
	}
	return nil
}

func (server *Server) requireChatPair(ctx context.Context, userID, targetID int32) error {
	session, err := server.sessionFromMetadata(ctx)
	if err != nil {
		return err
	}
	if userID == session.UserID || targetID == session.UserID {
		return nil
	}
	return status.Error(codes.PermissionDenied, "cannot access this chat")
}

func maskSlot(id, viewer int32) int32 {
	if id == 0 || id == viewer {
		return id
	}
	return -1
}
