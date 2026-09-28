package util

import (
	"fmt"
	"net/smtp"
)

type SMTPConfig struct {
	Host     string
	Port     string
	Username string
	Password string
	From     string
}

func (config Config) SMTP() SMTPConfig {
	return SMTPConfig{
		Host:     config.SMTPHost,
		Port:     config.SMTPPort,
		Username: config.SMTPUsername,
		Password: config.SMTPPassword,
		From:     config.SMTPFrom,
	}
}

func (smtpConfig SMTPConfig) send(to []string, subject, body string) bool {
	if smtpConfig.Host == "" || smtpConfig.Username == "" || smtpConfig.Password == "" {
		fmt.Println("smtp is not configured")
		return false
	}
	from := smtpConfig.From
	if from == "" {
		from = smtpConfig.Username
	}
	auth := smtp.PlainAuth("", smtpConfig.Username, smtpConfig.Password, smtpConfig.Host)
	msg := "Subject: " + subject + "\n" +
		"Content-Type: text/html; charset=utf-8\n\n" +
		body
	err := smtp.SendMail(smtpConfig.Host+":"+smtpConfig.Port, auth, from, to, []byte(msg))
	if err != nil {
		fmt.Println(err)
		return false
	}
	return true
}

func SendValidateCodeOnEmail(smtpConfig SMTPConfig, requestCode string, to []string) bool {
	subject := "「Dating Date」アカウント認証コードのメール"
	body := `<html>
	<body>
		<h2>会員の皆様</h2>
		<h3>出会い系ソーシャルプラットフォーム「Dating Date」にご登録いただき、誠にありがとうございます。
		アカウントのセキュリティを確保するため、確認コードをお送りいたします。</h3>
		<h3>確認コード： ` + requestCode + `  </h3>
		<h3>このコードは、ウェブサイトまたはアプリの指定された欄に、15分以内に入力してアカウント認証を完了してください。</h3>
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
	return smtpConfig.send(to, subject, body)
}
