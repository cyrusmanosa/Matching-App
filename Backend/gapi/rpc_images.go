package gapi

import (
	db "Backend/db/sqlc"
	info "Backend/db/sqlc/info"
	"Backend/pb"
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateImages(ctx context.Context, req *pb.CreateImagesRequest) (*pb.CreateImagesResponse, error) {
	img := info.CreateImageParams{
		UserID: req.GetUserID(),
		Qr:     req.GetQr(),
		Img1:   req.GetImg1(),
		Img2:   req.GetImg2(),
		Img3:   req.GetImg3(),
		Img4:   req.GetImg4(),
		Img5:   req.GetImg5(),
	}

	images, err := server.store.CreateImage(ctx, img)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
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

	images, err := server.store.GetUserimageData(ctx, req.GetUserID())
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.GetImagesResponse{
		Img: convertImages(images),
	}
	return rsp, nil
}

func (server *Server) UpdateImages(ctx context.Context, req *pb.UpdateImagesRequest) (*pb.UpdateImagesResponse, error) {
	img := info.UpdateImageParams{
		UserID: req.GetUserID(),
		Img1:   req.GetImg1(),
		Img2:   req.GetImg2(),
		Img3:   req.GetImg3(),
		Img4:   req.GetImg4(),
		Img5:   req.GetImg5(),
	}

	images, err := server.store.UpdateImage(ctx, img)
	if err != nil {
		errCode := db.ErrorCode(err)
		if errCode == db.ForeignKeyViolation || errCode == db.UniqueViolation {
			return nil, status.Errorf(codes.NotFound, "user not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to input UserID: %s", err)
	}

	rsp := &pb.UpdateImagesResponse{
		Img: convertImages(images),
	}
	return rsp, nil
}
