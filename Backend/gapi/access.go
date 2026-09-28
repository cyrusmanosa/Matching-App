package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

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
		ids, chatErr := server.chatStore.GetTargetID(ctx, session.UserID)
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

func otherChatUser(self, userID, targetID int32) int32 {
	if userID == self {
		return targetID
	}
	return userID
}

func (server *Server) blockedWith(ctx context.Context, userID int32) (map[int32]struct{}, error) {
	ids, err := server.infoStore.ListBlockedWith(ctx, userID)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to check block")
	}
	set := make(map[int32]struct{}, len(ids))
	for _, id := range ids {
		set[id] = struct{}{}
	}
	return set, nil
}

func hideBlockedSlot(id int32, blocked map[int32]struct{}) (int32, bool) {
	if _, skip := blocked[id]; skip {
		return 0, true
	}
	return id, false
}

func (server *Server) hideBlockedTargets(ctx context.Context, userID int32, list *pb.Targetlist) error {
	blocked, err := server.blockedWith(ctx, userID)
	if err != nil {
		return err
	}
	if id, hidden := hideBlockedSlot(list.Target1ID, blocked); hidden {
		list.Target1ID = id
		list.T1Type = ""
	}
	if id, hidden := hideBlockedSlot(list.Target2ID, blocked); hidden {
		list.Target2ID = id
		list.T2Type = ""
	}
	if id, hidden := hideBlockedSlot(list.Target3ID, blocked); hidden {
		list.Target3ID = id
		list.T3Type = ""
	}
	return nil
}

func (server *Server) ensureNotBlocked(ctx context.Context, userID, targetID int32) error {
	if targetID == 0 || userID == targetID {
		return nil
	}
	blocked, err := server.infoStore.IsEitherBlocked(ctx, userID, targetID)
	if err != nil {
		return status.Error(codes.Internal, "failed to check block")
	}
	if blocked {
		return status.Error(codes.PermissionDenied, "blocked")
	}
	return nil
}

func maskSlot(id, viewer int32) int32 {
	if id == 0 || id == viewer {
		return id
	}
	return -1
}
