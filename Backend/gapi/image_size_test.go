package gapi

import (
	"bytes"
	"image"
	"image/jpeg"
	"testing"
)

func TestCompressPhotoShrinksLargeJpeg(t *testing.T) {
	src := image.NewRGBA(image.Rect(0, 0, 2000, 1000))
	var buf bytes.Buffer
	if err := jpeg.Encode(&buf, src, &jpeg.Options{Quality: 95}); err != nil {
		t.Fatal(err)
	}
	out, err := compressPhoto(buf.Bytes())
	if err != nil {
		t.Fatal(err)
	}
	decoded, _, err := image.Decode(bytes.NewReader(out))
	if err != nil {
		t.Fatal(err)
	}
	if decoded.Bounds().Dx() > photoMaxEdge || decoded.Bounds().Dy() > photoMaxEdge {
		t.Fatalf("size = %v", decoded.Bounds())
	}
}

func TestCompressPhotoKeepsSmallJpeg(t *testing.T) {
	src := image.NewRGBA(image.Rect(0, 0, 20, 10))
	var buf bytes.Buffer
	if err := jpeg.Encode(&buf, src, &jpeg.Options{Quality: 80}); err != nil {
		t.Fatal(err)
	}
	out, err := compressPhoto(buf.Bytes())
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(out, buf.Bytes()) {
		t.Fatal("small jpeg should be stored as uploaded")
	}
}

func TestCompressPhotoRejectsHugeUnknownBytes(t *testing.T) {
	raw := bytes.Repeat([]byte{1}, photoMaxRaw+1)
	if _, err := compressPhoto(raw); err == nil {
		t.Fatal("expected oversized image to be rejected")
	}
}
