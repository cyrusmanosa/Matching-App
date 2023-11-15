import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class CompanionshipConditionsRepair extends StatelessWidget {
  CompanionshipConditionsRepair({Key? key}) : super(key: key);

  TextEditingController resetCompanionshipEraController = TextEditingController();
  TextEditingController resetCompanionshipCountryController = TextEditingController();
  TextEditingController resetCompanionshipCityController = TextEditingController();
  TextEditingController resetCompanionshipGenderController = TextEditingController();
  TextEditingController resetCompanionshipAccompanyTypeController = TextEditingController();
  TextEditingController resetCompanionshipFindTargetController = TextEditingController();
  TextEditingController resetCompanionshipSociabilityController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context),
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120.v),

                // Era
                CustomInputBar(titleName: "年代:", backendPart: _buildCompanionshipResetEraInput(context)),
                SizedBox(height: 15.v),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildCompanionshipResetCountryInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildCompanionshipResetCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildCompanionshipResetGenderInput(context)),
                SizedBox(height: 15.v),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildCompanionshipResetAccompanyTypeInput(context)),
                SizedBox(height: 15.v),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildCompanionshipResetFindTargetInput(context)),
                SizedBox(height: 15.v),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildCompanionshipResetSociabilityInput(context)),
                SizedBox(height: 23.v),

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
                SizedBox(height: 40),

                _buildCertificationForCheck(context),
                SizedBox(height: 30)
              ],
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
      title: AppbarTitle(text: "お相伴の条件更改", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
  Widget _buildCompanionshipResetEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipEraController,
      hintText: "３０代",
    );
  }

  /// Section Widget
  Widget _buildCompanionshipResetCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipCountryController,
      hintText: "日本",
    );
  }

  /// Section Widget
  Widget _buildCompanionshipResetCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipCityController,
      hintText: "大阪",
    );
  }

  /// Section Widget
  Widget _buildCompanionshipResetGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipGenderController,
      hintText: "男",
    );
  }

  /// Section Widget
  Widget _buildCompanionshipResetAccompanyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipAccompanyTypeController,
      hintText: "おしゃべり",
    );
  }

  /// Section Widget
  Widget _buildCompanionshipResetFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipFindTargetController,
      hintText: "聞き役",
    );
  }

  /// Section Widget
  Widget _buildCompanionshipResetSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetCompanionshipSociabilityController,
      hintText: "人たら神",
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
    Navigator.pushNamed(context, AppRoutes.deleteTarget);
  }
}
