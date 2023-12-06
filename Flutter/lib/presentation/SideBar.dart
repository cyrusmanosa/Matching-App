import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_sideBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 310.h,
          height: 850,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 80.v),
            decoration: AppDecoration.outlineDarkBlue9001,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // add date
                Text("2023-11-01から", style: TextStyle(color: appTheme.gray800)),
                SizedBox(height: 4.v),

                _buildUserRow(context),
                SizedBox(height: 31.v),
                _buildCheckPointRow(context),
                SizedBox(height: 20.v),

                // 写真解放
                CustomSideBar(item: "写真解放"),
                SizedBox(height: 30.v),
                // 連絡解放
                CustomSideBar(item: "連絡解放"),
                SizedBox(height: 30.v),

                // 位置共有
                CustomSideBar(item: "位置共有"),
                SizedBox(height: 30.v),

                // デート解放
                CustomSideBar(item: "デート解放"),
                SizedBox(height: 30.v),

                // SNS共有
                CustomSideBar(item: "SNS共有"),
                SizedBox(height: 30.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// User data box
  Widget _buildUserRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
      decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(imagePath: ImageConstant.imgUser, height: 55.adaptSize, width: 55.adaptSize),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("名前", style: CustomTextStyles.titleLargeBlack900),
                Text("目的：", style: CustomTextStyles.titleLargeBlack900),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// item Title
  Widget _buildCheckPointRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Link 1
        Padding(
          padding: EdgeInsets.only(top: 15.v, bottom: 15.v),
          child: SizedBox(width: 50.h, child: Divider()),
        ),
        // title
        Text("チェックポイント", style: CustomTextStyles.titleLargeBlack900),
        // Link 2
        Padding(
          padding: EdgeInsets.only(top: 15.v, bottom: 15.v),
          child: SizedBox(width: 50.h, child: Divider()),
        ),
      ],
    );
  }
}
