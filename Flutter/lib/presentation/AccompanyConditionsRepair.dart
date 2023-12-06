import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable, camel_case_types
class AccompanyConditionsRepair extends StatelessWidget {
  final String title;
  AccompanyConditionsRepair(this.title, {Key? key}) : super(key: key);

  TextEditingController resetAccompanyEraController = TextEditingController();
  TextEditingController resetAccompanyCountryController = TextEditingController();
  TextEditingController resetAccompanyCityController = TextEditingController();
  TextEditingController resetAccompanyGenderController = TextEditingController();
  TextEditingController resetAccompanyAccompanyTypeController = TextEditingController();
  TextEditingController resetAccompanyFindTargetController = TextEditingController();
  TextEditingController resetAccompanySociabilityController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context, title),
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
            child: Column(
              children: [
                // Era
                CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyResetEraInput(context)),
                SizedBox(height: 15.v),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildAccompanyResetCountryInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildAccompanyResetCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildAccompanyResetGenderInput(context)),
                SizedBox(height: 15.v),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyResetAccompanyTypeInput(context)),
                SizedBox(height: 15.v),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildAccompanyResetFindTargetInput(context)),
                SizedBox(height: 15.v),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanyResetSociabilityInput(context)),
                SizedBox(height: 23.v),

                // 本人
                Align(
                  alignment: Alignment.centerLeft,
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
  PreferredSizeWidget _buildHeader(BuildContext context, String title) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: title, margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
  Widget _buildAccompanyResetEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanyEraController,
      hintText: "３０代",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanyCountryController,
      hintText: "日本",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanyCityController,
      hintText: "大阪",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanyGenderController,
      hintText: "男",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetAccompanyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanyAccompanyTypeController,
      hintText: "おしゃべり",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanyFindTargetController,
      hintText: "聞き役",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetAccompanySociabilityController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
    );
  }

  /// Certification For Check
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 110,
      height: 40,
      text: "条件確認",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        onTaptf(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deleteTarget);
  }
}
