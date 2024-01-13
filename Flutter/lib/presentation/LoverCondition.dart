import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/loading.dart';
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

  TextEditingController resetLoverMinAgeController = TextEditingController();
  TextEditingController resetLoverMaxAgeController = TextEditingController();
  TextEditingController resetLoverCityController = TextEditingController();
  TextEditingController resetLoverGenderController = TextEditingController();
  TextEditingController resetLoverSexualController = TextEditingController();
  TextEditingController resetLoverSpeakLanguageController = TextEditingController();

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
        resetLoverMinAgeController = TextEditingController(text: response.l.minAge.toString());
        resetLoverMaxAgeController = TextEditingController(text: response.l.maxAge.toString());
        resetLoverCityController = TextEditingController(text: response.l.city.toString());
        resetLoverGenderController = TextEditingController(text: response.l.gender.toString());
        resetLoverSexualController = TextEditingController(text: response.l.sexual.toString());
        resetLoverSpeakLanguageController = TextEditingController(text: response.l.speaklanguage.toString());
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
          minAge: int.parse(resetLoverMinAgeController.text),
          maxAge: int.parse(resetLoverMaxAgeController.text),
          city: resetLoverCityController.text,
          gender: resetLoverGenderController.text,
          speaklanguage: resetLoverSpeakLanguageController.text,
        );

        await GrpcInfoService.client.updateLover(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data for update", false);
        throw Exception("Error occurred while fetching update Lover.");
      }
    } else {
      try {
        final request = CreateLoverRequest(
          sessionID: apiKeyS,
          minAge: int.parse(resetLoverMinAgeController.text),
          maxAge: int.parse(resetLoverMaxAgeController.text),
          city: resetLoverCityController.text,
          gender: resetLoverGenderController.text,
          speaklanguage: resetLoverSpeakLanguageController.text,
        );

        await GrpcInfoService.client.createLover(request);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data for create Lover", false);
        throw Exception("Error occurred while fetching Create Lover.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "恋人の条件")),
      body: SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
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
              CustomInputBar(titleName: "性別:", backendPart: _buildLoverResetGenderInput(context)),
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
                child: Row(
                  children: [
                    Container(
                      height: mediaW / 25,
                      width: mediaW / 25,
                      decoration: BoxDecoration(color: confirmBtn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
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
    );
  }

  /// Min Age
  Widget _buildLoverMinAgeInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaH / 16,
      width: mediaW / 7.5,
      maxLength: 3,
      controller: resetLoverMaxAgeController,
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
      controller: resetLoverMinAgeController,
      hintText: "20",
    );
  }

  /// City
  Widget _buildLoverResetCityInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverCityController, hintText: "大阪");
  }

  /// Gender
  Widget _buildLoverResetGenderInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverGenderController, hintText: "男");
  }

  /// Sexual
  Widget _buildLoverResetSexualInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverSexualController, hintText: "異性愛");
  }

  /// Speak Language
  Widget _buildLoverSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: resetLoverSpeakLanguageController, hintText: "日本語");
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
