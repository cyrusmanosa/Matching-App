import '../Profile/widgets/shownicknamebar_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        // main
        body: SizedBox(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 15.v),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.h),
              child: Column(
                children: [
                  // Part 1 - img
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile img
                      CustomImageView(
                        imagePath: ImageConstant.imgVectorgray500,
                        height: 150.adaptSize,
                        width: 150.adaptSize,
                        margin: EdgeInsets.only(top: 10.v, bottom: 9.v),
                      ),

                      // 4
                      CustomImageView(
                        imagePath: ImageConstant.imgPhotoSet,
                        height: 169.v,
                        width: 50.h,
                        margin: EdgeInsets.only(left: 22.h),
                      )
                    ],
                  ),
                  SizedBox(height: 20.v),

                  // Part 2 - data
                  _buildInformationBar(context),
                  SizedBox(height: 20.v),

                  // intro
                  Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("自己紹介", style: CustomTextStyles.bodyLargePinkA100),
                        Divider(),
                        Text(
                          "亜sだds仇sだdsあっだ",
                          style: CustomTextStyles.bodyLargeBlack900,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 150.v),

                  // title
                  Text(
                    "個人基本情報",
                    style: CustomTextStyles.headlineSmallRoundedMplus1c,
                  ),
                  SizedBox(height: 25.v),

                  //
                  _buildShowNicknameBar(context),
                  SizedBox(height: 30.v),

                  // edit button
                  CustomOutlinedButton(
                    width: 150.h,
                    text: "編集",
                    buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
                    onPressed: () {
                      onTaptf(context);
                    },
                  ),
                  SizedBox(height: 30.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(text: "プロフィール"),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMenu,
          margin: EdgeInsets.only(left: 67.v, right: 18.v),
        )
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildShowNicknameBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return ShownicknamebarItemWidget();
        },
      ),
    );
  }

// Part2
  Widget _buildInformationBar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _buildChangeWord(context),
      // link1
      SizedBox(
        height: 65.v,
        child: VerticalDivider(
          width: 1.h,
          thickness: 1.v,
          indent: 17.h,
          endIndent: 18.h,
        ),
      ),
      _buildClaimWord(context),
      // link1
      SizedBox(
        height: 65.v,
        child: VerticalDivider(
          width: 1.h,
          thickness: 1.v,
          indent: 17.h,
          endIndent: 18.h,
        ),
      ),
      _buildSendWord(context)
    ]);
  }

  Widget _buildClaimWord(BuildContext context) {
    return Column(
      children: [Text("クレーム回数", style: theme.textTheme.titleLarge), Text("0", style: theme.textTheme.headlineLarge)],
    );
  }

  Widget _buildChangeWord(BuildContext context) {
    return Column(
        children: [Text("交換回数", style: theme.textTheme.titleLarge), Text("0", style: theme.textTheme.headlineLarge)]);
  }

  Widget _buildSendWord(BuildContext context) {
    return Column(
        children: [Text("伝送回数", style: theme.textTheme.titleLarge), Text("0", style: theme.textTheme.headlineLarge)]);
  }

// edit button
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }
}
