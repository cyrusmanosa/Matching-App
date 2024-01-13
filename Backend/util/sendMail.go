package util

import (
	"fmt"
	"net/smtp"
)

func SendValidateCodeOnEmail(RequestCode string, to []string) bool {
	auth := smtp.PlainAuth("", "studiocmkc0110@gmail.com", "iodvpvmlyvadnhfb", "smtp.gmail.com")
	subject := "「Dating Date」アカウント認証コードのメール"
	body := `<html>
	<body>
		<h2>会員の皆様</h2>
		<h3>出会い系ソーシャルプラットフォーム「Dating Date」にご登録いただき、誠にありがとうございます。
		アカウントのセキュリティを確保するため、確認コードをお送りいたします。</h3>
		<h3>確認コード： ` + RequestCode + `  </h3>
		<h3>このコードは、ウェブサイトまたはアプリの指定された欄に、5分以内に入力してアカウント認証を完了してください。</h3>
		<h3>【重要】</h3>
		<ul>
		<li>このメールは、お客様がメールアドレスを登録されたために送信されています。心当たりのない場合は、すぐにサポートチームまでお問い合わせください。</li>
		<li>このコードを他人に教えないでください。Dating Dateの担当者がお客様にコードを尋ねることは絶対にありません。</li>
		</ul>
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
