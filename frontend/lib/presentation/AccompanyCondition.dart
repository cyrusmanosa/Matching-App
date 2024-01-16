import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Word_button.dart';
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

  @override
  void initState() {
    super.initState();
    getAccompanyGrpcRequest(context);
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

  // Grpc
  void createAccompanyGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    setState(() {
      showLoadDialog(context);
    });
    await Future.delayed(Duration(seconds: 1));
    if (haveTable == true) {
      try {
        final request = UpdateAccompanyRequest(
          sessionID: apiKeyS,
          era: int.parse(accompanyEraController.text),
          speaklanguage: accompanySpeakLanguageController.text,
          findType: accompanyFindTypeController.text,
          sociability: accompanySociabilityController.text,
        );
        await GrpcInfoService.client.updateAccompany(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
        throw Exception("更新の取得中にエラーが発生しました。");
      }
    } else {
      try {
        final request = CreateAccompanyRequest(
          sessionID: apiKeyS,
          era: int.parse(accompanyEraController.text),
          speaklanguage: accompanySpeakLanguageController.text,
          findType: accompanyFindTypeController.text,
          sociability: accompanySociabilityController.text,
        );
        await GrpcInfoService.client.createAccompany(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
        throw Exception("作成アカンパニーの取得中にエラーが発生しました。");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "お相伴の条件更改", true),
      // 鍵盤彈出後自動調節Size - 要test先知
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
                CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyResetEraInput(context)),
                SizedBox(height: mediaH / 50),

                // Language
                CustomInputBar(titleName: "言語:", backendPart: _buildAccompanyResetSpeakLanguageInput(context)),
                SizedBox(height: mediaH / 50),

                // Accompany Type
                CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyTypeInput(context)),
                SizedBox(height: mediaH / 50),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanyResetSociabilityInput(context)),
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
    return CustomInputFormBar(controller: accompanySpeakLanguageController, hintText: "日本語");
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

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
