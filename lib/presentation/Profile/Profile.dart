import '../Profile/widgets/shownicknamebar_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                _buildHeader(context),
                SizedBox(height: 30),

                // img
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile img
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorgray500,
                      height: 150.adaptSize,
                      width: 150.adaptSize,
                      margin: EdgeInsets.only(top: 10.v, bottom: 10.v),
                    ),

                    // 4
                    CustomImageView(
                      imagePath: ImageConstant.imgPhotoSet,
                      height: 170.v,
                      width: 50.h,
                      margin: EdgeInsets.only(left: 22),
                    )
                  ],
                ),
                SizedBox(height: 20.v),

                // Part 2 - data
                _buildInformationBar(context),
                SizedBox(height: 20.v),

                // intro
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("自己紹介", style: CustomTextStyles.bodyLargePinkA100),
                      Divider(),
                      Text("亜sだds仇sだdsあっだ", style: CustomTextStyles.bodyLargeBlack900)
                    ],
                  ),
                ),
                SizedBox(height: 150.v),

                // title
                Text("個人基本情報", style: CustomTextStyles.headlineSmallRoundedMplus1c),
                SizedBox(height: 25.v),

                // Nick Name
                _buildShowNicknameBar(context),
                SizedBox(height: 40.v),

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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 137.h, vertical: 20.5),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20.v),
          Text("プロフィール", style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }

// Part2 All in one
  Widget _buildInformationBar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        ]));
  }

  // Part2 Backend
  Widget _buildClaimWord(BuildContext context) {
    return Column(
      children: [Text("クレーム回数", style: theme.textTheme.titleLarge), Text("0", style: theme.textTheme.headlineLarge)],
    );
  }

  Widget _buildChangeWord(BuildContext context) {
    return Column(children: [Text("交換回数", style: theme.textTheme.titleLarge), Text("0", style: theme.textTheme.headlineLarge)]);
  }

  Widget _buildSendWord(BuildContext context) {
    return Column(children: [Text("伝送回数", style: theme.textTheme.titleLarge), Text("0", style: theme.textTheme.headlineLarge)]);
  }

  /// Nick Name
  Widget _buildShowNicknameBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(height: 24.v);
        },
        itemCount: 1,
        itemBuilder: (context, index) {
          return ShownicknamebarItemWidget();
        },
      ),
    );
  }

// edit button
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }
}
