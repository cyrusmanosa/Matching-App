import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningMsgBox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoverConditionRepair extends StatefulWidget {
  LoverConditionRepair({Key? key}) : super(key: key);

  @override
  _LoverConditionRepairState createState() => _LoverConditionRepairState();
}

class _LoverConditionRepairState extends State<LoverConditionRepair> {
  TextEditingController resetLoverMinAgeController = TextEditingController();
  TextEditingController resetLoverMaxAgeController = TextEditingController();
  TextEditingController resetLoverCountryController = TextEditingController();
  TextEditingController resetLoverCityController = TextEditingController();
  TextEditingController resetLoverGenderController = TextEditingController();
  TextEditingController resetLoverBloodController = TextEditingController();
  TextEditingController resetLoverConstellationController = TextEditingController();
  TextEditingController resetLoverSexualController = TextEditingController();
  TextEditingController resetLoverHeightController = TextEditingController();
  TextEditingController resetLoverWeightController = TextEditingController();
  TextEditingController resetLoverSpeakLanguageController = TextEditingController();
  TextEditingController resetLoverEducationController = TextEditingController();
  TextEditingController resetLoverJobController = TextEditingController();
  TextEditingController resetLoverAnnualSalaryController = TextEditingController();
  TextEditingController resetLoverSociabilityController = TextEditingController();
  TextEditingController resetLoverReligiousController = TextEditingController();

// Http
  void updateLoverHttpRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    var url = "http://127.0.0.1:8080/UpdateLover";
    var requestBody = {
      "session_id": apiKeyS,
      "MinAge": resetLoverMinAgeController.text,
      "MaxAge": resetLoverMaxAgeController.text,
      "City": resetLoverCityController.text,
      "Gender": resetLoverGenderController.text,
      "Constellation": resetLoverConstellationController.text,
      "Height": resetLoverHeightController.text,
      "Weight": resetLoverWeightController.text,
      "Speak_language": resetLoverSpeakLanguageController.text,
      "Job": resetLoverJobController.text,
      "AnnualSalary": resetLoverAnnualSalaryController.text,
      "Sociability": resetLoverSociabilityController.text,
      "Religious": resetLoverReligiousController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTapNextPage(context);
    }
  }

// Grpc
  void updateLoverGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    final request = UpdateLoverRequest(
      sessionID: apiKeyS,
      minAge: int.parse(resetLoverMinAgeController.text),
      maxAge: int.parse(resetLoverMaxAgeController.text),
      city: resetLoverCityController.text,
      gender: resetLoverGenderController.text,
      constellation: resetLoverConstellationController.text,
      height: int.parse(resetLoverHeightController.text),
      weight: int.parse(resetLoverWeightController.text),
      speaklanguage: resetLoverSpeakLanguageController.text,
      job: resetLoverJobController.text,
      annualSalary: int.parse(resetLoverAnnualSalaryController.text),
      sociability: resetLoverSociabilityController.text,
      religious: resetLoverReligiousController.text,
    );

    final response = await GrpcInfoService.client.updateLover(request);
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
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildHeader(context),
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
          child: Column(
            children: [
              Row(
                children: [
                  CustomInputBar(titleName: "年齢:", backendPart: _buildLoverMinAgeInput(context)),
                  SizedBox(width: mediaQueryData.size.width / 30),
                  Text("から"),
                  SizedBox(width: mediaQueryData.size.width / 30),
                  CustomInputBar(titleName: "", backendPart: _buildLoverMaxAgeInput(context)),
                ],
              ),
              SizedBox(height: mediaQueryData.size.height / 100),
              // Country
              CustomInputBar(titleName: "国籍:", backendPart: _buildLoverResetCountryInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // City
              CustomInputBar(titleName: "居住地:", backendPart: _buildLoverResetCityInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Gender
              CustomInputBar(titleName: "性別:", backendPart: _buildLoverResetGenderInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Constellation
              CustomInputBar(titleName: "星座:", backendPart: _buildLoverResetConstellationInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Blood
              CustomInputBar(titleName: "血液型:", backendPart: _buildLoverResetBloodInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Sexual
              CustomInputBar(titleName: "性的指向:", backendPart: _buildLoverResetSexualInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Height
              CustomInputBar(titleName: "身長:", backendPart: _buildLoverResetHeightInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Wegiht
              CustomInputBar(titleName: "体重:", backendPart: _buildLoverResetWeightInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Speak Language
              CustomInputBar(titleName: "言語:", backendPart: _buildLoverSpeakLanguageInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Job
              CustomInputBar(titleName: "職種:", backendPart: _buildLoverResetJobInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Annual Salary
              CustomInputBar(titleName: "年収:", backendPart: _buildLoverResetAnnualSalaryInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Socialbility
              CustomInputBar(titleName: "社交力:", backendPart: _buildLoverResetSociabilityInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Religious
              CustomInputBar(titleName: "宗教:", backendPart: _buildLoverResetReligiousInput(context)),
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
                      decoration: BoxDecoration(color: confirmBtn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
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
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "恋人の条件更改"));
  }

  /// Min Age
  Widget _buildLoverMinAgeInput(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaQueryData.size.height / 16,
      width: mediaQueryData.size.width / 7.5,
      maxLength: 3,
      controller: resetLoverMaxAgeController,
      hintText: "20",
    );
  }

  /// Min Age
  Widget _buildLoverMaxAgeInput(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaQueryData.size.height / 16,
      width: mediaQueryData.size.width / 7.5,
      maxLength: 3,
      controller: resetLoverMinAgeController,
      hintText: "20",
    );
  }

  /// Country
  Widget _buildLoverResetCountryInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverCountryController, hintText: "日本");
  }

  /// City
  Widget _buildLoverResetCityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverCityController, hintText: "大阪");
  }

  /// Gender
  Widget _buildLoverResetGenderInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverGenderController, hintText: "男");
  }

  /// Constellation
  Widget _buildLoverResetConstellationInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverConstellationController, hintText: "いて座");
  }

  /// Constellation
  Widget _buildLoverResetBloodInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverBloodController, hintText: "A");
  }

  /// Sexual
  Widget _buildLoverResetSexualInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverSexualController, hintText: "異性愛");
  }

  /// Height
  Widget _buildLoverResetHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverHeightController, hintText: "170cm");
  }

  /// Weight
  Widget _buildLoverResetWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverWeightController, hintText: "170cm");
  }

  /// Speak Language
  Widget _buildLoverSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverSpeakLanguageController, hintText: "日本語");
  }

  /// Job
  Widget _buildLoverResetJobInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverJobController, hintText: "ホスト");
  }

  /// Annual Salary
  Widget _buildLoverResetAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverAnnualSalaryController, hintText: "4000");
  }

  /// Sociability
  Widget _buildLoverResetSociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverSociabilityController, hintText: "人たら神");
  }

  /// Religious
  Widget _buildLoverResetReligiousInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverReligiousController, hintText: "多神教");
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        updateLoverGrpcRequest(context);
      },
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
