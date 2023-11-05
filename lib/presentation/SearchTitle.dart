import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class searchTitle extends StatelessWidget {
  const searchTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: 81.v,
                      width: 95.h),
                  SizedBox(height: 1.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgSlogan,
                      height: 17.v,
                      width: 100.h),
                  SizedBox(height: 19.v),
                  Text("探すターゲットの種類",
                      style: CustomTextStyles.headlineMediumBlack900_1),
                  SizedBox(height: 26.v),
                  CustomElevatedButton(
                      text: "趣味",
                      onPressed: () {
                        onTaptf(context);
                      }),
                  SizedBox(height: 30.v),
                  CustomElevatedButton(
                      text: "恋人",
                      buttonStyle: CustomButtonStyles.fillPink,
                      onPressed: () {
                        onTaptf1(context);
                      }),
                  SizedBox(height: 30.v),
                  CustomElevatedButton(
                      text: "お相伴",
                      buttonStyle: CustomButtonStyles.fillRedA,
                      onPressed: () {
                        onTaptf2(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the k23Screen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.HobbyCondition);
  }

  /// Navigates to the k27Screen when the action is triggered.
  onTaptf1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.LoverConditions);
  }

  /// Navigates to the k29Screen when the action is triggered.
  onTaptf2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.CompanionshipConditions);
  }
}
