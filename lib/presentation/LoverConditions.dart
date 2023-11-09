import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class LoverConditions extends StatelessWidget {
  LoverConditions({Key? key}) : super(key: key);

  TextEditingController ageInputController = TextEditingController();

  TextEditingController group23Controller = TextEditingController();

  TextEditingController group24Controller = TextEditingController();

  TextEditingController group26Controller = TextEditingController();

  TextEditingController group27Controller = TextEditingController();

  TextEditingController group28Controller = TextEditingController();

  TextEditingController distanceController = TextEditingController();

  TextEditingController frame4Controller = TextEditingController();

  TextEditingController frame4Controller1 = TextEditingController();

  TextEditingController zipcodeController = TextEditingController();

  TextEditingController frame4Controller2 = TextEditingController();

  TextEditingController frame4Controller3 = TextEditingController();

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 66.v,
                          width: 60.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "年齢:",
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                              _buildAgeInput(context),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 31.v,
                            bottom: 4.v,
                          ),
                          child: Text(
                            "から",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        _buildForty(context),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.v),
                _buildCounityInput(context),
                SizedBox(height: 15.v),
                _buildCityInput(context),
                SizedBox(height: 15.v),
                _buildGenderInput(context),
                SizedBox(height: 15.v),
                _buildConstellationInput(context),
                SizedBox(height: 15.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: _buildWeightInput(context),
                ),
                SizedBox(height: 15.v),
                _buildSexualInput(context),
                SizedBox(height: 15.v),
                _buildHeightInput(context),
                SizedBox(height: 15.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: _buildWeightInput(context),
                ),
                SizedBox(height: 15.v),
                _buildEducationInput(context),
                SizedBox(height: 15.v),
                _buildJobInput(context),
                SizedBox(height: 15.v),
                _buildAnnualSalaryInput(context),
                SizedBox(height: 15.v),
                _buildSociabilityInput(context),
                SizedBox(height: 15.v),
                _buildReligiousInput(context),
                SizedBox(height: 3.v),
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
                SizedBox(height: 41.v),
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
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 48.v),
          Text(
            "恋人の条件設定",
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAgeInput(BuildContext context) {
    return CustomTextFormField(
      width: 60.h,
      controller: ageInputController,
      hintText: "30",
      alignment: Alignment.bottomCenter,
    );
  }

  /// Section Widget
  Widget _buildForty(BuildContext context) {
    return CustomOutlinedButton(
      height: 40.v,
      width: 60.h,
      text: "40",
      margin: EdgeInsets.only(
        left: 15.h,
        top: 26.v,
      ),
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
      buttonTextStyle: theme.textTheme.bodyLarge!,
    );
  }

  /// Section Widget
  Widget _buildGroup23(BuildContext context) {
    return CustomTextFormField(
      controller: group23Controller,
      hintText: "日本",
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
          _buildGroup23(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup24(BuildContext context) {
    return CustomTextFormField(
      controller: group24Controller,
      hintText: "大阪",
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
          _buildGroup24(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup26(BuildContext context) {
    return CustomTextFormField(
      controller: group26Controller,
      hintText: "男",
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
          _buildGroup26(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup27(BuildContext context) {
    return CustomTextFormField(
      controller: group27Controller,
      hintText: "いて座",
    );
  }

  /// Section Widget
  Widget _buildConstellationInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "星座:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup27(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup28(BuildContext context) {
    return CustomTextFormField(
      controller: group28Controller,
      hintText: "異性愛",
    );
  }

  /// Section Widget
  Widget _buildSexualInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "性的指向:",
            style: theme.textTheme.titleLarge,
          ),
          _buildGroup28(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDistance(BuildContext context) {
    return CustomTextFormField(
      controller: distanceController,
      hintText: "170cm",
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
  Widget _buildFrame4(BuildContext context) {
    return CustomTextFormField(
      controller: frame4Controller,
      hintText: "高校生",
    );
  }

  /// Section Widget
  Widget _buildEducationInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "学歴:",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 2.v),
          _buildFrame4(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame5(BuildContext context) {
    return CustomTextFormField(
      controller: frame4Controller1,
      hintText: "ホスト",
    );
  }

  /// Section Widget
  Widget _buildJobInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "職種:",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 2.v),
          _buildFrame5(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildZipcode(BuildContext context) {
    return CustomTextFormField(
      controller: zipcodeController,
      hintText: "4000",
    );
  }

  /// Section Widget
  Widget _buildAnnualSalaryInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "年収:",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 2.v),
          _buildZipcode(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame6(BuildContext context) {
    return CustomTextFormField(
      controller: frame4Controller2,
      hintText: "人たら神",
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
          _buildFrame6(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame7(BuildContext context) {
    return CustomTextFormField(
      controller: frame4Controller3,
      hintText: "多神教",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildReligiousInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "宗教:",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 2.v),
          _buildFrame7(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "条件確認",
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
    );
  }

  /// Common widget
  Widget _buildWeightInput(BuildContext context) {
    return Column(
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
    );
  }
}
