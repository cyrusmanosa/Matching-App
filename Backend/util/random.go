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
	bloodTypes := []string{"A", "B", "AB", "O"}
	return bloodTypes[seededRand.Intn(4)]
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
	hobbies := []string{"運動", "アウトドア", "旅行", "語学", "音楽", "絵画", "彫刻", "手芸", "写真", "料理", "園芸", "読書", "映画鑑賞", "テレビ鑑賞", "ゲーム", "音楽鑑賞", "演劇"}
	return hobbies[seededRand.Intn(len(hobbies))]
}

func RandomAccompantType() string {
	actions := []string{"聞き入る", "一緒に活動", "励ます", "サポート", "助けを求める"}
	return actions[seededRand.Intn(len(actions))]
}

func RandomSociability() string {
	socialPersonalities := []string{
		"社交的",
		"内向的でシャイ",
		"社交不安",
		"少人数派",
		"独立心の強い人",
	}
	return socialPersonalities[seededRand.Intn(len(socialPersonalities))]
}

func RandomSexual() string {
	genders := []string{"男性", "女性", "その他"}
	return genders[seededRand.Intn(len(genders))]
}

func RandomJob() string {
	job := []string{"製造",
		"サービス",
		"IT",
		"金融",
		"医療",
		"教育",
		"公務員",
		"芸能",
		"スポーツ",
		"研究",
		"作家",
		"アーティスト",
		"広告",
		"デザイン",
		"芸術",
		"音楽",
		"映画・テレビ",
		"出版"}
	return job[seededRand.Intn(len(job))]
}

func RandomAddress(country string) string {
	address := map[string][]string{
		"インドネシア": {"ジャカルタ", "バンドン", "スラバヤ", "メダン", "ジョグジャカルタ", "バリ", "スンバワ"},
		"タイ":     {"バンコク", "チェンマイ", "プーケット", "パタヤ", "ソンクラー", "ピピ島"},
		"ベトナム":   {"ハノイ", "ホーチミン", "ダナン", "ハイフォン", "カントー", "ナムディン"},
		"マカオ":    {"澳門半島", "氹仔", "路環"},
		"マレーシア":  {"クアラルンプール", "ジョホールバル", "ペナン", "クチン"},
		"中国":     {"北京", "上海", "広州", "深圳", "成都", "天津", "重慶", "西安", "武漢", "杭州", "蘇州", "南京", "寧波", "青島", "廈門", "泉州", "福州", "長沙", "鄭州", "瀋陽", "大連", "長春", "哈爾濱", "南寧", "海口", "貴陽", "昆明", "呼和浩特", "石家莊", "太原", "西寧", "銀川", "烏魯木齊"},
		"日本":     {"東京", "大阪", "京都", "名古屋", "福岡", "横浜", "神戸", "奈良", "広島", "札幌", "仙台", "さいたま", "千葉", "神奈川", "新潟", "富山", "石川", "福井", "山梨", "長野", "岐阜", "静岡", "愛知", "三重", "滋賀", "兵庫", "和歌山", "鳥取", "島根", "岡山", "山口", "徳島", "香川", "愛媛", "高知", "佐賀", "長崎", "熊本", "大分", "宮崎", "鹿児島", "沖縄"},
		"韓国":     {"ソウル", "釜山", "大邱", "仁川", "光州", "済州島"},
		"香港":     {"香港島", "九龍", "新界"},
		"台湾":     {"タイペイ", "シンペイ", "タイチュン", "タイナン", "カオシュン", "キーロン", "トウエン", "チャンファ", "ミャオリ", "ナントウ", "ウンリン", "キャイチ", "タイトン", "ファーリエン", "イーラン"},
	}

	return address[country][seededRand.Intn(len(address[country]))]
}

func RandomCountry() string {
	country := []string{"日本", "香港", "マカオ", "中国", "インドネシア", "タイ", "韓国", "ベトナム", "マレーシア", "台湾"}
	return country[seededRand.Intn(len(country))]
}

func SwitchLanguage(country string) []string {
	var Language []string
	LanguageList := []string{"英語", "広東語", "日本語", "韓国語", "インドネシア語", "タイ語", "ベトナム語", "中国語", "閩南語"}

	switch country {
	case "日本":
		Language = []string{"日本語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "香港":
		Language = []string{"広東語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "マカオ":
		Language = []string{"広東語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "中国":
		Language = []string{"中国語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "インドネシア":
		Language = []string{"インドネシア語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "タイ":
		Language = []string{"タイ語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "韓国":
		Language = []string{"韓国語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "ベトナム":
		Language = []string{"ベトナム", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "マレーシア":
		Language = []string{"マレーシア", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	case "台湾":
		Language = []string{"中国語", "英語"}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans != Language[0] && ans != Language[1] {
				Language = append(Language, ans)
				break
			}
		}
	}
	return Language
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
	t := []string{"趣味", "恋人", "相伴"}
	r := seededRand.Intn(3)

	return t[r]
}

func RandomBool() bool {
	bo := []bool{true, false}
	return bo[rand.Intn(len(bo))]
}

func RandomMediaType() string {
	media := []string{"文字", "写真"}
	return media[rand.Intn(2)]
}

func RandomGender() string {
	gender := []string{"男性", "女性", "その他"}
	return gender[rand.Intn(len(gender))]
}
