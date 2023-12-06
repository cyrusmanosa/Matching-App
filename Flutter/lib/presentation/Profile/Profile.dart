import '../Profile/widgets/shownicknamebar_item_widget.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      // img
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Profile img
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorgray500,
                            height: 150.adaptSize,
                            width: 150.adaptSize,
                            margin: EdgeInsets.symmetric(vertical: 10),
                          ),

                          // 4
                          CustomImageView(
                            imagePath: ImageConstant.imgPhotoSet,
                            height: 170.v,
                            width: 50.h,
                            margin: EdgeInsets.only(left: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.v),

                      // Part 2 - data
                      _buildInformationBar(context),
                      SizedBox(height: 20.v),

                      // intro
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("自己紹介", style: CustomTextStyles.bodyLargePinkA100),
                            Divider(),
                            Text("亜sだds仇sだdsあっだ", style: CustomTextStyles.bodyLargeBlack900),
                          ],
                        ),
                      ),
                      SizedBox(height: 100.v),

                      // title
                      Text("個人基本情報", style: CustomTextStyles.headlineSmallRoundedMplus1c),
                      SizedBox(height: 25.v),

                      // Nick Name
                      ShownDataBaWidget(item: "ニックネーム", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "身長", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "体重", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "居住地", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "学歴", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "趣味", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "職種", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "性的指向", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "社交力", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "探す対象", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "目的", data: "泰泰"),
                      SizedBox(height: 25.v),
                      ShownDataBaWidget(item: "宗教", data: "泰泰"),

                      SizedBox(height: 40.v),

                      // edit button
                      CustomOutlinedButton(
                        width: 110,
                        height: 40,
                        text: "編集",
                        buttonTextStyle: theme.textTheme.titleMedium,
                        onPressed: () {
                          onTaptf(context);
                        },
                      ),
                      SizedBox(height: 30.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 137.h, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 40),
          Text("プロフィール", style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }

  // Part2 All in one
  Widget _buildInformationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
        ],
      ),
    );
  }

  // Part2 Backend
  Widget _buildClaimWord(BuildContext context) {
    return Column(
      children: [Text("クレーム回数", style: theme.textTheme.titleMedium), Text("0", style: theme.textTheme.headlineSmall)],
    );
  }

  Widget _buildChangeWord(BuildContext context) {
    return Column(children: [Text("交換回数", style: theme.textTheme.titleMedium), Text("0", style: theme.textTheme.headlineSmall)]);
  }

  Widget _buildSendWord(BuildContext context) {
    return Column(children: [Text("伝送回数", style: theme.textTheme.titleMedium), Text("0", style: theme.textTheme.headlineSmall)]);
  }

// edit button
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }
}
