import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfirmationCore extends StatelessWidget {
  ConfirmationCore({Key? key}) : super(key: key);

  TextEditingController confirmationCoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95, alignment: Alignment.center),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100, alignment: Alignment.center),
              SizedBox(height: 20.v),

              // Title
              Text("以下にコードを認証してください。", style: theme.textTheme.bodySmall),
              SizedBox(height: 15.v),

              // Input
              CustomInputBar(titleName: "認証コード:", backendPart: _buildConfirmationCoreInput(context)),
              SizedBox(height: 2.v),
              // reset password
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    onTapReturn(context);
                  },
                  child: Text("コードが届かない場合", style: CustomTextStyles.bodyMediumBlack900),
                ),
              ),
              SizedBox(height: 25.v),

              // button
              CustomOutlinedButton(
                alignment: Alignment.center,
                height: 40,
                width: 95,
                text: "認証",
                buttonTextStyle: theme.textTheme.titleSmall!,
                onPressed: () {
                  onTaptf(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Era
  Widget _buildConfirmationCoreInput(BuildContext context) {
    return CustomTextFormField(
      controller: confirmationCoreController,
      hintText: "423198",
      maxLines: 1,
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signupPhoneoremailPartoneScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_1);
  }
}
