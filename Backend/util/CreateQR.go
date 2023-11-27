package util

import (
	"github.com/skip2/go-qrcode"
)

func CreateQR(name string, url string) (string, error) {
	qrCode, err := qrcode.New(url, qrcode.Highest)
	if err != nil {
		return "", err
	}

	filename := "../images/Qr/" + name + ".png"
	err = qrCode.WriteFile(256, filename)
	if err != nil {
		return "", err
	}

	return filename, nil
}
