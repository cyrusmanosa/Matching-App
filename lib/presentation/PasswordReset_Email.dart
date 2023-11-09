import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
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
            padding: EdgeInsets.only(
              left: 30.h,
              top: 65.v,
              right: 30.h,
            ),
            child: Column(
              children: [
                // Logo
                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 80,
                  width: 95,
                ),
                SizedBox(height: 1.v),
                // Slogan
                CustomImageView(
                  imagePath: ImageConstant.imgSlogan,
                  height: 17,
                  width: 100,
                ),
                SizedBox(height: 50.v),

                // Title
                Text(
                  "パスワード再設定",
                  style: theme.textTheme.headlineLarge!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 20.v),

                // Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "メールアドレス:",
                      style: theme.textTheme.titleLarge,
                    ),
                    _buildResetPasswordEmailInput(context),
                  ],
                ),
                SizedBox(height: 25.v),

                // button
                CustomOutlinedButton(
                  height: 38.v,
                  width: 96.h,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    onTapPasswordResetButton(context);
                  },
                ),
                SizedBox(height: 20.v),

                // msg
                Container(
                  width: 356.h,
                  margin: EdgeInsets.only(left: 3.h, right: 10.h),
                  child: Text(
                    "ご登録されているメールアドレスに認証キーを送します。\n「送信する」ボタンを押してください。",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumBlack900_1,
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// _ResetPassword Email
  Widget _buildResetPasswordEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "example@email.com",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
    );
  }
}

/// PasswordResetEmail-Send
/// Send to Email for check user
onTapPasswordResetButton(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.newPasswordSetup);
}
