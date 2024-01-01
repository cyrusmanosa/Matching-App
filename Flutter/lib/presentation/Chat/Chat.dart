import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/chatUsers.dart';
import 'package:dating_your_date/presentation/Chat/widgets/conversationList.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      imageURL: "https://randomuser.me/api/portraits/men/1.jpg",
      time: "Now",
    ),
    ChatUsers(
      name: "Glady's Murphy",
      messageText: "That's Great",
      imageURL: "https://randomuser.me/api/portraits/women/2.jpg",
      time: "Yesterday",
    ),
    ChatUsers(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      imageURL: "https://randomuser.me/api/portraits/men/3.jpg",
      time: "31 Mar",
    ),
    ChatUsers(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "https://randomuser.me/api/portraits/women/1.jpg",
      time: "28 Mar",
    ),
    ChatUsers(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      imageURL: "https://randomuser.me/api/portraits/women/4.jpg",
      time: "23 Mar",
    ),
    ChatUsers(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      imageURL: "https://randomuser.me/api/portraits/men/5.jpg",
      time: "17 Mar",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: mediaQueryData.size.width / 20, top: mediaQueryData.size.height / 30),
              child: Text("Conversations", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            ListView.separated(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: mediaQueryData.size.height / 50),
              physics: NeverScrollableScrollPhysics(),
              // 分線
              separatorBuilder: (context, index) => Divider(),

              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
