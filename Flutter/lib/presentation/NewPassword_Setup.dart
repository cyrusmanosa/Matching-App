import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
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
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Logo and Slogan
                SizedBox(height: mediaQueryData.size.height / 30),
                CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 4),
                CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3.5),
                SizedBox(height: mediaQueryData.size.height / 30),

                // New Password
                CustomInputBar(titleName: "新しいパスワード", backendPart: _buildNewPasswordInput(context)),

                // msg
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: mediaQueryData.size.width / 100),
                    child: Text("＊半角英数字の組合せ（8桁以上15桁以下）", style: CustomTextStyles.pwRuleGray500),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 25),

                // New Password Confirm
                CustomInputBar(titleName: "新しいパスワード（確認）", backendPart: _buildNewPasswordConfirm(context)),
                SizedBox(height: mediaQueryData.size.height / 25),

                // Button
                _buildNextPageButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return CustomInputFormBar(
      controller: newPasswordSetupController,
      hintText: "Ankdl2332",
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: mediaQueryData.size.height / 25,
      text: "送信",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        onTapNextButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return CustomInputFormBar(
      controller: newPasswordSetupConfirmController,
      hintText: "Ankdl2332",
      textInputAction: TextInputAction.done,
    );
  }

  /// Navigates to the okScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPasswordDone);
  }
}
