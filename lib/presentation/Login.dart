import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_elevated_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

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
                    child: Column(children: [
                      // Logo and Name
                      SizedBox(height: 45),
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo, width: 160.h),
                      SizedBox(height: 3.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgSlogan, width: 210.h),

                      // ID
                      SizedBox(height: 20.v),
                      _buildEmailInput1(context),

                      // Password
                      SizedBox(height: 13.v),
                      _buildPasswordInput1(context),

                      // reset password
                      SizedBox(height: 8.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtWidget(context);
                              },
                              child: Text("パスワードを忘れた場合",
                                  style: CustomTextStyles.bodyMediumBlack900))),

                      // login button
                      SizedBox(height: 14.v),
                      _buildLoginButton(context),
                      SizedBox(height: 20.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 12.v, bottom: 8.v),
                                child: SizedBox(width: 81.h, child: Divider())),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("または",
                                    style: theme.textTheme.titleMedium)),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 12.v, bottom: 8.v),
                                child: SizedBox(width: 81.h, child: Divider()))
                          ]),

                      // SignUp of Email
                      SizedBox(height: 30.v),
                      _buildRegisterWithEmailButton(context),

                      // SignUp of Facebook
                      SizedBox(height: 9.v),
                      _buildContinueWithFacebookButton(context),

                      // SignUp of Twitter
                      SizedBox(height: 13.v),
                      _buildContinueWithTwitterButton(context),

                      // SignUp of Google
                      SizedBox(height: 9.v),
                      _buildContinueWithGoogleButton(context),
                    ])))));
  }

  /// Email Input Backend
  Widget _buildEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailInputController,
      textInputType: TextInputType.emailAddress,
      hintText: "example@email.com",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Email Input
  Widget _buildEmailInput1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ユーザーID:", style: theme.textTheme.titleLarge),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: _buildEmailInput(context),
        ),
      ],
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
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Password Input
  Widget _buildPasswordInput1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("パスワード:", style: theme.textTheme.titleLarge),
      _buildPasswordInput(context)
    ]);
  }

  /// Login Button
  Widget _buildLoginButton(BuildContext context) {
    return CustomOutlinedButton(
        height: 38.v,
        width: 96.h,
        text: "ログイン",
        buttonTextStyle: theme.textTheme.titleSmall!,
        onPressed: () {
          onTapLoginButton(context);
        });
  }

  /// SignUp of Email Backend
  Widget _buildRegisterWithEmailButton(BuildContext context) {
    return CustomElevatedButton(
        height: 50.v,
        text: "メールアドレスで登録",
        margin: EdgeInsets.symmetric(horizontal: 35.h),
        buttonStyle: CustomButtonStyles.fillPinkA,
        buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
        onPressed: () {
          onTapRegisterWithEmailButton(context);
        });
  }

  /// SignUp of facebook Backend
  Widget _buildContinueWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
        height: 50.v,
        text: "フェイスブックで続ける",
        margin: EdgeInsets.symmetric(horizontal: 35.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 15.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLogosfacebook, width: 42.v)),
        buttonStyle: CustomButtonStyles.outlineBlue,
        buttonTextStyle: CustomTextStyles.bodyMediumPrimary);
  }

  /// SignUp of twtter Backend
  Widget _buildContinueWithTwitterButton(BuildContext context) {
    return CustomOutlinedButton(
        height: 50.v,
        text: "ツイッターで続ける",
        margin: EdgeInsets.symmetric(horizontal: 35.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgClose, width: 34.v)),
        buttonStyle: CustomButtonStyles.outlineOnErrorContainer,
        buttonTextStyle: CustomTextStyles.bodyMediumPrimary);
  }

  /// SignUp of google Backend
  Widget _buildContinueWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
        height: 50.v,
        text: "グーグルで続ける",
        margin: EdgeInsets.symmetric(horizontal: 35.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgDevicongoogle, width: 34.v)),
        buttonStyle: CustomButtonStyles.outlineGray,
        buttonTextStyle: CustomTextStyles.bodyMediumGray700);
  }

  /// PasswordResetEmail
  onTapTxtWidget(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.PasswordResetEmail);
  }

  /// Home
  onTapLoginButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.Home);
  }

  /// EmailConfirmation
  onTapRegisterWithEmailButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.EmailConfirmation);
  }
}
