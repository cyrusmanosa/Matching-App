// ignore_for_file: empty_constructor_bodies

library user;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final globalSession = const FlutterSecureStorage();
final globalUserId = const FlutterSecureStorage();

final Map<String, String> gender = {
  '男性': "M",
  '女性': "F",
  '中性': "N",
};
