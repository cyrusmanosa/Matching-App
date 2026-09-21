package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"context"
	"errors"
	"fmt"
	"math"
	"sort"
	"time"

	"github.com/google/uuid"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

// searchResultLimit 是回傳給 App 的上限。App 會從名單最前面挑第一個還沒在目標清單裡的人。
const searchResultLimit = 30

const (
	sessionStatusLogin  = "Login"
	sessionStatusSignUp = "SignUp"
)

// searcherProfile 是搜尋者自己的資料，用來判斷對方是否也在找你。
type searcherProfile struct {
	Age           int32
	Gender        string
	City          string
	Sexual        string
	Speaklanguage []string
	HobbyType     string
	Experience    int32
	Sociability   string
	AccompanyType string
}

type rankedID struct {
	id      int32
	percent int
}

func (server *Server) userFromSession(ctx context.Context, sessionID string) (info.Session, error) {
	gid, err := uuid.Parse(sessionID)
	if err != nil {
		return info.Session{}, status.Errorf(codes.InvalidArgument, "invalid session id")
	}

	session, err := server.infoStore.GetSession(ctx, gid)
	if err != nil {
		if errors.Is(err, db.ErrRecordNotFound) {
			return info.Session{}, status.Errorf(codes.Unauthenticated, "session not found")
		}
		return info.Session{}, status.Errorf(codes.Internal, "failed to load session")
	}
	if session.IsBlocked || (session.Status != sessionStatusLogin && session.Status != sessionStatusSignUp) {
		return info.Session{}, status.Errorf(codes.Unauthenticated, "session is closed")
	}
	if session.ExpiresAt.Valid && time.Now().After(session.ExpiresAt.Time) {
		return info.Session{}, status.Errorf(codes.Unauthenticated, "session expired")
	}
	payload, err := server.tokenMaker.VerifyToken(session.AccessToken)
	if err != nil || payload.ID != session.ID {
		return info.Session{}, status.Errorf(codes.Unauthenticated, "invalid access token")
	}
	return session, nil
}

func (server *Server) loadSearcherProfile(ctx context.Context, userID int32) (searcherProfile, error) {
	fix, err := server.infoStore.GetUserFixInformation(ctx, userID)
	if err != nil {
		if errors.Is(err, db.ErrRecordNotFound) {
			return searcherProfile{}, status.Errorf(codes.NotFound, "profile not found")
		}
		return searcherProfile{}, status.Errorf(codes.Internal, "failed to load profile")
	}

	can, err := server.infoStore.GetUserCanChangeInformation(ctx, userID)
	if err != nil && !errors.Is(err, db.ErrRecordNotFound) {
		return searcherProfile{}, status.Errorf(codes.Internal, "failed to load profile")
	}

	return searcherProfile{
		Age:           fix.Age,
		Gender:        fix.Gender,
		City:          can.City,
		Sexual:        can.Sexual,
		Speaklanguage: can.Speaklanguage,
		HobbyType:     can.HobbyType,
		Experience:    can.Experience,
		Sociability:   can.Sociability,
		AccompanyType: can.AccompanyType,
	}, nil
}

// similarity 是單一條件的相符程度，0 到 1。active 為 false 代表使用者沒填這項，不計分。
// 這對應搜尋引擎 bool query 裡的 should 子句：沒寫進查詢的條件不會懲罰文件。
type similarity struct {
	active bool
	score  float64
}

type boostClause struct {
	weight float64
	sim    similarity
}

const ageDecayScale int32 = 10

func clamp01(score float64) float64 {
	if score < 0 {
		return 0
	}
	if score > 1 {
		return 1
	}
	return score
}

func tokenSet(values []string) map[string]struct{} {
	set := make(map[string]struct{}, len(values))
	for _, value := range values {
		if value == "" {
			continue
		}
		set[value] = struct{}{}
	}
	return set
}

// jaccardSimilarity 用集合交疊比例計分。兩組語言完全相同是 1，只重疊一部分則給部分分數。
func jaccardSimilarity(want, got []string) similarity {
	left := tokenSet(want)
	if len(left) == 0 {
		return similarity{}
	}
	right := tokenSet(got)
	if len(right) == 0 {
		return similarity{active: true, score: 0}
	}
	intersection := 0
	union := len(right)
	for token := range left {
		if _, ok := right[token]; ok {
			intersection++
			continue
		}
		union++
	}
	return similarity{active: true, score: float64(intersection) / float64(union)}
}

func exactSimilarity(want, got string) similarity {
	if want == "" {
		return similarity{}
	}
	if want == got {
		return similarity{active: true, score: 1}
	}
	return similarity{active: true, score: 0}
}

func citySimilarity(wanted []string, city string) similarity {
	choices := tokenSet(wanted)
	if len(choices) == 0 {
		return similarity{}
	}
	if city != "" {
		if _, ok := choices[city]; ok {
			return similarity{active: true, score: 1}
		}
	}
	return similarity{active: true, score: 0}
}

func experienceSimilarity(want, got int32) similarity {
	if want <= 0 {
		return similarity{}
	}
	if got >= want {
		return similarity{active: true, score: 1}
	}
	return similarity{active: true, score: float64(got) / float64(want)}
}

// linearDecay 是搜尋引擎對數字欄位的計分方式：範圍內是 1，超出後每遠一年少 0.1，超過 10 年是 0。
func linearDecay(distance int32) float64 {
	if distance <= 0 {
		return 1
	}
	if distance >= ageDecayScale {
		return 0
	}
	return float64(ageDecayScale-distance) / float64(ageDecayScale)
}

func decadeSimilarity(age, era int32) similarity {
	if era <= 0 {
		return similarity{}
	}
	if age >= era && age < era+10 {
		return similarity{active: true, score: 1}
	}
	var distance int32
	if age < era {
		distance = era - age
	} else {
		distance = age - (era + 9)
	}
	return similarity{active: true, score: linearDecay(distance)}
}

func rangeSimilarity(value, minAge, maxAge int32) similarity {
	if minAge > 0 && maxAge > 0 && minAge > maxAge {
		minAge, maxAge = maxAge, minAge
	}
	if minAge <= 0 && maxAge <= 0 {
		return similarity{}
	}
	if minAge > 0 && value < minAge {
		return similarity{active: true, score: linearDecay(minAge - value)}
	}
	if maxAge > 0 && value > maxAge {
		return similarity{active: true, score: linearDecay(value - maxAge)}
	}
	return similarity{active: true, score: 1}
}

// weightedScore 把通過硬性篩選的人當成基礎分，再依每個 should 子句的權重加總。
// 完全符合是 100；有填條件但都不符時，仍保留篩選通過的基礎分，避免直接變成 0。
func weightedScore(clauses []boostClause) int {
	const filterWeight = 1.0
	weighted := filterWeight
	total := filterWeight
	used := false
	for _, clause := range clauses {
		if !clause.sim.active || clause.weight <= 0 {
			continue
		}
		used = true
		total += clause.weight
		weighted += clause.weight * clamp01(clause.sim.score)
	}
	if !used {
		return 100
	}
	return int(math.Round(weighted / total * 100))
}

// applyMutualBoost 參考交友配對常見的雙向分數：對方的條件也符合你時加到滿分，不符合則降低。
// 對方還沒設定尋找條件時，維持接近單向分數，不把人直接排除。
func applyMutualBoost(oneWay, their int, hasPref bool) int {
	if oneWay < 0 {
		oneWay = 0
	}
	if oneWay > 100 {
		oneWay = 100
	}
	factor := 0.85
	if hasPref {
		if their < 0 {
			their = 0
		}
		if their > 100 {
			their = 100
		}
		factor = 0.75 + 0.25*float64(their)/100
	}
	return int(math.Round(float64(oneWay) * factor))
}

func normalizeAgeRange(minAge, maxAge int32) (int32, int32) {
	if minAge > 0 && maxAge > 0 && minAge > maxAge {
		return maxAge, minAge
	}
	return minAge, maxAge
}

func buildSearchResult(ranked []rankedID) (ids []int32, rank string, length int32) {
	if len(ranked) == 0 {
		return []int32{}, "0%", 0
	}

	sort.SliceStable(ranked, func(i, j int) bool {
		if ranked[i].percent != ranked[j].percent {
			return ranked[i].percent > ranked[j].percent
		}
		return ranked[i].id < ranked[j].id
	})
	if len(ranked) > searchResultLimit {
		ranked = ranked[:searchResultLimit]
	}

	ids = make([]int32, len(ranked))
	for i, item := range ranked {
		ids[i] = item.id
	}
	return ids, fmt.Sprintf("%d%%", ranked[0].percent), int32(len(ids))
}

func scoreHobby(candidate info.HobbyCandidate, pref info.Hobby, me searcherProfile) int {
	oneWay := weightedScore([]boostClause{
		{weight: 1, sim: experienceSimilarity(pref.Experience, candidate.Experience)},
		{weight: 2, sim: jaccardSimilarity(pref.Speaklanguage, candidate.Speaklanguage)},
		{weight: 2, sim: citySimilarity(pref.City, candidate.City)},
		{weight: 2, sim: decadeSimilarity(candidate.Age, pref.Era)},
		{weight: 2, sim: exactSimilarity(pref.Gender, candidate.Gender)},
	})
	their := weightedScore([]boostClause{
		{weight: 2, sim: exactSimilarity(candidate.WantType, me.HobbyType)},
		{weight: 1, sim: experienceSimilarity(candidate.WantExperience, me.Experience)},
		{weight: 2, sim: jaccardSimilarity(candidate.WantSpeaklanguage, me.Speaklanguage)},
		{weight: 2, sim: citySimilarity(candidate.WantCity, me.City)},
		{weight: 2, sim: decadeSimilarity(me.Age, candidate.WantEra)},
		{weight: 2, sim: exactSimilarity(candidate.WantGender, me.Gender)},
	})
	return applyMutualBoost(oneWay, their, candidate.HasPref)
}

func scoreLover(candidate info.LoverCandidate, pref info.Lover, me searcherProfile) int {
	oneWay := weightedScore([]boostClause{
		{weight: 3, sim: rangeSimilarity(candidate.Age, pref.MinAge, pref.MaxAge)},
		{weight: 2, sim: exactSimilarity(pref.Sexual, candidate.Sexual)},
		{weight: 2, sim: jaccardSimilarity(pref.Speaklanguage, candidate.Speaklanguage)},
		{weight: 2, sim: citySimilarity(pref.City, candidate.City)},
	})
	their := weightedScore([]boostClause{
		{weight: 3, sim: rangeSimilarity(me.Age, candidate.WantMinAge, candidate.WantMaxAge)},
		{weight: 2, sim: exactSimilarity(candidate.WantGender, me.Gender)},
		{weight: 2, sim: exactSimilarity(candidate.WantSexual, me.Sexual)},
		{weight: 2, sim: jaccardSimilarity(candidate.WantSpeaklanguage, me.Speaklanguage)},
		{weight: 2, sim: citySimilarity(candidate.WantCity, me.City)},
	})
	return applyMutualBoost(oneWay, their, candidate.HasPref)
}

func scoreAccompany(candidate info.AccompanyCandidate, pref info.Accompany, me searcherProfile) int {
	oneWay := weightedScore([]boostClause{
		{weight: 2, sim: exactSimilarity(pref.Sociability, candidate.Sociability)},
		{weight: 2, sim: jaccardSimilarity(pref.Speaklanguage, candidate.Speaklanguage)},
		{weight: 3, sim: decadeSimilarity(candidate.Age, pref.Era)},
	})
	their := weightedScore([]boostClause{
		{weight: 2, sim: exactSimilarity(candidate.WantType, me.AccompanyType)},
		{weight: 2, sim: exactSimilarity(candidate.WantSociability, me.Sociability)},
		{weight: 2, sim: jaccardSimilarity(candidate.WantSpeaklanguage, me.Speaklanguage)},
		{weight: 3, sim: decadeSimilarity(me.Age, candidate.WantEra)},
	})
	return applyMutualBoost(oneWay, their, candidate.HasPref)
}
