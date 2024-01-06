import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/chatUsers.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/Chat/widgets/conversationList.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // Grpc
  Future getTargetID(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);

    try {
      final targetIDRequest = GetTargetIDRequest(userID: userid);
      final tid = await GrpcChatService.client.getTargetID(targetIDRequest);
      return tid.targetID;
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input data of Target");
      throw Exception("Error occurred while fetching target list.");
    }
  }

  Future<List<TargetInfos>> getUserInfoGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);

    List<int> targetID = await getTargetID(context);
    List<TargetInfos> users = [];

    for (int i = 0; i < targetID.length; i++) {
      try {
        // take info
        final infoRequest = GetCanChangeRequest(sessionID: apiKeyS, userID: targetID[i]);
        final infoResponse = await GrpcInfoService.client.getCanChange(infoRequest);
        // take icon
        final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: targetID[i]);
        final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
        // take last msg
        final lmsgRequest = GetLastMsgRequest(userID: userid!, targetID: targetID[i]);
        final lmsgResponse = await GrpcChatService.client.getLastMsg(lmsgRequest);

        users.add(TargetInfos(
          userid: targetID[i],
          img: imgResponse.img.img1,
          info: infoResponse.canChangeInfo,
          lastMsg: lmsgResponse.media,
          isRead: lmsgResponse.isread,
        ));
      } on GrpcError {
        showErrorDialog(context, "Error: validatable input data of Info");
        throw Exception("Error occurred while fetching canChangeInfo.");
      }
    }
    return users;
  }

  List<ChatUsers> chatUsers = [ChatUsers(time: "Now"), ChatUsers(time: "23 Mar"), ChatUsers(time: "17 Mar")];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      body: FutureBuilder<List<TargetInfos>>(
        future: getUserInfoGrpcRequest(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: mediaW / 20, top: mediaH / 15),
                    child: Text("Conversations", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: mediaH / 50),
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return ConversationList(
                        targetid: data[index].userid,
                        name: data[index].info.nickName,
                        messageText: data[index].lastMsg,
                        imageUrl: data[index].img,
                        time: chatUsers[index].time,
                        isMessageRead: data[index].isRead,
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
