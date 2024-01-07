import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class PasswordResetEmail extends StatelessWidget {
  PasswordResetEmail({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
        child: Column(
          children: [
            // Logo and Slogan
            SizedBox(height: mediaH / 15),
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
    );
  }

  /// _ResetPassword Email
  Widget _buildResetPasswordEmailInput(BuildContext context) {
    return CustomInputFormBar(controller: emailController, hintText: "example@email.com", textInputType: TextInputType.emailAddress);
  }
}

/// Next Button
Widget _buildNextButton(BuildContext context) {
  return CustomOutlinedButton(
    text: "送信",
    onPressed: () {
      onTapPasswordResetButton(context);
    },
  );
}

/// Send to Email for check user
onTapPasswordResetButton(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.newPasswordSetup);
}
