import 'dart:convert';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_password.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;

class PasswordSetup extends StatefulWidget {
  PasswordSetup({Key? key}) : super(key: key);

  @override
  _PasswordSetupState createState() => _PasswordSetupState();
}

class _PasswordSetupState extends State<PasswordSetup> {
  TextEditingController passwordSetupController = TextEditingController();
  TextEditingController passwordSetupConfirmController = TextEditingController();

  // Http
  void inputPasswordHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/InputPassword";
    var requestBody = {
      "session_id": globalSessionID,
      "password": passwordSetupController.text,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapNextPage(context);
    }
  }

  // Grpc
  void inputPasswordGrpcRequest(BuildContext context) async {
    if (passwordSetupController.text != passwordSetupConfirmController.text) {
      showErrorDialog(context, "パスワード（確認）とパスワードは一致しません");
    } else if (isPureText(passwordSetupController.text) || isPureNumber(passwordSetupController.text)) {
      showErrorDialog(context, "パスワードの組み合わせは英数字は必要です");
    } else if (passwordSetupController.text.length < 8) {
      showErrorDialog(context, "パスワードの長さは 8 以上です。");
    } else {
      try {
        final request = InputPasswordRequest(sessionID: globalSessionID, password: passwordSetupController.text);
        await GrpcInfoService.client.inputPassword(request);
        onTapNextPage(context);
      } on GrpcError catch (e) {
        showErrorDialog(context, "Error: ${e.codeName}");
      }
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          // Error Logo
          title: CustomImageView(
            imagePath: ImageConstant.imgWarning,
            height: mediaQueryData.size.height / 20,
            width: mediaQueryData.size.width / 10,
            alignment: Alignment.center,
          ),

          // Word
          content: Container(
            width: mediaQueryData.size.width / 1.1,
            child: Text(errorMessage, style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
          ),
          actions: [
            CustomOutlinedButton(
              text: "OK",
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: mediaQueryData.size.height / 100),
              onPressed: () {
                onTapReturn(context);
              },
            ),
          ],
        );
      },
    );
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
          child: Column(
            children: [
              // Logo and Slogan
              SizedBox(height: mediaQueryData.size.height / 15),
              CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 3.5),
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3),
              SizedBox(height: mediaQueryData.size.height / 30),

              // New Password
              CustomInputBar(titleName: "パスワード", backendPart: _buildPasswordInput(context)),

              // msg
              Align(alignment: Alignment.centerLeft, child: Text("＊半角英数字の組合せ（8桁以上15桁以下）", style: CustomTextStyles.pwRuleGray500)),
              SizedBox(height: mediaQueryData.size.height / 25),

              // New Password Confirm
              CustomInputBar(titleName: "パスワード（確認）", backendPart: _buildPasswordConfirm(context)),
              SizedBox(height: mediaQueryData.size.height / 25),

              // Button
              _buildNextButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return CustomInputFormBar(
      controller: passwordSetupController,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      hintText: "Ankdl2332",
      obscureText: passwordVisible ? false : true,
      focusNode: FocusNode(),
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
  Widget _buildPasswordConfirm(BuildContext context) {
    return CustomInputFormBar(
      controller: passwordSetupConfirmController,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      hintText: "Ankdl2332",
      obscureText: passwordVisible ? false : true,
      focusNode: FocusNode(),
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

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
  }
}
