import 'package:dating_your_date/client/session_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';

void main() {
  test('搜尋成功時顯示相符百分比', () {
    expect(matchReadyMessage('85%'), '新しいターゲットも準備しました（一致 85%）');
  });

  test('配對原因跟在百分比後面', () {
    expect(
      matchReadyMessage('82%\n同じ言語\n同じ都市'),
      '新しいターゲットも準備しました（一致 82%）\n・同じ言語\n・同じ都市',
    );
  });

  test('多人結果只顯示被選中的人', () {
    const rank = '2\n90%\n同じ趣味\n---\n9\n70%\n同じ言語';
    expect(matchReadyMessageFor(rank, 9), '新しいターゲットも準備しました（一致 70%）\n・同じ言語');
  });

  test('沒有分數時顯示 0%', () {
    expect(emptyMatchMessage(''), '新しい条件で合わせるパーセントは0%です。');
    expect(emptyMatchMessage('0%'), '新しい条件で合わせるパーセントは0%です。');
  });

  test('只有未登入錯誤會被當成 session 結束', () {
    expect(isUnauthenticated(GrpcError.custom(StatusCode.unauthenticated, 'session is closed')), isTrue);
    expect(isUnauthenticated(GrpcError.custom(StatusCode.permissionDenied, 'use password')), isFalse);
    expect(sessionEndedMessage.contains('もう一度ログインしてください'), isTrue);
  });
}
