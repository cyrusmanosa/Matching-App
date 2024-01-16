import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_Word_button.dart';
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
  }

  // check tabel
  void getLoverGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
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

// Grpc
  void updateLoverGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    setState(() {
      showLoadDialog(context);
    });
    await Future.delayed(Duration(seconds: 1));
    if (haveTable == true) {
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
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
        throw Exception("恋人条件の更新中にエラーが発生しました。");
      }
    } else {
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
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
        throw Exception("恋人条件を入力中にエラーが発生しました。");
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
      // 鍵盤彈出後自動調節Size - 要test先知
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
                  CustomInputBar(titleName: "年齢:", backendPart: _buildLoverMinAgeInput(context, mediaH, mediaW)),
                  SizedBox(width: mediaW / 30),
                  Text("から"),
                  SizedBox(width: mediaW / 30),
                  CustomInputBar(titleName: "", backendPart: _buildLoverMaxAgeInput(context, mediaH, mediaW)),
                ],
              ),
              SizedBox(height: mediaH / 100),

              // City
              CustomInputBar(titleName: "居住地:", backendPart: _buildLoverResetCityInput(context)),
              SizedBox(height: mediaH / 50),

              // Gender
              CustomInputBar(titleName: "相手の性別:", backendPart: _buildLoverResetGenderInput(context)),
              SizedBox(height: mediaH / 50),

              // Sexual
              CustomInputBar(titleName: "性的指向:", backendPart: _buildLoverResetSexualInput(context)),
              SizedBox(height: mediaH / 50),

              // Speak Language
              CustomInputBar(titleName: "言語:", backendPart: _buildLoverSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // 本人認証の丸
              InkWell(
                onTap: () {
                  setState(() {
                    confirmBtn = !confirmBtn;
                  });
                },
                child: WordButton(msg: "本人認証を確認しました", mediaH: mediaH, mediaW: mediaW, boolbtn: confirmBtn),
              ),
              SizedBox(height: mediaH / 25),

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
      hintText: "20",
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
      hintText: "20",
    );
  }

  /// City
  Widget _buildLoverResetCityInput(BuildContext context) {
    return CustomInputFormBar(controller: loverCityController, hintText: "大阪");
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
    return CustomInputFormBar(controller: loverSpeakLanguageController, hintText: "日本語");
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
