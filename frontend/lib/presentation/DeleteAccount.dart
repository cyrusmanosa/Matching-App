import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/client/session_auth.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_contact.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class DeleteAccount extends StatefulWidget {
  DeleteAccount({super.key});
  @override
  _DeleteAccountPageState createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccount> {
  TextEditingController messageBoxController = TextEditingController();

  void createContact(BuildContext context) async {
    if (messageBoxController.text.isEmpty) {
      await showErrorDialog(context, "削除する理由は入力してください");
      return;
    }
    final sessionID = await globalSession.read(key: 'SessionId');
    if (sessionID == null || sessionID.isEmpty) {
      await showErrorDialog(context, "ログインし直してください。");
      return;
    }
    try {
      showLoadDialog(context);
      await GrpcInfoService.client.createContact(CreateContactRequest(
        sessionID: sessionID,
        contactType: "削除",
        message: messageBoxController.text,
        status: "Sended",
      ));
      await GrpcInfoService.client.deleteFix(DeleteFixRequest(sessionID: sessionID));
      await clearLocalLogin();
      if (!context.mounted) return;
      Navigator.pop(context);
      await showLogoDialog(context, "アカウントは削除しました。ご利用ありがとうございました。", true);
      await Future.delayed(const Duration(seconds: 1));
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
    } on GrpcError {
      if (!context.mounted) return;
      Navigator.pop(context);
      await showErrorDialog(context, "アカウントを削除できませんでした。");
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
                child: Text("アカウントを削除する理由を入力してください", overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleOfUnderLogo),
              ),
              SizedBox(height: mediaH / 50),

              // Input
              CustomInputBar(titleName: "削除の理由:", backendPart: _buildMessageBoxInput(context, mediaH, mediaW)),
              SizedBox(height: mediaH / 50),

              // button
              _buildNextButton(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Introduce
  Widget _buildMessageBoxInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: mediaW / 75)),
      height: mediaH / 5,
      controller: messageBoxController,
      hintText: "私はXXXです。。。。。",
      textInputAction: TextInputAction.done,
      maxLines: 8,
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
