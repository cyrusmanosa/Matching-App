import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
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

class LoverCondition extends StatefulWidget {
  LoverCondition({Key? key}) : super(key: key);

  @override
  _LoverConditionState createState() => _LoverConditionState();
}

class _LoverConditionState extends State<LoverCondition> {
  bool? haveTable;
  bool confirmBtn = false;
  List<String> loverAddress = [];

  TextEditingController loverMinAgeController = TextEditingController();
  TextEditingController loverMaxAgeController = TextEditingController();
  TextEditingController loverCityController = TextEditingController();
  TextEditingController loverGenderController = TextEditingController();
  TextEditingController loverSexualController = TextEditingController();
  TextEditingController loverSpeakLanguageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getLoverGrpcRequest(context);
    getCountry(context);
  }

  String country = "";

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
  void getLoverGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      // check tabel
      final request = GetLoverRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getLover(request);
      setState(() {
        haveTable = true;
        loverMinAgeController = TextEditingController(text: response.l.minAge.toString());
        loverMaxAgeController = TextEditingController(text: response.l.maxAge.toString());
        loverCityController = TextEditingController(text: response.l.city.toString());
        loverGenderController = TextEditingController(text: response.l.gender.toString());
        loverSexualController = TextEditingController(text: response.l.sexual.toString());
        loverSpeakLanguageController = TextEditingController(text: response.l.speaklanguage.toString());
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  void checkTargetUserTable(BuildContext context) async {
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

// Grpc
  void updateLoverGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    if (!isPureNumber(loverMinAgeController.text) || !isPureNumber(loverMaxAgeController.text)) {
      await showErrorDialog(context, "入力した年齢は数字ではありません");
    } else if (loverMinAgeController.text.isEmpty || loverMaxAgeController.text.isEmpty) {
      await showErrorDialog(context, "年齢はまだ設定していません");
    } else if (loverMinAgeController.text.isEmpty || loverMaxAgeController.text.isEmpty) {
      await showErrorDialog(context, "最低年齢と最高年齢はまだ設定していません");
    } else if (loverGenderController.text.isEmpty) {
      await showErrorDialog(context, "相手の性別はまだ設定していません");
    } else if (loverSexualController.text.isEmpty) {
      await showErrorDialog(context, "性的指向はまだ設定していません");
    } else {
      if (haveTable == true) {
        setState(() {
          showLoadDialog(context);
        });
        try {
          final request = UpdateLoverRequest(
            sessionID: apiKeyS,
            minAge: int.parse(loverMinAgeController.text),
            maxAge: int.parse(loverMaxAgeController.text),
            city: loverCityController.text,
            gender: loverGenderController.text,
            speaklanguage: loverSpeakLanguageController.text,
          );

          await GrpcInfoService.client.updateLover(request);
          await showLogoDialog(context, "恋人の条件を更新しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
          throw Exception("恋人条件の更新中にエラーが発生しました。");
        }
      } else {
        setState(() {
          showLoadDialog(context);
        });
        try {
          final request = CreateLoverRequest(
            sessionID: apiKeyS,
            minAge: int.parse(loverMinAgeController.text),
            maxAge: int.parse(loverMaxAgeController.text),
            city: loverCityController.text,
            gender: loverGenderController.text,
            speaklanguage: loverSpeakLanguageController.text,
          );

          await GrpcInfoService.client.createLover(request);
          await showLogoDialog(context, "恋人の条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
          throw Exception("恋人条件を入力中にエラーが発生しました。");
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
      appBar: buildAppBar(context, "恋人の条件", true),
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.bgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 50),
          child: Column(
            children: [
              Row(
                children: [
                  CustomInputBar(titleName: "*年齢:", backendPart: _buildLoverMinAgeInput(context, mediaH, mediaW)),
                  SizedBox(width: mediaW / 30),
                  Text("から"),
                  SizedBox(width: mediaW / 30),
                  CustomInputBar(titleName: "", backendPart: _buildLoverMaxAgeInput(context, mediaH, mediaW)),
                ],
              ),
              SizedBox(height: mediaH / 100),

              // Gender
              CustomInputBar(titleName: "*相手の性別:", backendPart: _buildLoverResetGenderInput(context)),
              SizedBox(height: mediaH / 50),

              // Sexual
              CustomInputBar(titleName: "*性的指向:", backendPart: _buildLoverResetSexualInput(context)),
              SizedBox(height: mediaH / 50),

              // Speak Language
              CustomInputBar(titleName: "言語 - メイン:", backendPart: _buildLoverSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // City
              if (country.isNotEmpty) CustomInputBar(titleName: "*居住地:", backendPart: _buildLoverResetCityInput(context)),
              SizedBox(height: mediaH / 35),

              // button
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Min Age
  Widget _buildLoverMinAgeInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaH / 16,
      width: mediaW / 7.5,
      maxLength: 3,
      controller: loverMaxAgeController,
      hintText: "25",
    );
  }

  /// Min Age
  Widget _buildLoverMaxAgeInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaH / 16,
      width: mediaW / 7.5,
      maxLength: 3,
      controller: loverMinAgeController,
      hintText: "30",
    );
  }

  /// Reset City
  Widget _buildLoverResetCityInput(BuildContext context) {
    return CustomMultiSelectDropDownBar(
      itemArray: asiaCities[country],
      onChanged: (value) {
        loverAddress = value;
      },
    );
  }

  /// Gender
  Widget _buildLoverResetGenderInput(BuildContext context) {
    return CustomDropDownBar(controller: loverGenderController, hintText: genderList[0], itemArray: genderList);
  }

  /// Sexual
  Widget _buildLoverResetSexualInput(BuildContext context) {
    return CustomDropDownBar(controller: loverSexualController, hintText: sexualList[0], itemArray: sexualList);
  }

  /// Speak Language
  Widget _buildLoverSpeakLanguageInput(BuildContext context) {
    return CustomDropDownBar(controller: loverSpeakLanguageController, hintText: languages[0], itemArray: languages);
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

  onTapPaymentPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
