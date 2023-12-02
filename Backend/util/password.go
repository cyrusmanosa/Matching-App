package util

import (
	"fmt"

	"golang.org/x/crypto/bcrypt"
)

func HashPassword(password string) (string, error) {
	HashPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)

	if err != nil {
		return "", fmt.Errorf("failed to hash password: %w", err)
	}
	return string(HashPassword), nil
}

func CheckPassword(password, HashPassword string) error {
	return bcrypt.CompareHashAndPassword([]byte(HashPassword), []byte(password))
}
