import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class HobbyCondition extends StatelessWidget {
  HobbyCondition({Key? key}) : super(key: key);

  TextEditingController group6Controller = TextEditingController();

  TextEditingController group7Controller = TextEditingController();

  TextEditingController group8Controller = TextEditingController();

  TextEditingController group9Controller = TextEditingController();

  TextEditingController group10Controller = TextEditingController();

  TextEditingController group11Controller = TextEditingController();

  TextEditingController group12Controller = TextEditingController();

  TextEditingController distanceController = TextEditingController();

  TextEditingController frame4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context),
                SizedBox(height: 120.v),
                _buildEraInput(context),
                SizedBox(height: 16.v),
                _buildCounityInput(context),
                SizedBox(height: 16.v),
                _buildCityInput(context),
                SizedBox(height: 16.v),
                _buildGenderInput(context),
                SizedBox(height: 16.v),
                _buildHobbyTypeInput(context),
                SizedBox(height: 16.v),
                _buildFindTargetInput(context),
                SizedBox(height: 16.v),
                _buildExperienceInput(context),
                SizedBox(height: 16.v),
                _buildHeightInput(context),
                SizedBox(height: 16.v),
                _buildWeightInput(context),
                SizedBox(height: 16.v),
                _buildSociabilityInput(context),
                SizedBox(height: 21.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.h),
                    child: Row(
                      children: [
                        Container(
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          decoration: BoxDecoration(
                            color: appTheme.gray500,
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                            "本人認証を確認しました",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 28.v),
                _buildCertificationForCheck(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 124.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 49.v),
          Text(
            "趣味の条件設定",
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup6(BuildContext context) {
    return CustomTextFormField(
      controller: group6Controller,
      hintText: "３０代",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildEraInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "年代:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup6(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup7(BuildContext context) {
    return CustomTextFormField(
      controller: group7Controller,
      hintText: "日本",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCounityInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "国籍:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup7(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup8(BuildContext context) {
    return CustomTextFormField(
      controller: group8Controller,
      hintText: "大阪",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCityInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "居住地:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup8(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup9(BuildContext context) {
    return CustomTextFormField(
      controller: group9Controller,
      hintText: "男",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildGenderInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "性別:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup9(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup10(BuildContext context) {
    return CustomTextFormField(
      controller: group10Controller,
      hintText: "サッカー",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildHobbyTypeInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "趣味のタイプ:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup10(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup11(BuildContext context) {
    return CustomTextFormField(
      controller: group11Controller,
      hintText: "サッカーのチームメンバー",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildFindTargetInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "探す対象:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup11(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup12(BuildContext context) {
    return CustomTextFormField(
      controller: group12Controller,
      hintText: "3年",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildExperienceInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "経験:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup12(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDistance(BuildContext context) {
    return CustomTextFormField(
      controller: distanceController,
      hintText: "170cm",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildHeightInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "身長:",
            style: theme.textTheme.titleLarge,
          ),
          _buildDistance(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWeightInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "体重:",
            style: theme.textTheme.titleLarge,
          ),
          Container(
            width: 370.h,
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.outlinePinkA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "60kg",
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame4(BuildContext context) {
    return CustomTextFormField(
      controller: frame4Controller,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSociabilityInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "社交力:",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 2.v),
          _buildFrame4(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "条件確認",
      buttonStyle: CustomButtonStyles.outlinePinkATL30,
    );
  }
}
