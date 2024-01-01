import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_hobby.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HobbyCondition extends StatefulWidget {
  HobbyCondition({Key? key}) : super(key: key);

  @override
  _HobbyConditionState createState() => _HobbyConditionState();
}

class _HobbyConditionState extends State<HobbyCondition> {
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

// Http
  void createHobbyHttpRequest(BuildContext context) async {
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
      onTapNextButton(context);
    }
  }

// Grpc
  void createHobbyGrpcRequest(BuildContext context) async {
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

    final response = await GrpcInfoService.client.createHobby(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextButton(context);
    } else {
      print(globalSessionID);
      showErrorDialog(context, "Error: Empty response");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          // Error Logo
          title: CustomImageView(
            imagePath: ImageConstant.imgWarning,
            height: mediaQueryData.size.height / 20,
            width: mediaQueryData.size.width / 10,
            alignment: Alignment.center,
          ),

          // Word
          content: Container(
            width: mediaQueryData.size.width / 1.1,
            child: Text(errorMessage, style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
          ),
          actions: [
            CustomOutlinedButton(
              alignment: Alignment.center,
              text: "OK",
              margin: EdgeInsets.only(bottom: mediaQueryData.size.height / 100),
              onPressed: () {
                onTapReturn(context);
              },
            ),
          ],
        );
      },
    );
  }

  bool confirmBtn = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context),
        body: Form(
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
              child: Column(
                children: [
                  // Era
                  CustomInputBar(titleName: "年代:", backendPart: _buildHobbyEraInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Country
                  CustomInputBar(titleName: "国籍:", backendPart: _buildHobbyCountryInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // City
                  CustomInputBar(titleName: "居住地:", backendPart: _buildHobbyCityInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Gender
                  CustomInputBar(titleName: "性別:", backendPart: _buildHobbyGenderInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Language
                  CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildHobbySpeakLanguageInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Hobby Type
                  CustomInputBar(titleName: "趣味のタイプ:", backendPart: _buildHobbyTypeInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Find Target
                  CustomInputBar(titleName: "探す対象:", backendPart: _buildHobbyFindTargetInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Experience
                  CustomInputBar(titleName: "経験:", backendPart: _buildHobbyExperienceInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Height
                  CustomInputBar(titleName: "身長:", backendPart: _buildHobbyHeightInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Weight
                  CustomInputBar(titleName: "体重:", backendPart: _buildHobbyWeightInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Sociability
                  CustomInputBar(titleName: "社交力:", backendPart: _buildHobbySociabilityInput(context)),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // 本人認証の丸
                  InkWell(
                    onTap: () {
                      setState(() {
                        confirmBtn = !confirmBtn;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: mediaQueryData.size.width / 25,
                          width: mediaQueryData.size.width / 25,
                          decoration:
                              BoxDecoration(color: confirmBtn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mediaQueryData.size.width / 50),
                          child: Text("本人認証を確認しました", style: confirmBtn ? CustomTextStyles.confirmGreen : CustomTextStyles.confirmGray),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: mediaQueryData.size.height / 25),
                  // button
                  _buildNextPageButton(context),
                  SizedBox(height: mediaQueryData.size.height / 25),
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
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapReturn(context);
        },
      ),
      title: AppbarTitle(text: "趣味の条件設定", margin: EdgeInsets.only(top: 60, bottom: 20)),
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Era
  Widget _buildHobbyEraInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyEraController, hintText: "３０代");
  }

  /// Country
  Widget _buildHobbyCountryInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyCountryController, hintText: "日本");
  }

  /// City
  Widget _buildHobbyCityInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyCityController, hintText: "大阪");
  }

  /// Gender
  Widget _buildHobbyGenderInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyGenderController, hintText: "男");
  }

  /// Speak Language
  Widget _buildHobbySpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbySpeakLanguageController, hintText: "日本語");
  }

  /// Hobby Type
  Widget _buildHobbyTypeInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyFindTypeController, hintText: "サッカー");
  }

  /// Find Target
  Widget _buildHobbyFindTargetInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyFindTargetController, hintText: "サッカーのチームメンバー");
  }

  /// Experience
  Widget _buildHobbyExperienceInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyExperienceController, hintText: "3年");
  }

  /// Height
  Widget _buildHobbyHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyHeightController, hintText: "170cm");
  }

  /// Section Widget
  Widget _buildHobbyWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyWeightController, hintText: "60Kg");
  }

  /// Sociability
  Widget _buildHobbySociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbySociabilityController, hintText: "人たら神");
  }

  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        createHobbyGrpcRequest(context);
      },
    );
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
