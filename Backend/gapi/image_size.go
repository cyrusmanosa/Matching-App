package gapi

import (
	"bytes"
	"errors"
	"image"
	_ "image/gif"
	"image/jpeg"
	_ "image/png"
)

const (
	photoMaxEdge  = 1024
	photoQuality  = 80
	photoKeepSize = 400 * 1024
	photoMaxRaw   = 2 << 20
)

func compressPhoto(raw []byte) ([]byte, error) {
	if len(raw) == 0 {
		return raw, nil
	}
	img, format, err := image.Decode(bytes.NewReader(raw))
	if err != nil {
		if len(raw) > photoMaxRaw {
			return nil, errors.New("image is too large")
		}
		return raw, nil
	}
	bounds := img.Bounds()
	width, height := bounds.Dx(), bounds.Dy()
	if format == "jpeg" && width <= photoMaxEdge && height <= photoMaxEdge && len(raw) <= photoKeepSize {
		return raw, nil
	}
	dstW, dstH := fitEdge(width, height, photoMaxEdge)
	if dstW != width || dstH != height {
		img = scaleNearest(img, dstW, dstH)
	}
	var buf bytes.Buffer
	if err = jpeg.Encode(&buf, img, &jpeg.Options{Quality: photoQuality}); err != nil {
		return nil, err
	}
	return buf.Bytes(), nil
}

func fitEdge(width, height, maxEdge int) (int, int) {
	if width <= maxEdge && height <= maxEdge {
		return width, height
	}
	if width >= height {
		nextH := height * maxEdge / width
		if nextH < 1 {
			nextH = 1
		}
		return maxEdge, nextH
	}
	nextW := width * maxEdge / height
	if nextW < 1 {
		nextW = 1
	}
	return nextW, maxEdge
}

func scaleNearest(src image.Image, dstW, dstH int) *image.RGBA {
	dst := image.NewRGBA(image.Rect(0, 0, dstW, dstH))
	bounds := src.Bounds()
	srcW, srcH := bounds.Dx(), bounds.Dy()
	for y := 0; y < dstH; y++ {
		sy := bounds.Min.Y + y*srcH/dstH
		for x := 0; x < dstW; x++ {
			sx := bounds.Min.X + x*srcW/dstW
			dst.Set(x, y, src.At(sx, sy))
		}
	}
	return dst
}
