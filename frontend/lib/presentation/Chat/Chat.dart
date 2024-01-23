import 'dart:convert';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/ChatModel.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
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
  String lastMsg = "";
  List<int> targetID = [];
  List<TargetInfos> users = [];

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  Future<void> fetchData(BuildContext context) async {
    await _getTargetID(context);
    _getUserInfoGrpcRequest(context);
  }

// Grpc
  Future<void> _getTargetID(BuildContext context) async {
    try {
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final targetIDRequest = GetTargetIDRequest(userID: userid);
      final tid = await GrpcChatService.client.getTargetID(targetIDRequest);
      setState(() {
        targetID = tid.targetID;
        if (targetID == []) {
          isEmpty = true;
        }
      });
    } on GrpcError {
      await showErrorDialog(context, "エラー：検証可能な入力データ");
      throw Exception("データの送信中にエラーが発生しました。");
    }
  }

  Future<void> _getUserInfoGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      for (int i = 0; i < targetID.length; i++) {
        // take info
        final infoRequest = GetCanChangeRequest(sessionID: apiKeyS, userID: targetID[i]);
        final infoResponse = await GrpcInfoService.client.getCanChange(infoRequest);
        // take icon
        final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: targetID[i]);
        final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
        // take last msg
        final lmsgRequest = GetLastMsgRequest(userID: userid!, targetID: targetID[i]);
        final lmsgResponse = await GrpcChatService.client.getLastMsg(lmsgRequest);
        if (lmsgResponse.mediaType == "text") {
          String str = utf8.decode(lmsgResponse.media);
          lastMsg = str;
        }

        Uint8List bytes = Uint8List.fromList(imgResponse.img.img1);
        setState(() {
          users.add(TargetInfos(
              userid: targetID[i], img: bytes, info: infoResponse.canChangeInfo, lastMsg: lastMsg, isRead: lmsgResponse.isRead));
        });
      }
      isEmpty = false;
    } on GrpcError {
      isEmpty = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    return Scaffold(
      appBar: buildAppBar(context, "チャット", false),
      backgroundColor: appTheme.bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isEmpty == true)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: mediaH / 4),
                  child: Text("相手とまだおしゃべりしておりません", style: CustomTextStyles.smallTitle20),
                ),
              ),
            ListView.separated(
              itemCount: users.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: mediaH / 50),
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: mediaH / 50),
              itemBuilder: (context, index) {
                return ConversationList(
                  targetid: users[index].userid,
                  name: users[index].info.nickName,
                  messageText: users[index].lastMsg,
                  imageUrl: users[index].img,
                  isMessageRead: users[index].isRead,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
