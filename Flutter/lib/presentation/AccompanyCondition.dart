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

class AccompanyCondition extends StatefulWidget {
  AccompanyCondition({Key? key}) : super(key: key);

  @override
  _AccompanyConditionState createState() => _AccompanyConditionState();
}

class _AccompanyConditionState extends State<AccompanyCondition> {
  TextEditingController accompanyEraController = TextEditingController();
  TextEditingController accompanyCityController = TextEditingController();
  TextEditingController accompanyGenderController = TextEditingController();
  TextEditingController accompanySpeakLanguageController = TextEditingController();
  TextEditingController accompanyFindTypeController = TextEditingController();
  TextEditingController accompanyFindTargetController = TextEditingController();
  TextEditingController accompanySociabilityController = TextEditingController();

// Http
  void createAccompanyHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateAccompany";
    var requestBody = {
      "session_id": globalSessionID,
      "Era": accompanyEraController.text,
      "City": accompanyCityController.text,
      "Gender": accompanyGenderController.text,
      "Speak_language": accompanySpeakLanguageController.text,
      "Find_Type": accompanyFindTypeController.text,
      "Find_Target": accompanyFindTargetController.text,
      "Sociability": accompanySociabilityController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTapNextButton(context);
    }
  }

  // Grpc
  void createAccompanyGrpcRequest(BuildContext context) async {
    final request = CreateAccompanyRequest(
      sessionID: globalSessionID,
      era: int.parse(accompanyEraController.text),
      city: accompanyCityController.text,
      gender: accompanyGenderController.text,
      speaklanguage: accompanySpeakLanguageController.text,
      findType: accompanyFindTypeController.text,
      findTarget: accompanyFindTargetController.text,
      sociability: accompanySociabilityController.text,
      certification: false,
    );

    final response = await GrpcInfoService.client.createAccompany(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextButton(context);
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
                CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyEraInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildAccompanyCityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildAccompanyGenderInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Language
                CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildAccompanySpeakLanguageInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyFindTypeInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildAccompanyFindTargetInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanySociabilityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 40),

                // 本人
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

                _buildNextPageButton(context),
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
      title: AppbarTitle(text: "お相伴の条件設定", margin: EdgeInsets.only(top: 60, bottom: 20)),
    );
  }

  /// ture back
  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Era
  Widget _buildAccompanyEraInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanyEraController,
      hintText: "３０代",
    );
  }

  /// City
  Widget _buildAccompanyCityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanyCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildAccompanyGenderInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanyGenderController,
      hintText: "男",
    );
  }

  /// Speak Language
  Widget _buildAccompanySpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanySpeakLanguageController,
      hintText: "日本語",
    );
  }

  /// Accompany Type
  Widget _buildAccompanyFindTypeInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanyFindTypeController,
      hintText: "おしゃべり",
    );
  }

  /// FindTarget
  Widget _buildAccompanyFindTargetInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanyFindTargetController,
      hintText: "聞き役",
    );
  }

  /// Sociability
  Widget _buildAccompanySociabilityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: accompanySociabilityController,
      hintText: "人たら神",
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        createAccompanyGrpcRequest(context);
      },
    );
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
