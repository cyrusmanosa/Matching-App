import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
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
            padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
            child: Column(
              children: [
                // logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: 15.v),

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
                SizedBox(height: 20.v),

                // input
                CustomInputBar(titleName: "メールアドレス:", backendPart: _buildResetPasswordEmailInput(context)),
                SizedBox(height: 15.v),

                // button
                CustomOutlinedButton(
                  height: 40,
                  width: 95,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleSmall!,
                ),
                SizedBox(height: 40.v),

                // msg
                SizedBox(
                  width: 300.h,
                  child: Text(
                    "ログインパスワードの再設定を行います。「送信する」ボタンを押してください。",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumBlack900,
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
    return CustomTextFormField(
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
