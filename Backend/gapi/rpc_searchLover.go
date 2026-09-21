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

func (server *Server) SearchTargetLover(ctx context.Context, req *pb.SearchRequestL) (*pb.SearchResponseL, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	myLover, err := server.infoStore.GetLover(ctx, session.UserID)
	if err != nil {
		if errors.Is(err, db.ErrRecordNotFound) {
			return nil, status.Errorf(codes.NotFound, "lover preference not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to load lover preference")
	}
	if myLover.Gender == "" && myLover.MinAge == 0 && myLover.MaxAge == 0 {
		return emptyLoverResponse(), nil
	}

	me, err := server.loadSearcherProfile(ctx, session.UserID)
	if err != nil {
		return nil, err
	}

	minAge, maxAge := normalizeAgeRange(myLover.MinAge, myLover.MaxAge)
	candidates, err := server.infoStore.ListLoverCandidates(ctx, info.ListLoverCandidatesParams{
		UserID: session.UserID,
		Gender: myLover.Gender,
		MinAge: minAge,
		MaxAge: maxAge,
	})
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to search lover")
	}

	ranked := make([]rankedID, 0, len(candidates))
	for _, candidate := range candidates {
		ranked = append(ranked, rankedID{
			id:      candidate.UserID,
			percent: scoreLover(candidate, myLover, me),
		})
	}

	ids, rank, length := buildSearchResult(ranked)
	return &pb.SearchResponseL{
		Resu: convertSearchL(ids, length, rank),
	}, nil
}

func emptyLoverResponse() *pb.SearchResponseL {
	return &pb.SearchResponseL{
		Resu: convertSearchL([]int32{}, 0, "0%"),
	}
}
