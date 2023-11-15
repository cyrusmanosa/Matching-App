import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class NewPasswordSetup extends StatelessWidget {
  NewPasswordSetup({Key? key}) : super(key: key);

  TextEditingController newPasswordSetupController = TextEditingController();
  TextEditingController newPasswordSetupConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
            child: Column(
              children: [
                // Logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // Slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: 30.v),

                // Title
                Text("新しいパスワード設定", style: CustomTextStyles.headlineSmallRoundedMplus1c.copyWith(decoration: TextDecoration.underline)),
                SizedBox(height: 20.v),

                // New Password
                CustomInputBar(titleName: "新しいパスワード", backendPart: _buildNewPasswordInput(context)),

                // msg
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text("＊半角英数字の組合せ（8桁以上15桁以下）", style: CustomTextStyles.bodyMediumgray500),
                  ),
                ),
                SizedBox(height: 30.v),

                // New Password Confirm
                CustomInputBar(titleName: "新しいパスワード（確認）", backendPart: _buildNewPasswordConfirm(context)),

                SizedBox(height: 40.v),

                // Button
                CustomOutlinedButton(
                    height: 40,
                    width: 95,
                    text: "設定",
                    buttonTextStyle: theme.textTheme.titleMedium,
                    onPressed: () {
                      onTaptf(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: newPasswordSetupController,
      hintText: "Ankdl2332",
    );
  }

  /// Section Widget
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return CustomTextFormField(
      controller: newPasswordSetupConfirmController,
      hintText: "Ankdl2332",
      textInputAction: TextInputAction.done,
    );
  }

  /// Navigates to the okScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPasswordDone);
  }
}
