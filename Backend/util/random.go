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
		"Social Butterfly",
		"Introverted and Shy",
		"Socially Anxious",
		"Small Group Lover",
		"Independent",
	}
	return socialPersonalities[rand.Intn(len(socialPersonalities))]
}

func RandomSexual() string {
	var genders = []string{
		"Male",
		"Female",
		"Non-Binary",
		"Transgender",
		"Intersex",
	}
	return genders[rand.Intn(len(genders))]
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
