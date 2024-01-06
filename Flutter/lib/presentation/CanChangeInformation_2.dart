import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore_for_file: must_be_immutable,camel_case_types
class CanChangeInformation_2 extends StatelessWidget {
  CanChangeInformation_2({Key? key, this.can1}) : super(key: key);

  final CreateCanChangeRequest? can1;

  TextEditingController canChangeJobController = TextEditingController();
  TextEditingController canChangeAnnualSalaryController = TextEditingController();
  TextEditingController canChangeSociabilityController = TextEditingController();
  TextEditingController canChangeReligiousController = TextEditingController();
  TextEditingController canChangeIntroduceController = TextEditingController();

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  // Http
  void updateCanChangeHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateCanChangeInfo";
    var requestBody = {
      "Job": canChangeJobController.text,
      "AnnualSalary": int.parse(canChangeAnnualSalaryController.text),
      "Sociability": canChangeSociabilityController.text,
      "Religious": canChangeReligiousController.text,
      "Introduce": canChangeIntroduceController.text,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapNextPage(context);
    }
  }

  // Grpc
  void createCanChangeGrpcRequest(BuildContext context) async {
    if (canChangeJobController.text.isEmpty) {
      showErrorDialog(context, "仕事はまだ入力されていません");
    } else if (!isPureNumber(canChangeAnnualSalaryController.text)) {
      showErrorDialog(context, "入力した年収は数字じゃありません");
    } else if (canChangeSociabilityController.text.isEmpty) {
      showErrorDialog(context, "社交力はまだ入力されていません");
    } else if (canChangeReligiousController.text.isEmpty) {
      showErrorDialog(context, "宗教はまだ入力されていません");
    } else if (canChangeIntroduceController.text.isEmpty) {
      showErrorDialog(context, "自己紹介はまだ入力されていません");
    } else {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = CreateCanChangeRequest(
        sessionID: apiKeyS,
        nickName: can1?.nickName,
        city: can1?.city,
        sexual: can1?.sexual,
        height: can1?.height,
        weight: can1?.weight,
        speaklanguage: can1?.speaklanguage,
        education: can1?.education,
        job: canChangeJobController.text,
        annualSalary: int.parse(canChangeAnnualSalaryController.text),
        sociability: canChangeSociabilityController.text,
        religious: canChangeReligiousController.text,
        introduce: canChangeIntroduceController.text,
      );

      try {
        await GrpcInfoService.client.createCanChange(request);
        onTapNextPage(context);
      } on GrpcError catch (e) {
        showErrorDialog(context, "Error: ${e.codeName}");
      }
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
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
              text: "OK",
              alignment: Alignment.center,
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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _buildHeader(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
        child: Column(
          children: [
            // Job
            CustomInputBar(titleName: "仕事:", backendPart: _buildcanChangeJobInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Annual Salary
            CustomInputBar(titleName: "年収:", backendPart: _buildcanChangeAnnualSalaryInput(context)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: mediaQueryData.size.width / 100),
                child: Text("＊入力しなくても大丈夫です。", style: CustomTextStyles.wordOnlySmallButton),
              ),
            ),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Sociability
            CustomInputBar(titleName: "社交力:", backendPart: _buildcanChangeSociabilityInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Religious
            CustomInputBar(titleName: "宗教:", backendPart: _buildcanChangeReligiousInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Introduce
            CustomInputBar(titleName: "自己紹介:", backendPart: _buildcanChangeIntroduceInput(context)),
            SizedBox(height: mediaQueryData.size.height / 25),

            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "基本個人情報 - C"));
  }

  // turn back
  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Job
  Widget _buildcanChangeJobInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeJobController, hintText: "ホスト");
  }

  /// Annual Salary
  Widget _buildcanChangeAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeAnnualSalaryController, hintText: "4000");
  }

  /// Sociability
  Widget _buildcanChangeSociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeSociabilityController, hintText: "人たら神");
  }

  /// Religious
  Widget _buildcanChangeReligiousInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeReligiousController, hintText: "多神教");
  }

  /// Introduce
  Widget _buildcanChangeIntroduceInput(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return CustomInputFormBar(
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 75)),
      height: mediaQueryData.size.height / 5,
      controller: canChangeIntroduceController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
      contentPadding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.height / 200, vertical: mediaQueryData.size.width / 50),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "次へ",
      onPressed: () {
        createCanChangeGrpcRequest(context);
      },
    );
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.targetFirstTime);
  }
}
