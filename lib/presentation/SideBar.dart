import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 310.h,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 22.h,
              vertical: 79.v,
            ),
            decoration: AppDecoration.outlineBlack9001,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "2023-11-01から",
                  style: CustomTextStyles.bodyLargegray800,
                ),
                SizedBox(height: 4.v),
                _buildUserRow(context),
                SizedBox(height: 31.v),
                _buildCheckPointRow(context),
                SizedBox(height: 20.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 43.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "写真解放",
                          style: CustomTextStyles
                              .headlineSmallRoundedMplus1cGray500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 43.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "連絡解放",
                          style: CustomTextStyles
                              .headlineSmallRoundedMplus1cGray500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 43.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "位置共有",
                          style: CustomTextStyles
                              .headlineSmallRoundedMplus1cGray500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.v),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "デート解放",
                          style: CustomTextStyles
                              .headlineSmallRoundedMplus1cGray500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 43.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "SNS共有",
                          style: CustomTextStyles
                              .headlineSmallRoundedMplus1cGray500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 54.adaptSize,
            width: 54.adaptSize,
            margin: EdgeInsets.only(bottom: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "名前",
                  style: CustomTextStyles.titleLargeBlack900,
                ),
                Text(
                  "目的：",
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCheckPointRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 16.v,
              bottom: 12.v,
            ),
            child: SizedBox(
              width: 50.h,
              child: Divider(),
            ),
          ),
          Text(
            "チェックポイント",
            style: CustomTextStyles.titleLargeBlack900,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16.v,
              bottom: 12.v,
            ),
            child: SizedBox(
              width: 50.h,
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
