package util

func SendResetPWEmail(smtpConfig SMTPConfig, requestLink string, to []string) bool {
	subject := "「Dating Date」パスワードリセットのメール"
	body := `<html>
	<body>
		<h2>会員の皆様</h2>
		<h3>出会い系ソーシャルプラットフォーム「Dating Date」にご登録いただき、誠にありがとうございます。</h3>
		<h3>パスワードのリセットをご希望の場合、以下のリンクをクリックしてください。</h3>
		<a href="` + requestLink + `">パスワードリセット</a>
		<h3>ご不明な点がございましたら、お気軽にサポートチームまでお問い合わせください。</h3>
		<br>
		<h2>敬具</h2>
		<h2>Dating Date チーム</h2>
		<p>※このメールは送信専用です。返信はしないでください。</p>
	</body>
	</html>`
	return smtpConfig.send(to, subject, body)
}
