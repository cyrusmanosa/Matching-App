package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"errors"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) SearchTargetHobby(ctx context.Context, req *pb.SearchRequestH) (*pb.SearchResponseH, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	myHobby, err := server.infoStore.GetHobby(ctx, session.UserID)
	if err != nil {
		if errors.Is(err, db.ErrRecordNotFound) {
			return nil, status.Errorf(codes.NotFound, "hobby preference not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to load hobby preference")
	}
	if myHobby.FindType == "" {
		return emptyHobbyResponse(), nil
	}

	me, err := server.loadSearcherProfile(ctx, session.UserID)
	if err != nil {
		return nil, err
	}

	candidates, err := server.infoStore.ListHobbyCandidates(ctx, info.ListHobbyCandidatesParams{
		UserID:    session.UserID,
		HobbyType: myHobby.FindType,
	})
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to search hobby")
	}

	ranked := make([]rankedID, 0, len(candidates))
	for _, candidate := range candidates {
		ranked = append(ranked, rankedID{
			id:      candidate.UserID,
			percent: scoreHobby(candidate, myHobby, me),
		})
	}

	ids, rank, length := buildSearchResult(ranked)
	return &pb.SearchResponseH{
		Resu: convertSearchH(ids, length, rank),
	}, nil
}

func emptyHobbyResponse() *pb.SearchResponseH {
	return &pb.SearchResponseH{
		Resu: convertSearchH([]int32{}, 0, "0%"),
	}
}
