package util

import (
	"fmt"
	"net/smtp"
)

func SendValidateCodeOnEmail(RequestCode string, to []string) bool {
	auth := smtp.PlainAuth("", "studiocmkc0110@gmail.com", "iodvpvmlyvadnhfb", "smtp.gmail.com")
	subject := "Verification Code Email for Dating Date"
	body := `<html>
	<body>
		<h2>Dear User,</竹>
		<h3>Thank you for registering with Dating Date, our dating and social platform! To ensure the security of your account, we are sending you a verification code. Please use the following code to complete the verification process:</h3>
		<br>
		<h3>Verification Code:  ` + RequestCode + `  </h3>
		<br>
		<h3>Please enter this code in the designated field on our website or application within the next 5 minutes to complete your account verification. If you did not initiate this request or have any concerns, please contact our support team immediately.</h3>
		<h3>Thank you for your cooperation.</h3>
		<br>
		<h2>Best regards,</h2>
		<h2>The Dating Date Team</h2>
	</body>
	</html>`

	msg := "Subject: " + subject + "\n" +
		"Content-Type: text/html; charset=utf-8\n\n" +
		body

	err := smtp.SendMail("smtp.gmail.com:587", auth, "studiocmkc0110@gmail.com", to, []byte(msg))
	if err != nil {
		fmt.Println(err)
		return false
	}
	return true
}
