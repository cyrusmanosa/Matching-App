import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_hobby.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class HobbyCondition extends StatefulWidget {
  HobbyCondition({Key? key}) : super(key: key);

  @override
  _HobbyConditionState createState() => _HobbyConditionState();
}

class _HobbyConditionState extends State<HobbyCondition> {
  bool? haveTable;
  bool confirmBtn = false;

  TextEditingController resetHobbyEraController = TextEditingController();
  TextEditingController resetHobbyCityController = TextEditingController();
  TextEditingController resetHobbyGenderController = TextEditingController();
  TextEditingController resetHobbySpeakLanguageController = TextEditingController();
  TextEditingController resetHobbyFindTypeController = TextEditingController();
  TextEditingController resetHobbyExperienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getHobbyGrpcRequest(context);
  }

  // check tabel
  void getHobbyGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = GetHobbyRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getHobby(request);
      setState(() {
        haveTable = true;
        resetHobbyEraController = TextEditingController(text: response.h.era.toString());
        resetHobbyCityController = TextEditingController(text: response.h.city.toString());
        resetHobbyGenderController = TextEditingController(text: response.h.gender.toString());
        resetHobbySpeakLanguageController = TextEditingController(text: response.h.speaklanguage.toString());
        resetHobbyFindTypeController = TextEditingController(text: response.h.findType.toString());
        resetHobbyExperienceController = TextEditingController(text: response.h.experience.toString());
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  void checkTargetUserTable(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = GetTargetListRequest(sessionID: apiKeyS);
      await GrpcInfoService.client.getTargetList(request);
      Navigator.pushNamed(context, AppRoutes.deleteTarget);
    } on GrpcError {
      onTapPaymentPage(context);
    }
  }

  void hobbyGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    setState(() {
      showLoadDialog(context);
    });
    await Future.delayed(Duration(seconds: 1));
    if (haveTable == true) {
      try {
        final request = UpdateHobbyRequest(
          sessionID: apiKeyS,
          era: int.parse(resetHobbyEraController.text),
          city: resetHobbyCityController.text,
          gender: resetHobbyGenderController.text,
          speaklanguage: resetHobbySpeakLanguageController.text,
          findType: resetHobbyFindTypeController.text,
          experience: int.parse(resetHobbyExperienceController.text),
        );
        await GrpcInfoService.client.updateHobby(request);
        checkTargetUserTable(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
        throw Exception("ホビーの更新中にエラーが発生しました。");
      }
    } else {
      try {
        final request = CreateHobbyRequest(
          sessionID: apiKeyS,
          era: int.parse(resetHobbyEraController.text),
          city: resetHobbyCityController.text,
          gender: resetHobbyGenderController.text,
          speaklanguage: resetHobbySpeakLanguageController.text,
          findType: resetHobbyFindTypeController.text,
          experience: int.parse(resetHobbyExperienceController.text),
        );
        await GrpcInfoService.client.createHobby(request);
        onTapPaymentPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
        throw Exception("ホビーの条件を入力中にエラーが発生しました。");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "趣味の条件", true),
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.bgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 50),
            child: Column(
              children: [
                // Era
                CustomInputBar(titleName: "年代:", backendPart: _buildHobbyResetEraInput(context)),
                SizedBox(height: mediaH / 50),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildHobbyResetCityInput(context)),
                SizedBox(height: mediaH / 50),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildHobbyResetGenderInput(context)),
                SizedBox(height: mediaH / 50),

                // Language
                CustomInputBar(titleName: "言語:", backendPart: _buildHobbySpeakLanguageInput(context)),
                SizedBox(height: mediaH / 50),

                // Hobby Type
                CustomInputBar(titleName: "趣味のタイプ:", backendPart: _buildHobbyResetHobbyTypeInput(context)),
                SizedBox(height: mediaH / 50),

                // Experience
                CustomInputBar(titleName: "経験 - 年:", backendPart: _buildHobbyResetExperienceInput(context)),
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
                        decoration:
                            BoxDecoration(color: confirmBtn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
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
      ),
    );
  }

  Widget _buildHobbyResetEraInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyEraController, hintText: "30");
  }

  /// Reset City
  Widget _buildHobbyResetCityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyCityController, hintText: "大阪");
  }

  /// Reset Gender
  Widget _buildHobbyResetGenderInput(BuildContext context) {
    return CustomDropDownBar(controller: resetHobbyGenderController, hintText: genderList[0], itemArray: genderList);
  }

  /// Speak Language
  Widget _buildHobbySpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbySpeakLanguageController, hintText: "日本語");
  }

  /// Reset Hobby Type
  Widget _buildHobbyResetHobbyTypeInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyFindTypeController, hintText: "サッカー");
  }

  /// Reset Experience
  Widget _buildHobbyResetExperienceInput(BuildContext context) {
    return CustomInputFormBar(controller: resetHobbyExperienceController, hintText: "3");
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        hobbyGrpcRequest(context);
      },
    );
  }

  onTapPaymentPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
