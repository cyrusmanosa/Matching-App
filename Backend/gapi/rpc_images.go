package gapi

import (
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (server *Server) CreateImages(ctx context.Context, req *pb.CreateImagesRequest) (*pb.CreateImagesResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	img1, err := compressPhoto(req.GetImg1())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img2, err := compressPhoto(req.GetImg2())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img3, err := compressPhoto(req.GetImg3())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img4, err := compressPhoto(req.GetImg4())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img5, err := compressPhoto(req.GetImg5())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}

	img := info.CreateImageParams{
		UserID: token.UserID,
		Img1:   img1,
		Img2:   img2,
		Img3:   img3,
		Img4:   img4,
		Img5:   img5,
	}

	images, err := server.infoStore.CreateImage(ctx, img)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.CreateImagesResponse{
		Img: convertImages(images),
	}
	return rsp, nil
}

func (server *Server) GetImages(ctx context.Context, req *pb.GetImagesRequest) (*pb.GetImagesResponse, error) {
	session, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}
	if err = server.canReadUser(ctx, session, req.GetUserID()); err != nil {
		return nil, err
	}

	images, err := server.infoStore.GetUserimageData(ctx, req.GetUserID())
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input image: %s", err)
	}

	rsp := &pb.GetImagesResponse{
		Img: convertImages(images),
	}
	return rsp, nil
}

func (server *Server) UpdateImages(ctx context.Context, req *pb.UpdateImagesRequest) (*pb.UpdateImagesResponse, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	img1, err := compressPhoto(req.GetImg1())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img2, err := compressPhoto(req.GetImg2())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img3, err := compressPhoto(req.GetImg3())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img4, err := compressPhoto(req.GetImg4())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}
	img5, err := compressPhoto(req.GetImg5())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "image is too large")
	}

	img := info.UpdateImageParams{
		UserID: token.UserID,
		Img1:   img1,
		Img2:   img2,
		Img3:   img3,
		Img4:   img4,
		Img5:   img5,
	}

	images, err := server.infoStore.UpdateImage(ctx, img)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateImagesResponse{
		Img: convertImages(images),
	}
	return rsp, nil
}
func (server *Server) DeleteImages(ctx context.Context, req *pb.DeleteImagesRequest) (*emptypb.Empty, error) {
	token, err := server.userFromSession(ctx, req.GetSessionID())
	if err != nil {
		return nil, err
	}

	err = server.infoStore.DeleteImage(ctx, token.UserID)
	if err != nil {
		if missingRecord(err) {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	return &emptypb.Empty{}, nil
}
