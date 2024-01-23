import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/presentation/CanChangeInformation_2.dart';
import 'package:dating_your_date/theme/theme_helper.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_checkBox_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class CanChangeInformation1 extends StatefulWidget {
  CanChangeInformation1({Key? key}) : super(key: key);

  @override
  _CanChangeInformation1State createState() => _CanChangeInformation1State();
}

class _CanChangeInformation1State extends State<CanChangeInformation1> {
  String country = "";
  Iterable<String> cClanguage = [];
  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  @override
  void initState() {
    super.initState();
    getCountry(context);
  }

  Future<void> getCountry(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final request = GetFixRequest(sessionID: apiKeyS, userID: userid);
      final response = await GrpcInfoService.client.getFix(request);
      setState(() {
        country = response.fix.country;
      });
    } on GrpcError {
      Navigator.pop(context);
      await showErrorDialog(context, "エラー：検証可能な入力データがありません。");
      throw Exception("基本個人情報 - A の取得中にエラーが発生しました。");
    }
  }

  TextEditingController canChangeNickNameController = TextEditingController();
  TextEditingController canChangeCityController = TextEditingController();
  TextEditingController canChangeSexualController = TextEditingController();
  TextEditingController canChangeHeightController = TextEditingController();
  TextEditingController canChangeWeightController = TextEditingController();
  TextEditingController canChangeEducationController = TextEditingController();
  TextEditingController canChangeReligiousController = TextEditingController();

  // Grpc
  void canChangeGrpcRequest(BuildContext context) async {
    if (canChangeNickNameController.text.isEmpty) {
      await showErrorDialog(context, "ニックネームはまだ入力されていません");
    } else if (canChangeCityController.text.isEmpty) {
      await showErrorDialog(context, "居住地はまだ入力されていません");
    } else if (canChangeSexualController.text.isEmpty) {
      await showErrorDialog(context, "性的指向はまだ入力されていません");
    } else if (canChangeHeightController.text.isEmpty) {
      await showErrorDialog(context, " 身長 - cmはまだ入力されていません");
    } else if (!isPureNumber(canChangeHeightController.text)) {
      await showErrorDialog(context, "入力した 身長 - cmは数字じゃありません");
    } else if (canChangeReligiousController.text.isEmpty) {
      await showErrorDialog(context, "宗教はまだ入力されていません");
    } else if (canChangeWeightController.text.isEmpty) {
      await showErrorDialog(context, " 体重 - kgはまだ入力されていません");
    } else if (!isPureNumber(canChangeWeightController.text)) {
      await showErrorDialog(context, "入力した 体重 - kgは数字じゃありません");
    } else if (cClanguage.isEmpty) {
      await showErrorDialog(context, "学歴はまだ入力されていません");
    } else {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = CreateCanChangeRequest(
          sessionID: apiKeyS,
          nickName: canChangeNickNameController.text,
          city: canChangeCityController.text,
          sexual: canChangeSexualController.text,
          height: int.parse(canChangeHeightController.text),
          weight: int.parse(canChangeWeightController.text),
          speaklanguage: cClanguage,
          education: canChangeEducationController.text,
          religious: canChangeReligiousController.text,
        );
        onTapNextPage(context, request);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：検証可能な入力データがありません。");
        throw Exception("基本個人情報 - A の取得中にエラーが発生しました。");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "基本個人情報 - A", true),
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
              // Nick Name
              CustomInputBar(titleName: "ニックネーム:", backendPart: _buildcanChangeNickNameInput(context)),
              SizedBox(height: mediaH / 50),

              // City
              if (country.isNotEmpty) CustomInputBar(titleName: "居住地:", backendPart: _buildcanChangeCityInput(context)),
              SizedBox(height: mediaH / 50),

              // Sexual
              CustomInputBar(titleName: "性的指向:", backendPart: _buildcanChangeSexualInput(context)),
              SizedBox(height: mediaH / 50),

              // Height
              CustomInputBar(titleName: " 身長 - cm:", backendPart: _buildcanChangeHeightInput(context)),
              SizedBox(height: mediaH / 50),

              // Width
              CustomInputBar(titleName: " 体重 - kg:", backendPart: _buildcanChangeWeightInput(context)),
              SizedBox(height: mediaH / 50),

              // Job
              CustomInputBar(titleName: "学歴:", backendPart: _buildcanChangeEducationInput(context)),
              SizedBox(height: mediaH / 50),

              // Religious
              CustomInputBar(titleName: "宗教:", backendPart: _buildcanChangeReligiousInput(context)),
              SizedBox(height: mediaH / 50),

              // Speak Language
              CustomInputBar(titleName: "言語:", backendPart: _buildcanChangeSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 25),

              // Button
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Nickname
  Widget _buildcanChangeNickNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeNickNameController,
      hintText: "仆街",
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// City
  Widget _buildcanChangeCityInput(BuildContext context) {
    return CustomDropDownBar(controller: canChangeCityController, hintText: "大阪", itemArray: asiaCities[country]);
  }

  /// Sexual
  Widget _buildcanChangeSexualInput(BuildContext context) {
    return CustomDropDownBar(controller: canChangeSexualController, hintText: sexualList[0], itemArray: sexualList);
  }

  /// Height
  Widget _buildcanChangeHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeHeightController, hintText: "170");
  }

  /// Width
  Widget _buildcanChangeWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeWeightController, hintText: "60");
  }

  /// Religious
  Widget _buildcanChangeReligiousInput(BuildContext context) {
    return CustomDropDownBar(controller: canChangeReligiousController, hintText: religions[0], itemArray: religions);
  }

  /// Education
  Widget _buildcanChangeEducationInput(BuildContext context) {
    return CustomDropDownBar(controller: canChangeEducationController, hintText: educationLevels[0], itemArray: educationLevels);
  }

  /// Speak Language
  Widget _buildcanChangeSpeakLanguageInput(BuildContext context) {
    return CustomMultiSelectDropDownBar(
      itemArray: languages,
      onChanged: (value) {
        cClanguage = value;
      },
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "次へ",
      onPressed: () {
        canChangeGrpcRequest(context);
      },
    );
  }

  onTapNextPage(BuildContext context, CreateCanChangeRequest request) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CanChangeInformation2(can1: request)));
  }
}
