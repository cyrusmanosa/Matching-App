import 'package:dating_your_date/client/login_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('接受正常郵件地址', () {
    expect(emailIsValid('cyrus@example.com'), isTrue);
  });

  test('拒絕沒有網域的郵件地址', () {
    expect(emailIsValid('cyrus'), isFalse);
    expect(emailIsValid('cyrus@'), isFalse);
  });

  test('SNS 密碼標記帶著服務名稱', () {
    expect(snsPassword('google'), 'sns:google');
    expect(snsPassword('facebook'), 'sns:facebook');
  });

  test('新註冊的 session 可以取出確認碼', () {
    expect(isSignupSession('signup:abc'), isTrue);
    expect(signupCodeFromSession('signup:abc'), 'abc');
    expect(isSignupSession('1b3f0c2e-1111-2222-3333-444455556666'), isFalse);
  });
}
