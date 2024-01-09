import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/chatRecordNoID.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/presentation/SideBar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key? key, this.name, this.imageUrl, this.time, this.targetid}) : super(key: key);

  final String? name;
  final String? imageUrl;
  final String? time;
  final int? targetid;

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController newMsgTextController = TextEditingController();

  Future<List<ChatRecordNoID>> getChatRecords(BuildContext context) async {
    try {
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final crRequest = GetChatRecordRequest(userID: userid!, targetID: widget.targetid);
      final crResponse = await GrpcChatService.client.getChatRecord(crRequest);
      return crResponse.chatRecordNoID;
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input data of Info");
      throw Exception("Error occurred while fetching take chat record");
    }
  }

  // Grpc
  void senderMsgGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final myRequest = CreateChatRecordRequest(
        userID: userid,
        targetID: widget.targetid,
        roleType: "sender",
        mediaType: "text",
        media: newMsgTextController.text,
      );
      await GrpcChatService.client.createChatRecord(myRequest);
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input data of myself");
      throw Exception("Error occurred while fetching myself chat record");
    }
  }

  void receiverMsgGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final targetRequest = CreateChatRecordRequest(
        userID: widget.targetid,
        targetID: userid,
        roleType: "receiver",
        mediaType: "text",
        media: newMsgTextController.text,
      );
      await GrpcChatService.client.createChatRecord(targetRequest);
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input data of target");
      throw Exception("Error occurred while fetching target chat record");
    }
    newMsgTextController = TextEditingController();
  }

  void checkStatus(String t) {
    if (t != "Now") {
      checktime = false;
    }
  }

  bool checktime = true;
  @override
  void initState() {
    super.initState();
    getChatRecords(context);
    checkStatus(widget.time!);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildHeader(context, mediaW),
      drawer: Drawer(
        child: SideBar(
          name: widget.name,
          imageUrl: widget.imageUrl,
        ),
      ),
      body: FutureBuilder<List<ChatRecordNoID>>(
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
                        padding: EdgeInsets.symmetric(
                          vertical: mediaH / 150,
                          horizontal: mediaW / 30,
                        ),
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
      bottomNavigationBar: Container(
        height: mediaH / 10.5,
        color: appTheme.white,
        child: Padding(
          padding: EdgeInsets.only(left: mediaW / 20, right: mediaW / 20, bottom: mediaH / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [optionBarButton(context, 30), _buildMsgInput(context), sendBarButton(context, 20)],
          ),
        ),
      ),
    );
  }

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
              CircleAvatar(backgroundImage: NetworkImage("${widget.imageUrl}"), maxRadius: 20),
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

  Widget sendBarButton(BuildContext context, double s) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (newMsgTextController.text.isNotEmpty || newMsgTextController.text != " ") {
            senderMsgGrpcRequest(context);
            receiverMsgGrpcRequest(context);
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

  Widget optionBarButton(BuildContext context, double s) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
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

  Widget _buildMsgInput(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
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
      return Text("Online", style: CustomTextStyles.pwRuleGray500);
    }
    return Container();
  }
}
