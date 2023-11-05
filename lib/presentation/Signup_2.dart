import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class signUp_2 extends StatelessWidget {
  signUp_2({Key? key}) : super(key: key);

  TextEditingController group54Controller = TextEditingController();

  TextEditingController group55Controller = TextEditingController();

  TextEditingController group56Controller = TextEditingController();

  TextEditingController distanceController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  TextEditingController group59Controller = TextEditingController();

  TextEditingController group60Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 39.v),
                      _buildNickNameInput(context),
                      SizedBox(height: 16.v),
                      _buildCityInput(context),
                      SizedBox(height: 16.v),
                      _buildSexualInput(context),
                      SizedBox(height: 16.v),
                      _buildHeightInput(context),
                      SizedBox(height: 16.v),
                      _buildWeightInput(context),
                      SizedBox(height: 16.v),
                      _buildEducationInput(context),
                      SizedBox(height: 16.v),
                      _buildJobInput(context)
                    ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarTitle(
            text: "基本個人情報 - B",
            margin: EdgeInsets.only(top: 59.v, bottom: 11.v)),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildGroup54(BuildContext context) {
    return CustomTextFormField(
      controller: group54Controller,
      hintText: "仆街",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildNickNameInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("ニックネーム:", style: theme.textTheme.titleLarge),
      _buildGroup54(context)
    ]);
  }

  /// Section Widget
  Widget _buildGroup55(BuildContext context) {
    return CustomTextFormField(
      controller: group55Controller,
      hintText: "大阪",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCityInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("居住地:", style: theme.textTheme.titleLarge),
      _buildGroup55(context)
    ]);
  }

  /// Section Widget
  Widget _buildGroup56(BuildContext context) {
    return CustomTextFormField(
      controller: group56Controller,
      hintText: "異性愛",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSexualInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("性的指向:", style: theme.textTheme.titleLarge),
      _buildGroup56(context)
    ]);
  }

  /// Section Widget
  Widget _buildDistance(BuildContext context) {
    return CustomTextFormField(
      controller: distanceController,
      hintText: "170cm",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildHeightInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("身長:", style: theme.textTheme.titleLarge),
      _buildDistance(context)
    ]);
  }

  /// Section Widget
  Widget _buildWeight(BuildContext context) {
    return CustomTextFormField(
      controller: weightController,
      hintText: "60kg",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildWeightInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("体重:", style: theme.textTheme.titleLarge),
      _buildWeight(context)
    ]);
  }

  /// Section Widget
  Widget _buildGroup59(BuildContext context) {
    return CustomTextFormField(
      controller: group59Controller,
      hintText: "高校生",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildEducationInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("学歴:", style: theme.textTheme.titleLarge),
      _buildGroup59(context)
    ]);
  }

  /// Section Widget
  Widget _buildGroup60(BuildContext context) {
    return CustomTextFormField(
      controller: group60Controller,
      hintText: "ホスト",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildJobInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("職種:", style: theme.textTheme.titleLarge),
      _buildGroup60(context)
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

  /// Navigates to the signupPhoneoremailPartthreeScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.SignUp_3);
  }
}
