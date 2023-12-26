import 'dart:convert';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/rpc_password.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

class NewPasswordSetup extends StatefulWidget {
  NewPasswordSetup({Key? key}) : super(key: key);

  @override
  _NewPasswordSetupState createState() => _NewPasswordSetupState();
}

class _NewPasswordSetupState extends State<NewPasswordSetup> {
  TextEditingController newPasswordSetupController = TextEditingController();
  TextEditingController newPasswordSetupConfirmController = TextEditingController();

  get http => null;

  // Http
  void resetPasswordHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/ChangePassword";
    var requestBody = {
      "session_id": globalSessionID,
      "password": newPasswordSetupController.text,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapNextButton(context);
    }
  }

  // Grpc
  void resetPasswordGrpcRequest(BuildContext context) async {
    final request = ResetPasswordRequest(
      sessionID: globalSessionID,
      password: newPasswordSetupController.text,
    );
    final response = await GrpcService.client.resetPassword(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextButton(context);
    } else {
      showErrorDialog(context, "Error: validatable input data");
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
              alignment: Alignment.center,
              text: "OK",
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
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Logo and Slogan
                SizedBox(height: mediaQueryData.size.height / 15),
                CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 4),
                CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3.5),
                SizedBox(height: mediaQueryData.size.height / 30),

                // New Password
                CustomInputBar(titleName: "新しいパスワード", backendPart: _buildNewPasswordInput(context)),

                // msg
                Align(alignment: Alignment.centerLeft, child: Text("＊半角英数字の組合せ（8桁以上15桁以下）", style: CustomTextStyles.pwRuleGray500)),
                SizedBox(height: mediaQueryData.size.height / 25),

                // New Password Confirm
                CustomInputBar(titleName: "新しいパスワード（確認）", backendPart: _buildNewPasswordConfirm(context)),
                SizedBox(height: mediaQueryData.size.height / 25),

                // Button
                _buildNextPageButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return CustomInputFormBar(
      controller: newPasswordSetupController,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      hintText: "Ankdl2332",
      obscureText: passwordVisible ? false : true,
      maxLines: 1,
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
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return CustomInputFormBar(
      controller: newPasswordSetupConfirmController,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      hintText: "Ankdl2332",
      obscureText: passwordVisible ? false : true,
      maxLines: 1,
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
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: mediaQueryData.size.height / 25,
      text: "設定",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        if (newPasswordSetupController.text != newPasswordSetupConfirmController.text) {
          showErrorDialog(context, "パスワード（確認）とパスワードが一致しません");
        } else if (isPureText(newPasswordSetupController.text) || isPureNumber(newPasswordSetupController.text)) {
          showErrorDialog(context, "パスワードの組み合わせは英数字が必要です");
        } else {
          resetPasswordGrpcRequest(context);
        }
      },
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the okScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPasswordDone);
  }
}
