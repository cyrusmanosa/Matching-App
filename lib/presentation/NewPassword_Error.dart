import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class NewPasswordError extends StatelessWidget {
  NewPasswordError({Key? key}) : super(key: key);

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
              SizedBox(height: 7.v),
              Container(
                width: 336.h,
                margin: EdgeInsets.symmetric(horizontal: 17.h),
                child: Text(
                  "ご確認ください\n新しいパスワードのフォーマットが正しくありません",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumOnPrimary,
                ),
              ),
              SizedBox(height: 9.v),
              Text(
                "新しいパスワード設定",
                style: theme.textTheme.headlineLarge!.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              _buildNewPasswordInput(context),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "＊半角英数字の組合せ（8桁以上15桁以下）",
                    style: CustomTextStyles.bodyMediumGray50002,
                  ),
                ),
              ),
              SizedBox(height: 23.v),
              _buildNewPasswordConfirm(context),
              SizedBox(height: 23.v),
              CustomOutlinedButton(
                height: 38.v,
                width: 96.h,
                text: "設定",
                buttonTextStyle: theme.textTheme.titleSmall!,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "新しいパスワード:",
          style: theme.textTheme.titleLarge,
        ),
        CustomTextFormField(
          controller: zipcodeController,
          hintText: "423198",
          decoration: InputDecoration(),
          children: [],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildNewPasswordConfirm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "新しいパスワード（確認）:",
          style: theme.textTheme.titleLarge,
        ),
        CustomTextFormField(
          controller: zipcodeController1,
          hintText: "423198",
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(),
          children: [],
        ),
      ],
    );
  }
}
