package api

import (
	"fmt"
	"net/smtp"
)

func sendMailSimple(subject, body string, to []string) {
	auth := smtp.PlainAuth("", "studiocmkc0110@gmail.com", "iodvpvmlyvadnhfb", "smtp.gmail.com")
	msg := "Subject: " + subject + "\n" + body
	err := smtp.SendMail("smtp.gmail.com:587", auth, "studiocmkc0110@gmail.com", to, []byte(msg))
	if err != nil {
		fmt.Println(err)
	}
}

// example
// func main() {
// 	sendMailSimple(
// 		"Another subject123",
// 		"Another body",
// 		[]string{"studiocmkc0110@gmail.com"},
// 	)
// }
