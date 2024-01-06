import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_hobby.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HobbyConditionRepair extends StatefulWidget {
  HobbyConditionRepair({Key? key}) : super(key: key);

  @override
  _HobbyConditionRepairState createState() => _HobbyConditionRepairState();
}

class _HobbyConditionRepairState extends State<HobbyConditionRepair> {
  TextEditingController resetHobbyEraController = TextEditingController();
  TextEditingController resetHobbyCountryController = TextEditingController();
  TextEditingController resetHobbyCityController = TextEditingController();
  TextEditingController resetHobbyGenderController = TextEditingController();
  TextEditingController resetHobbySpeakLanguageController = TextEditingController();
  TextEditingController resetHobbyFindTypeController = TextEditingController();
  TextEditingController resetHobbyFindTargetController = TextEditingController();
  TextEditingController resetHobbyExperienceController = TextEditingController();
  TextEditingController resetHobbySociabilityController = TextEditingController();
  TextEditingController resetHobbyHeightController = TextEditingController();
  TextEditingController resetHobbyWeightController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

// Http
  void updateHobbyHttpRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    var url = "http://127.0.0.1:8080/CreateHobby";
    var requestBody = {
      "session_id": apiKeyS,
      "Era": resetHobbyEraController.text,
      "City": resetHobbyCityController.text,
      "Gender": resetHobbyGenderController.text,
      "Height": resetHobbyHeightController.text,
      "Weight": resetHobbyWeightController.text,
      "Speak_language": resetHobbySpeakLanguageController.text,
      "Find_Type": resetHobbyFindTypeController.text,
      "Find_Target": resetHobbyFindTargetController.text,
      "Experience": resetHobbyExperienceController.text,
      "Sociability": resetHobbySociabilityController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTapNextPage(context);
    }
  }

  void updateHobbyGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    final request = UpdateHobbyRequest(
      sessionID: apiKeyS,
      era: int.parse(resetHobbyEraController.text),
      city: resetHobbyCityController.text,
      gender: resetHobbyGenderController.text,
      height: int.parse(resetHobbyHeightController.text),
      weight: int.parse(resetHobbyWeightController.text),
      speaklanguage: resetHobbySpeakLanguageController.text,
      findType: resetHobbyFindTypeController.text,
      findTarget: resetHobbyFindTargetController.text,
      experience: int.parse(resetHobbyExperienceController.text),
      sociability: resetHobbySociabilityController.text,
    );

    final response = await GrpcInfoService.client.updateHobby(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextPage(context);
    } else {
      showErrorDialog(context, "Error: Empty response");
    }
  }

  bool confirmBtn = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: _buildHeader(context),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
          child: Column(
            children: [
              // Era
              CustomInputBar(titleName: "年代:", backendPart: _buildHobbyResetEraInput(context)),
              SizedBox(height: mediaH / 50),

              // Country
              CustomInputBar(titleName: "国籍:", backendPart: _buildHobbyResetCountryInput(context)),
              SizedBox(height: mediaH / 50),

              // City
              CustomInputBar(titleName: "居住地:", backendPart: _buildHobbyResetCityInput(context)),
              SizedBox(height: mediaH / 50),

              // Gender
              CustomInputBar(titleName: "性別:", backendPart: _buildHobbyResetGenderInput(context)),
              SizedBox(height: mediaH / 50),

              // Language
              CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildHobbySpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // Hobby Type
              CustomInputBar(titleName: "趣味のタイプ:", backendPart: _buildHobbyResetHobbyTypeInput(context)),
              SizedBox(height: mediaH / 50),

              // Find Target
              CustomInputBar(titleName: "探す対象:", backendPart: _buildHobbyResetFindTargetInput(context)),
              SizedBox(height: mediaH / 50),

              // Experience
              CustomInputBar(titleName: "経験:", backendPart: _buildHobbyResetExperienceInput(context)),
              SizedBox(height: mediaH / 50),

              // Height
              CustomInputBar(titleName: "身長:", backendPart: _buildHobbyResetHeightInput(context)),
              SizedBox(height: mediaH / 50),

              // Weight
              CustomInputBar(titleName: "体重:", backendPart: _buildHobbyResetWeightInput(context)),
              SizedBox(height: mediaH / 50),

              // Sociability
              CustomInputBar(titleName: "社交力:", backendPart: _buildHobbyResetSociabilityInput(context)),
              SizedBox(height: mediaH / 50),

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
                      height: mediaW / 25,
                      width: mediaW / 25,
                      decoration: BoxDecoration(color: confirmBtn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 50),
                      child: Text("本人認証を確認しました", style: confirmBtn ? CustomTextStyles.confirmGreen : CustomTextStyles.confirmGray),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaH / 25),

              // button
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "趣味の条件更改"));
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Reset Era
  Widget _buildHobbyResetEraInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyEraController, hintText: "３０代");
  }

  /// Reset Country
  Widget _buildHobbyResetCountryInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyCountryController, hintText: "日本");
  }

  /// Reset City
  Widget _buildHobbyResetCityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyCityController, hintText: "大阪");
  }

  /// Reset Gender
  Widget _buildHobbyResetGenderInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyGenderController, hintText: "男");
  }

  /// Speak Language
  Widget _buildHobbySpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbySpeakLanguageController, hintText: "日本語");
  }

  /// Reset Hobby Type
  Widget _buildHobbyResetHobbyTypeInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyFindTypeController, hintText: "サッカー");
  }

  /// Reset Find Target
  Widget _buildHobbyResetFindTargetInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyFindTargetController, hintText: "サッカーのチームメンバー");
  }

  /// Reset Experience
  Widget _buildHobbyResetExperienceInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyExperienceController, hintText: "3年");
  }

  /// Reset Sociability
  Widget _buildHobbyResetSociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbySociabilityController, hintText: "人たら神");
  }

  /// Reset Height
  Widget _buildHobbyResetHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyHeightController, hintText: "172");
  }

  /// Reset Weight
  Widget _buildHobbyResetWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyWeightController, hintText: "65Kg");
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        updateHobbyGrpcRequest(context);
      },
    );
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
