import 'dart:convert';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable,camel_case_types
class CanChangeInformation_1 extends StatelessWidget {
  CanChangeInformation_1({Key? key}) : super(key: key);

  TextEditingController canChangeNickNameController = TextEditingController();
  TextEditingController canChangeCityController = TextEditingController();
  TextEditingController canChangeSexualController = TextEditingController();
  TextEditingController canChangeHeightController = TextEditingController();
  TextEditingController canChangeWeightController = TextEditingController();
  TextEditingController canChangeSpeakLanguageController = TextEditingController();
  TextEditingController canChangeEducationController = TextEditingController();

  // Http
  void createCanChangeHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateFixInfo";
    var requestBody = {
      "SessionID": globalSessionID,
      "NickName": canChangeNickNameController.text,
      "City": canChangeCityController.text,
      "Sexual": canChangeSexualController.text,
      "Height": int.parse(canChangeHeightController.text),
      "Weight": int.parse(canChangeWeightController.text),
      "Speaklanguage": canChangeSpeakLanguageController.text,
      "Education": canChangeEducationController.text,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTapNextButton(context);
    }
  }

  // Grpc
  void createCanChangeGrpcRequest(BuildContext context) async {
    final request = CreateCanChangeRequest(
      sessionID: globalSessionID,
      nickName: canChangeNickNameController.text,
      city: canChangeCityController.text,
      sexual: canChangeSexualController.text,
      height: int.parse(canChangeHeightController.text),
      weight: int.parse(canChangeWeightController.text),
      speaklanguage: canChangeSpeakLanguageController.text,
      education: canChangeEducationController.text,
    );

    if (canChangeNickNameController.text == "") {
      showErrorDialog(context, "ニックネームがまだ入力されていません");
    } else if (canChangeCityController.text == "") {
      showErrorDialog(context, "居住地がまだ入力されていません");
    } else if (canChangeSexualController.text == "") {
      showErrorDialog(context, "性的指向がまだ入力されていません");
    } else if (canChangeHeightController.text == "") {
      showErrorDialog(context, "身長がまだ入力されていません");
    } else if (canChangeWeightController.text == "") {
      showErrorDialog(context, "体重がまだ入力されていません");
    } else if (canChangeSpeakLanguageController.text == "") {
      showErrorDialog(context, "学歴がまだ入力されていません");
    } else {
      final response = await GrpcInfoService.client.createCanChange(request);
      // ignore: unnecessary_null_comparison
      if (response != null) {
        onTapNextButton(context);
      } else {
        showErrorDialog(context, "Error: validatable input data");
      }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildHeader(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Nick Name
                CustomInputBar(titleName: "ニックネーム:", backendPart: _buildcanChangeNickNameInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildcanChangeCityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Sexual
                CustomInputBar(titleName: "性的指向:", backendPart: _buildcanChangeSexualInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildcanChangeHeightInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Weight
                CustomInputBar(titleName: "体重:", backendPart: _buildcanChangeWeightInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Speak Language
                CustomInputBar(titleName: "言語:", backendPart: _buildcanChangeSpeakLanguageInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Job
                CustomInputBar(titleName: "学歴:", backendPart: _buildcanChangeEducationInput(context)),
                SizedBox(height: mediaQueryData.size.height / 25),

                // Button
                _buildNextPageButton(context),
                SizedBox(height: mediaQueryData.size.height / 25),
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
      title: AppbarTitle(text: "基本個人情報 - B", margin: EdgeInsets.only(top: 60, bottom: 20)),
    );
  }

  // turn back
  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Nickname
  Widget _buildcanChangeNickNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeNickNameController,
      hintText: "仆街",
    );
  }

  /// City
  Widget _buildcanChangeCityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeCityController,
      hintText: "大阪",
    );
  }

  /// Sexual
  Widget _buildcanChangeSexualInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeSexualController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildcanChangeHeightInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeHeightController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildcanChangeWeightInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeWeightController,
      hintText: "60kg",
    );
  }

  /// Education
  Widget _buildcanChangeEducationInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeEducationController,
      hintText: "高校生",
    );
  }

  /// Speak Language
  Widget _buildcanChangeSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeSpeakLanguageController,
      hintText: "EN,HK,CN,JP",
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: mediaQueryData.size.height / 25,
      text: "次へ",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        createCanChangeGrpcRequest(context);
      },
    );
  }

  /// Navigates to the signupPhoneoremailPartthreeScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_2);
  }
}
