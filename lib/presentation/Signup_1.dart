import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable, camel_case_types
class SignUp_1 extends StatelessWidget {
  SignUp_1({Key? key}) : super(key: key);
  TextEditingController lastNameInputController = TextEditingController();
  TextEditingController firstNameInputController = TextEditingController();
  TextEditingController countryInputController = TextEditingController();
  TextEditingController genderInputController = TextEditingController();
  TextEditingController bloodInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // Header
              _buildSignUpAHeader(context),
              SizedBox(height: 15.v),

              // image
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 140.adaptSize,
                width: 140.adaptSize,
                alignment: Alignment.center,
              ),
              SizedBox(height: 20.v),

              // msg
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 65.h),
                  child: Text(
                    "以下の項目は全部入力するのが必要です。",
                    style: CustomTextStyles.bodyMediumBlack900_1,
                  ),
                ),
              ),
              SizedBox(height: 25.v),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("姓:", style: theme.textTheme.titleLarge), _buildLastNameInput(context)],
                ),
              ),
              SizedBox(height: 3.v),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 65.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("名:", style: theme.textTheme.titleLarge), _buildFirstNameInput(context)])),
              SizedBox(height: 3.v),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("生年月日:", style: theme.textTheme.titleLarge), _buildBirthInput(context)],
                ),
              ),
              SizedBox(height: 3.v),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("国籍:", style: theme.textTheme.titleLarge), _buildCountryInput(context)],
                ),
              ),
              SizedBox(height: 3.v),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("性別:", style: theme.textTheme.titleLarge), _buildGenderInput(context)],
                ),
              ),
              SizedBox(height: 3.v),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("血液型:", style: theme.textTheme.titleLarge), _buildBloodInput(context)],
                ),
              ),
              SizedBox(height: 3.v),
              // 18
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 65.h),
                  child: Row(
                    children: [
                      Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "満18歳以上の独身であることを誓約します",
                          style: theme.textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.v),

              // Agree
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 65.h),
                  child: Row(
                    children: [
                      Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                        decoration: BoxDecoration(
                          color: appTheme.gray500,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "全ての規約に同意します",
                          style: theme.textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.v)
            ],
          ),
        ),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  /// Header
  Widget _buildSignUpAHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 125.5, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [SizedBox(height: 35.v), Text("基本個人情報 - A", style: theme.textTheme.headlineMedium)],
      ),
    );
  }

  /// Last Name
  Widget _buildLastNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: lastNameInputController,
      hintText: "山崎",
    );
  }

  /// First Name
  Widget _buildFirstNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: firstNameInputController,
      hintText: "泰一",
    );
  }

  /// Birth
  Widget _buildBirthInput(BuildContext context) {
    return CustomTextFormField(
      controller: countryInputController,
      hintText: "1982−03−12",
    );
  }

  /// Country
  Widget _buildCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: countryInputController,
      hintText: "日本",
    );
  }

  /// Gender
  Widget _buildGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: genderInputController,
      hintText: "男",
    );
  }

  /// Blood
  Widget _buildBloodInput(BuildContext context) {
    return CustomTextFormField(
      controller: bloodInputController,
      hintText: "O",
      textInputAction: TextInputAction.done,
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "次へ",
      margin: EdgeInsets.only(left: 140.h, right: 140.h, bottom: 30.v),
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
      onPressed: () {
        onTapNextButton(context);
      },
    );
  }

  /// Navigates to the signupPhoneoremailParttwoScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_2);
  }
}
