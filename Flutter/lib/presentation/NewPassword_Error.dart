import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable, camel_case_types
class NewPasswordError extends StatelessWidget {
  NewPasswordError({Key? key}) : super(key: key);

  TextEditingController newPasswordSetupController = TextEditingController();
  TextEditingController newPasswordSetupConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
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
                width: 340.h,
                margin: EdgeInsets.symmetric(horizontal: 25.h),
                child: Text(
                  "ご確認ください\n新しいパスワードのフォーマットが正しくありません",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumOnPrimary,
                ),
              ),
              SizedBox(height: 20.v),

              // input 1
              CustomInputBar(titleName: "新しいパスワード:", backendPart: _buildNewPasswordSetupInput(context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "＊半角英数字の組合せ（8桁以上15桁以下）",
                    style: CustomTextStyles.bodyMediumgray500,
                  ),
                ),
              ),
              SizedBox(height: 30.v),

              // input 2
              CustomInputBar(titleName: "新しいパスワード（確認）:", backendPart: _buildNewPasswordSetupConfirm(context)),
              SizedBox(height: 40.v),

              // button
              CustomOutlinedButton(
                height: 40,
                width: 95,
                text: "設定",
                buttonTextStyle: theme.textTheme.titleSmall!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewPasswordSetupInput(BuildContext context) {
    return CustomTextFormField(
      controller: newPasswordSetupController,
      hintText: "ASD423198",
    );
  }

  /// Section Widget
  Widget _buildNewPasswordSetupConfirm(BuildContext context) {
    return CustomTextFormField(
      controller: newPasswordSetupConfirmController,
      hintText: "ASD423198",
      textInputAction: TextInputAction.done,
    );
  }
}
