package util

import (
	"fmt"
	"math/rand"
	"strings"
	"time"

	"github.com/sethvargo/go-password/password"
)

const charset = alphabet + "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
const alphabet = "abcdefghijklmnopqrstuvwxyz"

var seededRand *rand.Rand = rand.New(rand.NewSource(time.Now().UnixNano()))

func Randomstring(n int) string {
	var sb strings.Builder
	k := len(alphabet)
	for i := 0; i < n; i++ {
		c := alphabet[rand.Intn(k)]
		sb.WriteByte(c)
	}
	return sb.String()
}

func RandomRole() string {
	role := []string{"sender", "receiver"}
	r := rand.Intn(2)
	return role[r]
}

func RandomBlood() string {
	r := rand.Intn(4)
	Gender := []string{"A", "B", "AB", "O"}
	a := Gender[r]
	return a
}

func SwitchConstellation(M, D int) string {
	switch M {
	case 1:
		if D < 20 {
			return "Capricorn"
		} else {
			return "Aquarius"
		}
	case 2:
		if D < 19 {
			return "Aquarius"
		} else {
			return "Pisces"
		}
	case 3:
		if D < 21 {
			return "Pisces"
		} else {
			return "Aries"
		}
	case 4:
		if D < 20 {
			return "Aries"
		} else {
			return "Taurus"
		}
	case 5:
		if D < 21 {
			return "Taurus"
		} else {
			return "Gemini"
		}
	case 6:
		if D < 21 {
			return "Gemini"
		} else {
			return "Cancer"
		}
	case 7:
		if D < 23 {
			return "Cancer"
		} else {
			return "Leo"
		}
	case 8:
		if D < 23 {
			return "Leo"
		} else {
			return "Virgo"
		}
	case 9:
		if D < 23 {
			return "Virgo"
		} else {
			return "Libra"
		}
	case 10:
		if D < 24 {
			return "Libra"
		} else {
			return "Scorpio"
		}
	case 11:
		if D < 23 {
			return "Scorpio"
		} else {
			return "Sagittarius"
		}
	case 12:
		if D < 22 {
			return "Sagittarius"
		} else {
			return "Capricorn"
		}
	default:
		return "無效的月份"
	}
}

func RandomConstellation() string {
	M := rand.Intn(12) + 1
	D := rand.Intn(31) + 1
	switch M {
	case 1:
		if D < 20 {
			return "Capricorn"
		} else {
			return "Aquarius"
		}
	case 2:
		if D < 19 {
			return "Aquarius"
		} else {
			return "Pisces"
		}
	case 3:
		if D < 21 {
			return "Pisces"
		} else {
			return "Aries"
		}
	case 4:
		if D < 20 {
			return "Aries"
		} else {
			return "Taurus"
		}
	case 5:
		if D < 21 {
			return "Taurus"
		} else {
			return "Gemini"
		}
	case 6:
		if D < 21 {
			return "Gemini"
		} else {
			return "Cancer"
		}
	case 7:
		if D < 23 {
			return "Cancer"
		} else {
			return "Leo"
		}
	case 8:
		if D < 23 {
			return "Leo"
		} else {
			return "Virgo"
		}
	case 9:
		if D < 23 {
			return "Virgo"
		} else {
			return "Libra"
		}
	case 10:
		if D < 24 {
			return "Libra"
		} else {
			return "Scorpio"
		}
	case 11:
		if D < 23 {
			return "Scorpio"
		} else {
			return "Sagittarius"
		}
	case 12:
		if D < 22 {
			return "Sagittarius"
		} else {
			return "Capricorn"
		}
	default:
		return "無效的月份"
	}
}

func RandomPassword(len int) string {
	pd, _ := password.Generate(len, 10, 10, false, false)
	return pd
}

func RandomEra() int32 {
	return (rand.Int31n(9) + 1) * 10
}

func RandomHobbyType() string {
	hobbies := []string{
		"Sports and Outdoor Activities",
		"Arts and Creativity",
		"Collecting and Crafts",
		"Music and Performance",
		"Reading and Writing",
		"Cooking and Baking",
		"Health and Fitness",
		"Video Games",
		"Travel and Adventure",
	}
	randomHobby := hobbies[rand.Intn(len(hobbies))]
	var H string
	switch randomHobby {
	case "Sports and Outdoor Activities":
		sports := []string{"Basketball", "Football", "Tennis", "Golf", "Swimming", "Running", "Skiing", "Hiking", "Camping", "Fishing"}
		H = sports[rand.Intn(len(sports))]
	}
	return H
}

func RandomAccompantType() string {
	actions := []string{
		"Listen and understand",
		"Engage in activities together",
		"Encourage",
		"Support",
		"Seek help",
	}
	return actions[rand.Intn(len(actions))]
}

func RandomSociability() string {
	socialPersonalities := []string{
<<<<<<< HEAD
		"Social Butterfly",
		"Introverted and Shy",
		"Socially Anxious",
		"Small Group Lover",
		"Independent",
=======
		"社交的な人",
		"内向的でシャイ",
		"社交不安",
		"少人数派",
		"独立心の強い人",
>>>>>>> parent of f9b9b1f (delete bug)
	}
	return socialPersonalities[rand.Intn(len(socialPersonalities))]
}

func RandomSexual() string {
<<<<<<< HEAD
	var genders = []string{
		"Male",
		"Female",
		"Non-Binary",
		"Transgender",
		"Intersex",
	}
	return genders[rand.Intn(len(genders))]
=======
	genders := []string{
		"男性",
		"女性",
		"非バイナリー",
		"トランスジェンダー",
		"インターセックス",
	}
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
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "香港":
		Language = []string{"広東語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "マカオ":
		Language = []string{"広東語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "中国":
		Language = []string{"中国語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "インドネシア":
		Language = []string{"インドネシア語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "タイ":
		Language = []string{"タイ語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "韓国":
		Language = []string{"韓国語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "ベトナム":
		Language = []string{"ベトナム", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "マレーシア":
		Language = []string{"マレーシア", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	case "台湾":
		Language = []string{"中国語", "英語", LanguageList[rand.Intn(len(LanguageList))]}
		for i := 0; i < len(LanguageList); i++ {
			ans := LanguageList[rand.Intn(len(LanguageList))]
			if ans == Language[0] {
				continue
			} else {
				Language = append(Language, ans)
				break
			}
		}
	}
	return Language
>>>>>>> parent of f9b9b1f (delete bug)
}

func RandomEducation() string {
	var educationLevels = []string{
		"Primary Education",
		"Secondary Education",
		"High School Graduate",
		"Vocational School",
		"Associate's Degree",
		"Bachelor's Degree",
		"Master's Degree",
		"Doctoral Degree",
	}
	return educationLevels[rand.Intn(len(educationLevels))]
}

func RandomReligious() string {
	var religions = []string{
		"Christianity",
		"Islam",
		"Buddhism",
		"Hinduism",
		"Judaism",
		"Taoism",
		"Sikhism",
		"Catholicism",
		"Protestantism",
		"Confucianism",
	}
	return religions[rand.Intn(len(religions))]
}

func RandomCheckCode() string {
	b := make([]byte, 8)
	for i := range b {
		b[i] = charset[seededRand.Intn(len(charset))]
	}
	return string(b)
}

func BirthstringtoInt(Bday string) (map[string]int, error) {
	BirthInt := map[string]int{
		"year":  0,
		"month": 0,
		"day":   0,
	}

	date, err := time.Parse("2006-01-02", Bday)
	if err != nil {
		fmt.Println("日期解析錯誤:", err)
		return nil, err
	}

	BirthInt["year"] = int(date.Year())
	BirthInt["month"] = int(date.Month())
	BirthInt["day"] = int(date.Day())

	return BirthInt, nil
}

func SwitchAge(Y, M, D int) int32 {
	currentDate := time.Now()
	currentYear := currentDate.Year()
	currentMonth := int(currentDate.Month())
	currentDay := currentDate.Day()

	age := currentYear - Y

	if currentMonth < M || (currentMonth == M && currentDay < D) {
		age--
	}

	return int32(age)
}

func RandomTT() string {
<<<<<<< HEAD
	t := []string{"Hobby", "Lover", "Accompany"}
	r := rand.Intn(3)
=======
	t := []string{"趣味", "恋人", "お相伴"}
	r := seededRand.Intn(3)
>>>>>>> parent of f9b9b1f (delete bug)

	return t[r]
}
