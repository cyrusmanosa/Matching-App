import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'mocks/fake_backend.dart';

void main() {
  test('聊天列表把照片和文字都轉成預覽', () {
    final backend = FakeBackend();

    expect(backend.lastMessage(mediaType: 'image', media: [9, 9]), '写真');
    expect(backend.lastMessage(mediaType: 'text', media: utf8.encode('今夜空いてる？')), '今夜空いてる？');
    expect(backend.lastMessage(mediaType: 'text', media: []), '');
    expect(backend.calls, ['lastMessage:image', 'lastMessage:text', 'lastMessage:text']);
  });
}
