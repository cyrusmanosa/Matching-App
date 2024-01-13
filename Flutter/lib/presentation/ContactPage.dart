import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);

  TextEditingController msgTypeController = TextEditingController();
  TextEditingController messageBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
        child: Column(
          children: [
            // Logo and Slogan
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 4),
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3.5),
            SizedBox(height: mediaH / 30),

            // msg
            Container(
              alignment: Alignment.centerLeft,
              child: Text("送信後、弊社担当者よりメールにてご返信いたします", overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleOfUnderLogo),
            ),
            SizedBox(height: mediaH / 50),

            // Input
            CustomInputBar(titleName: "メッセージの種類:", backendPart: _buildMessageTypeInput(context)),
            SizedBox(height: mediaH / 50),

            // Input
            CustomInputBar(titleName: "メッセージボックス:", backendPart: _buildMessageBoxInput(context, mediaH, mediaW)),
            SizedBox(height: mediaH / 50),

            // button
            _buildNextButton(context)
          ],
        ),
      ),
    );
  }

  /// Message Type
  Widget _buildMessageTypeInput(BuildContext context) {
    return CustomInputFormBar(controller: msgTypeController, hintText: "ewqeqweqw");
  }

  /// Introduce
  Widget _buildMessageBoxInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: mediaW / 75)),
      height: mediaH / 5,
      controller: messageBoxController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
      contentPadding: EdgeInsets.symmetric(horizontal: mediaH / 200, vertical: mediaW / 50),
    );
  }
}

/// Next Button
Widget _buildNextButton(BuildContext context) {
  return CustomOutlinedButton(
    text: "送信",
    onPressed: () {
      onTapReturn(context);
    },
  );
}

onTapReturn(BuildContext context) {
  Navigator.pop(context);
}
