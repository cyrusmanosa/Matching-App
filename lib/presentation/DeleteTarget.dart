import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DeleteTarget extends StatelessWidget {
  DeleteTarget({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildHeader(context),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillPrimary,
          child: Column(
            children: [
              CustomImageView(imagePath: ImageConstant.imgSliderfortargetchange, height: 650.v, width: 430.h),
              SizedBox(height: 5.v),
              CustomOutlinedButton(
                width: 150.h,
                text: "削除",
                buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
                onPressed: () {
                  onTaptf(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
        centerTitle: true, title: AppbarTitle(text: "ターゲットを削除", margin: EdgeInsets.only(top: 59.v, bottom: 11.v)), styleType: Style.bgFill);
  }

  /// Navigates to the warnningOfDeletePageScreen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.warningDeleteUser);
  }
}
