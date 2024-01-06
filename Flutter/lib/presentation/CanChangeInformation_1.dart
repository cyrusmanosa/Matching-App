import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/presentation/CanChangeInformation_2.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable,camel_case_types
class CanChangeInformation_1 extends StatelessWidget {
  CanChangeInformation_1({Key? key}) : super(key: key);

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  TextEditingController canChangeNickNameController = TextEditingController();
  TextEditingController canChangeCityController = TextEditingController();
  TextEditingController canChangeSexualController = TextEditingController();
  TextEditingController canChangeHeightController = TextEditingController();
  TextEditingController canChangeWeightController = TextEditingController();
  TextEditingController canChangeSpeakLanguageController = TextEditingController();
  TextEditingController canChangeEducationController = TextEditingController();

  // Grpc
  void canChangeGrpcRequest(BuildContext context) async {
    if (canChangeNickNameController.text.isEmpty) {
      showErrorDialog(context, "ニックネームはまだ入力されていません");
    } else if (canChangeCityController.text.isEmpty) {
      showErrorDialog(context, "居住地はまだ入力されていません");
    } else if (canChangeSexualController.text.isEmpty) {
      showErrorDialog(context, "性的指向はまだ入力されていません");
    } else if (canChangeHeightController.text.isEmpty) {
      showErrorDialog(context, "身長はまだ入力されていません");
    } else if (!isPureNumber(canChangeHeightController.text)) {
      showErrorDialog(context, "入力した身長は数字じゃありません");
    } else if (canChangeWeightController.text.isEmpty) {
      showErrorDialog(context, "体重はまだ入力されていません");
    } else if (!isPureNumber(canChangeWeightController.text)) {
      showErrorDialog(context, "入力した体重は数字じゃありません");
    } else if (canChangeSpeakLanguageController.text.isEmpty) {
      showErrorDialog(context, "学歴はまだ入力されていません");
    } else {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = CreateCanChangeRequest(
        sessionID: apiKeyS,
        nickName: canChangeNickNameController.text,
        city: canChangeCityController.text,
        sexual: canChangeSexualController.text,
        height: int.parse(canChangeHeightController.text),
        weight: int.parse(canChangeWeightController.text),
        speaklanguage: canChangeSpeakLanguageController.text,
        education: canChangeEducationController.text,
      );
      onTapNextPage(context, request);
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
            // _buildHeader(context),
            // Nick Name
            CustomInputBar(titleName: "ニックネーム:", backendPart: _buildcanChangeNickNameInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // City
            CustomInputBar(titleName: "居住地:", backendPart: _buildcanChangeCityInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Sexual
            CustomInputBar(titleName: "性的指向:", backendPart: _buildcanChangeSexualInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Height
            CustomInputBar(titleName: "身長:", backendPart: _buildcanChangeHeightInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Weight
            CustomInputBar(titleName: "体重:", backendPart: _buildcanChangeWeightInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Speak Language
            CustomInputBar(titleName: "言語:", backendPart: _buildcanChangeSpeakLanguageInput(context)),
            SizedBox(height: mediaQueryData.size.height / 50),

            // Job
            CustomInputBar(titleName: "学歴:", backendPart: _buildcanChangeEducationInput(context)),
            SizedBox(height: mediaQueryData.size.height / 25),

            // Button
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "基本個人情報 - B"));
  }

  // turn back
  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Nickname
  Widget _buildcanChangeNickNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: canChangeNickNameController,
      hintText: "仆街",
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// City
  Widget _buildcanChangeCityInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeCityController, hintText: "大阪");
  }

  /// Sexual
  Widget _buildcanChangeSexualInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeSexualController, hintText: "異性愛");
  }

  /// Height
  Widget _buildcanChangeHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeHeightController, hintText: "170cm");
  }

  /// Weight
  Widget _buildcanChangeWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeWeightController, hintText: "60kg");
  }

  /// Education
  Widget _buildcanChangeEducationInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeEducationController, hintText: "高校生");
  }

  /// Speak Language
  Widget _buildcanChangeSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: canChangeSpeakLanguageController, hintText: "EN,HK,CN,JP");
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => CanChangeInformation_2(can1: request)));
  }
}
