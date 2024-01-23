import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class CanChangeInformation2 extends StatefulWidget {
  CanChangeInformation2({Key? key, this.can1}) : super(key: key);

  final CreateCanChangeRequest? can1;

  @override
  _CanChangeInformation2State createState() => _CanChangeInformation2State();
}

class _CanChangeInformation2State extends State<CanChangeInformation2> {
  TextEditingController canChangeJobController = TextEditingController();
  TextEditingController canChangeAnnualSalaryController = TextEditingController();
  TextEditingController canChangeSociabilityController = TextEditingController();
  TextEditingController canChangeIntroduceController = TextEditingController();
  TextEditingController accompanyFindTypeController = TextEditingController();
  TextEditingController hobbyFindTypeController = TextEditingController();
  TextEditingController hobbyExperienceController = TextEditingController();

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  // Grpc
  void createCanChangeGrpcRequest(BuildContext context) async {
    if (canChangeJobController.text.isEmpty) {
      await showErrorDialog(context, "仕事はまだ入力されていません");
    } else if (canChangeSociabilityController.text.isEmpty) {
      await showErrorDialog(context, "社交力はまだ入力されていません");
    } else if (canChangeIntroduceController.text.isEmpty) {
      await showErrorDialog(context, "自己紹介はまだ入力されていません");
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
          religious: widget.can1?.religious,
          job: canChangeJobController.text,
          hobbyType: hobbyFindTypeController.text,
          experience: int.parse(hobbyExperienceController.text),
          accompanyType: accompanyFindTypeController.text,
          annualSalary: int.parse(canChangeAnnualSalaryController.text),
          sociability: canChangeSociabilityController.text,
          introduce: canChangeIntroduceController.text,
        );
        await GrpcInfoService.client.createCanChange(request);
        createChatRecord(context);
        onTapNextPage(context);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：検証可能な入力データがありません。");
        throw Exception("基本個人情報 - B の取得中にエラーが発生しました。");
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
      await showErrorDialog(context, "エラー：検証可能なチャットレコードの作成");
      throw Exception("チャットレコードの取得中にエラーが発生しました。");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "基本個人情報 - B", true),
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
          child: Column(
            children: [
              SizedBox(height: mediaH / 75),
              // Job
              CustomInputBar(titleName: "仕事:", backendPart: _buildcanChangeJobInput(context)),
              SizedBox(height: mediaH / 90),

              // Annual Salary
              CustomInputBar(titleName: "年収:", backendPart: _buildcanChangeAnnualSalaryInput(context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: mediaW / 100),
                  child: Text("＊入力しなくても大丈夫です。", style: CustomTextStyles.wordOnlySmallButton),
                ),
              ),
              SizedBox(height: mediaH / 90),

              // Sociability
              CustomInputBar(titleName: "社交力:", backendPart: _buildcanChangeSociabilityInput(context)),
              SizedBox(height: mediaH / 55),

              // hobby
              CustomInputBar(titleName: "趣味 - タイプ:", backendPart: _buildHobbyhobbyTypeInput(context)),
              SizedBox(height: mediaH / 55),

              // Experience
              CustomInputBar(titleName: "経験 - 年:", backendPart: _buildHobbyResetExperienceInput(context)),
              SizedBox(height: mediaH / 50),

              // Sociability
              CustomInputBar(titleName: "相伴のタイプ:", backendPart: _buildAccompanyTypeInput(context)),
              SizedBox(height: mediaH / 55),

              // Introduce
              CustomInputBar(titleName: "自己紹介:", backendPart: _buildcanChangeIntroduceInput(context, mediaH, mediaW)),
              SizedBox(height: mediaH / 25),

              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // turn back
  Widget _buildHobbyhobbyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: hobbyFindTypeController, hintText: hobbyTpye[0], itemArray: hobbyTpye);
  }

  /// Section Widget
  Widget _buildAccompanyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: accompanyFindTypeController, hintText: accompanyType[0], itemArray: accompanyType);
  }

  /// Job
  Widget _buildcanChangeJobInput(BuildContext context) {
    return CustomDropDownBar(controller: canChangeJobController, hintText: occupations[0], itemArray: occupations);
  }

  /// Annual Salary
  Widget _buildcanChangeAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeAnnualSalaryController, hintText: "4000");
  }

  /// Reset Experience
  Widget _buildHobbyResetExperienceInput(BuildContext context) {
    return CustomInputFormBar(controller: hobbyExperienceController, hintText: "3");
  }

  /// Sociability
  Widget _buildcanChangeSociabilityInput(BuildContext context) {
    return CustomDropDownBar(controller: canChangeSociabilityController, hintText: socialPersonalities[0], itemArray: socialPersonalities);
  }

  /// Introduce
  Widget _buildcanChangeIntroduceInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: mediaW / 75)),
      height: mediaH / 5.5,
      controller: canChangeIntroduceController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      onTap: () {
        FocusNode().requestFocus();
      },
      contentPadding: EdgeInsets.symmetric(horizontal: mediaH / 200, vertical: mediaW / 55),
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
