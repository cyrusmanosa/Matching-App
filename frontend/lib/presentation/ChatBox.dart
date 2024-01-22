import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/chatRecordNoID.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/presentation/SideBar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key? key, this.name, this.imageUrl, this.time, this.targetid}) : super(key: key);

  final String? name;
  final Uint8List? imageUrl;
  final String? time;
  final int? targetid;

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  String? purpose;
  bool checktime = true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController newMsgTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPurpose(context);
  }

  Future<List<ChatRecordNoID>> getChatRecords(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final crRequest = GetChatRecordRequest(userID: userid!, targetID: widget.targetid);
      final crResponse = await GrpcChatService.client.getChatRecord(crRequest);
      return crResponse.chatRecordNoID;
    } on GrpcError {
      throw Exception('No chat records found');
    }
  }

  void getPurpose(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final request = GetTargetListRequest(sessionID: apiKeyS, userID: userid);
      final response = await GrpcInfoService.client.getTargetList(request);
      if (response.tl.target1ID == widget.targetid && response.tl.target1ID != 0) {
        setState(() {
          purpose = response.tl.t1Type;
        });
      } else if (response.tl.target2ID == widget.targetid && response.tl.target2ID != 0) {
        setState(() {
          purpose = response.tl.t2Type;
        });
      } else if (response.tl.target3ID == widget.targetid && response.tl.target3ID != 0) {
        setState(() {
          purpose = response.tl.t3Type;
        });
      }
    } on GrpcError {
      await showErrorDialog(context, "エラー：検証可能なデータの入力データ");
      throw Exception("データの取得中にエラーが発生しました。");
    }
  }

  // Grpc
  void senderMsgGrpcRequest(BuildContext context) async {
    try {
      // myself
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final uid = int.tryParse(apiKeyU!);
      final myRequest = CreateChatRecordRequest(
        userID: uid,
        targetID: widget.targetid,
        roleType: "sender",
        mediaType: "text",
        media: newMsgTextController.text,
      );
      await GrpcChatService.client.createChatRecord(myRequest);
      // target
      final targetRequest = CreateChatRecordRequest(
        userID: widget.targetid,
        targetID: uid,
        roleType: "receiver",
        mediaType: "text",
        media: newMsgTextController.text,
      );
      await GrpcChatService.client.createChatRecord(targetRequest);
    } on GrpcError {
      await showErrorDialog(context, "エラー：検証可能なメッセージの送信 at myself");
      throw Exception("データの取得中にエラーが発生しました。");
    } finally {
      newMsgTextController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildHeader(context, mediaW),
      drawer: Drawer(child: SideBar()),
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.bgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: FutureBuilder<List<ChatRecordNoID>>(
          future: getChatRecords(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: mediaH / 100),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: mediaH / 150, horizontal: mediaW / 30),
                          child: Align(
                            alignment: (data[index].roleType == "receiver" ? Alignment.bottomLeft : Alignment.bottomRight),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: mediaW / 1.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.r30,
                                color: (data[index].roleType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                              ),
                              padding: EdgeInsets.symmetric(vertical: mediaH / 100, horizontal: mediaW / 30),
                              child: Text(data[index].media, style: TextStyle(fontSize: mediaH / 60)),
                            ),
                          ),
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
      ),
      bottomNavigationBar: Container(
        height: mediaH / 10.5,
        color: Color.fromARGB(255, 226, 226, 226),
        child: Padding(
          padding: EdgeInsets.only(left: mediaW / 20, right: mediaW / 20, bottom: mediaH / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              optionBarButton(context, 30, mediaH, mediaW),
              _buildMsgInput(context, mediaH, mediaW),
              sendBarButton(context, 20, mediaH, mediaW),
            ],
          ),
        ),
      ),
    );
  }

// Header
  PreferredSizeWidget _buildHeader(BuildContext context, double mediaW) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.yellow,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black54),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: mediaW / 30),
          // info bar
          child: Row(
            children: [
              Container(margin: EdgeInsets.only(left: mediaW / 8)),
              // image
              CircleAvatar(backgroundImage: MemoryImage(widget.imageUrl!), maxRadius: 20),
              SizedBox(width: mediaW / 50),
              // name and status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(widget.name!, style: CustomTextStyles.msgWordOfMsgBox), checkShow(context)],
                ),
              ),
              // seting icon
              IconButton(
                icon: Icon(Icons.settings, color: Colors.black54),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendBarButton(BuildContext context, double s, double mediaH, double mediaW) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (newMsgTextController.text.isNotEmpty) {
            senderMsgGrpcRequest(context);
          }
        });
      },
      child: Container(
        height: mediaH / 30,
        width: mediaW / 14,
        decoration: BoxDecoration(color: appTheme.black, borderRadius: BorderRadiusStyle.r30),
        child: Icon(Icons.send, color: Colors.white, size: s),
      ),
    );
  }

  // no do
  Widget optionBarButton(BuildContext context, double s, double mediaH, double mediaW) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: mediaH / 30,
        width: mediaW / 14,
        decoration: BoxDecoration(color: appTheme.black, borderRadius: BorderRadiusStyle.r30),
        child: Icon(Icons.add, color: Colors.white, size: s),
      ),
    );
  }

  Widget _buildMsgInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      height: mediaH / 30,
      width: mediaW / 1.45,
      controller: newMsgTextController,
      hintText: "Write message...",
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  Widget checkShow(BuildContext context) {
    if (checktime) {
      return Text("Online", style: CustomTextStyles.pwRulegrey500);
    }
    return Container();
  }
}
