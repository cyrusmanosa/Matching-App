package gapi

import (
	"context"
	"time"
)

const signupTTL = 15 * time.Minute

type pendingSignup struct {
	Email    string
	Provider string
	Verified bool
	Expires  time.Time
}

func (server *Server) savePending(ctx context.Context, code, email, provider string, verified bool) error {
	return server.infoStore.SavePendingSignup(ctx, code, email, provider, verified, time.Now().Add(signupTTL))
}

func (server *Server) verifyPending(ctx context.Context, code string) (pendingSignup, bool) {
	email, provider, _, expiresAt, err := server.infoStore.GetPendingSignup(ctx, code)
	if err != nil || time.Now().After(expiresAt) {
		_ = server.infoStore.DeletePendingSignup(ctx, code)
		return pendingSignup{}, false
	}
	if err = server.infoStore.MarkPendingSignupVerified(ctx, code); err != nil {
		return pendingSignup{}, false
	}
	return pendingSignup{Email: email, Provider: provider, Verified: true, Expires: expiresAt}, true
}

func (server *Server) takeVerifiedSignup(ctx context.Context, code string) (pendingSignup, bool) {
	email, provider, verified, expiresAt, err := server.infoStore.GetPendingSignup(ctx, code)
	if err != nil || !verified || time.Now().After(expiresAt) {
		return pendingSignup{}, false
	}
	if err = server.infoStore.DeletePendingSignup(ctx, code); err != nil {
		return pendingSignup{}, false
	}
	return pendingSignup{Email: email, Provider: provider, Verified: true, Expires: expiresAt}, true
}
