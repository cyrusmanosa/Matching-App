package gapi

import (
	"sync"
	"time"
)

const signupTTL = 30 * time.Minute

type pendingSignup struct {
	Email    string
	Provider string
	Verified bool
	Expires  time.Time
}

var (
	signupMu      sync.Mutex
	pendingByCode = map[string]pendingSignup{}
)

func savePending(code, email, provider string, verified bool) {
	signupMu.Lock()
	defer signupMu.Unlock()
	now := time.Now()
	for key, item := range pendingByCode {
		if now.After(item.Expires) {
			delete(pendingByCode, key)
		}
	}
	pendingByCode[code] = pendingSignup{
		Email:    email,
		Provider: provider,
		Verified: verified,
		Expires:  now.Add(signupTTL),
	}
}

func verifyPending(code string) (pendingSignup, bool) {
	signupMu.Lock()
	defer signupMu.Unlock()
	item, ok := pendingByCode[code]
	if !ok || time.Now().After(item.Expires) {
		delete(pendingByCode, code)
		return pendingSignup{}, false
	}
	item.Verified = true
	pendingByCode[code] = item
	return item, true
}

func takeVerifiedSignup(code string) (pendingSignup, bool) {
	signupMu.Lock()
	defer signupMu.Unlock()
	item, ok := pendingByCode[code]
	if !ok || !item.Verified || time.Now().After(item.Expires) {
		return pendingSignup{}, false
	}
	delete(pendingByCode, code)
	return item, true
}
