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
class HobbyCondition extends StatelessWidget {
  final String title;
  HobbyCondition(this.title, {Key? key}) : super(key: key);

  TextEditingController hobbyEraInputController = TextEditingController();
  TextEditingController hobbyCountryInputController = TextEditingController();
  TextEditingController hobbyCityInputController = TextEditingController();
  TextEditingController hobbyGenderInputController = TextEditingController();
  TextEditingController hobbySpeakLanguageInputController = TextEditingController();
  TextEditingController hobbyFindTypeInputController = TextEditingController();
  TextEditingController hobbyFindTargetInputController = TextEditingController();
  TextEditingController hobbyExperienceInputController = TextEditingController();
  TextEditingController hobbyHeightInputController = TextEditingController();
  TextEditingController hobbyWeightInputController = TextEditingController();
  TextEditingController hobbySociabilityInputController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void hobbyRequset(BuildContext context) async {
    var url = "http://127.0.0.1:8080/SignUp";
    var requestBody = {
      "User_ID": 1,
      "Era": hobbyEraInputController.text,
      "City": hobbyCityInputController.text,
      "Gender": hobbyGenderInputController.text,
      "Height": hobbyHeightInputController.text,
      "Weight": hobbyWeightInputController.text,
      "Speak_language": hobbySpeakLanguageInputController.text,
      "Find_Type": hobbyFindTypeInputController.text,
      "Find_Target": hobbyFindTargetInputController.text,
      "Experience": hobbyExperienceInputController.text,
      "Sociability": hobbySociabilityInputController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTaptf(context);
    } else {
      print("Era: ${hobbyEraInputController.text}");
      print("City: ${hobbyCityInputController.text}");
      print("Gender: ${hobbyGenderInputController.text}");
      print("Height: ${hobbyHeightInputController.text}");
      print("Weight: ${hobbyWeightInputController.text}");
      print("Speak_language: ${hobbySpeakLanguageInputController.text}");
      print("Find_Type: ${hobbyFindTypeInputController.text}");
      print("Find_Target: ${hobbyFindTargetInputController.text}");
      print("Experience: ${hobbyExperienceInputController.text}");
      print("Sociability: ${hobbySociabilityInputController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context, title),
        body: Form(
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
              child: Column(
                children: [
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

                  // Language
                  CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildHobbySpeakLanguageInput(context)),
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

  /// Backend ----------------------------------------------------------------

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
  Widget _buildHobbySpeakLanguageInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbySpeakLanguageInputController,
      hintText: "日本語",
    );
  }

  /// Hobby Type
  Widget _buildHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyFindTypeInputController,
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
      width: 110,
      height: 40,
      text: "条件確認",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        hobbyRequset(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
