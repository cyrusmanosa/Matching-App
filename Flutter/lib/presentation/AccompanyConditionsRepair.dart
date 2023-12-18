import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
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

// ignore: must_be_immutable, camel_case_types
class AccompanyConditionsRepair extends StatelessWidget {
  final String title;
  AccompanyConditionsRepair(this.title, {Key? key}) : super(key: key);

  TextEditingController resetAccompanyEraController = TextEditingController();
  TextEditingController resetAccompanyCityController = TextEditingController();
  TextEditingController resetAccompanyGenderController = TextEditingController();
  TextEditingController resetAccompanySpeakLanguageController = TextEditingController();
  TextEditingController resetAccompanyFindTypeController = TextEditingController();
  TextEditingController resetAccompanyFindTargetController = TextEditingController();
  TextEditingController resetAccompanySociabilityController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
      onTapNextButton(context);
    } else {
      print("Era: ${resetAccompanyEraController.text}");
      print("City: ${resetAccompanyCityController.text}");
      print("Gender: ${resetAccompanyGenderController.text}");
      print("Speak_language: ${resetAccompanySpeakLanguageController.text}");
      print("Find_Type: ${resetAccompanyFindTypeController.text}");
      print("Find_Target: ${resetAccompanyFindTargetController.text}");
      print("Sociability: ${resetAccompanySociabilityController.text}");
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

    final response = await GrpcService.client.updateAccompany(request);
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
                SizedBox(height: 23.v),

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

                _buildNextPageButton(context),
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

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
  Widget _buildAccompanyResetEraInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanyEraController,
      hintText: "３０代",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetCityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanyCityController,
      hintText: "大阪",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetGenderInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanyGenderController,
      hintText: "男",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetAccompanyTypeInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanyFindTypeController,
      hintText: "おしゃべり",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetFindTargetInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanyFindTargetController,
      hintText: "聞き役",
    );
  }

  /// Accompany Type
  Widget _buildAccompanyResetSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanySpeakLanguageController,
      hintText: "おしゃべり",
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetSociabilityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: resetAccompanySociabilityController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: mediaQueryData.size.height / 25,
      text: "条件確認",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        createAccompanyGrpcRequest(context);
      },
    );
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deleteTarget);
  }
}
