import 'package:dating_your_date/client/match_reasons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('趣味相符時列出語言城市和年齡', () {
    final reasons = hobbyMatchReasons(
      theirHobby: '音楽',
      theirGender: '女性',
      theirCity: '東京',
      theirLanguages: ['日本語', '英語'],
      theirAge: 24,
      theirExperience: 5,
      findType: '音楽',
      wantGender: '女性',
      wantCities: ['東京'],
      wantLanguages: ['日本語'],
      wantEra: 20,
      wantExperience: 3,
    );

    expect(reasons.first, '同じ趣味');
    expect(reasons, contains('同じ言語'));
    expect(reasons, contains('同じ都市'));
    expect(reasons.length, lessThanOrEqualTo(4));
  });

  test('沒有重疊時不顯示原因', () {
    expect(
      loverMatchReasons(
        theirGender: '男性',
        theirSexual: '',
        theirCity: '大阪',
        theirLanguages: ['英語'],
        theirAge: 40,
        wantGender: '女性',
        wantSexual: '',
        wantCities: ['東京'],
        wantLanguages: ['日本語'],
        minAge: 20,
        maxAge: 25,
      ),
      isEmpty,
    );
  });
}
