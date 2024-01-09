import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CanChangeInformation_2 extends StatefulWidget {
  CanChangeInformation_2({Key? key, this.can1}) : super(key: key);

  final CreateCanChangeRequest? can1;

  @override
  _CanChangeInformation_2State createState() => _CanChangeInformation_2State();
}

class _CanChangeInformation_2State extends State<CanChangeInformation_2> {
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
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = CreateCanChangeRequest(
          sessionID: apiKeyS,
          nickName: widget.can1?.nickName,
          city: widget.can1?.city,
          sexual: widget.can1?.sexual,
          height: widget.can1?.height,
          weight: widget.can1?.weight,
          speaklanguage: widget.can1?.speaklanguage,
          education: widget.can1?.education,
          job: canChangeJobController.text,
          annualSalary: int.parse(canChangeAnnualSalaryController.text),
          sociability: canChangeSociabilityController.text,
          religious: canChangeReligiousController.text,
          introduce: canChangeIntroduceController.text,
        );
        await GrpcInfoService.client.createCanChange(request);
        createChatRecord(context);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data");
        throw Exception("Error occurred while fetching CanChange1.");
      }
    }
  }

  // Grpc
  void createChatRecord(BuildContext context) async {
    try {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final request = CreateChatTableRequest(userID: userid!);
      await GrpcChatService.client.createChatTable(request);
    } on GrpcError {
      Navigator.pop(context);
      showErrorDialog(context, "Error: validatable create Chat Record");
      throw Exception("Error occurred while fetching Chat Record");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "基本個人情報 - C")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
        child: Column(
          children: [
            // Job
            CustomInputBar(titleName: "仕事:", backendPart: _buildcanChangeJobInput(context)),
            SizedBox(height: mediaH / 50),

            // Annual Salary
            CustomInputBar(titleName: "年収:", backendPart: _buildcanChangeAnnualSalaryInput(context)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: mediaW / 100),
                child: Text("＊入力しなくても大丈夫です。", style: CustomTextStyles.wordOnlySmallButton),
              ),
            ),
            SizedBox(height: mediaH / 50),

            // Sociability
            CustomInputBar(titleName: "社交力:", backendPart: _buildcanChangeSociabilityInput(context)),
            SizedBox(height: mediaH / 50),

            // Religious
            CustomInputBar(titleName: "宗教:", backendPart: _buildcanChangeReligiousInput(context)),
            SizedBox(height: mediaH / 50),

            // Introduce
            CustomInputBar(titleName: "自己紹介:", backendPart: _buildcanChangeIntroduceInput(context)),
            SizedBox(height: mediaH / 25),

            _buildNextButton(context),
          ],
        ),
      ),
    );
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
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return CustomInputFormBar(
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: mediaW / 75)),
      height: mediaH / 5,
      controller: canChangeIntroduceController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
      contentPadding: EdgeInsets.symmetric(horizontal: mediaH / 200, vertical: mediaW / 50),
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Target(head: "logo")));
  }
}
