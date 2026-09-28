package gapi

import (
	info "Backend/db/sqlc/info"
	"strings"
	"testing"
)

func TestJaccardGivesPartialCredit(t *testing.T) {
	full := jaccardSimilarity([]string{"日本語", "英語"}, []string{"英語", "日本語"})
	half := jaccardSimilarity([]string{"日本語", "英語"}, []string{"日本語"})
	none := jaccardSimilarity([]string{"日本語"}, []string{"英語"})
	skipped := jaccardSimilarity(nil, []string{"日本語"})

	if full.score != 1 || half.score != 0.5 || none.score != 0 {
		t.Fatalf("jaccard = %v, %v, %v", full.score, half.score, none.score)
	}
	if skipped.active {
		t.Fatal("empty preference should be skipped")
	}
}

func TestDecadeDecayKeepsNearbyAges(t *testing.T) {
	inside := decadeSimilarity(25, 20)
	near := decadeSimilarity(32, 20)
	far := decadeSimilarity(45, 20)
	if inside.score != 1 {
		t.Fatalf("inside decade = %v, want 1", inside.score)
	}
	if near.score <= 0 || near.score >= 1 {
		t.Fatalf("nearby age = %v, want a partial score", near.score)
	}
	if far.score != 0 {
		t.Fatalf("far age = %v, want 0", far.score)
	}
	if decadeSimilarity(25, 0).active {
		t.Fatal("unset era should be skipped")
	}
}

func TestLoverAgeOutsideRangeScoresBelowInside(t *testing.T) {
	pref := info.Lover{
		MinAge: 20, MaxAge: 30, City: []string{"京都"}, Gender: "女性", Sexual: "女性",
		Speaklanguage: []string{"日本語"},
	}
	me := searcherProfile{Age: 22, Gender: "男性", City: "京都", Sexual: "男性", Speaklanguage: []string{"日本語"}}
	inside := info.LoverCandidate{
		UserID: 1, City: "京都", Sexual: "女性", Speaklanguage: []string{"日本語"}, Age: 28, Gender: "女性",
	}
	nearby := inside
	nearby.UserID = 2
	nearby.Age = 33
	if scoreLover(inside, pref, me) <= scoreLover(nearby, pref, me) {
		t.Fatal("age inside the requested range should rank above a nearby age")
	}
	if scoreLover(nearby, pref, me) == 0 {
		t.Fatal("an age just outside the range should still receive a score")
	}
}

func TestScoreHobbyRanksFullMatchFirst(t *testing.T) {
	pref := info.Hobby{
		Era:           20,
		City:          []string{"東京", "大阪"},
		Gender:        "女性",
		Speaklanguage: []string{"日本語", "英語"},
		FindType:      "音楽",
		Experience:    1,
	}
	me := searcherProfile{Age: 24, Gender: "男性", City: "東京", Speaklanguage: []string{"日本語", "英語"}, HobbyType: "音楽", Experience: 3}
	full := info.HobbyCandidate{
		UserID: 2, City: "大阪", Speaklanguage: []string{"日本語", "英語"}, HobbyType: "音楽", Experience: 2,
		Age: 25, Gender: "女性", HasPref: true, WantType: "音楽", WantEra: 20, WantCity: []string{"東京"},
		WantGender: "男性", WantSpeaklanguage: []string{"日本語", "英語"}, WantExperience: 1,
	}
	partial := info.HobbyCandidate{
		UserID: 3, City: "福岡", Speaklanguage: []string{"日本語"}, HobbyType: "音楽", Experience: 2,
		Age: 40, Gender: "男性",
	}

	if scoreHobby(full, pref, me) != 100 {
		t.Fatalf("full match = %d, want 100", scoreHobby(full, pref, me))
	}
	if scoreHobby(partial, pref, me) >= scoreHobby(full, pref, me) {
		t.Fatal("partial match should rank below a full match")
	}
	if scoreHobby(partial, pref, me) <= 0 {
		t.Fatal("partial overlap should still score above zero")
	}
}

func TestMutualPreferenceOutranksSameProfile(t *testing.T) {
	pref := info.Accompany{
		Era: 20, Speaklanguage: []string{"日本語"}, FindType: "一緒に活動", Sociability: "社交的",
	}
	me := searcherProfile{Age: 22, Speaklanguage: []string{"日本語"}, Sociability: "社交的", AccompanyType: "一緒に活動"}
	oneWay := info.AccompanyCandidate{
		UserID: 8, Speaklanguage: []string{"日本語"}, Sociability: "社交的", AccompanyType: "一緒に活動", Age: 24,
	}
	mutual := oneWay
	mutual.UserID = 9
	mutual.HasPref = true
	mutual.WantType = "一緒に活動"
	mutual.WantSociability = "社交的"
	mutual.WantEra = 20
	mutual.WantSpeaklanguage = []string{"日本語"}

	if scoreAccompany(mutual, pref, me) <= scoreAccompany(oneWay, pref, me) {
		t.Fatal("a candidate who is also looking for the searcher should rank higher")
	}
}

func TestScoreAccompanyKeepsLanguageMatchWithoutAge(t *testing.T) {
	pref := info.Accompany{
		Era: 20, Speaklanguage: []string{"日本語"}, FindType: "一緒に活動", Sociability: "社交的",
	}
	me := searcherProfile{Age: 22, Speaklanguage: []string{"日本語"}, Sociability: "社交的", AccompanyType: "一緒に活動"}
	withLanguage := info.AccompanyCandidate{
		UserID: 8, Speaklanguage: []string{"日本語"}, Sociability: "社交的", AccompanyType: "一緒に活動", Age: 45,
	}
	withoutLanguage := info.AccompanyCandidate{
		UserID: 9, Speaklanguage: []string{"英語"}, Sociability: "社交的", AccompanyType: "一緒に活動", Age: 45,
	}
	if scoreAccompany(withLanguage, pref, me) <= scoreAccompany(withoutLanguage, pref, me) {
		t.Fatal("language match without the age decade must still rank above no language match")
	}
}

func TestBuildSearchResultOrdersByPercent(t *testing.T) {
	ids, rank, length := buildSearchResult([]rankedID{
		{id: 4, percent: 50},
		{id: 2, percent: 100},
		{id: 9, percent: 100},
		{id: 3, percent: 75},
	})
	if rank != "2\n100%\n---\n9\n100%\n---\n3\n75%\n---\n4\n50%" || length != 4 {
		t.Fatalf("rank=%s len=%d", rank, length)
	}
	if ids[0] != 2 || ids[1] != 9 || ids[2] != 3 || ids[3] != 4 {
		t.Fatalf("order = %v, want [2 9 3 4]", ids)
	}

	emptyIDs, emptyRank, emptyLen := buildSearchResult(nil)
	if len(emptyIDs) != 0 || emptyRank != "0%" || emptyLen != 0 {
		t.Fatalf("empty result = %v %s %d", emptyIDs, emptyRank, emptyLen)
	}
}

func TestMatchRankIncludesStrongReasons(t *testing.T) {
	pref := info.Hobby{
		FindType: "音楽", Gender: "女性", Era: 20, Experience: 3,
		City: []string{"東京"}, Speaklanguage: []string{"日本語"},
	}
	me := searcherProfile{HobbyType: "音楽", Gender: "男性"}
	candidate := info.HobbyCandidate{
		HobbyType: "音楽", Gender: "女性", Age: 24, Experience: 5, City: "東京",
		Speaklanguage: []string{"日本語"}, WantType: "音楽", HasPref: true,
	}
	reasons := hobbyReasons(candidate, pref, me)
	if reasons[0] != "同じ趣味" {
		t.Fatalf("first reason = %s", reasons[0])
	}
	joined := strings.Join(reasons, "\n")
	for _, want := range []string{"同じ言語", "同じ都市", "年齢が近い", "希望の性別"} {
		if !strings.Contains(joined, want) && len(reasons) < 4 {
			t.Fatalf("missing %s in %v", want, reasons)
		}
	}
	rank := formatMatchRank(rankedID{percent: 80, reasons: reasons})
	if !strings.HasPrefix(rank, "80%\n") {
		t.Fatalf("rank = %s", rank)
	}
}

func TestEmptyLanguagePreferenceIsNotAMiss(t *testing.T) {
	pref := info.Hobby{Gender: "女性", FindType: "音楽"}
	me := searcherProfile{}
	candidate := info.HobbyCandidate{Gender: "女性", Speaklanguage: []string{"日本語"}}
	onlyGender := scoreHobby(candidate, pref, me)

	pref.Speaklanguage = []string{"英語"}
	missedLanguage := scoreHobby(candidate, pref, me)
	if missedLanguage >= onlyGender {
		t.Fatalf("missing a requested language should lower the score: %d >= %d", missedLanguage, onlyGender)
	}
}

func TestNormalizeAgeRange(t *testing.T) {
	minAge, maxAge := normalizeAgeRange(30, 20)
	if minAge != 20 || maxAge != 30 {
		t.Fatalf("swapped range = %d-%d, want 20-30", minAge, maxAge)
	}
}
