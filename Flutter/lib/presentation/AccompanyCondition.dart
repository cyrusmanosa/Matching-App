import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
import 'package:dating_your_date/widgets/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Word_button.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

class AccompanyCondition extends StatefulWidget {
  AccompanyCondition({Key? key}) : super(key: key);

  @override
  _AccompanyConditionState createState() => _AccompanyConditionState();
}

class _AccompanyConditionState extends State<AccompanyCondition> {
  bool? haveTable;
  bool confirmBtn = false;

  TextEditingController resetAccompanyEraController = TextEditingController();
  TextEditingController resetAccompanySpeakLanguageController = TextEditingController();
  TextEditingController resetAccompanyFindTypeController = TextEditingController();
  TextEditingController resetAccompanySociabilityController = TextEditingController();

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
        resetAccompanyEraController.text = response.ac.era.toString();
        resetAccompanySpeakLanguageController.text = response.ac.speaklanguage.toString();
        resetAccompanyFindTypeController.text = response.ac.findType.toString();
        resetAccompanySociabilityController.text = response.ac.sociability.toString();
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
          era: int.parse(resetAccompanyEraController.text),
          speaklanguage: resetAccompanySpeakLanguageController.text,
          findType: resetAccompanyFindTypeController.text,
          sociability: resetAccompanySociabilityController.text,
        );
        await GrpcInfoService.client.updateAccompany(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data for update");
        throw Exception("Error occurred while fetching update Accompany.");
      }
    } else {
      try {
        final request = CreateAccompanyRequest(
          sessionID: apiKeyS,
          era: int.parse(resetAccompanyEraController.text),
          speaklanguage: resetAccompanySpeakLanguageController.text,
          findType: resetAccompanyFindTypeController.text,
          sociability: resetAccompanySociabilityController.text,
        );
        await GrpcInfoService.client.createAccompany(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data for create accompany");
        throw Exception("Error occurred while fetching Create Accompany.");
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
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.bgColor,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
          child: Column(
            children: [
              // Era
              CustomInputBar(titleName: "年代:", backendPart: _buildAccompanyResetEraInput(context)),
              SizedBox(height: mediaH / 50),

              // Language
              CustomInputBar(titleName: "お喋れる言語:", backendPart: _buildAccompanyResetSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // Accompany Type
              CustomInputBar(titleName: "お相伴のタイプ:", backendPart: _buildAccompanyResetAccompanyTypeInput(context)),
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
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetEraInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyEraController, hintText: "３０代");
  }

  /// Section Widget
  Widget _buildAccompanyResetAccompanyTypeInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanyFindTypeController, hintText: "おしゃべり");
  }

  /// Accompany Type
  Widget _buildAccompanyResetSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanySpeakLanguageController, hintText: "おしゃべり");
  }

  /// Section Widget
  Widget _buildAccompanyResetSociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetAccompanySociabilityController, hintText: "人たら神");
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
