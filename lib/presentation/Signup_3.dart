import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class signUp_3 extends StatelessWidget {
  signUp_3({Key? key}) : super(key: key);

  TextEditingController zipcodeController = TextEditingController();

  TextEditingController group36Controller = TextEditingController();

  TextEditingController group37Controller = TextEditingController();

  TextEditingController ddController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 43.v),
                child: Column(children: [
                  _buildAnnualSalaryInput(context),
                  SizedBox(height: 14.v),
                  _buildSociabilityInput(context),
                  SizedBox(height: 14.v),
                  _buildReligiousInput(context),
                  SizedBox(height: 19.v),
                  _buildIntroduceInput(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarTitle(
            text: "基本個人情報 - C",
            margin: EdgeInsets.only(top: 59.v, bottom: 11.v)),
        styleType: Style.bgFill);
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("年収:", style: theme.textTheme.titleLarge),
      _buildZipcode(context)
    ]);
  }

  /// Section Widget
  Widget _buildGroup36(BuildContext context) {
    return CustomTextFormField(
      controller: group36Controller,
      hintText: "人たら神",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSociabilityInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("社交力:", style: theme.textTheme.titleLarge),
      _buildGroup36(context)
    ]);
  }

  /// Section Widget
  Widget _buildGroup37(BuildContext context) {
    return CustomTextFormField(
      controller: group37Controller,
      hintText: "多神教",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildReligiousInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("宗教:", style: theme.textTheme.titleLarge),
      _buildGroup37(context)
    ]);
  }

  /// Section Widget
  Widget _buildDd(BuildContext context) {
    return CustomTextFormField(
      controller: ddController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 19.v),
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildIntroduceInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("自己紹介:", style: theme.textTheme.titleLarge),
      _buildDd(context)
    ]);
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
        width: 150.h,
        text: "次へ",
        margin: EdgeInsets.only(left: 140.h, right: 140.h, bottom: 30.v),
        buttonStyle: CustomButtonStyles.outlinePinkATL301,
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates to the k26Screen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.SearchTitle);
  }
}
