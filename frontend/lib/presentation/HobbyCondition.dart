import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_hobby.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_checkBox_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class HobbyCondition extends StatefulWidget {
  HobbyCondition({Key? key, this.arguments}) : super(key: key);

  final String? arguments;
  @override
  _HobbyConditionState createState() => _HobbyConditionState();
}

class _HobbyConditionState extends State<HobbyCondition> {
  bool? haveTable;
  bool confirmBtn = false;

  TextEditingController hobbyEraController = TextEditingController();
  TextEditingController hobbyGenderController = TextEditingController();
  TextEditingController hobbySpeakLanguageController = TextEditingController();
  TextEditingController hobbyFindTypeController = TextEditingController();
  TextEditingController hobbyExperienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getHobbyGrpcRequest(context);
    getCountry(context);
  }

  String country = "";
  List<String> hoobyAddress = [];

  void getCountry(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    // take country
    final crequest = GetFixRequest(sessionID: apiKeyS, userID: userid);
    final result = await GrpcInfoService.client.getFix(crequest);
    setState(() {
      country = result.fix.country;
    });
  }

  // check tabel
  void getHobbyGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');

      // Hobby
      final request = GetHobbyRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getHobby(request);
      setState(() {
        haveTable = true;
        hobbyEraController = TextEditingController(text: response.h.era.toString());
        hobbyGenderController = TextEditingController(text: response.h.gender.toString());
        hobbySpeakLanguageController = TextEditingController(text: response.h.speaklanguage.toString());
        hobbyFindTypeController = TextEditingController(text: response.h.findType.toString());
        hobbyExperienceController = TextEditingController(text: response.h.experience.toString());
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  Future<void> checkTargetUserTable(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    final request = GetTargetListRequest(sessionID: apiKeyS);
    final response = await GrpcInfoService.client.getTargetList(request);
    if (response.tl.target1ID != 0 && response.tl.target2ID != 0 && response.tl.target3ID != 0) {
      Navigator.pushNamed(context, AppRoutes.deleteTarget);
    } else {
      onTapPaymentPage(context);
    }
  }

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  void hobbyGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    if (!isPureNumber(hobbyEraController.text)) {
      await showErrorDialog(context, "入力した年代は数字ではありません");
    } else if (hobbyEraController.text.isEmpty) {
      await showErrorDialog(context, "年代はまだ設定していません");
    } else if (hoobyAddress.isEmpty) {
      await showErrorDialog(context, "居住地はまだ設定していません");
    } else if (hobbyFindTypeController.text.isEmpty) {
      await showErrorDialog(context, "趣味 - タイプはまだ設定していません");
    } else {
      if (haveTable == true) {
        setState(() {
          showLoadDialog(context);
        });
        try {
          final era = int.tryParse(hobbyEraController.text);
          final experience = int.tryParse(hobbyExperienceController.text);
          if (era == null || experience == null) {
            await showErrorDialog(context, "エラー：数値を入力してください");
            return;
          }

          final request = UpdateHobbyRequest(
            sessionID: apiKeyS,
            era: era,
            city: hoobyAddress.toString(),
            gender: hobbyGenderController.text,
            speaklanguage: hobbySpeakLanguageController.text,
            findType: hobbyFindTypeController.text,
            experience: experience,
          );
          await GrpcInfoService.client.updateHobby(request);
          await showLogoDialog(context, "ホビーの条件を更新しました", false);
          await Future.delayed(Duration(seconds: 1));
          await checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
          throw Exception("ホビーの更新中にエラーが発生しました。");
        }
      } else {
        setState(() {
          showLoadDialog(context);
        });
        try {
          final era = int.tryParse(hobbyEraController.text);
          final experience = int.tryParse(hobbyExperienceController.text);
          if (era == null || experience == null) {
            await showErrorDialog(context, "エラー：数値を入力してください");
            return;
          }

          final request = CreateHobbyRequest(
            sessionID: apiKeyS,
            era: era,
            city: hoobyAddress.toString(),
            gender: hobbyGenderController.text,
            speaklanguage: hobbySpeakLanguageController.text,
            findType: hobbyFindTypeController.text,
            experience: experience,
          );
          await GrpcInfoService.client.createHobby(request);
          await showLogoDialog(context, "ホビーの条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          onTapPaymentPage(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
          throw Exception("ホビーの条件を入力中にエラーが発生しました。");
        }
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
                CustomInputBar(titleName: "*年代:", backendPart: _buildHobbyResetEraInput(context)),
                SizedBox(height: mediaH / 50),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildHobbyResetGenderInput(context)),
                SizedBox(height: mediaH / 50),

                // Language
                CustomInputBar(titleName: "言語 - メイン:", backendPart: _buildHobbySpeakLanguageInput(context)),
                SizedBox(height: mediaH / 50),

                // Hobby Type
                CustomInputBar(titleName: "*趣味 - タイプ:", backendPart: _buildHobbyhobbyTypeInput(context)),
                SizedBox(height: mediaH / 50),

                // Experience
                CustomInputBar(titleName: "経験 - 年:", backendPart: _buildHobbyResetExperienceInput(context)),
                SizedBox(height: mediaH / 50),

                // City
                if (country.isNotEmpty) CustomInputBar(titleName: "*居住地:", backendPart: _buildHobbyResetCityInput(context)),
                SizedBox(height: mediaH / 35),

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
    return CustomInputFormBar(controller: hobbyEraController, hintText: "30");
  }

  /// Reset City
  Widget _buildHobbyResetCityInput(BuildContext context) {
    return CustomMultiSelectDropDownBar(
      itemArray: asiaCities[country],
      onChanged: (value) {
        hoobyAddress = value;
      },
    );
  }

  /// Reset Gender
  Widget _buildHobbyResetGenderInput(BuildContext context) {
    return CustomDropDownBar(controller: hobbyGenderController, hintText: hobbyGenderController.text, itemArray: genderList);
  }

  /// Speak Language
  Widget _buildHobbySpeakLanguageInput(BuildContext context) {
    return CustomDropDownBar(controller: hobbySpeakLanguageController, hintText: hobbySpeakLanguageController.text, itemArray: languages);
  }

  /// Reset Hobby Type
  Widget _buildHobbyhobbyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: hobbyFindTypeController, hintText: hobbyFindTypeController.text, itemArray: hobbyTpye);
  }

  /// Reset Experience
  Widget _buildHobbyResetExperienceInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyExperienceController, hintText: "3");
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
