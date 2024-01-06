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
        padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 20, vertical: mediaQueryData.size.height / 60),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(imageUrl), maxRadius: 30),
            SizedBox(width: mediaQueryData.size.width / 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: appTheme.black)),
                  SizedBox(height: mediaQueryData.size.height / 300),
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
            Padding(padding: EdgeInsets.only(left: mediaQueryData.size.width / 50)),
            Text(time, style: TextStyle(fontSize: 12, fontWeight: isMessageRead ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
