import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_contact.pb.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController msgTypeController = TextEditingController();
  TextEditingController messageBoxController = TextEditingController();

  void createContact(BuildContext context) async {
    if (msgTypeController.text.isEmpty || messageBoxController.text.isEmpty) {
      await showErrorDialog(context, "正しく入力してください");
    } else {
      try {
        setState(() {
          showLoadDialog(context);
        });
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = CreateContactRequest(
          sessionID: apiKeyS,
          contactType: msgTypeController.text,
          message: messageBoxController.text,
          status: "Sended",
        );
        await GrpcInfoService.client.createContact(request);
        await showLogoDialog(context, "送信が完了しました。担当者よりご連絡いたします。", false);
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } on GrpcError {
        await showErrorDialog(context, "エラー：検証可能なメッセージの送信");
        throw Exception("データの取得中にエラーが発生しました。");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "", true),
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
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

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "送信",
      onPressed: () {
        createContact(context);
      },
    );
  }
}
