import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

// ignore: must_be_immutable
class ConversationList extends StatefulWidget {
  ConversationList({
    Key? key,
    this.targetid,
    this.name,
    this.messageText,
    this.imageUrl,
    this.time,
    this.isMessageRead,
  }) : super(key: key);
  final int? targetid;
  final String? name;
  final String? messageText;
  final String? imageUrl;
  final String? time;
  bool? isMessageRead;

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  // Grpc
  void updateReadGrpcRequest(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);

    final request = UpdateReadRequest(userID: userid, targetID: widget.targetid);
    try {
      await GrpcChatService.client.updateRead(request);
    } on GrpcError catch (e) {
      showErrorDialog(context, "Error: ${e.codeName}");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return GestureDetector(
      onTap: () {
        updateReadGrpcRequest(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBox(name: widget.name, time: widget.time, imageUrl: widget.imageUrl, targetid: widget.targetid),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 15, vertical: mediaH / 60),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl!), maxRadius: 30),
            SizedBox(width: mediaW / 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: appTheme.black)),
                  SizedBox(height: mediaH / 300),
                  Text(
                    widget.messageText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: appTheme.gray800,
                      fontWeight: widget.isMessageRead! ? FontWeight.normal : FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: mediaW / 50)),
            Text(widget.time!, style: TextStyle(fontSize: 12, fontWeight: widget.isMessageRead! ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
