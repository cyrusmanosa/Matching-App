import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;

  const ConversationList({
    Key? key,
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
  }) : super(key: key);

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
                  )),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(imageUrl), maxRadius: 30),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: appTheme.black)),
                  SizedBox(height: mediaQueryData.size.height / 300),
                  Text(
                    messageText,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      fontWeight: isMessageRead ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Text(time, style: TextStyle(fontSize: 12, fontWeight: isMessageRead ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
