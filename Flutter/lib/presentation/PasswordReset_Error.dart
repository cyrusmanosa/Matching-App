import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class PasswordResetError extends StatelessWidget {
  PasswordResetError({Key? key}) : super(key: key);

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
                // logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: mediaQueryData.size.height / 50),

                // warning logo
                CustomImageView(imagePath: ImageConstant.imgWarning, height: 40, width: 50),
                SizedBox(height: 5.v),
                // warning message
                Container(
                  width: 300.h,
                  margin: EdgeInsets.only(left: 25.h, right: 25.h),
                  child: Text(
                    "ご確認ください\nメールアドレスを持つアカウントが見つかりません",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumOnPrimary,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // input
                CustomInputBar(titleName: "メールアドレス:", backendPart: _buildResetPasswordEmailInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // button
                CustomOutlinedButton(
                  width: mediaQueryData.size.width / 4,
                  height: mediaQueryData.size.height / 25,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleMedium!,
                ),
                SizedBox(height: mediaQueryData.size.height / 25),

                // msg
                SizedBox(
                  width: 300.h,
                  child: Text(
                    "ログインパスワードの再設定を行います。「送信する」ボタンを押してください。",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumblack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildResetPasswordEmailInput(BuildContext context) {
    return CustomInputFormBar(
      controller: emailController,
      hintText: "example@email.com",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
    );
  }
}

onTapPasswordResetButton(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.newPasswordSetup);
}
