import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class PasswordResetEmail extends StatelessWidget {
  PasswordResetEmail({Key? key}) : super(key: key);

  TextEditingController passwordResetEmailController = TextEditingController();
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
                // Logo And Slogan
                CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 4),
                CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3),
                SizedBox(height: mediaQueryData.size.height / 50),

                // msg
                Container(
                  width: 356.h,
                  margin: EdgeInsets.only(left: 3.h, right: 10.h),
                  child: Text(
                    "ご登録されているメールアドレスに認証キーを送します。",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleOfUnderLogo,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Input
                CustomInputBar(titleName: "メールアドレス:", backendPart: _buildResetPasswordEmailInput(context)),
                SizedBox(height: 25.v),

                // button
                CustomOutlinedButton(
                  height: 40,
                  width: 95,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleMedium,
                  onPressed: () {
                    onTapPasswordResetButton(context);
                  },
                ),
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
      controller: passwordResetEmailController,
      hintText: "example@email.com",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      maxLines: 1,
    );
  }
}

/// PasswordResetEmail-Send
/// Send to Email for check user
onTapPasswordResetButton(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.newPasswordSetup);
}
