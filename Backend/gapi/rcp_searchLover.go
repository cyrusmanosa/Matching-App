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

func (server *Server) SearchTargetLover(ctx context.Context, req *pb.SearchRequest) (*pb.SearchResponse, error) {
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
	myLover, err := server.infoStore.GetLover(ctx, token.UserID)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	/// Search start :: 50% Up
	datac := info.FixSearchLoverParams{
		UserID: token.UserID,
		Age:    &myLover.MinAge,
		Age_2:  &myLover.MaxAge,
		Gender: &myLover.Gender,
	}
	Ff, err1 := server.infoStore.FixSearchLover(ctx, datac)
	if err1 != nil {
		errCode := db.ErrorCode(err1)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.NotFound, "No Data")
	}

	if len(Ff) > 0 {
		var C_step1_50 []info.Canchangeinformation
		for i := 0; i < len(Ff); i++ {
			FC, err1 := server.infoStore.GetUserCanChangeInformation(ctx, Ff[i].UserID)
			if err1 != nil {
				return nil, status.Errorf(codes.Internal, "failed to get user with Fix")
			}
			C_step1_50 = append(C_step1_50, FC)
		}
		C_step2_75, C_step2_50 := check75Loverup(C_step1_50, myLover)

		// 75%
		if len(C_step2_75) > 0 {
			full, msg := checkLover100(C_step2_75, myLover)
			if full > 0 {
				return &pb.SearchResponse{
					Result: full,
					Rank:   msg,
				}, nil
			} else {
				return &pb.SearchResponse{
					Result: C_step2_75[rand.Intn(len(C_step2_75))].UserID,
					Rank:   "75%",
				}, nil
			}
		}

		// 62.5%
		if len(C_step2_50) > 0 {
			f75, msg := checkLover100(C_step2_50, myLover)
			if f75 > 0 {
				return &pb.SearchResponse{
					Result: f75,
					Rank:   msg,
				}, nil
			} else {
				return &pb.SearchResponse{
					Result: C_step2_50[rand.Intn(len(C_step2_50))].UserID,
					Rank:   "50%",
				}, nil
			}
		}
	} else {
		return &pb.SearchResponse{
			Result: Ff[rand.Intn(len(Ff))].UserID,
			Rank:   "50%",
		}, nil
	}
	// 50% 未満
	return &pb.SearchResponse{
		Result: 0,
		Rank:   "No search results found",
	}, nil
}

func check75Loverup(C_step1_50 []info.Canchangeinformation, myLover info.Lover) ([]info.Canchangeinformation, []info.Canchangeinformation) {
	var C_step2_75 []info.Canchangeinformation
	var C_step2_50 []info.Canchangeinformation
	// Sexual and Language
	for i := 0; i < len(C_step1_50); i++ {
		// Sexual
		if C_step1_50[i].Sexual >= myLover.Sexual {
			for i := 0; i < len(C_step1_50); i++ {
				// Language
				for j := 0; j < len(C_step1_50[i].Speaklanguage); j++ {
					for k := 0; k < len(myLover.Speaklanguage); k++ {
						if C_step1_50[i].Speaklanguage[j] == myLover.Speaklanguage[k] {
							C_step2_75 = append(C_step2_75, C_step1_50[i])
							break
						}
					}
				}
				C_step2_50 = append(C_step2_50, C_step1_50[i])
			}
		}
	}
	return C_step2_75, C_step2_50
}

func checkLover100(C_step2_75 []info.Canchangeinformation, myLover info.Lover) (int32, string) {
	var C_step3_100 []info.Canchangeinformation
	// Address
	for i := 0; i < len(C_step2_75); i++ {
		for k := 0; k < len(myLover.City); k++ {
			if C_step2_75[i].City == myLover.City[k] {
				C_step3_100 = append(C_step3_100, C_step2_75[i])
			}
		}
	}
	return C_step3_100[rand.Intn(len(C_step3_100))].UserID, "100%"
}
