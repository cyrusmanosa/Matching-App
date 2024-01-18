package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"fmt"
	"math/rand"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) SearchTargetAccompany(ctx context.Context, req *pb.SearchRequest) (*pb.SearchResponse, error) {
	Gid, err := uuid.Parse(req.GetSessionID())
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Session ID Error: %s", err)
	}
	token, err := server.infoStore.GetSession(ctx, Gid)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "authID Error: %s", err)
	}
	_, err = server.tokenMaker.VerifyToken(token.AccessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %v", err)
	}
	myAccompany, err := server.infoStore.GetAccompany(ctx, token.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	/// Search start :: 63% Up
	datac := info.CanChangeSearchAccompanyParams{
		UserID:        token.UserID,
		Speaklanguage: nil,
		Sociability:   &myAccompany.Sociability,
		AccompanyType: &myAccompany.FindType,
	}
	Cc, err1 := server.infoStore.CanChangeSearchAccompany(ctx, datac)
	if err1 != nil {
		errCode := db.ErrorCode(err1)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.NotFound, "No Data")
	}

	if len(Cc) > 0 {
		C_step1_75, C_step1_63 := checkAccompany75(Cc, myAccompany)
		// 75%
		if len(C_step1_75) > 0 {
			var F_step2_75 []info.Fixinformation
			for i := 0; i < len(C_step1_75); i++ {
				CF, err1 := server.infoStore.GetUserFixInformation(ctx, C_step1_75[i].UserID)
				if err1 != nil {
					return nil, status.Errorf(codes.Internal, "failed to get user with Fix")
				}
				F_step2_75 = append(F_step2_75, CF)
			}
			if len(F_step2_75) > 0 {
				full, msg := checkAccompany100(F_step2_75, myAccompany)
				// 100%
				if full > 0 {
					return &pb.SearchResponse{
						Result: full,
						Rank:   msg,
					}, nil
				}
			}
		}

		// 62.5%
		if len(C_step1_63) > 0 {
			var F_step2_63 []info.Fixinformation
			for i := 0; i < len(C_step1_63); i++ {
				CF, err1 := server.infoStore.GetUserFixInformation(ctx, C_step1_63[i].UserID)
				if err1 != nil {
					return nil, status.Errorf(codes.Internal, "failed to get user with Fix")
				}
				F_step2_63 = append(F_step2_63, CF)
			}
			if len(F_step2_63) > 0 {
				f75, msg := checkAccompany100(F_step2_63, myAccompany)
				// 62.5% to 75%
				if f75 != 0 {
					return &pb.SearchResponse{
						Result: f75,
						Rank:   msg,
					}, nil
				}
			} else {
				return &pb.SearchResponse{
					Result: C_step1_63[rand.Intn(len(C_step1_63))].UserID,
					Rank:   "50%",
				}, nil
			}
		}

	} else {
		return &pb.SearchResponse{
			Result: Cc[rand.Intn(len(Cc))].UserID,
			Rank:   "50%",
		}, nil
	}
	// 50% 未満
	return &pb.SearchResponse{
		Result: 0,
		Rank:   "No search results found",
	}, nil
}

func checkAccompany75(Cc []info.Canchangeinformation, myAccompany info.Accompany) ([]info.Canchangeinformation, []info.Canchangeinformation) {
	// if Max :: 62.5% to 75%
	var C_step1_63 []info.Canchangeinformation
	var C_step1_75 []info.Canchangeinformation
	for i := 0; i < len(Cc); i++ {
		for j := 0; j < len(Cc[i].Speaklanguage); j++ {
			for k := 0; k < len(myAccompany.Speaklanguage); k++ {
				if Cc[i].Speaklanguage[j] == myAccompany.Speaklanguage[k] {
					C_step1_75 = append(C_step1_75, Cc[i])
					break
				} else {
					C_step1_63 = append(C_step1_63, Cc[i])
				}
			}
		}
	}
	return C_step1_75, C_step1_63
}

func checkAccompany100(F_step2_75 []info.Fixinformation, myAccompany info.Accompany) (int32, string) {
	var F_step2_100 []info.Fixinformation
	for i := 0; i < len(F_step2_75); i++ {
		if F_step2_75[i].Age >= myAccompany.Era && F_step2_75[i].Age < myAccompany.Era+10 {
			F_step2_100 = append(F_step2_100, F_step2_75[i])
		}
	}
	if len(F_step2_100) > 0 {
		return F_step2_100[rand.Intn(len(F_step2_100))].UserID, "100%"
	}
	return 0, "Not Found"
}
