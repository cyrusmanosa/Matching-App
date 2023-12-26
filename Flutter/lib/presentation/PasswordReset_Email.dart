import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class PasswordResetEmail extends StatelessWidget {
  PasswordResetEmail({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Logo and Slogan
                SizedBox(height: mediaQueryData.size.height / 15),
                CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 4),
                CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3.5),
                SizedBox(height: mediaQueryData.size.height / 50),

                // msg
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("ご登録されているメールアドレスに認証キーを送します", overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleOfUnderLogo),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Input
                CustomInputBar(titleName: "メールアドレス:", backendPart: _buildResetPasswordEmailInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // button
                _buildNextPageButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// _ResetPassword Email
  Widget _buildResetPasswordEmailInput(BuildContext context) {
    return CustomInputFormBar(
      controller: emailController,
      hintText: "example@email.com",
      textInputType: TextInputType.emailAddress,
    );
  }
}

/// Next Button
Widget _buildNextPageButton(BuildContext context) {
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
