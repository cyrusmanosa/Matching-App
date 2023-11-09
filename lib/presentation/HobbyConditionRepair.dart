import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/presentation/Chat/Chat.dart';
import 'package:cyrus_man_s_application1/presentation/Home/Home.dart';
import 'package:cyrus_man_s_application1/presentation/Profile/Profile.dart';
import 'package:cyrus_man_s_application1/presentation/Target/Target.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_bottom_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class HobbyConditionRepair extends StatelessWidget {
  HobbyConditionRepair({Key? key}) : super(key: key);

  TextEditingController ageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController residenceController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController interestTypeController = TextEditingController();
  TextEditingController group77Controller = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController socialSkillsController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 113.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.h),
                    child: Column(
                      children: [
                        _buildEraInput(context),
                        SizedBox(height: 15.v),
                        _buildCounityInput(context),
                        SizedBox(height: 15.v),
                        _buildCityInput(context),
                        SizedBox(height: 15.v),
                        _buildGenderInput(context),
                        SizedBox(height: 15.v),
                        _buildHobbyTypeInput(context),
                        SizedBox(height: 15.v),
                        _buildFindTargetInput(context),
                        SizedBox(height: 15.v),
                        _buildExperienceInput(context),
                        SizedBox(height: 15.v),
                        _buildWeightInput(context),
                        SizedBox(height: 15.v),
                        _buildWeightInput(context),
                        SizedBox(height: 15.v),
                        _buildSociabilityInput(context),
                        SizedBox(height: 20.v),
                        Align(
                          alignment: Alignment.centerLeft,
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
                        SizedBox(height: 25.v),
                        _buildConditionConfirmation(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "趣味の条件更改",
        margin: EdgeInsets.only(
          top: 60.v,
          bottom: 10.v,
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
  Widget _buildInterestType(BuildContext context) {
    return CustomTextFormField(
      controller: interestTypeController,
      hintText: "サッカー",
    );
  }

  /// Section Widget
  Widget _buildHobbyTypeInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "趣味のタイプ:",
          style: theme.textTheme.titleLarge,
        ),
        _buildInterestType(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildGroup77(BuildContext context) {
    return CustomTextFormField(
      controller: group77Controller,
      hintText: "サッカーのチームメンバー",
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
        _buildGroup77(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildExperience(BuildContext context) {
    return CustomTextFormField(
      controller: experienceController,
      hintText: "3年",
    );
  }

  /// Section Widget
  Widget _buildExperienceInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "経験:",
          style: theme.textTheme.titleLarge,
        ),
        _buildExperience(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildSocialSkills(BuildContext context) {
    return CustomTextFormField(
      controller: socialSkillsController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
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
        SizedBox(height: 2.v),
        _buildSocialSkills(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildConditionConfirmation(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "条件確認",
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
      },
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
            vertical: 3.v,
          ),
          decoration: AppDecoration.outlinePinkA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.v),
              Text(
                "60kg",
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.tf:
        return AppRoutes.home;
      case BottomBarEnum.tf1:
        return AppRoutes.target;
      case BottomBarEnum.tf2:
        return AppRoutes.chat;
      case BottomBarEnum.tf3:
        return AppRoutes.profile;
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.home:
        return Home();
      case AppRoutes.target:
        return Target();
      case AppRoutes.chat:
        return Chat();
      case AppRoutes.profile:
        return Profile();
      default:
        return DefaultWidget();
    }
  }
}
