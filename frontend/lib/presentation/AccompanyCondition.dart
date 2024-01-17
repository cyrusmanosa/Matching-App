import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class AccompanyCondition extends StatefulWidget {
  AccompanyCondition({Key? key}) : super(key: key);

  @override
  _AccompanyConditionState createState() => _AccompanyConditionState();
}

class _AccompanyConditionState extends State<AccompanyCondition> {
  bool? haveTable;
  bool confirmBtn = false;

  TextEditingController accompanyEraController = TextEditingController();
  TextEditingController accompanySpeakLanguageController = TextEditingController();
  TextEditingController accompanyFindTypeController = TextEditingController();
  TextEditingController accompanySociabilityController = TextEditingController();
  String country = "";

  @override
  void initState() {
    super.initState();
    getAccompanyGrpcRequest(context);
    getCountry(context);
  }

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
  void getAccompanyGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = GetAccompanyRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getAccompany(request);
      setState(() {
        haveTable = true;
        accompanyEraController.text = response.ac.era.toString();
        accompanySpeakLanguageController.text = response.ac.speaklanguage.toString();
        accompanyFindTypeController.text = response.ac.findType.toString();
        accompanySociabilityController.text = response.ac.sociability.toString();
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
  void createAccompanyGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    if (!isPureNumber(accompanyEraController.text)) {
      await showErrorDialog(context, "入力した年代は数字ではありません");
    } else if (accompanyEraController.text.isEmpty) {
      await showErrorDialog(context, "年代はまだ設定していません");
    } else if (accompanyFindTypeController.text.isEmpty) {
      await showErrorDialog(context, "相伴 - タイプはまだ設定していません");
    } else {
      if (haveTable == true) {
        setState(() {
          showLoadDialog(context);
        });
        try {
          final request = UpdateAccompanyRequest(
            sessionID: apiKeyS,
            era: int.parse(accompanyEraController.text),
            speaklanguage: accompanySpeakLanguageController.text,
            findType: accompanyFindTypeController.text,
            sociability: accompanySociabilityController.text,
          );
          await GrpcInfoService.client.updateAccompany(request);
          await showLogoDialog(context, "相伴の条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
          throw Exception("相伴の条件を入力中にエラーが発生しました。");
        }
      } else {
        setState(() {
          showLoadDialog(context);
        });
        try {
          final request = CreateAccompanyRequest(
            sessionID: apiKeyS,
            era: int.parse(accompanyEraController.text),
            speaklanguage: accompanySpeakLanguageController.text,
            findType: accompanyFindTypeController.text,
            sociability: accompanySociabilityController.text,
          );
          await GrpcInfoService.client.createAccompany(request);
          await showLogoDialog(context, "相伴の条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
          throw Exception("相伴の条件を入力中にエラーが発生しました。");
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
      appBar: buildAppBar(context, "相伴の条件更改", true),
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
                CustomInputBar(titleName: "*年代:", backendPart: _buildAccompanyResetEraInput(context)),
                SizedBox(height: mediaH / 50),

                // Language
                CustomInputBar(titleName: "言語 - メイン:", backendPart: _buildAccompanyResetSpeakLanguageInput(context)),
                SizedBox(height: mediaH / 50),

                // Accompany Type
                CustomInputBar(titleName: "*相伴のタイプ:", backendPart: _buildAccompanyTypeInput(context)),
                SizedBox(height: mediaH / 50),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanyResetSociabilityInput(context)),
                SizedBox(height: mediaH / 50),

                SizedBox(height: mediaH / 25),
                _buildNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetEraInput(BuildContext context) {
    return CustomInputFormBar(controller: accompanyEraController, hintText: "30");
  }

  /// Section Widget
  Widget _buildAccompanyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: accompanyFindTypeController, hintText: accompanyType[0], itemArray: accompanyType);
  }

  /// Accompany Type
  Widget _buildAccompanyResetSpeakLanguageInput(BuildContext context) {
    return CustomDropDownBar(controller: accompanySpeakLanguageController, hintText: languages[0], itemArray: languages);
  }

  /// Section Widget
  Widget _buildAccompanyResetSociabilityInput(BuildContext context) {
    return CustomDropDownBar(controller: accompanySociabilityController, hintText: socialPersonalities[0], itemArray: socialPersonalities);
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

  onTapPaymentPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
