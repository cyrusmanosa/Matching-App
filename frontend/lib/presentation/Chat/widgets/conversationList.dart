import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/client/session_auth.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class ConversationList extends StatefulWidget {
  ConversationList({super.key, this.targetid, this.name, this.messageText, this.imageUrl, this.isMessageRead, this.onClosed});
  final int? targetid;
  final String? name;
  final String? messageText;
  final Uint8List? imageUrl;
  final bool? isMessageRead;
  final VoidCallback? onClosed;

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  String tType = '';

  @override
  void initState() {
    super.initState();
    _loadType();
  }

  Future<void> _loadType() async {
    try {
      final apiKeyS = await globalSession.read(key: 'SessionId');
      final apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU ?? '');
      if (userid == null) return;
      final rsp = await GrpcInfoService.client.getTargetList(GetTargetListRequest(sessionID: apiKeyS, userID: userid));
      String next = '見つけた';
      if (widget.targetid == rsp.tl.target1ID) {
        next = rsp.tl.t1Type;
      } else if (widget.targetid == rsp.tl.target2ID) {
        next = rsp.tl.t2Type;
      } else if (widget.targetid == rsp.tl.target3ID) {
        next = rsp.tl.t3Type;
      }
      if (!mounted) return;
      setState(() => tType = next);
    } on GrpcError catch (error) {
      if (isUnauthenticated(error)) return;
    }
  }

  Color _typeColor() {
    if (tType == '趣味') return appTheme.grey800;
    if (tType == '相伴') return appTheme.scallopSeashell;
    if (tType == '恋人') return appTheme.pinkA100;
    return appTheme.grey500;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final mediaH = media.size.height;
    final mediaW = media.size.width;
    final unread = widget.isMessageRead == false;
    final image = widget.imageUrl;
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBox(
              name: widget.name ?? '',
              imageUrl: image,
              targetid: widget.targetid,
              tType: tType.isEmpty ? null : tType,
            ),
          ),
        );
        widget.onClosed?.call();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mediaW * 0.04),
        padding: EdgeInsets.symmetric(horizontal: mediaW * 0.04, vertical: mediaH * 0.016),
        decoration: BoxDecoration(
          color: appTheme.white,
          border: Border.all(color: appTheme.black, width: mediaW * 0.003),
          borderRadius: BorderRadius.circular(mediaW * 0.04),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: image == null || image.isEmpty ? null : MemoryImage(image),
              backgroundColor: appTheme.grey100,
              radius: mediaW * 0.07,
              child: image == null || image.isEmpty ? Icon(Icons.person, size: mediaW * 0.07) : null,
            ),
            SizedBox(width: mediaW * 0.035),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: mediaW * 0.045, fontWeight: FontWeight.w800, color: appTheme.black),
                        ),
                      ),
                      if (tType.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: mediaW * 0.02, vertical: mediaH * 0.004),
                          decoration: BoxDecoration(color: _typeColor(), borderRadius: BorderRadius.circular(mediaW * 0.03)),
                          child: Text(tType, style: TextStyle(fontSize: mediaW * 0.028, color: appTheme.white, fontWeight: FontWeight.w700)),
                        ),
                    ],
                  ),
                  SizedBox(height: mediaH * 0.006),
                  Text(
                    widget.messageText ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: mediaW * 0.034,
                      color: unread ? appTheme.black : appTheme.grey800,
                      fontWeight: unread ? FontWeight.w800 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (unread)
              Container(
                margin: EdgeInsets.only(left: mediaW * 0.02),
                width: mediaW * 0.025,
                height: mediaW * 0.025,
                decoration: BoxDecoration(color: appTheme.pinkA100, shape: BoxShape.circle),
              ),
          ],
        ),
      ),
    );
  }
}
