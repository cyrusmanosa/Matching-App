import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
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
class AccompanyConditions extends StatelessWidget {
  final String title;
  AccompanyConditions(this.title, {Key? key}) : super(key: key);

  TextEditingController accompanyEraController = TextEditingController();
  TextEditingController accompanyCityController = TextEditingController();
  TextEditingController accompanyGenderController = TextEditingController();
  TextEditingController accompanySpeakLanguageController = TextEditingController();
  TextEditingController accompanyFindTypeController = TextEditingController();
  TextEditingController accompanyFindTargetController = TextEditingController();
  TextEditingController accompanySociabilityController = TextEditingController();

// Http
  void createAccompanyHttpRequset(BuildContext context) async {
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
      onTaptf(context);
    } else {
      print("Era: ${accompanyEraController.text}");
      print("City: ${accompanyCityController.text}");
      print("Gender: ${accompanyGenderController.text}");
      print("Speak_language: ${accompanySpeakLanguageController.text}");
      print("Find_Type: ${accompanyFindTypeController.text}");
      print("Find_Target: ${accompanyFindTargetController.text}");
      print("Sociability: ${accompanySociabilityController.text}");
    }
  }

  // Grpc
  void createAccompanyGrpcRequset(BuildContext context) async {
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

    final response = await GrpcService.client.createAccompany(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTaptf(context);
    } else {
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
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
            child: Column(
              children: [
                // Era
                CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyEraInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildAccompanyCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildAccompanyGenderInput(context)),
                SizedBox(height: 15.v),

                // Language
                CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildAccompanySpeakLanguageInput(context)),
                SizedBox(height: 15.v),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyFindTypeInput(context)),
                SizedBox(height: 15.v),

                // Find Target
                CustomInputBar(titleName: "探す対象:", backendPart: _buildAccompanyFindTargetInput(context)),
                SizedBox(height: 15.v),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanySociabilityInput(context)),
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

                SizedBox(height: 40),

                _buildCertificationForCheck(context),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  /// ture back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Era
  Widget _buildAccompanyEraInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanyEraController,
      hintText: "３０代",
    );
  }

  /// City
  Widget _buildAccompanyCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanyCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildAccompanyGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanyGenderController,
      hintText: "男",
    );
  }

  /// Speak Language
  Widget _buildAccompanySpeakLanguageInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanySpeakLanguageController,
      hintText: "日本語",
    );
  }

  /// Accompany Type
  Widget _buildAccompanyFindTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanyFindTypeController,
      hintText: "おしゃべり",
    );
  }

  /// FindTarget
  Widget _buildAccompanyFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanyFindTargetController,
      hintText: "聞き役",
    );
  }

  /// Sociability
  Widget _buildAccompanySociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: accompanySociabilityController,
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
        createAccompanyGrpcRequset(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
