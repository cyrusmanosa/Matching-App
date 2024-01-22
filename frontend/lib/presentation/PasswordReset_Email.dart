import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_ResetPasswordEmail.pb.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

// ignore: must_be_immutable, camel_case_types
class PasswordResetEmail extends StatelessWidget {
  PasswordResetEmail({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> emailResetPW(BuildContext context) async {
    if (!isEmailValid(emailController.text)) {
      await showErrorDialog(context, "無効なメールアドレス");
    }
    try {
      showLoadDialog(context);
      final req = ResetPwEmailRequest(email: emailController.text);
      final rsp = await GrpcInfoService.client.emailResetPassword(req);
      if (rsp.status == "ok") {
        Navigator.pop(context);
        await globalemail.write(key: 'email', value: '${rsp.link}');
        showLogoDialog(context, "メールアドレスをチェックしてください。", false);
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
      } else {
        showErrorDialog(context, "メールアドレスは誤りがあります。");
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
      }
    } on GrpcError {
      showErrorDialog(context, "メールアドレスは誤りがあります。");
      throw Exception("ログインの取得中にエラーが発生しました。");
    }
    Navigator.pop(context);
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
                child: Text("ご登録されているメールアドレスに認証キーを送します", overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleOfUnderLogo),
              ),
              SizedBox(height: mediaH / 50),

              // Input
              CustomInputBar(titleName: "メールアドレス:", backendPart: _buildResetPasswordEmailInput(context)),
              SizedBox(height: mediaH / 50),

              // button
              _buildNextButton(context)
            ],
          ),
        ),
      ),
    );
  }

  /// _ResetPassword Email
  Widget _buildResetPasswordEmailInput(BuildContext context) {
    return CustomInputFormBar(controller: emailController, hintText: "example@email.com", textInputType: TextInputType.emailAddress);
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "送信",
      onPressed: () {
        emailResetPW(context);
      },
    );
  }
}
