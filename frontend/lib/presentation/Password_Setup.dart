import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_password.pb.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class PasswordSetup extends StatefulWidget {
  PasswordSetup({Key? key}) : super(key: key);

  @override
  _PasswordSetupState createState() => _PasswordSetupState();
}

class _PasswordSetupState extends State<PasswordSetup> {
  TextEditingController passwordSetupController = TextEditingController();
  TextEditingController passwordSetupConfirmController = TextEditingController();

  void inputPasswordGrpcRequest(BuildContext context) async {
    if (passwordSetupController.text != passwordSetupConfirmController.text) {
      await showErrorDialog(context, "パスワード（確認）とパスワードは一致しません");
    } else if (isPureText(passwordSetupController.text) || isPureNumber(passwordSetupController.text)) {
      await showErrorDialog(context, "パスワードの組み合わせは英数字は必要です");
    } else if (passwordSetupController.text.length < 8) {
      await showErrorDialog(context, "パスワードの長さは 8 以上です。");
    } else {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = InputPasswordRequest(sessionID: apiKeyS, password: passwordSetupController.text);
        await GrpcInfoService.client.inputPassword(request);

        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：検証可能な入力データがありません。");
        throw Exception("パスワードの設定中にエラーが発生しました。");
      }
    }
  }

  bool passwordVisible = false;
  bool isPureText(String value) {
    final pattern = RegExp(r'^[a-zA-Z]+$');
    return pattern.hasMatch(value);
  }

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
          child: Column(
            children: [
              // Logo and Slogan
              CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 4.5),
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3.5),
              SizedBox(height: mediaH / 30),

              // New Password
              CustomInputBar(titleName: "パスワード", backendPart: _buildPasswordInput()),

              // msg
              Align(alignment: Alignment.centerLeft, child: Text("＊半角英数字の組合せ（8桁以上15桁以下）", style: CustomTextStyles.pwRulegrey500)),
              SizedBox(height: mediaH / 25),

              // New Password Confirm
              CustomInputBar(titleName: "パスワード（確認）", backendPart: _buildPasswordConfirm()),
              SizedBox(height: mediaH / 25),

              // Button
              _buildNextButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return CustomInputFormBar(
      controller: passwordSetupController,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      hintText: "Ankdl2332",
      obscureText: passwordVisible ? false : true,
      onTap: () {
        FocusNode().requestFocus();
      },
      suffix: IconButton(
        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordConfirm() {
    return CustomInputFormBar(
      controller: passwordSetupConfirmController,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      hintText: "Ankdl2332",
      obscureText: passwordVisible ? false : true,
      onTap: () {
        FocusNode().requestFocus();
      },
      suffix: IconButton(
        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      ),
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "設定",
      onPressed: () {
        inputPasswordGrpcRequest(context);
      },
    );
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
  }
}
