import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/ChatMessage.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key? key, this.name, this.imageUrl, this.time}) : super(key: key);

  final String? name;
  final String? imageUrl;
  final String? time;

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

  bool checktime = true;
  @override
  void initState() {
    super.initState();
    checkStatus(widget.time!);
    print(widget.imageUrl);
  }

  void checkStatus(String t) {
    // ignore: unrelated_type_equality_checks
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                        alignment: (messages[index].messageType == "receiver" ? Alignment.bottomLeft : Alignment.bottomRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.r30,
                            color: (messages[index].messageType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: mediaQueryData.size.height / 100,
                            horizontal: mediaQueryData.size.width / 30,
                          ),
                          child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // under bar
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: mediaQueryData.size.width / 20,
                right: mediaQueryData.size.width / 20,
                bottom: mediaQueryData.size.height / 40,
              ),
              height: mediaQueryData.size.height / 10.5,
              color: appTheme.white,
              child: Row(
                children: [
                  optionBarButton(context, 30),
                  SizedBox(width: mediaQueryData.size.width / 30),
                  _buildMsgInput(context),
                  SizedBox(width: mediaQueryData.size.width / 30),
                  sendBarButton(context, 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
