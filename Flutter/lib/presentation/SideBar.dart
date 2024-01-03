import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_sideBar.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SizedBox(
        width: 310,
        height: 850,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          decoration: BoxDecoration(
            color: appTheme.pinkA100,
            boxShadow: [BoxShadow(color: appTheme.black.withOpacity(0.25), spreadRadius: 2, blurRadius: 2, offset: Offset(15, 0))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // add date
              Text("2023-11-01から", style: TextStyle(color: appTheme.gray800)),
              SizedBox(height: 4),

              _buildUserRow(context),
              SizedBox(height: 31),
              _buildCheckPointRow(context),
              SizedBox(height: mediaQueryData.size.height / 50),

              // 写真解放
              CustomSideBar(item: "写真解放"),
              SizedBox(height: mediaQueryData.size.height / 25),
              // 連絡解放
              CustomSideBar(item: "連絡解放"),
              SizedBox(height: mediaQueryData.size.height / 25),

              // 位置共有
              CustomSideBar(item: "位置共有"),
              SizedBox(height: mediaQueryData.size.height / 25),

              // デート解放
              CustomSideBar(item: "デート解放"),
              SizedBox(height: mediaQueryData.size.height / 25),

              // SNS共有
              CustomSideBar(item: "SNS共有"),
              SizedBox(height: mediaQueryData.size.height / 25),
            ],
          ),
        ),
      ),
    );
  }

  /// User data box
  Widget _buildUserRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: AppDecoration.fillOnPrimary.copyWith(borderRadius: BorderRadiusStyle.r30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(imagePath: ImageConstant.imgUser, height: 55, width: 55),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("名前", style: CustomTextStyles.smallTitle20),
                Text("目的：", style: CustomTextStyles.smallTitle20),
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
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: SizedBox(width: 50, child: Divider()),
        ),
        // title
        Text("チェックポイント", style: CustomTextStyles.smallTitle20),
        // Link 2
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: SizedBox(width: 50, child: Divider()),
        ),
      ],
    );
  }
}
