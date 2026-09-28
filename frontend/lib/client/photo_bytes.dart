import 'dart:typed_data';

import 'package:image/image.dart' as image_codec;

const photoMaxEdge = 1024;
const photoQuality = 80;

List<int> compressPhoto(List<int> bytes) {
  if (bytes.isEmpty) return bytes;
  final decoded = image_codec.decodeImage(Uint8List.fromList(bytes));
  if (decoded == null) return bytes;
  var picture = decoded;
  final longest = picture.width > picture.height ? picture.width : picture.height;
  if (longest > photoMaxEdge) {
    if (picture.width >= picture.height) {
      picture = image_codec.copyResize(picture, width: photoMaxEdge);
    } else {
      picture = image_codec.copyResize(picture, height: photoMaxEdge);
    }
  }
  return image_codec.encodeJpg(picture, quality: photoQuality);
}
