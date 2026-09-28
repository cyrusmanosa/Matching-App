import 'dart:convert';

import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/pb/rpc_search.pb.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/pb/search.pb.dart';
import 'package:grpc/grpc.dart';

class FakeUser {
  FakeUser({required this.userID, required this.email, required this.password, this.provider = 'email'});

  final int userID;
  final String email;
  final String password;
  final String provider;
}

class FakeBackend {
  final users = <String, FakeUser>{};
  final calls = <String>[];

  void addUser(FakeUser user) {
    users[user.email] = user;
  }

  LoginUserResponse login(LoginUserRequest request) {
    calls.add('login:${request.email}');
    final provider = _snsProvider(request.password);
    final user = users[request.email];
    if (provider != null) {
      if (user == null) {
        return LoginUserResponse(sessionsID: 'signup:code-${request.email}', email: request.email);
      }
      if (user.provider == 'email') {
        throw GrpcError.custom(StatusCode.permissionDenied, 'use password');
      }
      if (user.provider != provider) {
        throw GrpcError.custom(StatusCode.failedPrecondition, 'different sns');
      }
      return LoginUserResponse(sessionsID: 'session-${user.userID}', email: user.email);
    }
    if (user == null || user.password != request.password) {
      throw GrpcError.custom(StatusCode.unauthenticated, 'incorrect email or password');
    }
    return LoginUserResponse(sessionsID: 'session-${user.userID}', email: user.email);
  }

  GetUserIDResponse userID(GetUserIDRequest request) {
    calls.add('userID:${request.sessionID}');
    if (!request.sessionID.startsWith('session-')) {
      throw GrpcError.custom(StatusCode.unauthenticated, 'session not found');
    }
    final id = int.tryParse(request.sessionID.replaceFirst('session-', ''));
    if (id == null) {
      throw GrpcError.custom(StatusCode.unauthenticated, 'session not found');
    }
    return GetUserIDResponse(userID: id);
  }

  SearchResponseH searchHobby({required String rank, required List<int> ids}) {
    calls.add('searchHobby');
    return SearchResponseH(resu: sH(rank: rank, resultID: ids, len: ids.length));
  }

  String lastMessage({required String mediaType, required List<int> media}) {
    calls.add('lastMessage:$mediaType');
    if (mediaType == 'image') {
      return '写真';
    }
    if (media.isEmpty) {
      return '';
    }
    return utf8.decode(media, allowMalformed: true);
  }

  String? _snsProvider(String password) {
    const prefix = 'sns:';
    if (!password.startsWith(prefix)) {
      return null;
    }
    final provider = password.substring(prefix.length);
    if (provider == 'google' || provider == 'facebook' || provider == 'twitter') {
      return provider;
    }
    return null;
  }
}
