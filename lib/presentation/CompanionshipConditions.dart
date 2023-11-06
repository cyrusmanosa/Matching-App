import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class CompanionshipConditions extends StatelessWidget {
  CompanionshipConditions({Key? key}) : super(key: key);

  TextEditingController ageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController residenceController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController typeOfCompanionController = TextEditingController();
  TextEditingController targetController = TextEditingController();
  TextEditingController socialSkillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 32.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 88.v),
              _buildEraInput(context),
              SizedBox(height: 16.v),
              _buildCounityInput(context),
              SizedBox(height: 16.v),
              _buildCityInput(context),
              SizedBox(height: 16.v),
              _buildGenderInput(context),
              SizedBox(height: 16.v),
              _buildAccompanyTypeInput(context),
              SizedBox(height: 16.v),
              _buildFindTargetInput(context),
              SizedBox(height: 16.v),
              _buildSociabilityInput(context),
              SizedBox(height: 21.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(bottom: 1.v),
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
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
            ],
          ),
        ),
        bottomNavigationBar: _buildButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "お相伴の条件設定",
        margin: EdgeInsets.only(
          top: 59.v,
          bottom: 11.v,
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildAge(BuildContext context) {
    return CustomTextFormField(
      controller: ageController,
      hintText: "３０代",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildEraInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "年代:",
          style: theme.textTheme.titleLarge,
        ),
        _buildAge(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildNationality(BuildContext context) {
    return CustomTextFormField(
      controller: nationalityController,
      hintText: "日本",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCounityInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "国籍:",
          style: theme.textTheme.titleLarge,
        ),
        _buildNationality(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildResidence(BuildContext context) {
    return CustomTextFormField(
      controller: residenceController,
      hintText: "大阪",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCityInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "居住地:",
          style: theme.textTheme.titleLarge,
        ),
        _buildResidence(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return CustomTextFormField(
      controller: genderController,
      hintText: "男",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildGenderInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "性別:",
          style: theme.textTheme.titleLarge,
        ),
        _buildGender(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildTypeOfCompanion(BuildContext context) {
    return CustomTextFormField(
      controller: typeOfCompanionController,
      hintText: "おしゃべり",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildAccompanyTypeInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "お相伴のタイプ:",
          style: theme.textTheme.titleLarge,
        ),
        _buildTypeOfCompanion(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildTarget(BuildContext context) {
    return CustomTextFormField(
      controller: targetController,
      hintText: "聞き役",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildFindTargetInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "探す対象:",
          style: theme.textTheme.titleLarge,
        ),
        _buildTarget(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildSocialSkills(BuildContext context) {
    return CustomTextFormField(
      controller: socialSkillsController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSociabilityInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "社交力:",
          style: theme.textTheme.titleLarge,
        ),
        _buildSocialSkills(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "条件確認",
      margin: EdgeInsets.only(
        left: 140.h,
        right: 140.h,
        bottom: 2.v,
      ),
      buttonStyle: CustomButtonStyles.outlinePinkATL301,
    );
  }
}
