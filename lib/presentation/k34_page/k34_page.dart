import '../k34_page/widgets/shownicknamebar_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class K34Page extends StatelessWidget {
  const K34Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 16.v),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.h),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgVectorGray60001,
                                    height: 150.adaptSize,
                                    width: 150.adaptSize,
                                    margin: EdgeInsets.only(
                                        top: 10.v, bottom: 9.v)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgPhotoSet,
                                    height: 169.v,
                                    width: 50.h,
                                    margin: EdgeInsets.only(left: 22.h))
                              ]),
                          SizedBox(height: 16.v),
                          _buildInformationBar(context),
                          SizedBox(height: 15.v),
                          Padding(
                              padding: EdgeInsets.only(left: 20.h, right: 10.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("自己紹介",
                                        style:
                                            CustomTextStyles.bodyLargePinkA100),
                                    Divider(),
                                    Text("亜sだds仇sだdsあっだ",
                                        style:
                                            CustomTextStyles.bodyLargeBlack900)
                                  ])),
                          SizedBox(height: 47.v),
                          Text("個人基本情報",
                              style:
                                  CustomTextStyles.headlineSmallRoundedMplus1c),
                          SizedBox(height: 24.v),
                          _buildShowNicknameBar(context),
                          SizedBox(height: 24.v),
                          CustomOutlinedButton(
                              width: 150.h,
                              text: "編集",
                              buttonStyle: CustomButtonStyles.outlinePinkATL30,
                              onPressed: () {
                                onTaptf(context);
                              })
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarTitle(
            text: "プロフィール", margin: EdgeInsets.only(top: 59.v, bottom: 11.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.fromLTRB(35.h, 67.v, 35.h, 18.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildInformationBar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _buildSendWord(context),
      SizedBox(
          height: 65.v,
          child: VerticalDivider(
              width: 1.h, thickness: 1.v, indent: 17.h, endIndent: 18.h)),
      Column(children: [
        Text("クレーム回数", style: theme.textTheme.titleLarge),
        Text("０", style: theme.textTheme.headlineLarge)
      ]),
      SizedBox(
          height: 65.v,
          child: VerticalDivider(
              width: 1.h, thickness: 1.v, indent: 17.h, endIndent: 18.h)),
      _buildSendWord(context)
    ]);
  }

  /// Section Widget
  Widget _buildShowNicknameBar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 24.v);
            },
            itemCount: 12,
            itemBuilder: (context, index) {
              return ShownicknamebarItemWidget();
            }));
  }

  /// Common widget
  Widget _buildSendWord(BuildContext context) {
    return Column(children: [
      Text("伝送回数", style: theme.textTheme.titleLarge),
      Text("０", style: theme.textTheme.headlineLarge)
    ]);
  }

  /// Navigates to the k35Screen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.ProfileEdit);
  }
}
