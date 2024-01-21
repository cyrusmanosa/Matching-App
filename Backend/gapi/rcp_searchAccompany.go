package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"
	"fmt"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) SearchTargetAccompany(ctx context.Context, req *pb.SearchRequestA) (*pb.SearchResponseA, error) {
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
		Sociability:   myAccompany.Sociability,
		AccompanyType: myAccompany.FindType,
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
					if i < len(C_step1_75) {
						continue
					}
					return nil, status.Errorf(codes.Internal, "failed to get user with Fix")
				}
				F_step2_75 = append(F_step2_75, CF)
			}

			// 75% to 100
			if len(F_step2_75) > 0 {
				full, msg, le := checkAccompany100(F_step2_75, myAccompany)
				// 100%
				if len(full) > 0 {
					return &pb.SearchResponseA{
						Resu: convertSearchA(full, le, msg),
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
					if i < len(C_step1_63) {
						continue
					}
					return nil, status.Errorf(codes.Internal, "failed to get user with Fix")
				}
				F_step2_63 = append(F_step2_63, CF)
			}
			if len(F_step2_63) > 0 {
				f75, msg, le := checkAccompany100(F_step2_63, myAccompany)
				// 62.5% to 75%
				if len(f75) != 0 {
					return &pb.SearchResponseA{
						Resu: convertSearchA(f75, le, msg),
					}, nil
				}
			} else {
				var C_step1_63_id []int32
				for i := range Cc {
					C_step1_63_id = append(C_step1_63_id, C_step1_63[i].UserID)
				}
				return &pb.SearchResponseA{
					Resu: convertSearchA(C_step1_63_id, int32(len(C_step1_63)), "50%"),
				}, nil
			}
		}

	} else {
		var Cc_id []int32
		for i := range Cc {
			Cc_id = append(Cc_id, Cc[i].UserID)
		}
		return &pb.SearchResponseA{
			Resu: convertSearchA(Cc_id, int32(len(Cc)), "50%"),
		}, nil
	}
	// 50% 未満
	return &pb.SearchResponseA{
		Resu: convertSearchA(nil, 0, "No search results found"),
	}, nil
}

func checkAccompany75(Cc []info.Canchangeinformation, myAccompany info.Accompany) ([]info.Canchangeinformation, []info.Canchangeinformation) {
	// if Max :: 62.5% to 75%
	C_step1_63 := make([]info.Canchangeinformation, 0)
	C_step1_75 := make([]info.Canchangeinformation, 0)

	for i := 0; i < len(Cc); i++ {
		found := false
		for j := 0; j < len(Cc[i].Speaklanguage); j++ {
			for k := 0; k < len(myAccompany.Speaklanguage); k++ {
				if Cc[i].Speaklanguage[j] == myAccompany.Speaklanguage[k] {
					C_step1_75 = append(C_step1_75, Cc[i])
					found = true
					break
				}
			}
			if found {
				break
			}
		}

		if !found {
			C_step1_63 = append(C_step1_63, Cc[i])
		}
	}

	return C_step1_75, C_step1_63
}

func checkAccompany100(F_step2_75 []info.Fixinformation, myAccompany info.Accompany) ([]int32, string, int32) {
	var F_step2_100 []info.Fixinformation

	for i := 0; i < len(F_step2_75); i++ {
		if F_step2_75[i].Age >= myAccompany.Era && F_step2_75[i].Age < myAccompany.Era+10 {
			F_step2_100 = append(F_step2_100, F_step2_75[i])
		}
	}

	if len(F_step2_100) > 0 {
		var F_step2_100_id []int32
		for i := range F_step2_100 {
			F_step2_100_id = append(F_step2_100_id, F_step2_100[i].UserID)
		}
		return F_step2_100_id, "100%", int32(len(F_step2_100))
	}
	return nil, "Not Found", 0
}
