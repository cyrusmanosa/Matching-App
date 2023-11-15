import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class HobbyCondition extends StatelessWidget {
  HobbyCondition({Key? key}) : super(key: key);

  TextEditingController hobbyEraInputController = TextEditingController();
  TextEditingController hobbyCountryInputController = TextEditingController();
  TextEditingController hobbyCityInputController = TextEditingController();
  TextEditingController hobbyGenderInputController = TextEditingController();
  TextEditingController hobbyTypeInputController = TextEditingController();
  TextEditingController hobbyFindTargetInputController = TextEditingController();
  TextEditingController hobbyExperienceInputController = TextEditingController();
  TextEditingController hobbyHeightInputController = TextEditingController();
  TextEditingController hobbyWeightInputController = TextEditingController();
  TextEditingController hobbySociabilityInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120.v),

                // Era
                CustomInputBar(titleName: "年代:", backendPart: _buildHobbyEraInput(context)),
                SizedBox(height: 15.v),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildHobbyCountryInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildHobbyCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildHobbyGenderInput(context)),
                SizedBox(height: 15.v),

                // Hobby Type
                CustomInputBar(titleName: "趣味のタイプ:", backendPart: _buildHobbyTypeInput(context)),
                SizedBox(height: 15.v),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildHobbyFindTargetInput(context)),
                SizedBox(height: 15.v),

                // Experience of Hobby
                CustomInputBar(titleName: "経験:", backendPart: _buildHobbyExperienceInput(context)),
                SizedBox(height: 15.v),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildHobbyHeightInput(context)),
                SizedBox(height: 15.v),

                // Weight
                CustomInputBar(titleName: "体重:", backendPart: _buildHobbyWeightInput(context)),
                SizedBox(height: 15.v),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildHobbySociabilityInput(context)),
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
    );
  }

  /// Backend ----------------------------------------------------------------

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
      title: AppbarTitle(text: "趣味の条件設定", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Era
  Widget _buildHobbyEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyEraInputController,
      hintText: "３０代",
    );
  }

  /// Country
  Widget _buildHobbyCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyCountryInputController,
      hintText: "日本",
    );
  }

  /// City
  Widget _buildHobbyCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyCityInputController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildHobbyGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyGenderInputController,
      hintText: "男",
    );
  }

  /// Hobby Type
  Widget _buildHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyTypeInputController,
      hintText: "サッカー",
    );
  }

  /// Find Target
  Widget _buildHobbyFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyFindTargetInputController,
      hintText: "サッカーのチームメンバー",
    );
  }

  /// Experience
  Widget _buildHobbyExperienceInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyExperienceInputController,
      hintText: "3年",
    );
  }

  /// Height
  Widget _buildHobbyHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyHeightInputController,
      hintText: "170cm",
    );
  }

  /// Section Widget
  Widget _buildHobbyWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyWeightInputController,
      hintText: "60Kg",
      textInputAction: TextInputAction.done,
    );
  }

  /// Sociability
  Widget _buildHobbySociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbySociabilityInputController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
    );
  }

  /// Certification For Check
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 150,
      height: 50,
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
