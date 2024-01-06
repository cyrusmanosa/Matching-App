import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  ConversationList({
    Key? key,
    required this.targetid,
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
  }) : super(key: key);
  final int targetid;
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBox(
              name: name,
              time: time,
              imageUrl: imageUrl,
              targetid: targetid,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 20, vertical: mediaH / 60),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(imageUrl), maxRadius: 30),
            SizedBox(width: mediaW / 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: appTheme.black)),
                  SizedBox(height: mediaH / 300),
                  Text(
                    messageText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: appTheme.gray800,
                      fontWeight: !isMessageRead ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: mediaW / 50)),
            Text(time, style: TextStyle(fontSize: 12, fontWeight: isMessageRead ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
