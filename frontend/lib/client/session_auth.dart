import 'package:dating_your_date/client/blocked_users.dart';
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

String matchPercent(String rank) {
  final line = rank.split('\n').first.trim();
  if (line.isEmpty) return '0%';
  return line;
}

List<String> matchReasonLines(String rank) {
  final lines = rank.split('\n').map((line) => line.trim()).where((line) => line.isNotEmpty).toList();
  if (lines.length <= 1) return const [];
  if (!lines.first.endsWith('%')) return lines;
  return lines.sublist(1);
}

String matchBlockFor(String rank, int userID) {
  final hasBlocks = rank.contains('\n---\n') || RegExp(r'^\d+\n').hasMatch(rank);
  if (!hasBlocks) return rank;
  for (final block in rank.split('\n---\n')) {
    final lines = block.split('\n');
    if (lines.isNotEmpty && int.tryParse(lines.first) == userID) {
      return lines.skip(1).join('\n');
    }
  }
  final first = rank.split('\n---\n').first.split('\n');
  if (first.length > 1 && int.tryParse(first.first) != null) {
    return first.skip(1).join('\n');
  }
  return rank;
}

String matchReadyMessageFor(String rank, int userID) => matchReadyMessage(matchBlockFor(rank, userID));

String matchReadyMessage(String rank) {
  final buffer = StringBuffer('新しいターゲットも準備しました（一致 ${matchPercent(rank)}）');
  for (final reason in matchReasonLines(rank)) {
    buffer.write('\n・$reason');
  }
  return buffer.toString();
}

String emptyMatchMessage(String rank) {
  return '新しい条件で合わせるパーセントは${matchPercent(rank)}です。';
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

String? activeSessionId;
String? signupCode;

void rememberSession(String? sessionID) {
  activeSessionId = sessionID;
}

Future<void> clearLocalLogin() async {
  activeSessionId = null;
  await globalSession.delete(key: 'SessionId');
  await globalUserId.delete(key: 'UserID');
  await globalemail.delete(key: 'email');
  await clearBlockedUsers();
}

class ChatSessionInterceptor extends ClientInterceptor {
  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    final sessionID = activeSessionId;
    if (sessionID != null && sessionID.isNotEmpty) {
      options = options.mergedWith(CallOptions(metadata: {'session-id': sessionID}));
    }
    return invoker(method, request, options);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options, ClientStreamingInvoker<Q, R> invoker) {
    return invoker(method, requests, options);
  }
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
