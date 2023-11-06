import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/presentation/k1_page/k1_page.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_bottom_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class LoverConditionsRepair extends StatelessWidget {
  LoverConditionsRepair({Key? key}) : super(key: key);

  TextEditingController ageInputController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController residenceController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController sexualOrientationController = TextEditingController();
  TextEditingController heightInputController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController socialSkillsController = TextEditingController();
  TextEditingController religionController = TextEditingController();
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
              SizedBox(height: 105.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
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
                              _buildCityInput(context),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildCounityInput(context),
                        SizedBox(height: 16.v),
                        _buildCityInput1(context),
                        SizedBox(height: 16.v),
                        _buildGenderInput(context),
                        SizedBox(height: 16.v),
                        _buildBloodInput(context),
                        SizedBox(height: 16.v),
                        _buildBloodInput(context),
                        SizedBox(height: 16.v),
                        _buildSexualInput(context),
                        SizedBox(height: 16.v),
                        _buildHeightInput1(context),
                        SizedBox(height: 16.v),
                        _buildBloodInput(context),
                        SizedBox(height: 16.v),
                        _buildEducationInput(context),
                        SizedBox(height: 16.v),
                        _buildJobInput(context),
                        SizedBox(height: 16.v),
                        _buildAnnualSalaryInput(context),
                        SizedBox(height: 16.v),
                        _buildSociabilityInput(context),
                        SizedBox(height: 16.v),
                        _buildReligiousInput(context),
                        SizedBox(height: 21.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                height: 20.adaptSize,
                                width: 20.adaptSize,
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
                        SizedBox(height: 27.v),
                        _buildCertificationForCheck(context),
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

  /// hander
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "恋人の条件更改",
        margin: EdgeInsets.only(
          top: 59.v,
          bottom: 11.v,
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildAgeInput(BuildContext context) {
    return CustomTextFormField(
      width: 60.h,
      controller: ageInputController,
      hintText: "30",
      alignment: Alignment.bottomCenter,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCityInput(BuildContext context) {
    return CustomOutlinedButton(
      height: 40.v,
      width: 60.h,
      text: "40",
      margin: EdgeInsets.only(
        left: 15.h,
        top: 26.v,
      ),
      buttonStyle: CustomButtonStyles.outlinePinkATL5,
      buttonTextStyle: theme.textTheme.bodyLarge!,
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
  Widget _buildCityInput1(BuildContext context) {
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
  Widget _buildSexualOrientation(BuildContext context) {
    return CustomTextFormField(
      controller: sexualOrientationController,
      hintText: "異性愛",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSexualInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "性的指向:",
          style: theme.textTheme.titleLarge,
        ),
        _buildSexualOrientation(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildHeightInput(BuildContext context) {
    return CustomTextFormField(
      width: 51.h,
      controller: heightInputController,
      hintText: "170cm",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildHeightInput1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "身長:",
          style: theme.textTheme.titleLarge,
        ),
        Container(
          width: 370.h,
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 6.v,
          ),
          decoration: AppDecoration.outlinePinkA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: _buildHeightInput(context),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEducation(BuildContext context) {
    return CustomTextFormField(
      controller: educationController,
      hintText: "高校生",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildEducationInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "学歴:",
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 2.v),
        _buildEducation(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildOccupation(BuildContext context) {
    return CustomTextFormField(
      controller: occupationController,
      hintText: "ホスト",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildJobInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "職種:",
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 2.v),
        _buildOccupation(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildZipcode(BuildContext context) {
    return CustomTextFormField(
      controller: zipcodeController,
      hintText: "4000",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildAnnualSalaryInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "年収:",
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 2.v),
        _buildZipcode(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildSocialSkills(BuildContext context) {
    return CustomTextFormField(
      controller: socialSkillsController,
      hintText: "人たら神",
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
        SizedBox(height: 2.v),
        _buildSocialSkills(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildReligion(BuildContext context) {
    return CustomTextFormField(
      controller: religionController,
      hintText: "多神教",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildReligiousInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "宗教:",
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 2.v),
        _buildReligion(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "条件確認",
      margin: EdgeInsets.only(left: 100.h),
      buttonStyle: CustomButtonStyles.outlinePinkATL30,
      alignment: Alignment.centerLeft,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildBloodInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "血液型:",
          style: theme.textTheme.titleLarge,
        ),
        Container(
          width: 370.h,
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 6.v,
          ),
          decoration: AppDecoration.outlinePinkA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Text(
            "O",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.tf:
        return AppRoutes.k1Page;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.k1Page:
        return K1Page();
      default:
        return DefaultWidget();
    }
  }
}
