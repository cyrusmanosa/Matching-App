import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ConfirmationCoreError extends StatelessWidget {
  const ConfirmationCoreError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 47.h, top: 65.v, right: 47.h),
          child: Column(
            children: [
              // logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
              SizedBox(height: 30.v),

              // Error icon
              CustomImageView(imagePath: ImageConstant.imgWarning, height: 41.v, width: 49.h),
              SizedBox(height: 6.v),

              // Error Slogan
              SizedBox(
                width: 336.h,
                child: Text(
                  "ご確認ください\nこのメールアドレスの認証コードが正しくありません",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumOnPrimary,
                ),
              ),

              // Title
              Align(alignment: Alignment.centerLeft, child: Text("認証コードを送信しました", style: CustomTextStyles.headlineSmallRoundedMplus1c)),
              Text("以下にコードを入力してメールアドレスを認証してください。", style: theme.textTheme.bodySmall),
              SizedBox(height: 10.v),

              // Input
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: 35.h),
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
              ),
              SizedBox(height: 2.v),

              // Have not Code
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text("コードが届かない場合", style: CustomTextStyles.bodyMediumBlack900),
                ),
              ),
              SizedBox(height: 24.v),

              // Button
              CustomOutlinedButton(
                height: 38.v,
                width: 96.h,
                text: "認証",
                buttonTextStyle: theme.textTheme.titleSmall!,
                onPressed: () {
                  onTaptf(context);
                },
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_1);
  }
}
