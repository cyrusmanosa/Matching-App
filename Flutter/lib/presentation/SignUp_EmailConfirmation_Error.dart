import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EmailConfirmationError extends StatelessWidget {
  EmailConfirmationError({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // Slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: mediaQueryData.size.height / 25),

                //Warning Logo
                CustomImageView(imagePath: ImageConstant.imgWarning, height: 41.v, width: 49.h),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Warning Msg
                Container(
                  width: 340.h,
                  margin: EdgeInsets.symmetric(horizontal: 25.h),
                  child: Text(
                    "ご確認ください\nメールアドレスのフォーマットが正しくありません",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumOnPrimary,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // information note
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 350,
                    margin: EdgeInsets.only(left: 20.h, right: 33.h),
                    child: Text(
                      "・メールアドレスの受信確認が必須です。\n・ご登録済みのお客様は受信確認をお願いしております。",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumblack,
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Input
                CustomInputBar(titleName: "メールアドレス:", backendPart: _buildEmailInput(context)),
                SizedBox(height: mediaQueryData.size.height / 25),

                // send button
                CustomOutlinedButton(
                  height: 40,
                  width: 95,
                  text: "送信する",
                  buttonTextStyle: theme.textTheme.titleMedium!,
                  onPressed: () {
                    onTapNextButton(context);
                  },
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // 手続き
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 315,
                    child: Text(
                      "（この手続きは1回のみで、以降表示されません）",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumblack,
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
  Widget _buildEmailInput(BuildContext context) {
    return CustomInputFormBar(
      controller: emailController,
      hintText: "example@email.com",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Navigates to the error3Screen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }
}
