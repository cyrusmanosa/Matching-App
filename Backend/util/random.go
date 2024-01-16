package util

import (
	"fmt"
	"math/rand"
	"strings"
	"time"

	"github.com/sethvargo/go-password/password"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"
const charset = alphabet + "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

var seededRand *rand.Rand = rand.New(rand.NewSource(time.Now().UnixNano()))

func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)
	for i := 0; i < n; i++ {
		c := alphabet[seededRand.Intn(k)]
		sb.WriteByte(c)
	}
	return sb.String()
}

func RandomRole() string {
	roles := []string{"sender", "receiver"}
	r := seededRand.Intn(2)
	return roles[r]
}

func RandomBlood() string {
	r := seededRand.Intn(4)
	bloodTypes := []string{"A", "B", "AB", "O"}
	return bloodTypes[r]
}

func SwitchConstellation(M, D int) string {
	switch M {
	case 1:
		if D < 20 {
			return "山羊座"
		} else {
			return "水瓶座"
		}
	case 2:
		if D < 19 {
			return "水瓶座"
		} else {
			return "魚座"
		}
	case 3:
		if D < 21 {
			return "魚座"
		} else {
			return "牡羊座"
		}
	case 4:
		if D < 20 {
			return "牡羊座"
		} else {
			return "牡牛座"
		}
	case 5:
		if D < 21 {
			return "牡牛座"
		} else {
			return "双子座"
		}
	case 6:
		if D < 21 {
			return "双子座"
		} else {
			return "蟹座"
		}
	case 7:
		if D < 23 {
			return "蟹座"
		} else {
			return "獅子座"
		}
	case 8:
		if D < 23 {
			return "獅子座"
		} else {
			return "乙女座"
		}
	case 9:
		if D < 23 {
			return "乙女座"
		} else {
			return "天秤座"
		}
	case 10:
		if D < 24 {
			return "天秤座"
		} else {
			return "蠍座"
		}
	case 11:
		if D < 23 {
			return "蠍座"
		} else {
			return "射手座"
		}
	case 12:
		if D < 22 {
			return "射手座"
		} else {
			return "山羊座"
		}
	default:
		return "無効な月"
	}
}

func RandomPassword(len int) string {
	pd, _ := password.Generate(len, 10, 10, false, false)
	return pd
}

func RandomEra() int32 {
	return (seededRand.Int31n(9) + 1) * 10
}

func RandomHobbyType() string {
	hobbies := []string{
		"スポーツとアウトドア活動",
		"芸術と創造性",
		"コレクションとクラフト",
		"音楽とパフォーマンス",
		"読書と書き物",
		"料理とベーキング",
		"健康とフィットネス",
		"ビデオゲーム",
		"旅行と冒険",
	}
	randomHobby := hobbies[seededRand.Intn(len(hobbies))]
	var H string
	switch randomHobby {
	case "スポーツとアウトドア活動":
		sports := []string{"バスケットボール", "フットボール", "テニス", "ゴルフ", "スイミング", "ランニング", "スキー", "ハイキング", "キャンプ", "釣り"}
		H = sports[seededRand.Intn(len(sports))]
	}
	return H
}

func RandomAccompanimentType() string {
	actions := []string{
		"聞き入る",
		"一緒に活動する",
		"励ます",
		"サポートする",
		"助けを求める",
	}
	return actions[seededRand.Intn(len(actions))]
}

func RandomSociability() string {
	socialPersonalities := []string{
		"社交的な人",
		"内向的でシャイ",
		"社交不安",
		"少人数派",
		"独立心の強い人",
	}
	return socialPersonalities[seededRand.Intn(len(socialPersonalities))]
}

func RandomSexual() string {
	genders := []string{
		"男性",
		"女性",
		"非バイナリー",
		"トランスジェンダー",
		"インターセックス",
	}
	return genders[seededRand.Intn(len(genders))]
}

func RandomEducation() string {
	educationLevels := []string{
		"小学校",
		"中学校",
		"高校",
		"専門学校",
		"準学士",
		"学士",
		"修士",
		"博士",
	}
	return educationLevels[seededRand.Intn(len(educationLevels))]
}

func RandomReligious() string {
	religions := []string{
		"キリスト教",
		"イスラム教",
		"仏教",
		"ヒンドゥー教",
		"ユダヤ教",
		"道教",
		"シク教",
		"カトリック教",
		"プロテスタント教",
		"儒教",
	}
	return religions[seededRand.Intn(len(religions))]
}

func RandomCheckCode() string {
	b := make([]byte, 8)
	for i := range b {
		b[i] = charset[seededRand.Intn(len(charset))]
	}
	return string(b)
}

func BirthStringToInt(Bday string) (map[string]int, error) {
	BirthInt := map[string]int{
		"year":  0,
		"month": 0,
		"day":   0,
	}

	date, err := time.Parse("2006-01-02", Bday)
	if err != nil {
		fmt.Println("日付の解析エラー:", err)
		return nil, err
	}

	BirthInt["year"] = date.Year()
	BirthInt["month"] = int(date.Month())
	BirthInt["day"] = date.Day()

	return BirthInt, nil
}

func SwitchAge(Y, M, D int) int32 {
	currentDate := time.Now()
	currentYear := currentDate.Year()
	currentMonth := int(currentDate.Month())
	currentDay := currentDate.Day()

	age := int32(currentYear - Y)

	if currentMonth < M || (currentMonth == M && currentDay < D) {
		age--
	}

	return age
}

func RandomTT() string {
	t := []string{"趣味", "恋人", "お相伴"}
	r := seededRand.Intn(3)

	return t[r]
}
