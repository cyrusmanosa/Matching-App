import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class passwordResetError extends StatelessWidget {
  passwordResetError({Key? key})
      : super(
          key: key,
        );

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
                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 81.v,
                  width: 95.h,
                ),
                SizedBox(height: 1.v),
                CustomImageView(
                  imagePath: ImageConstant.imgSlogan,
                  height: 17.v,
                  width: 100.h,
                ),
                SizedBox(height: 8.v),
                CustomImageView(
                  imagePath: ImageConstant.imgWarning,
                  height: 41.v,
                  width: 49.h,
                ),
                SizedBox(height: 6.v),
                Container(
                  width: 322.h,
                  margin: EdgeInsets.only(
                    left: 23.h,
                    right: 25.h,
                  ),
                  child: Text(
                    "ご確認ください\nメールアドレスを持つアカウントが見つかりません",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumOnPrimary,
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  "パスワード再設定",
                  style: theme.textTheme.displaySmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 16.v),
                _buildEmailInput(context),
                SizedBox(height: 16.v),
                CustomOutlinedButton(
                  height: 38.v,
                  width: 96.h,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleSmall!,
                ),
                SizedBox(height: 38.v),
                SizedBox(
                  width: 258.h,
                  child: Text(
                    "ログインパスワードの再設定を行います。\n「送信する」ボタンを押してください。",
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

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "メールアドレス:",
          style: theme.textTheme.titleLarge,
        ),
        CustomTextFormField(
          controller: emailController,
          hintText: "example@email.com",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
          decoration: InputDecoration(),
          children: [],
        ),
      ],
    );
  }
}
