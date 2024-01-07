import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/loading.dart';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccompanyConditionRepair extends StatefulWidget {
  AccompanyConditionRepair({Key? key}) : super(key: key);

  @override
  _AccompanyConditionRepairState createState() => _AccompanyConditionRepairState();
}

class _AccompanyConditionRepairState extends State<AccompanyConditionRepair> {
  bool? haveTable;
  bool confirmBtn = false;

  TextEditingController resetAccompanyEraController = TextEditingController();
  TextEditingController resetAccompanyCityController = TextEditingController();
  TextEditingController resetAccompanyGenderController = TextEditingController();
  TextEditingController resetAccompanySpeakLanguageController = TextEditingController();
  TextEditingController resetAccompanyFindTypeController = TextEditingController();
  TextEditingController resetAccompanyFindTargetController = TextEditingController();
  TextEditingController resetAccompanySociabilityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAccompanyGrpcRequest(context);
  }

  // check tabel
  void getAccompanyGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = GetAccompanyRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getAccompany(request);
      setState(() {
        haveTable = true;
        resetAccompanyEraController.text = response.ac.era.toString();
        resetAccompanyCityController.text = response.ac.city.toString();
        resetAccompanyGenderController.text = response.ac.gender.toString();
        resetAccompanySpeakLanguageController.text = response.ac.speaklanguage.toString();
        resetAccompanyFindTypeController.text = response.ac.findType.toString();
        resetAccompanyFindTargetController.text = response.ac.findTarget.toString();
        resetAccompanySociabilityController.text = response.ac.sociability.toString();
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  // Http
  void updateAccompanyHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/UpdateAccompany";
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    var requestBody = {
      "session_id": apiKeyS,
      "Era": resetAccompanyEraController.text,
      "City": resetAccompanyCityController.text,
      "Gender": resetAccompanyGenderController.text,
      "Speak_language": resetAccompanySpeakLanguageController.text,
      "Find_Type": resetAccompanyFindTypeController.text,
      "Find_Target": resetAccompanyFindTargetController.text,
      "Sociability": resetAccompanySociabilityController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapNextPage(context);
    }
  }

  // Grpc
  void createAccompanyGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    setState(() {
      showLoadDialog(context);
    });
    await Future.delayed(Duration(seconds: 1));
    if (haveTable == true) {
      try {
        final request = UpdateAccompanyRequest(
          sessionID: apiKeyS,
          era: int.parse(resetAccompanyEraController.text),
          city: resetAccompanyCityController.text,
          gender: resetAccompanyGenderController.text,
          speaklanguage: resetAccompanySpeakLanguageController.text,
          findType: resetAccompanyFindTypeController.text,
          findTarget: resetAccompanyFindTargetController.text,
          sociability: resetAccompanySociabilityController.text,
          certification: false,
        );
        await GrpcInfoService.client.updateAccompany(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data for update");
        throw Exception("Error occurred while fetching update Accompany.");
      }
    } else {
      try {
        final request = CreateAccompanyRequest(
          sessionID: apiKeyS,
          era: int.parse(resetAccompanyEraController.text),
          city: resetAccompanyCityController.text,
          gender: resetAccompanyGenderController.text,
          speaklanguage: resetAccompanySpeakLanguageController.text,
          findType: resetAccompanyFindTypeController.text,
          findTarget: resetAccompanyFindTargetController.text,
          sociability: resetAccompanySociabilityController.text,
          certification: false,
        );
        await GrpcInfoService.client.createAccompany(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data for create accompany");
        throw Exception("Error occurred while fetching Create Accompany.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: _buildHeader(context),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
          child: Column(
            children: [
              // Era
              CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyResetEraInput(context)),
              SizedBox(height: mediaH / 50),

              // City
              CustomInputBar(titleName: "居住地:", backendPart: _buildAccompanyResetCityInput(context)),
              SizedBox(height: mediaH / 50),

              // Gender
              CustomInputBar(titleName: "性別:", backendPart: _buildAccompanyResetGenderInput(context)),
              SizedBox(height: mediaH / 50),

              // Language
              CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildAccompanyResetSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // Accompany Type
              CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyResetAccompanyTypeInput(context)),
              SizedBox(height: mediaH / 50),

              // Find Target
              CustomInputBar(titleName: "探す対象:", backendPart: _buildAccompanyResetFindTargetInput(context)),
              SizedBox(height: mediaH / 50),

              // Sociability
              CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanyResetSociabilityInput(context)),
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

              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "お相伴の条件更改"));
  }

  /// Section Widget
  Widget _buildAccompanyResetEraInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyEraController, hintText: "３０代");
  }

  /// Section Widget
  Widget _buildAccompanyResetCityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyCityController, hintText: "大阪");
  }

  /// Section Widget
  Widget _buildAccompanyResetGenderInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyGenderController, hintText: "男");
  }

  /// Section Widget
  Widget _buildAccompanyResetAccompanyTypeInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyFindTypeController, hintText: "おしゃべり");
  }

  /// Section Widget
  Widget _buildAccompanyResetFindTargetInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyFindTargetController, hintText: "聞き役");
  }

  /// Accompany Type
  Widget _buildAccompanyResetSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanySpeakLanguageController, hintText: "おしゃべり");
  }

  /// Section Widget
  Widget _buildAccompanyResetSociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanySociabilityController, hintText: "人たら神");
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        createAccompanyGrpcRequest(context);
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
