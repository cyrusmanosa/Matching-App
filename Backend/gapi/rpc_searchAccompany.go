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

func (server *Server) SearchTargetAccompany(ctx context.Context, req *pb.SearchRequestA) (*pb.SearchResponseA, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	myAccompany, err := server.infoStore.GetAccompany(ctx, session.UserID)
	if err != nil {
		if errors.Is(err, db.ErrRecordNotFound) {
			return nil, status.Errorf(codes.NotFound, "accompany preference not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to load accompany preference")
	}
	if myAccompany.FindType == "" {
		return emptyAccompanyResponse(), nil
	}

	me, err := server.loadSearcherProfile(ctx, session.UserID)
	if err != nil {
		return nil, err
	}

	candidates, err := server.infoStore.ListAccompanyCandidates(ctx, info.ListAccompanyCandidatesParams{
		UserID:        session.UserID,
		AccompanyType: myAccompany.FindType,
	})
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to search accompany")
	}

	ranked := make([]rankedID, 0, len(candidates))
	for _, candidate := range candidates {
		ranked = append(ranked, rankedID{
			id:      candidate.UserID,
			percent: scoreAccompany(candidate, myAccompany, me),
		})
	}

	ids, rank, length := buildSearchResult(ranked)
	return &pb.SearchResponseA{
		Resu: convertSearchA(ids, length, rank),
	}, nil
}

func emptyAccompanyResponse() *pb.SearchResponseA {
	return &pb.SearchResponseA{
		Resu: convertSearchA([]int32{}, 0, "0%"),
	}
}
