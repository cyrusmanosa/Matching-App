import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_Input_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EmailConfirmation extends StatelessWidget {
  EmailConfirmation({Key? key}) : super(key: key);
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
            padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
            child: Column(
              children: [
                // Logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: 20.v),

                // Title
                Text("メールアドレスを登録", style: CustomTextStyles.headlineSmallRoundedMplus1c.copyWith(decoration: TextDecoration.underline)),
                SizedBox(height: 15.v),

                // input
                CustomInputBar(titleName: "メールアドレス", backendPart: _buildEmailInputSection(context)),
                SizedBox(height: 40.v),

                // send button
                CustomOutlinedButton(
                  height: 40,
                  width: 95,
                  text: "送信する",
                  margin: EdgeInsets.only(left: 130.h),
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    onTaptf(context);
                  },
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 40.v),

                // information note
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 315,
                    margin: EdgeInsets.only(left: 20.h, right: 33.h),
                    child: Text(
                      "・メールアドレスの受信確認が必須です。\n・ご登録済みのお客様にもメールアドレス受信確認をお\n    願いしております。",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumBlack900,
                    ),
                  ),
                ),
                // 手続き
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 315,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "\n（この手続きは1回のみで、以降表示されません）",
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
