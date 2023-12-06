import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class ConfirmationCore extends StatelessWidget {
  ConfirmationCore({Key? key}) : super(key: key);

  TextEditingController confirmationCoreController = TextEditingController();

  void checkcodeRequset(BuildContext context) async {
    var url = "http://127.0.0.1:8080/SignUpCheckCode";
    var requestBody = {"checkcode": confirmationCoreController.text};
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      onTaptf(context);
    } else {
      print("checkcode:");
      print(confirmationCoreController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95, alignment: Alignment.center),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100, alignment: Alignment.center),
              SizedBox(height: 20.v),

              // Title
              Text("以下にコードを認証してください。", style: theme.textTheme.bodySmall),
              SizedBox(height: 15.v),

              // Input
              CustomInputBar(titleName: "認証コード:", backendPart: _buildConfirmationCoreInput(context)),
              SizedBox(height: 2.v),
              // reset password
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    checkcodeRequset(context);
                  },
                  child: Text("コードが届かない場合", style: CustomTextStyles.bodyMediumBlack900),
                ),
              ),
              SizedBox(height: 25.v),

              // button
              CustomOutlinedButton(
                alignment: Alignment.center,
                height: 40,
                width: 95,
                text: "認証",
                buttonTextStyle: theme.textTheme.titleSmall!,
                onPressed: () {
                  onTaptf(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Era
  Widget _buildConfirmationCoreInput(BuildContext context) {
    return CustomTextFormField(
      controller: confirmationCoreController,
      hintText: "423198",
      maxLines: 1,
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signupPhoneoremailPartoneScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_1);
  }
}
