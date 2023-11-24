package util

import (
	"math/rand"

	"github.com/sethvargo/go-password/password"
)

func RandomGender() string {
	r := rand.Intn(2)
	Gender := []string{"Male", "Female"}
	a := Gender[r]
	return a
}
func RandomBlood() string {
	r := rand.Intn(4)
	Gender := []string{"A", "B", "AB", "O"}
	a := Gender[r]
	return a
}

func RandomConstellation(M, D int) string {
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
		"Climbing",
		"Photography",
		"Gardening",
		"Cooking",
		"Traveling",
		"Writing",
	}

	return hobbies[rand.Intn(len(hobbies))]
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
