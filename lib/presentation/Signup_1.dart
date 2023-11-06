import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignUp_1 extends StatelessWidget {
  SignUp_1({Key? key}) : super(key: key);
  TextEditingController lastNameInputController = TextEditingController();
  TextEditingController firstNameInputController = TextEditingController();
  TextEditingController group32Controller = TextEditingController();
  TextEditingController genderInputController = TextEditingController();
  TextEditingController bloodInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildHomeHeader(context),
                  SizedBox(height: 15.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 160.adaptSize,
                      width: 160.adaptSize,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 127.h)),
                  SizedBox(height: 10.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 65.h),
                          child: Text("以下の項目は全部入力するのが必要です。",
                              style: CustomTextStyles.bodyMediumBlack900_1))),
                  SizedBox(height: 5.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("姓:", style: theme.textTheme.titleLarge),
                            _buildLastNameInput(context)
                          ])),
                  SizedBox(height: 3.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("名:", style: theme.textTheme.titleLarge),
                            _buildFirstNameInput(context)
                          ])),
                  SizedBox(height: 3.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("生年月日:", style: theme.textTheme.titleLarge),
                            Container(
                                width: 300.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 19.h, vertical: 6.v),
                                decoration: AppDecoration.outlinePinkA.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5),
                                child: Text("1982−03−12",
                                    style: theme.textTheme.bodyLarge))
                          ])),
                  SizedBox(height: 3.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("国籍:", style: theme.textTheme.titleLarge),
                            _buildGroup32(context)
                          ])),
                  SizedBox(height: 3.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("性別:", style: theme.textTheme.titleLarge),
                            _buildGenderInput(context)
                          ])),
                  SizedBox(height: 3.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("血液型:", style: theme.textTheme.titleLarge),
                            _buildBloodInput(context)
                          ])),
                  SizedBox(height: 15.v),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                        decoration: BoxDecoration(
                            color: appTheme.gray500,
                            borderRadius: BorderRadius.circular(10.h))),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("満18歳以上の独身であることを誓約します",
                            style: theme.textTheme.bodyMedium))
                  ]),
                  SizedBox(height: 10.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 65.h),
                          child: Row(children: [
                            Container(
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(bottom: 1.v),
                                decoration: BoxDecoration(
                                    color: appTheme.gray500,
                                    borderRadius: BorderRadius.circular(10.h))),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text("全ての規約に同意します",
                                    style: theme.textTheme.bodyMedium))
                          ]))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  Widget _buildHomeHeader(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 115.h, vertical: 18.v),
        decoration: AppDecoration.fillGray,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(height: 34.v),
          Text("基本個人情報 - A", style: theme.textTheme.headlineMedium)
        ]));
  }

  /// Section Widget
  Widget _buildLastNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: lastNameInputController,
      hintText: "山崎",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildFirstNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: firstNameInputController,
      hintText: "泰一",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildGroup32(BuildContext context) {
    return CustomTextFormField(
      controller: group32Controller,
      hintText: "日本",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: genderInputController,
      hintText: "男",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildBloodInput(BuildContext context) {
    return CustomTextFormField(
      controller: bloodInputController,
      hintText: "O",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
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

  /// Navigates to the signupPhoneoremailParttwoScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_2);
  }
}
