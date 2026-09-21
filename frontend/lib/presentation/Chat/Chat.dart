import 'dart:convert';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/client/session_auth.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/ChatModel.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/presentation/Chat/widgets/conversationList.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isEmpty = false;
  bool loading = true;
  List<int> targetID = [];
  List<TargetInfos> users = [];

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  Future<void> fetchData(BuildContext context) async {
    await _getTargetID(context);
    await _getUserInfoGrpcRequest();
  }

// Grpc
  Future<void> _getTargetID(BuildContext context) async {
    final ids = <int>{};
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU ?? '');
    if (userid == null) {
      if (mounted) setState(() => loading = false);
      return;
    }
    try {
      final tid = await GrpcChatService.client.getTargetID(GetTargetIDRequest(userID: userid));
      ids.addAll(tid.targetID.where((id) => id != 0));
    } on GrpcError catch (error) {
      if (isUnauthenticated(error)) {
        if (mounted) setState(() => loading = false);
        return;
      }
    }
    try {
      final list = await GrpcInfoService.client.getTargetList(GetTargetListRequest(sessionID: apiKeyS, userID: userid));
      for (final id in [list.tl.target1ID, list.tl.target2ID, list.tl.target3ID]) {
        if (id != 0) ids.add(id);
      }
    } on GrpcError catch (error) {
      if (!mounted) return;
      if (isUnauthenticated(error)) {
        setState(() => loading = false);
        return;
      }
      if (ids.isEmpty) {
        setState(() => loading = false);
        await showErrorDialog(context, "チャット相手を読み込めませんでした。");
        return;
      }
    }
    if (!mounted) return;
    setState(() {
      targetID = ids.toList();
    });
  }

  Future<void> _getUserInfoGrpcRequest() async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final next = <TargetInfos>[];
      for (int i = 0; i < targetID.length; i++) {
        try {
          final infoResponse = await GrpcInfoService.client.getCanChange(GetCanChangeRequest(sessionID: apiKeyS, userID: targetID[i]));
          final imgResponse = await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID[i]));
          var preview = "";
          var isRead = true;
          try {
            final lmsgResponse = await GrpcChatService.client.getLastMsg(GetLastMsgRequest(userID: userid!, targetID: targetID[i]));
            isRead = lmsgResponse.isRead;
            if (lmsgResponse.mediaType == "image") {
              preview = "写真";
            } else if (lmsgResponse.media.isNotEmpty) {
              preview = utf8.decode(lmsgResponse.media, allowMalformed: true);
            }
          } on GrpcError catch (error) {
            if (isUnauthenticated(error)) rethrow;
          }
          next.add(TargetInfos(
            userid: targetID[i],
            img: Uint8List.fromList(imgResponse.img.img1),
            info: infoResponse.canChangeInfo,
            lastMsg: preview,
            isRead: isRead,
          ));
        } on GrpcError catch (error) {
          if (isUnauthenticated(error)) rethrow;
        }
      }
      if (mounted) {
        setState(() {
          users = next;
          isEmpty = users.isEmpty;
          loading = false;
        });
      }
    } on GrpcError catch (error) {
      if (!mounted || isUnauthenticated(error)) return;
      setState(() {
        isEmpty = users.isEmpty;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    return Scaffold(
      appBar: buildAppBar(context, "チャット", false),
      backgroundColor: appTheme.bgColor,
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.forum_outlined, size: MediaQuery.of(context).size.width * 0.16, color: appTheme.pinkA100),
                        SizedBox(height: mediaH * 0.02),
                        Text("まだチャットがありません", textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, fontWeight: FontWeight.w700)),
                        SizedBox(height: mediaH * 0.01),
                        Text(
                          "マッチした相手がここに並びます。ホームから条件を設定してみましょう。",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.034, color: appTheme.grey800),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: users.length,
                  padding: EdgeInsets.symmetric(vertical: mediaH * 0.02),
                  separatorBuilder: (context, index) => SizedBox(height: mediaH * 0.012),
                  itemBuilder: (context, index) {
                    return ConversationList(
                      imageUrl: users[index].img,
                      isMessageRead: users[index].isRead,
                      messageText: users[index].lastMsg.isEmpty ? "メッセージはまだありません" : users[index].lastMsg,
                      name: users[index].info.nickName,
                      targetid: users[index].userid,
                      onClosed: () => fetchData(context),
                    );
                  },
                ),
    );
  }
}
