import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_Input_Bar.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class HobbyConditionRepair extends StatelessWidget {
  HobbyConditionRepair({Key? key}) : super(key: key);

  TextEditingController resetHobbyEraController = TextEditingController();
  TextEditingController resetHobbyCountryController = TextEditingController();
  TextEditingController resetHobbyCityController = TextEditingController();
  TextEditingController resetHobbyGenderController = TextEditingController();
  TextEditingController resetHobbyTypeController = TextEditingController();
  TextEditingController resetHobbyFindTargetController = TextEditingController();
  TextEditingController resetHobbyExperienceController = TextEditingController();
  TextEditingController resetHobbySociabilityController = TextEditingController();
  TextEditingController resetHobbyHeightController = TextEditingController();
  TextEditingController resetHobbyWeightController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context),
        body: Form(
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
              child: Column(
                children: [
                  SizedBox(height: 120.v),

                  // Era
                  CustomInputBar(titleName: "年代:", backendPart: _buildHobbyResetEraInput(context)),
                  SizedBox(height: 15.v),

                  // Country
                  CustomInputBar(titleName: "国籍:", backendPart: _buildHobbyResetCountryInput(context)),
                  SizedBox(height: 15.v),

                  // City
                  CustomInputBar(titleName: "居住地:", backendPart: _buildHobbyResetCityInput(context)),
                  SizedBox(height: 15.v),

                  // Gender
                  CustomInputBar(titleName: "性別:", backendPart: _buildHobbyResetGenderInput(context)),
                  SizedBox(height: 15.v),

                  // Hobby
                  CustomInputBar(titleName: "趣味のタイプ:", backendPart: _buildHobbyResetHobbyTypeInput(context)),
                  SizedBox(height: 15.v),

                  // Find Target
                  CustomInputBar(titleName: "探す対象:", backendPart: _buildHobbyResetFindTargetInput(context)),
                  SizedBox(height: 15.v),

                  // Experience of Hobby
                  CustomInputBar(titleName: "経験:", backendPart: _buildHobbyResetExperienceInput(context)),
                  SizedBox(height: 15.v),

                  // Height
                  CustomInputBar(titleName: "身長:", backendPart: _buildHobbyResetHeightInput(context)),
                  SizedBox(height: 15.v),

                  // Weight
                  CustomInputBar(titleName: "体重:", backendPart: _buildHobbyResetWeightInput(context)),
                  SizedBox(height: 15.v),

                  // Sociability
                  CustomInputBar(titleName: "社交力:", backendPart: _buildHobbyResetSociabilityInput(context)),
                  SizedBox(height: 20.v),

                  // 本人
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: Row(
                        children: [
                          Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadius.circular(10.h)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text("本人認証を確認しました", style: theme.textTheme.bodyMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.v),

                  // button
                  _buildCertificationForCheck(context),
                  SizedBox(height: 30.v)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "趣味の条件更改", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Reset Era
  Widget _buildHobbyResetEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyEraController,
      borderDecoration: InputBorder.none,
      hintText: "３０代",
    );
  }

  /// Reset Country
  Widget _buildHobbyResetCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyCountryController,
      hintText: "日本",
    );
  }

  /// Reset City
  Widget _buildHobbyResetCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyCityController,
      hintText: "大阪",
    );
  }

  /// Reset Gender
  Widget _buildHobbyResetGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyGenderController,
      hintText: "男",
    );
  }

  /// Reset Hobby Type
  Widget _buildHobbyResetHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyTypeController,
      hintText: "サッカー",
    );
  }

  /// Reset Find Target
  Widget _buildHobbyResetFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyFindTargetController,
      hintText: "サッカーのチームメンバー",
    );
  }

  /// Reset Experience
  Widget _buildHobbyResetExperienceInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyExperienceController,
      hintText: "3年",
    );
  }

  /// Reset Sociability
  Widget _buildHobbyResetSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbySociabilityController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
    );
  }

  /// Reset Height
  Widget _buildHobbyResetHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyHeightController,
      hintText: "172",
      textInputAction: TextInputAction.done,
    );
  }

  /// Reset Weight
  Widget _buildHobbyResetWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetHobbyWeightController,
      hintText: "65Kg",
      textInputAction: TextInputAction.done,
    );
  }

  /// Certification For Check
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "条件確認",
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
      onPressed: () {
        onTaptf(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
