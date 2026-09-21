import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/routes/app_routes.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

final appNavigatorKey = GlobalKey<NavigatorState>();
final sessionRouteObserver = SessionRouteObserver();

class SessionRouteObserver extends NavigatorObserver {
  String? currentName;

  void _remember(Route<dynamic>? route) {
    currentName = route?.settings.name;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => _remember(route);

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) => _remember(newRoute);

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => _remember(previousRoute);

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) => _remember(previousRoute);
}

String matchReadyMessage(String rank) => '新しいターゲットも準備しました（一致 $rank）';

String emptyMatchMessage(String rank) {
  final percent = rank.isEmpty ? '0%' : rank;
  return '新しい条件で合わせるパーセントは$percentです。';
}

const sessionEndedMessage = 'ログインの有効期限が切れたか、別の端末でログインされています。もう一度ログインしてください。';

const _methodsWithoutSession = {
  '/pb.Information/LoginUser',
  '/pb.Information/CheckEmail',
  '/pb.Information/CheckEmailCode',
  '/pb.Information/EmailResetPassword',
  '/pb.Information/ResetPwEmailConfirm',
  '/pb.Information/LogoutUser',
};

bool isUnauthenticated(GrpcError error) => error.code == StatusCode.unauthenticated;

Future<void> clearLocalLogin() async {
  await globalSession.delete(key: 'SessionId');
  await globalUserId.delete(key: 'UserID');
  await globalemail.delete(key: 'email');
}

class SessionAuthInterceptor extends ClientInterceptor {
  DateTime? _handledAt;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    final response = invoker(method, request, options);
    response.then((_) {}, onError: (Object error) {
      if (error is GrpcError && isUnauthenticated(error)) {
        _rejectSession(method.path);
      }
    });
    return response;
  }

  Future<void> _rejectSession(String methodPath) async {
    if (_methodsWithoutSession.contains(methodPath)) {
      return;
    }
    final now = DateTime.now();
    if (_handledAt != null && now.difference(_handledAt!) < const Duration(seconds: 2)) {
      return;
    }
    _handledAt = now;
    await clearLocalLogin();
    final navigator = appNavigatorKey.currentState;
    if (navigator == null) {
      return;
    }
    if (sessionRouteObserver.currentName == AppRoutes.login) {
      final overlayContext = navigator.overlay?.context;
      if (overlayContext != null) {
        await showErrorDialog(overlayContext, sessionEndedMessage);
      }
      return;
    }
    navigator.pushNamedAndRemoveUntil(AppRoutes.login, (route) => false, arguments: sessionEndedMessage);
  }
}
