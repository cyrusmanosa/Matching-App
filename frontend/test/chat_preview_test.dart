import 'dart:convert';

import 'package:dating_your_date/client/chat_preview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('照片訊息顯示為写真', () {
    expect(chatPreview('image', [1, 2, 3]), '写真');
  });

  test('文字訊息解出原文', () {
    expect(chatPreview('text', utf8.encode('こんにちは')), 'こんにちは');
  });

  test('沒有內容時是空字串', () {
    expect(chatPreview('text', []), '');
  });
}
