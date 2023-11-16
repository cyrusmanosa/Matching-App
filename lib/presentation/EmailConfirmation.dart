import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EmailConfirmation extends StatelessWidget {
  EmailConfirmation({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          // body: Form(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
            child: Column(
              children: [
                // Logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: 15.v),

                // information note
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 350,
                    margin: EdgeInsets.only(left: 20.h, right: 33.h),
                    child: Text(
                      "・メールアドレスの受信確認が必須です。\n・ご登録済みのお客様は受信確認をお願いしております。",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumBlack900,
                    ),
                  ),
                ),
                SizedBox(height: 20.v),

                // input
                CustomInputBar(titleName: "メールアドレス", backendPart: _buildEmailInputSection(context)),
                SizedBox(height: 30.v),

                // send button
                CustomOutlinedButton(
                  height: 40,
                  width: 95,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    onTaptf(context);
                  },
                ),
                SizedBox(height: 20.v),

                // 手続き
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 315,
                    child: Text(
                      "（この手続きは1回のみで、以降表示されません）",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumBlack900,
                    ),
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
  Widget _buildEmailInputSection(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "  example@email.com",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      maxLines: 1,
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.confirmationCore);
  }
}
