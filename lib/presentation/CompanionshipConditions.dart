import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_Input_Bar.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class CompanionshipConditions extends StatelessWidget {
  CompanionshipConditions({Key? key}) : super(key: key);

  TextEditingController companionshipEraController = TextEditingController();
  TextEditingController companionshipCountryController = TextEditingController();
  TextEditingController companionshipCityController = TextEditingController();
  TextEditingController companionshipGenderController = TextEditingController();
  TextEditingController companionshipAccompanyTypeController = TextEditingController();
  TextEditingController companionshipFindTargetController = TextEditingController();
  TextEditingController companionshipSociabilityController = TextEditingController();

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
                CustomInputBar(titleName: "年代:", backendPart: _buildCompanionshipEraInput(context)),
                SizedBox(height: 15.v),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildCompanionshipCountryInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildCompanionshipCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildCompanionshipGenderInput(context)),
                SizedBox(height: 15.v),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildCompanionshipAccompanyTypeInput(context)),
                SizedBox(height: 15.v),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildCompanionshipFindTargetInput(context)),
                SizedBox(height: 15.v),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildCompanionshipSociabilityInput(context)),
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
      title: AppbarTitle(text: "お相伴の条件設定", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  /// ture back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Era
  Widget _buildCompanionshipEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipEraController,
      hintText: "３０代",
    );
  }

  /// Country
  Widget _buildCompanionshipCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipCountryController,
      hintText: "日本",
    );
  }

  /// City
  Widget _buildCompanionshipCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildCompanionshipGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipGenderController,
      hintText: "男",
    );
  }

  /// Accompany Type
  Widget _buildCompanionshipAccompanyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipAccompanyTypeController,
      hintText: "おしゃべり",
    );
  }

  /// FindTarget
  Widget _buildCompanionshipFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipFindTargetController,
      hintText: "聞き役",
    );
  }

  /// Sociability
  Widget _buildCompanionshipSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: companionshipSociabilityController,
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
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
