import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccompanyConditionRepair extends StatefulWidget {
  AccompanyConditionRepair({Key? key}) : super(key: key);

  @override
  _AccompanyConditionRepairState createState() => _AccompanyConditionRepairState();
}

class _AccompanyConditionRepairState extends State<AccompanyConditionRepair> {
  TextEditingController resetAccompanyEraController = TextEditingController();
  TextEditingController resetAccompanyCityController = TextEditingController();
  TextEditingController resetAccompanyGenderController = TextEditingController();
  TextEditingController resetAccompanySpeakLanguageController = TextEditingController();
  TextEditingController resetAccompanyFindTypeController = TextEditingController();
  TextEditingController resetAccompanyFindTargetController = TextEditingController();
  TextEditingController resetAccompanySociabilityController = TextEditingController();

// Http
  void updateAccompanyHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/UpdateAccompany";
    var requestBody = {
      "session_id": globalSessionID,
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
    final request = UpdateAccompanyRequest(
      sessionID: globalSessionID,
      era: int.parse(resetAccompanyEraController.text),
      city: resetAccompanyCityController.text,
      gender: resetAccompanyGenderController.text,
      speaklanguage: resetAccompanySpeakLanguageController.text,
      findType: resetAccompanyFindTypeController.text,
      findTarget: resetAccompanyFindTargetController.text,
      sociability: resetAccompanySociabilityController.text,
      certification: false,
    );

    final response = await GrpcInfoService.client.updateAccompany(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextPage(context);
    } else {
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
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Era
                CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyResetEraInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildAccompanyResetCityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildAccompanyResetGenderInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Language
                CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildAccompanyResetSpeakLanguageInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyResetAccompanyTypeInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildAccompanyResetFindTargetInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanyResetSociabilityInput(context)),
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

                _buildNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      title: AppbarTitle(text: "お相伴の条件更改", margin: EdgeInsets.only(top: 60, bottom: 20)),
    );
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
    Navigator.pushNamed(context, AppRoutes.deleteTarget);
  }
}
