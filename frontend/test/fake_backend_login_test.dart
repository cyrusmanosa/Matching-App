import 'package:dating_your_date/client/login_rules.dart';
import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';

import 'mocks/fake_backend.dart';

void main() {
  late FakeBackend backend;

  setUp(() {
    backend = FakeBackend()
      ..addUser(FakeUser(userID: 7, email: 'member@example.com', password: 'secret123', provider: 'email'))
      ..addUser(FakeUser(userID: 8, email: 'google@example.com', password: '', provider: 'google'));
  });

  test('密碼正確時登入並取得使用者 ID', () {
    final login = backend.login(LoginUserRequest(email: 'member@example.com', password: 'secret123'));
    final user = backend.userID(GetUserIDRequest(sessionID: login.sessionsID));

    expect(login.sessionsID, 'session-7');
    expect(user.userID, 7);
    expect(backend.calls, ['login:member@example.com', 'userID:session-7']);
  });

  test('密碼錯誤時回未登入', () {
    expect(
      () => backend.login(LoginUserRequest(email: 'member@example.com', password: 'wrong')),
      throwsA(isA<GrpcError>().having((error) => error.code, 'code', StatusCode.unauthenticated)),
    );
  });

  test('密碼帳戶不能用 SNS 標記進入', () {
    expect(
      () => backend.login(LoginUserRequest(email: 'member@example.com', password: snsPassword('google'))),
      throwsA(isA<GrpcError>().having((error) => error.code, 'code', StatusCode.permissionDenied)),
    );
  });

  test('同一個 SNS 可以登入', () {
    final login = backend.login(LoginUserRequest(email: 'google@example.com', password: snsPassword('google')));
    expect(isSignupSession(login.sessionsID), isFalse);
    expect(login.sessionsID, 'session-8');
  });

  test('新郵件地址走註冊並帶出確認碼', () {
    final login = backend.login(LoginUserRequest(email: 'new@example.com', password: snsPassword('facebook')));
    expect(isSignupSession(login.sessionsID), isTrue);
    expect(signupCodeFromSession(login.sessionsID), 'code-new@example.com');
  });
}
