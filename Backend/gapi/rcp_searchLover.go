package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"fmt"
<<<<<<< HEAD
=======
	"math/rand"
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

<<<<<<< HEAD
func (server *Server) SearchTargetLover(ctx context.Context, req *pb.SearchRequestL) (*pb.SearchResponseL, error) {
=======
func (server *Server) SearchTargetLover(ctx context.Context, req *pb.SearchRequest) (*pb.SearchResponse, error) {
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
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
<<<<<<< HEAD
				if i < len(Ff) {
					continue
				}
=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
				return nil, status.Errorf(codes.Internal, "failed to get user with Fix")
			}
			C_step1_50 = append(C_step1_50, FC)
		}
		C_step2_75, C_step2_50 := check75Loverup(C_step1_50, myLover)

		// 75%
		if len(C_step2_75) > 0 {
<<<<<<< HEAD
			full, msg, le := checkLover100(C_step2_75, myLover)
			if len(full) > 0 {
				return &pb.SearchResponseL{
					Resu: convertSearchL(full, le, msg),
				}, nil
			} else {
				var C_step2_75_id []int32
				for i := range C_step2_75 {
					C_step2_75_id = append(C_step2_75_id, C_step2_75[i].UserID)
				}
				return &pb.SearchResponseL{
					Resu: convertSearchL(C_step2_75_id, int32(len(C_step2_75)), "75%"),
=======
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
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
				}, nil
			}
		}

		// 62.5%
		if len(C_step2_50) > 0 {
<<<<<<< HEAD
			f75, msg, le := checkLover100(C_step2_50, myLover)
			if len(f75) > 0 {
				return &pb.SearchResponseL{
					Resu: convertSearchL(f75, le, msg),
				}, nil
			} else {
				var C_step2_50_id []int32
				for i := range C_step2_50 {
					C_step2_50_id = append(C_step2_50_id, C_step2_50[i].UserID)
				}
				return &pb.SearchResponseL{
					Resu: convertSearchL(C_step2_50_id, int32(len(C_step2_50)), "50%"),
=======
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
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
				}, nil
			}
		}
	} else {
<<<<<<< HEAD
		var Ff_id []int32
		for i := range Ff {
			Ff_id = append(Ff_id, Ff[i].UserID)
		}
		return &pb.SearchResponseL{
			Resu: convertSearchL(Ff_id, int32(len(Ff)), "50%"),
		}, nil
	}
	// 50% 未満

	return &pb.SearchResponseL{
		Resu: convertSearchL(nil, 0, "No search results found"),
=======
		return &pb.SearchResponse{
			Result: Ff[rand.Intn(len(Ff))].UserID,
			Rank:   "50%",
		}, nil
	}
	// 50% 未満
	return &pb.SearchResponse{
		Result: 0,
		Rank:   "No search results found",
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
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

<<<<<<< HEAD
func checkLover100(C_step2_75 []info.Canchangeinformation, myLover info.Lover) ([]int32, string, int32) {
=======
func checkLover100(C_step2_75 []info.Canchangeinformation, myLover info.Lover) (int32, string) {
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
	var C_step3_100 []info.Canchangeinformation
	// Address
	for i := 0; i < len(C_step2_75); i++ {
		for k := 0; k < len(myLover.City); k++ {
			if C_step2_75[i].City == myLover.City[k] {
				C_step3_100 = append(C_step3_100, C_step2_75[i])
			}
		}
	}
<<<<<<< HEAD
	var C_step3_100_id []int32
	for i := range C_step3_100 {
		C_step3_100_id = append(C_step3_100_id, C_step3_100[i].UserID)
	}
	return C_step3_100_id, "100%", int32(len(C_step3_100))
=======
	return C_step3_100[rand.Intn(len(C_step3_100))].UserID, "100%"
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
}
