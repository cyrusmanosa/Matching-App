import 'dart:convert';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/rpc_password.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class PasswordSetup extends StatelessWidget {
  PasswordSetup({Key? key}) : super(key: key);

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
      onTapNextButton(context);
    }
  }

  // Grpc
  void inputPasswordGrpcRequest(BuildContext context) async {
    final request = InputPasswordRequest(
      sessionID: globalSessionID,
      password: passwordSetupController.text,
    );
    final response = await GrpcService.client.inputPassword(request);
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
      builder: (context) => AlertDialog(
        content: Text(errorMessage),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
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
                // Logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // Slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: mediaQueryData.size.height / 25),

                // New Password
                CustomInputBar(titleName: "パスワード", backendPart: _buildNewPasswordInput(context)),

                // msg
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text("＊半角英数字の組合せ（8桁以上15桁以下）", style: CustomTextStyles.bodyMediumgray500),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 25),

                // New Password Confirm
                CustomInputBar(titleName: "パスワード（確認）", backendPart: _buildNewPasswordConfirm(context)),
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
      controller: passwordSetupController,
      hintText: "Ankdl2332",
    );
  }

  /// Section Widget
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return CustomInputFormBar(
      controller: passwordSetupConfirmController,
      hintText: "Ankdl2332",
      textInputAction: TextInputAction.done,
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      height: 40,
      width: 95,
      text: "設定",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        if (passwordSetupController.text != passwordSetupConfirmController.text) {
          showErrorDialog(context, "Error: password not same");
        } else {
          inputPasswordGrpcRequest(context);
        }
      },
    );
  }

  /// Navigates to the okScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
  }
}
