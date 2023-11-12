import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ConfirmationCore extends StatelessWidget {
  const ConfirmationCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 47.h, top: 65.v, right: 47.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95, alignment: Alignment.center),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100, alignment: Alignment.center),
              SizedBox(height: 15.v),

              // Title
              Text("認証コードを送信しました", style: CustomTextStyles.headlineSmallRoundedMplus1c),
              SizedBox(height: 1.v),
              Text("以下にコードを入力してメールアドレスを認証してください。", style: theme.textTheme.bodySmall),
              SizedBox(height: 15.v),

              // Input
              Padding(
                padding: EdgeInsets.only(right: 36.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("認証コード:", style: theme.textTheme.titleLarge),
                    Container(
                      width: 300.h,
                      padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 6.v),
                      decoration: AppDecoration.outlinePinkA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: Text("423198", style: theme.textTheme.bodyLarge),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.v),

              Text(
                "コードが届かない場合",
                style: CustomTextStyles.bodyMediumBlack900,
              ),
              SizedBox(height: 24.v),

              // button
              CustomOutlinedButton(
                  height: 38.v,
                  width: 96.h,
                  text: "認証",
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    onTaptf(context);
                  },
                  alignment: Alignment.center),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the signupPhoneoremailPartoneScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_1);
  }
}
