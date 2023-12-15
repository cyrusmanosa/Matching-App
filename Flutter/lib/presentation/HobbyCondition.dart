import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/rpc_hobby.pb.dart';
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

  TextEditingController hobbyEraController = TextEditingController();
  TextEditingController hobbyCountryController = TextEditingController();
  TextEditingController hobbyCityController = TextEditingController();
  TextEditingController hobbyGenderController = TextEditingController();
  TextEditingController hobbySpeakLanguageController = TextEditingController();
  TextEditingController hobbyFindTypeController = TextEditingController();
  TextEditingController hobbyFindTargetController = TextEditingController();
  TextEditingController hobbyExperienceController = TextEditingController();
  TextEditingController hobbyHeightController = TextEditingController();
  TextEditingController hobbyWeightController = TextEditingController();
  TextEditingController hobbySociabilityController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

// Http
  void createHobbyHttpRequset(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateHobby";
    var requestBody = {
      "session_id": globalSessionID,
      "Era": hobbyEraController.text,
      "City": hobbyCityController.text,
      "Gender": hobbyGenderController.text,
      "Height": hobbyHeightController.text,
      "Weight": hobbyWeightController.text,
      "Speak_language": hobbySpeakLanguageController.text,
      "Find_Type": hobbyFindTypeController.text,
      "Find_Target": hobbyFindTargetController.text,
      "Experience": hobbyExperienceController.text,
      "Sociability": hobbySociabilityController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTaptf(context);
    } else {
      print("Era: ${hobbyEraController.text}");
      print("City: ${hobbyCityController.text}");
      print("Gender: ${hobbyGenderController.text}");
      print("Height: ${hobbyHeightController.text}");
      print("Weight: ${hobbyWeightController.text}");
      print("Speak_language: ${hobbySpeakLanguageController.text}");
      print("Find_Type: ${hobbyFindTypeController.text}");
      print("Find_Target: ${hobbyFindTargetController.text}");
      print("Experience: ${hobbyExperienceController.text}");
      print("Sociability: ${hobbySociabilityController.text}");
    }
  }

  void createHobbyGrpcRequset(BuildContext context) async {
    final request = CreateHobbyRequest(
      sessionID: globalSessionID,
      era: int.parse(hobbyEraController.text),
      city: hobbyCityController.text,
      gender: hobbyGenderController.text,
      height: int.parse(hobbyHeightController.text),
      weight: int.parse(hobbyWeightController.text),
      speaklanguage: hobbySpeakLanguageController.text,
      findType: hobbyFindTypeController.text,
      findTarget: hobbyFindTargetController.text,
      experience: int.parse(hobbyExperienceController.text),
      sociability: hobbySociabilityController.text,
    );

    final response = await GrpcService.client.createHobby(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTaptf(context);
    } else {
      print(globalSessionID);
      showErrorDialog(context, "Error: Empty response");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
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

                  // Experience
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
      controller: hobbyEraController,
      hintText: "３０代",
    );
  }

  /// Country
  Widget _buildHobbyCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyCountryController,
      hintText: "日本",
    );
  }

  /// City
  Widget _buildHobbyCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildHobbyGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyGenderController,
      hintText: "男",
    );
  }

  /// Speak Language
  Widget _buildHobbySpeakLanguageInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbySpeakLanguageController,
      hintText: "日本語",
    );
  }

  /// Hobby Type
  Widget _buildHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyFindTypeController,
      hintText: "サッカー",
    );
  }

  /// Find Target
  Widget _buildHobbyFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyFindTargetController,
      hintText: "サッカーのチームメンバー",
    );
  }

  /// Experience
  Widget _buildHobbyExperienceInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyExperienceController,
      hintText: "3年",
    );
  }

  /// Height
  Widget _buildHobbyHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyHeightController,
      hintText: "170cm",
    );
  }

  /// Section Widget
  Widget _buildHobbyWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyWeightController,
      hintText: "60Kg",
      textInputAction: TextInputAction.done,
    );
  }

  /// Sociability
  Widget _buildHobbySociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbySociabilityController,
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
        createHobbyGrpcRequset(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
