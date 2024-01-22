package util

import (
	"fmt"
	"net/smtp"
)

func SendResetPWEmail(Requestlink string, to []string) bool {
	auth := smtp.PlainAuth("", "studiocmkc0110@gmail.com", "iodvpvmlyvadnhfb", "smtp.gmail.com")
	subject := "「Dating Date」パスワードリセットのメール"
	body := `<html>
	<body>
		<h2>会員の皆様</h2>
		<h3>出会い系ソーシャルプラットフォーム「Dating Date」にご登録いただき、誠にありがとうございます。</h3>
		<h3>パスワードのリセットをご希望の場合、以下のリンクをクリックしてください。</h3>
		<a href="` + Requestlink + `">パスワードリセット</a>
		<h3>ご不明な点がございましたら、お気軽にサポートチームまでお問い合わせください。</h3>
		<br>
		<h2>敬具</h2>
		<h2>Dating Date チーム</h2>
		<p>※このメールは送信専用です。返信はしないでください。</p>
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
