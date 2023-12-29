import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoverCondition extends StatefulWidget {
  LoverCondition({Key? key}) : super(key: key);

  @override
  _LoverConditionState createState() => _LoverConditionState();
}

class _LoverConditionState extends State<LoverCondition> {
  TextEditingController loverMinAgeController = TextEditingController();
  TextEditingController loverMaxAgeController = TextEditingController();
  TextEditingController loverCityController = TextEditingController();
  TextEditingController loverGenderController = TextEditingController();
  TextEditingController loverBloodController = TextEditingController();
  TextEditingController loverConstellationController = TextEditingController();
  TextEditingController loverSexualController = TextEditingController();
  TextEditingController loverHeightController = TextEditingController();
  TextEditingController loverWeightController = TextEditingController();
  TextEditingController loverSpeakLanguageController = TextEditingController();
  TextEditingController loverEducationController = TextEditingController();
  TextEditingController loverJobController = TextEditingController();
  TextEditingController loverAnnualSalaryController = TextEditingController();
  TextEditingController loverSociabilityController = TextEditingController();
  TextEditingController loverReligiousController = TextEditingController();

// Http
  void createLoverHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateLover";
    var requestBody = {
      "session_id": globalSessionID,
      "MinAge": loverMinAgeController.text,
      "MaxAge": loverMaxAgeController.text,
      "City": loverCityController.text,
      "Gender": loverGenderController.text,
      "Constellation": loverConstellationController.text,
      "Height": loverHeightController.text,
      "Weight": loverWeightController.text,
      "Speak_language": loverSpeakLanguageController.text,
      "Job": loverJobController.text,
      "AnnualSalary": loverAnnualSalaryController.text,
      "Sociability": loverSociabilityController.text,
      "Religious": loverReligiousController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTapNextButton(context);
    }
  }

// Grpc
  void createLoverGrpcRequest(BuildContext context) async {
    final request = CreateLoverRequest(
      sessionID: globalSessionID,
      minAge: int.parse(loverMinAgeController.text),
      maxAge: int.parse(loverMaxAgeController.text),
      city: loverCityController.text,
      gender: loverGenderController.text,
      constellation: loverConstellationController.text,
      height: int.parse(loverHeightController.text),
      weight: int.parse(loverWeightController.text),
      speaklanguage: loverSpeakLanguageController.text,
      job: loverJobController.text,
      annualSalary: int.parse(loverAnnualSalaryController.text),
      sociability: loverSociabilityController.text,
      religious: loverReligiousController.text,
    );

    final response = await GrpcInfoService.client.createLover(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextButton(context);
    } else {
      showErrorDialog(context, "Error: Empty response");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
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
              alignment: Alignment.center,
              text: "OK",
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

  bool confirmBtn = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // _buildLoverAgeInput(context),
                SizedBox(height: mediaQueryData.size.height / 50),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildLoverCityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildLoverGenderInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Constellation
                CustomInputBar(titleName: "星座:", backendPart: _buildLoverConstellationInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Blood
                CustomInputBar(titleName: "血液型:", backendPart: _buildLoverBloodInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Sexual
                CustomInputBar(titleName: "性的指向:", backendPart: _buildLoverSexualInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildLoverHeightInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Wegiht
                CustomInputBar(titleName: "体重:", backendPart: _buildLoverWeightInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Speak Language
                CustomInputBar(titleName: "言語:", backendPart: _buildLoverSpeakLanguageInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Job
                CustomInputBar(titleName: "職種:", backendPart: _buildLoverJobInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Annual Salary
                CustomInputBar(titleName: "年収:", backendPart: _buildLoverAnnualSalaryInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Socialbility
                CustomInputBar(titleName: "社交力:", backendPart: _buildLoverSociabilityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Religious
                CustomInputBar(titleName: "宗教:", backendPart: _buildLoverReligiousInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

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
                        height: mediaQueryData.size.width / 25,
                        width: mediaQueryData.size.width / 25,
                        decoration:
                            BoxDecoration(color: confirmBtn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mediaQueryData.size.width / 50),
                        child: Text("本人認証を確認しました", style: confirmBtn ? CustomTextStyles.confirmGreen : CustomTextStyles.pwRuleGray500),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: mediaQueryData.size.height / 25),

                // button
                _buildNextPageButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapReturn(context);
        },
      ),
      title: AppbarTitle(text: "恋人の条件設定", margin: EdgeInsets.only(top: 60, bottom: 20)),
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  // /// Min Age
  // Widget _buildLoverMinAgeInput(BuildContext context) {
  //   return CustomInputFormBar(
  //     maxLength: 3,
  //     width: 60.h,
  //     controller: loverMinAgeController,
  //     hintText: "30",
  //     alignment: Alignment.bottomCenter,
  //   );
  // }

  // /// Max Age
  // Widget _buildLoverMaxAgeInput(BuildContext context) {
  //   return CustomInputFormBar(
  //     maxLength: 3,
  //     maxLines: 1,
  //     width: 60,
  //     height: 20,
  //     controller: loverMaxAgeController,
  //     hintText: "30",
  //   );
  // }

  // Widget _buildLoverAgeInput(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("年齢", style: theme.textTheme.titleMedium),
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: appTheme.pinkA100),
  //           borderRadius: BorderRadiusStyle.r10,
  //         ),
  //         child: _buildLoverMaxAgeInput(context),
  //       ),
  //     ],
  //   );
  // }

  /// City
  Widget _buildLoverCityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildLoverGenderInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverGenderController,
      hintText: "男",
    );
  }

  /// Constellation
  Widget _buildLoverConstellationInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverConstellationController,
      hintText: "いて座",
    );
  }

  /// Constellation
  Widget _buildLoverBloodInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverBloodController,
      hintText: "A",
    );
  }

  /// Sexual
  Widget _buildLoverSexualInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverSexualController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildLoverHeightInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverHeightController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildLoverWeightInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverWeightController,
      hintText: "170cm",
    );
  }

  /// Speak Language
  Widget _buildLoverSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverSpeakLanguageController,
      hintText: "日本語",
    );
  }

  /// Job
  Widget _buildLoverJobInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverJobController,
      hintText: "ホスト",
    );
  }

  /// Annual Salary
  Widget _buildLoverAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverAnnualSalaryController,
      hintText: "4000",
    );
  }

  /// Sociability
  Widget _buildLoverSociabilityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverSociabilityController,
      hintText: "人たら神",
    );
  }

  /// Religious
  Widget _buildLoverReligiousInput(BuildContext context) {
    return CustomInputFormBar(
      controller: loverReligiousController,
      hintText: "多神教",
      textInputAction: TextInputAction.done,
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: 40,
      text: "条件確認",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        createLoverGrpcRequest(context);
      },
    );
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
