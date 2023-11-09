import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class HobbyCondition extends StatelessWidget {
  HobbyCondition({Key? key}) : super(key: key);

  TextEditingController targetEraInputController = TextEditingController();
  TextEditingController targetCountryInputController = TextEditingController();
  TextEditingController targetCityInputController = TextEditingController();
  TextEditingController targetGenderInputController = TextEditingController();
  TextEditingController targetHobbyTypeInputController = TextEditingController();
  TextEditingController findTargetInputController = TextEditingController();
  TextEditingController targetExperienceInputController = TextEditingController();
  TextEditingController targetHeightInputController = TextEditingController();
  TextEditingController targetWeightInputController = TextEditingController();
  TextEditingController targetSociabilityInputController = TextEditingController();

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
                // Header
                _buildHeader(context),
                SizedBox(height: 120.v),

                // Era
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("年代:", style: theme.textTheme.titleLarge),
                      _buildTargetEraInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Country
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("国籍:", style: theme.textTheme.titleLarge),
                      _buildTargetCountryInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // City
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("居住地:", style: theme.textTheme.titleLarge),
                      _buildTargetCityInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Gender
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("性別:", style: theme.textTheme.titleLarge),
                      _buildTargetGenderInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Hobby
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("趣味のタイプ:", style: theme.textTheme.titleLarge),
                      _buildTargetHobbyTypeInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Find Target
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("探す対象:", style: theme.textTheme.titleLarge),
                      _buildFindTargetInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Experience of Hobby
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "経験:",
                        style: theme.textTheme.titleLarge,
                      ),
                      _buildTargetExperienceInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Height
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "身長:",
                        style: theme.textTheme.titleLarge,
                      ),
                      _buildTargetHeightInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Weight
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "体重:",
                        style: theme.textTheme.titleLarge,
                      ),
                      _buildTargetWeightInput(context),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),

                // Sociability
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "社交力:",
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 2.v),
                      _buildTargetSociabilityInput(context),
                    ],
                  ),
                ),
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
                          decoration: BoxDecoration(
                            color: appTheme.gray500,
                            borderRadius: BorderRadius.circular(10.h),
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
                SizedBox(height: 25.v),
                _buildCertificationForCheck(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Backend ----------------------------------------------------------------

  /// Header
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 133, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 50.v),
          Text("趣味の条件設定", style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }

  /// Era
  Widget _buildTargetEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetEraInputController,
      hintText: "３０代",
    );
  }

  /// Country
  Widget _buildTargetCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetCountryInputController,
      hintText: "日本",
    );
  }

  /// City
  Widget _buildTargetCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetCityInputController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildTargetGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetGenderInputController,
      hintText: "男",
    );
  }

  /// Hobby Type
  Widget _buildTargetHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetHobbyTypeInputController,
      hintText: "サッカー",
    );
  }

  /// Find Target
  Widget _buildFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: findTargetInputController,
      hintText: "サッカーのチームメンバー",
    );
  }

  /// Experience
  Widget _buildTargetExperienceInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetExperienceInputController,
      hintText: "3年",
    );
  }

  /// Height
  Widget _buildTargetHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetHeightInputController,
      hintText: "170cm",
    );
  }

  /// Section Widget
  Widget _buildTargetWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetWeightInputController,
      hintText: "60Kg",
      textInputAction: TextInputAction.done,
    );
  }

  /// Sociability
  Widget _buildTargetSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: targetSociabilityInputController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
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
}
