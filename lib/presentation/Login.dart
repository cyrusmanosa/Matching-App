import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
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
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: Column(
              children: [
                // Logo
                SizedBox(height: 50),

                CustomImageView(imagePath: ImageConstant.imgLogo, width: 150.h),
                SizedBox(height: 15.v),

                // Slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, width: 200.h),
                SizedBox(height: 20.v),

                // ID
                CustomInputBar(titleName: "ユーザーID:", backendPart: _buildEmailInput(context)),
                SizedBox(height: 15.v),

                // Password
                CustomInputBar(titleName: "パスワード:", backendPart: _buildPasswordInput(context)),
                SizedBox(height: 5.v),

                // reset password
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      onTapPasswordResetEmail(context);
                    },
                    child: Text("パスワードを忘れた場合", style: CustomTextStyles.bodyMediumBlack900),
                  ),
                ),
                SizedBox(height: 15.v),

                // login button
                CustomOutlinedButton(
                  height: 40,
                  width: 95,
                  text: "ログイン",
                  buttonTextStyle: theme.textTheme.titleSmall,
                  onPressed: () {
                    onTapLoginButton(context);
                  },
                ),
                SizedBox(height: 25.v),

                // or
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // line 1
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: SizedBox(width: 80, child: Divider()),
                    ),
                    // Word
                    Text("または", style: theme.textTheme.titleMedium),

                    // line 2
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: SizedBox(width: 80, child: Divider()),
                    ),
                  ],
                ),
                SizedBox(height: 25.v),

                // SignUp of Email
                CustomElevatedButton(
                  height: 50.v,
                  text: "メールアドレスで登録",
                  margin: EdgeInsets.symmetric(horizontal: 35.h),
                  buttonStyle: CustomButtonStyles.fillPink,
                  buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
                  onPressed: () {
                    onTapRegisterWithEmailButton(context);
                  },
                ),
                SizedBox(height: 15.v),

                // SignUp of Facebook
                CustomOutlinedButton(
                  height: 50.v,
                  text: "フェイスブックで続ける",
                  margin: EdgeInsets.symmetric(horizontal: 35.h),
                  leftIcon: Container(
                    margin: EdgeInsets.only(left: 25.h, right: 35.h),
                    child: CustomImageView(imagePath: ImageConstant.imgLogosfacebook, width: 20.v),
                  ),
                  buttonStyle: CustomButtonStyles.outlineBlueBlueBG,
                  buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
                ),
                SizedBox(height: 15.v),

                // SignUp of Twitter
                CustomOutlinedButton(
                  height: 50.v,
                  text: "ツイッターで続ける",
                  margin: EdgeInsets.symmetric(horizontal: 35.h),
                  leftIcon: Container(
                    margin: EdgeInsets.only(left: 2, right: 30.h),
                    child: CustomImageView(imagePath: ImageConstant.imgClose, width: 35.v),
                  ),
                  buttonStyle: CustomButtonStyles.outlineBlackDGBG,
                  buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
                ),
                SizedBox(height: 15.v),

                // SignUp of Google
                CustomOutlinedButton(
                  height: 50.v,
                  text: "グーグルで続ける",
                  margin: EdgeInsets.symmetric(horizontal: 35.h),
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 35.h),
                    child: CustomImageView(imagePath: ImageConstant.imgDevicongoogle, width: 35.v),
                  ),
                  buttonStyle: CustomButtonStyles.outlineGrayWhiteBG,
                  buttonTextStyle: TextStyle(color: appTheme.gray800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Email Input Backend
  Widget _buildEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailInputController,
      textInputType: TextInputType.emailAddress,
      hintText: "example@email.com",
      maxLines: 1,
    );
  }

  /// Password Input Backend
  Widget _buildPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: passwordInputController,
      hintText: "Secret",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      maxLines: 1,
    );
  }

  /// Login
  onTapLoginButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.containerScreen);
  }

  /// PasswordResetEmail
  onTapPasswordResetEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordResetEmail);
  }

  /// EmailConfirmation
  onTapRegisterWithEmailButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.emailConfirmation);
  }
}
