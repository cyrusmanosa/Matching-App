import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/ChatModel.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/Chat/widgets/conversationList.dart';
import 'package:dating_your_date/theme/custom_text_style.dart';
import 'package:dating_your_date/widgets/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool? isEmpty;
  List<int> targetID = [];
  List<TargetInfos> users = [];

  @override
  void initState() {
    super.initState();
    _getTargetID(context);
  }

// Grpc
  void _getTargetID(BuildContext context) async {
    try {
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final targetIDRequest = GetTargetIDRequest(userID: userid);
      final tid = await GrpcChatService.client.getTargetID(targetIDRequest);
      setState(() {
        targetID = tid.targetID;
      });
      _getUserInfoGrpcRequest(context);
    } on GrpcError {
      isEmpty = true;
      showErrorDialog(context, "Error: validatable input data of Msg Info");
      throw Exception("Error occurred while fetching user info.");
    }
  }

  void _getUserInfoGrpcRequest(BuildContext context) async {
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

        Uint8List bytes = Uint8List.fromList(imgResponse.img.img1);
        Directory tempDir = await getTemporaryDirectory();
        File file = File('${tempDir.path}/data_$i.bin');
        await file.writeAsBytes(bytes);

        setState(() {
          users.add(TargetInfos(
            userid: targetID[i],
            img: file,
            info: infoResponse.canChangeInfo,
            lastMsg: lmsgResponse.media,
            isRead: lmsgResponse.isread,
          ));
        });
      }
      isEmpty = false;
    } on GrpcError {
      isEmpty = true;
    }
  }

  List<ChatUsers> chatUsers = [ChatUsers(time: "Now"), ChatUsers(time: "23 Mar"), ChatUsers(time: "17 Mar")];
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
              Center(child: Text("相手とまだおしゃべりしておりません", style: CustomTextStyles.smallTitle20))
            else
              ListView.separated(
                itemCount: users.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: mediaH / 50),
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    targetid: users[index].userid,
                    name: users[index].info.nickName,
                    messageText: users[index].lastMsg,
                    imageUrl: users[index].img,
                    time: chatUsers[index].time,
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
