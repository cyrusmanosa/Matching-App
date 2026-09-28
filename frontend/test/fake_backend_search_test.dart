import 'package:dating_your_date/client/session_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/fake_backend.dart';

void main() {
  test('搜尋結果用 mock 回傳的百分比組成畫面文字', () {
    final backend = FakeBackend();
    final response = backend.searchHobby(rank: '72%', ids: [3, 9]);

    expect(response.resu.len, 2);
    expect(response.resu.resultID, [3, 9]);
    expect(matchReadyMessage(response.resu.rank), '新しいターゲットも準備しました（一致 72%）');
    expect(backend.calls, ['searchHobby']);
  });

  test('沒有搜尋結果時畫面顯示 0%', () {
    final backend = FakeBackend();
    final response = backend.searchHobby(rank: '', ids: []);

    expect(response.resu.len, 0);
    expect(emptyMatchMessage(response.resu.rank), '新しい条件で合わせるパーセントは0%です。');
  });
}
