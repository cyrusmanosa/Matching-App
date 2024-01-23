import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/chatRecordNoID.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_socialmedia.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/pb/socialmedia.pb.dart';
import 'package:dating_your_date/presentation/SideBar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as customImage;

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
  SocialMedia? socialmediaData;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController newMsgTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPurpose(context);
    getSocialMedia(context);
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

  Future<void> getSocialMedia(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final req = GetSocialMediaRequest(userID: userid, targetID: widget.targetid!);
      final rsp = await GrpcChatService.client.getSocialMedia(req);
      setState(() {
        socialmediaData = rsp.sm;
      });
    } on GrpcError {
      throw Exception("エラーが発生しました。");
    }
  }

  void uploadPhotoToNewFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        senderPhotoGrpcRequest(context, file);
      });
    }
  }

  // Grpc
  void senderPhotoGrpcRequest(BuildContext context, File file) async {
    Uint8List bytes = await file.readAsBytes();
    final image = customImage.decodeImage(bytes);
    final double ratio = image!.width / image.height;
    final int targetWidth = 1024;
    final int targetHeight = (targetWidth / ratio).round();
    final resizedImage = customImage.copyResize(image, width: targetWidth, height: targetHeight);
    Uint8List resizedBytes = customImage.encodeJpg(resizedImage);
    List<int> img = resizedBytes.toList();
    try {
      // myself
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final uid = int.tryParse(apiKeyU!);
      final myRequest = CreateChatRecordRequest(
        userID: uid,
        targetID: widget.targetid,
        roleType: "sender",
        mediaType: "image",
        media: img,
      );
      await GrpcChatService.client.createChatRecord(myRequest);
      // target
      final targetRequest = CreateChatRecordRequest(
        userID: widget.targetid,
        targetID: uid,
        roleType: "receiver",
        mediaType: "image",
        media: img,
      );
      await GrpcChatService.client.createChatRecord(targetRequest);
    } on GrpcError {
      await showErrorDialog(context, "エラー：検証可能なメッセージの送信 at myself");
      throw Exception("データの取得中にエラーが発生しました。");
    }
  }

  void senderMsgGrpcRequest(BuildContext context) async {
    try {
      // myself
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final uid = int.tryParse(apiKeyU!);
      List<int> sendText = utf8.encode(newMsgTextController.text);
      final myRequest = CreateChatRecordRequest(
        userID: uid,
        targetID: widget.targetid,
        roleType: "sender",
        mediaType: "text",
        media: sendText,
      );
      await GrpcChatService.client.createChatRecord(myRequest);
      // target
      final targetRequest = CreateChatRecordRequest(
        userID: widget.targetid,
        targetID: uid,
        roleType: "receiver",
        mediaType: "text",
        media: sendText,
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildHeader(context, mediaW),
        drawer: Drawer(child: SideBar(sm: socialmediaData, targetId: widget.targetid!)),
        backgroundColor: appTheme.bgColor,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              FutureBuilder<List<ChatRecordNoID>>(
                future: getChatRecords(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: mediaH / 50),
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
                                color: (data[index].roleType == "receiver" ? appTheme.grey100 : Colors.blue[200]),
                              ),
                              padding: EdgeInsets.symmetric(vertical: mediaH / 100, horizontal: mediaW / 30),
                              child: switchdata(context, data[index], mediaH),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 10),
          height: mediaH / 12,
          color: Color.fromARGB(255, 226, 226, 226),
          margin: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
          child: Column(
            children: [
              SizedBox(height: mediaH / 200),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaW / 20, vertical: mediaH / 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    optionBarButton(context, 30, mediaH, mediaW),
                    _buildMsgInput(context, mediaH, mediaW),
                    sendBarButton(context, 20, mediaH, mediaW),
                  ],
                ),
              ),
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

  Widget switchdata(BuildContext context, ChatRecordNoID data, double mediaH) {
    if (data.mediaType == "text") {
      String str = utf8.decode(data.media);
      return Text(str, style: TextStyle(fontSize: mediaH / 60));
    } else if (data.mediaType == "image") {
      Uint8List img = Uint8List.fromList(data.media);
      return ClipRRect(borderRadius: BorderRadiusStyle.r15, child: Image.memory(img));
    }
    return Container();
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

  Widget optionBarButton(BuildContext context, double s, double mediaH, double mediaW) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: mediaH / 3,
              color: Color.fromARGB(255, 226, 226, 226),
              child: Column(
                children: [
                  // image
                  ListTile(
                      enabled: socialmediaData!.image,
                      leading: Icon(Icons.photo),
                      title: Text('写真解放'),
                      onTap: () {
                        uploadPhotoToNewFile();
                      }),
                  Divider(indent: 10, endIndent: 10),

                  // contact
                  ListTile(
                    enabled: socialmediaData!.contact,
                    leading: Icon(Icons.contacts),
                    title: Text('連絡解放'),
                    onTap: () {},
                  ),
                  Divider(indent: 10, endIndent: 10),
                  // location
                  ListTile(
                    enabled: socialmediaData!.location,
                    leading: Icon(Icons.location_on),
                    title: Text('位置共有'),
                    onTap: () {},
                  ),
                  Divider(indent: 10, endIndent: 10),
                  // dating
                  ListTile(
                    enabled: socialmediaData!.appointment,
                    leading: Icon(Icons.date_range),
                    title: Text('デート解放'),
                    onTap: () {},
                  ),
                  Divider(indent: 10, endIndent: 10),
                  // sns
                  ListTile(
                    enabled: socialmediaData!.sns,
                    leading: Icon(Icons.share),
                    title: Text('SNS共有'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: mediaH / 30,
        width: mediaW / 14,
        decoration: BoxDecoration(color: appTheme.black, borderRadius: BorderRadiusStyle.r30),
        child: Icon(Icons.add, color: appTheme.white, size: s),
      ),
    );
  }

  Widget _buildMsgInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      height: mediaH / 30,
      width: mediaW / 1.45,
      controller: newMsgTextController,
      hintText: "Write message...",
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
