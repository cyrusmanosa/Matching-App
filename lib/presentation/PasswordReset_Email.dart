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
                SizedBox(height: 57.v),
                Text(
                  "パスワード再設定",
                  style: theme.textTheme.headlineLarge!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 22.v),
                _buildEmailInputSection(context),
                SizedBox(height: 28.v),
                Container(
                  width: 356.h,
                  margin: EdgeInsets.only(
                    left: 3.h,
                    right: 10.h,
                  ),
                  child: Text(
                    "ご登録されているメールアドレスに認証キーを送します。\n「送信する」ボタンを押してください。",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumBlack900_1,
                  ),
                ),
                SizedBox(height: 14.v),
                CustomOutlinedButton(
                  height: 38.v,
                  width: 96.h,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleSmall!,
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
  Widget _buildEmailInputSection(BuildContext context) {
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
        ),
      ],
    );
  }
}
