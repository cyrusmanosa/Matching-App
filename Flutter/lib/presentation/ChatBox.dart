import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/ChatMessage.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key? key, this.name}) : super(key: key);

  final String? name;

  @override
  // ignore: library_private_types_in_public_api
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there anything wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: mediaQueryData.size.width / 30),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    onTapReturn(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(width: mediaQueryData.size.width / 100),
                CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"), maxRadius: 20),
                SizedBox(width: mediaQueryData.size.width / 50),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Kriss ", style: CustomTextStyles.msgWordOfMsgBox),
                      Text("Online", style: CustomTextStyles.pwRuleGray500),
                    ],
                  ),
                ),
                Icon(Icons.settings, color: Colors.black54),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: mediaQueryData.size.height / 100),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: mediaQueryData.size.height / 150, horizontal: mediaQueryData.size.width / 30),
                child: Align(
                  alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.symmetric(vertical: mediaQueryData.size.height / 100, horizontal: mediaQueryData.size.width / 30),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15)),
                  ),
                ),
              );
            },
          ),

          // input
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: mediaQueryData.size.width / 20,
                right: mediaQueryData.size.width / 20,
                bottom: mediaQueryData.size.height / 40,
              ),
              height: mediaQueryData.size.height / 12,
              color: Colors.green,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Color.fromARGB(255, 244, 3, 3), borderRadius: BorderRadius.circular(30)),
                      child: Icon(Icons.add, color: Colors.white, size: 30),
                    ),
                  ),
                  SizedBox(width: mediaQueryData.size.width / 30),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: mediaQueryData.size.width / 30),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(30)),
                      child: Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

onTapReturn(BuildContext context) {
  Navigator.pop(context);
}
