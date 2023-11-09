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
              SizedBox(height: 55.v),

              // Title
              Text(
                "新しいパスワード設定",
                style: theme.textTheme.headlineLarge!
                    .copyWith(decoration: TextDecoration.underline),
              ),
              SizedBox(height: 25.v),

              // Input 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("新しいパスワード:", style: theme.textTheme.titleLarge),
                  _buildNewPasswordInput(context),
                ],
              ),

              // msg
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text("＊半角英数字の組合せ（8桁以上15桁以下）",
                      style: CustomTextStyles.bodyMediumgray500),
                ),
              ),
              SizedBox(height: 23.v),

              // Input 2
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("新しいパスワード（確認）:", style: theme.textTheme.titleLarge),
                  _buildNewPasswordConfirm(context),
                ],
              ),
              SizedBox(height: 23.v),

              // Button
              CustomOutlinedButton(
                  height: 38.v,
                  width: 96.h,
                  text: "設定",
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    onTaptf(context);
                  }),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: zipcodeController,
      hintText: "423198",
    );
  }

  /// Section Widget
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return CustomTextFormField(
      controller: zipcodeController1,
      hintText: "423198",
      textInputAction: TextInputAction.done,
    );
  }

  /// Navigates to the okScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPasswordDone);
  }
}
