// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.24.0

package db

import (
	"context"
)

type Querier interface {
	AllChangeTargetUserList(ctx context.Context) ([]Changetargetuser, error)
	AllComplaintList(ctx context.Context) ([]Complaint, error)
	AllTargetUserList(ctx context.Context) ([]Targetlist, error)
	CreateAccompanyRequest(ctx context.Context, arg CreateAccompanyRequestParams) (Accompanyrequest, error)
	CreateChangeTargetUser(ctx context.Context, arg CreateChangeTargetUserParams) (Changetargetuser, error)
	CreateComplaint(ctx context.Context, arg CreateComplaintParams) (Complaint, error)
	CreateHobbyRequest(ctx context.Context, arg CreateHobbyRequestParams) (Hobbyrequest, error)
	CreateImage(ctx context.Context, arg CreateImageParams) (Image, error)
	CreateLoverRequest(ctx context.Context, arg CreateLoverRequestParams) (Loverrequest, error)
	CreateUserCanChangeInformation(ctx context.Context, arg CreateUserCanChangeInformationParams) (Canchangeinformation, error)
	CreateUserFixInformation(ctx context.Context, arg CreateUserFixInformationParams) (Fixinformation, error)
	DeleteComplaint(ctx context.Context, userID int32) error
	DeleteData(ctx context.Context, userID int32) error
	DeleteImage(ctx context.Context, userID int32) error
	DeleteInformation(ctx context.Context, userID int32) error
	DeleteTargetList(ctx context.Context, userID int32) error
	DeleteUser(ctx context.Context, userID int32) error
	DeleteUserAccompany(ctx context.Context, userID int32) error
	DeleteUserHobby(ctx context.Context, userID int32) error
	DeleteUserLoverRequest(ctx context.Context, userID int32) error
	GetChangeTargetUserList(ctx context.Context, userID int32) (Changetargetuser, error)
	GetTargetUserList(ctx context.Context, userID int32) (Targetlist, error)
	GetUserAccompany(ctx context.Context, userID int32) (Accompanyrequest, error)
	GetUserCanChangeInformation(ctx context.Context, userID int32) (Canchangeinformation, error)
	GetUserComplaintList(ctx context.Context, userID int32) (Complaint, error)
	GetUserFixInformation(ctx context.Context, userID int32) (Fixinformation, error)
	GetUserHobby(ctx context.Context, userID int32) (Hobbyrequest, error)
	GetUserLover(ctx context.Context, userID int32) (Loverrequest, error)
	GetUserimageData(ctx context.Context, userID int32) (Image, error)
	ListFixInformaion(ctx context.Context) ([]Fixinformation, error)
	ListUserAccompany(ctx context.Context) ([]Accompanyrequest, error)
	ListUserFixInformaion(ctx context.Context) ([]Canchangeinformation, error)
	ListUserHobby(ctx context.Context) ([]Hobbyrequest, error)
	ListUserLover(ctx context.Context) ([]Loverrequest, error)
	ListimagesList(ctx context.Context) ([]Image, error)
	TargetUserList(ctx context.Context, arg TargetUserListParams) (Targetlist, error)
	UpdateImage(ctx context.Context, arg UpdateImageParams) (Image, error)
	UpdateInformation(ctx context.Context, arg UpdateInformationParams) (Canchangeinformation, error)
	UpdatePassword(ctx context.Context, arg UpdatePasswordParams) (Fixinformation, error)
	UpdateTargetList(ctx context.Context, arg UpdateTargetListParams) (Targetlist, error)
	UpdateUserAccompany(ctx context.Context, arg UpdateUserAccompanyParams) (Accompanyrequest, error)
	UpdateUserHobby(ctx context.Context, arg UpdateUserHobbyParams) (Hobbyrequest, error)
	UpdateUserLover(ctx context.Context, arg UpdateUserLoverParams) (Loverrequest, error)
}

var _ Querier = (*Queries)(nil)
