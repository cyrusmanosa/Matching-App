import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class NewPasswordSetup extends StatelessWidget {
  NewPasswordSetup({Key? key}) : super(key: key);

  TextEditingController zipcodeController = TextEditingController();

  TextEditingController zipcodeController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: 81.v,
                      width: 95.h),
                  SizedBox(height: 1.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgSlogan,
                      height: 17.v,
                      width: 100.h),
                  SizedBox(height: 55.v),
                  Text("新しいパスワード設定",
                      style: theme.textTheme.headlineLarge!
                          .copyWith(decoration: TextDecoration.underline)),
                  SizedBox(height: 26.v),
                  _buildNewPasswordInput(context),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Text("＊半角英数字の組合せ（8桁以上15桁以下）",
                              style: CustomTextStyles.bodyMediumgray500))),
                  SizedBox(height: 23.v),
                  _buildNewPasswordConfirm(context),
                  SizedBox(height: 23.v),
                  CustomOutlinedButton(
                      height: 38.v,
                      width: 96.h,
                      text: "設定",
                      buttonTextStyle: theme.textTheme.titleSmall!,
                      onPressed: () {
                        onTaptf(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("新しいパスワード:", style: theme.textTheme.titleLarge),
      CustomTextFormField(
        controller: zipcodeController,
        hintText: "423198",
      )
    ]);
  }

  /// Section Widget
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("新しいパスワード（確認）:", style: theme.textTheme.titleLarge),
      CustomTextFormField(
        controller: zipcodeController1,
        hintText: "423198",
        textInputAction: TextInputAction.done,
      )
    ]);
  }

  /// Navigates to the okScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPasswordDone);
  }
}
