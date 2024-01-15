// ignore: file_names
import 'dart:io';

import 'package:dating_your_date/pb/canChange.pb.dart';

class ChatUsers {
  String time;
  ChatUsers({required this.time});
}

class TargetInfos {
  int userid;
  File img;
  String lastMsg;
  bool isRead;
  CanChange info;
  TargetInfos({required this.userid, required this.img, required this.info, required this.lastMsg, required this.isRead});
}
