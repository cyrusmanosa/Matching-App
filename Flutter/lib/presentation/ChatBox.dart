import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/ChatMessage.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/chatRecord.pb.dart';
import 'package:dating_your_date/pb/chatRecordNoID.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningMsgBox.dart';
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
  TextEditingController newMsgTextController = TextEditingController();

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there anything wrong?", messageType: "sender"),
  ];

  Future<List<ChatRecordNoID>> getChatRecords(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final crRequest = GetChatRecordRequest(userID: userid!, targetID: widget.targetid);
      final crResponse = await GrpcChatService.client.getChatRecord(crRequest);
      print(crResponse.chatRecordNoID);
      return crResponse.chatRecordNoID;
    } catch (e) {
      showErrorDialog(context, "Error: validatable input data of Info");
      throw Exception("Error occurred while fetching canChangeInfo: $e");
    }
  }

  bool checktime = true;
  @override
  void initState() {
    super.initState();
    getChatRecords(context);
    checkStatus(widget.time!);
  }

  void checkStatus(String t) {
    if (t != "Now") {
      checktime = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.yellow,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: mediaQueryData.size.width / 30),
              // info bar
              child: Row(
                children: [
                  Container(margin: EdgeInsets.only(left: mediaQueryData.size.width / 8)),
                  // image
                  CircleAvatar(backgroundImage: NetworkImage("${widget.imageUrl}"), maxRadius: 20),
                  SizedBox(width: mediaQueryData.size.width / 50),
                  // name and status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(widget.name!, style: CustomTextStyles.msgWordOfMsgBox), checkShow(context)],
                    ),
                  ),
                  // seting icon
                  Icon(Icons.settings, color: Colors.black54),
                ],
              ),
            ),
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
                      padding: EdgeInsets.symmetric(vertical: mediaQueryData.size.height / 100),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: mediaQueryData.size.height / 150, horizontal: mediaQueryData.size.width / 30),
                          child: Align(
                            alignment: (data[index].roleType == "receiver" ? Alignment.bottomLeft : Alignment.bottomRight),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.r30,
                                color: (data[index].roleType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: mediaQueryData.size.height / 100,
                                horizontal: mediaQueryData.size.width / 30,
                              ),
                              child: Text(data[index].message, style: TextStyle(fontSize: 15)),
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
          height: mediaQueryData.size.height / 10.5,
          color: appTheme.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: mediaQueryData.size.width / 20,
              right: mediaQueryData.size.width / 20,
              bottom: mediaQueryData.size.height / 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [optionBarButton(context, 30), _buildMsgInput(context), sendBarButton(context, 20)],
            ),
          ),
        ));
  }

  Widget sendBarButton(BuildContext context, double s) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          messages.add(ChatMessage(messageContent: newMsgTextController.text, messageType: "sender"));
          newMsgTextController = TextEditingController();
        });
      },
      child: Container(
        height: mediaQueryData.size.height / 30,
        width: mediaQueryData.size.width / 14,
        decoration: BoxDecoration(color: appTheme.black, borderRadius: BorderRadiusStyle.r30),
        child: Icon(Icons.send, color: Colors.white, size: s),
      ),
    );
  }

  Widget optionBarButton(BuildContext context, double s) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: mediaQueryData.size.height / 30,
        width: mediaQueryData.size.width / 14,
        decoration: BoxDecoration(color: appTheme.black, borderRadius: BorderRadiusStyle.r30),
        child: Icon(Icons.add, color: Colors.white, size: s),
      ),
    );
  }

  Widget _buildMsgInput(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return CustomInputFormBar(
      height: mediaQueryData.size.height / 30,
      width: mediaQueryData.size.width / 1.45,
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
