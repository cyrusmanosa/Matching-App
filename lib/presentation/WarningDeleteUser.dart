import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class WarningDeleteUser extends StatelessWidget {
  const WarningDeleteUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 15.h, top: 202.v, right: 15.h),
                child: Column(children: [SizedBox(height: 5.v), _buildWarningDelete(context)]))));
  }

  /// Section Widget
  Widget _buildWarningDelete(BuildContext context) {
    return Container(
        width: 400.h,
        padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 19.v),
        decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("警告", style: theme.textTheme.headlineLarge),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("一旦、確認するボタンを押したら、ご選択のユーザーを削除しましたので、もう一度お確認してください", style: CustomTextStyles.bodyLargeBlack900)),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              height: 38.v,
              width: 96.h,
              text: "削除確認",
              buttonTextStyle: theme.textTheme.titleSmall!,
              onPressed: () {
                onTaptf(context);
              }),
          SizedBox(height: 13.v)
        ]));
  }

  /// Navigates to the k12Screen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newTargetReady);
  }
}
