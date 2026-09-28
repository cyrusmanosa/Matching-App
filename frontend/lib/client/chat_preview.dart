import 'dart:convert';

String chatPreview(String mediaType, List<int> media) {
  if (mediaType == 'image') {
    return '写真';
  }
  if (media.isEmpty) {
    return '';
  }
  return utf8.decode(media, allowMalformed: true);
}
