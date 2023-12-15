import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable, camel_case_types
class LoverConditionsRepair extends StatelessWidget {
  final String title;
  LoverConditionsRepair(this.title, {Key? key}) : super(key: key);

  TextEditingController resetLoverMinAgeController = TextEditingController();
  TextEditingController resetLoverMaxAgeController = TextEditingController();
  TextEditingController resetLoverCountryController = TextEditingController();
  TextEditingController resetLoverCityController = TextEditingController();
  TextEditingController resetLoverGenderController = TextEditingController();
  TextEditingController resetLoverBloodController = TextEditingController();
  TextEditingController resetLoverConstellationController = TextEditingController();
  TextEditingController resetLoverSexualController = TextEditingController();
  TextEditingController resetLoverHeightController = TextEditingController();
  TextEditingController resetLoverWeightController = TextEditingController();
  TextEditingController resetLoverSpeakLanguageController = TextEditingController();
  TextEditingController resetLoverEducationController = TextEditingController();
  TextEditingController resetLoverJobController = TextEditingController();
  TextEditingController resetLoverAnnualSalaryController = TextEditingController();
  TextEditingController resetLoverSociabilityController = TextEditingController();
  TextEditingController resetLoverReligiousController = TextEditingController();

// Http
  void updateLoverHttpRequset(BuildContext context) async {
    var url = "http://127.0.0.1:8080/UpdateLover";
    var requestBody = {
      "session_id": globalSessionID,
      "MinAge": resetLoverMinAgeController.text,
      "MaxAge": resetLoverMaxAgeController.text,
      "City": resetLoverCityController.text,
      "Gender": resetLoverGenderController.text,
      "Constellation": resetLoverConstellationController.text,
      "Height": resetLoverHeightController.text,
      "Weight": resetLoverWeightController.text,
      "Speak_language": resetLoverSpeakLanguageController.text,
      "Job": resetLoverJobController.text,
      "AnnualSalary": resetLoverAnnualSalaryController.text,
      "Sociability": resetLoverSociabilityController.text,
      "Religious": resetLoverReligiousController.text,
      "Certification": false
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTaptf(context);
    } else {
      print("MinAge: ${resetLoverMinAgeController.text}");
      print("MaxAge: ${resetLoverMaxAgeController.text}");
      print("City: ${resetLoverCityController.text}");
      print("Gender: ${resetLoverGenderController.text}");
      print("Constellation: ${resetLoverConstellationController.text}");
      print("Height: ${resetLoverHeightController.text}");
      print("Weight: ${resetLoverWeightController.text}");
      print("Speak Language: ${resetLoverSpeakLanguageController.text}");
      print("Job: ${resetLoverJobController.text}");
      print("AnnualSalary: ${resetLoverAnnualSalaryController.text}");
      print("Sociability: ${resetLoverSociabilityController.text}");
      print("Religious: ${resetLoverReligiousController.text}");
    }
  }

  void updateLoverGrpcRequset(BuildContext context) async {
    final request = UpdateLoverRequest(
      sessionID: globalSessionID,
      minAge: int.parse(resetLoverMinAgeController.text),
      maxAge: int.parse(resetLoverMaxAgeController.text),
      city: resetLoverCityController.text,
      gender: resetLoverGenderController.text,
      constellation: resetLoverConstellationController.text,
      height: int.parse(resetLoverHeightController.text),
      weight: int.parse(resetLoverWeightController.text),
      speaklanguage: resetLoverSpeakLanguageController.text,
      job: resetLoverJobController.text,
      annualSalary: int.parse(resetLoverAnnualSalaryController.text),
      sociability: resetLoverSociabilityController.text,
      religious: resetLoverReligiousController.text,
    );

    final response = await GrpcService.client.updateLover(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTaptf(context);
    } else {
      showErrorDialog(context, "Error: Empty response");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Header
        appBar: _buildHeader(context, title),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
            child: Column(
              children: [
                // Text(
                //   "年齢:",
                //   style: theme.textTheme.titleLarge,
                // ),
                // // Age range
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 30.h),
                //     child: Row(
                //       children: [
                //         // Min
                //         Container(
                //           height: 65.h,
                //           width: 60.v,
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.red, width: 2),
                //           ),
                //           child: Stack(
                //             children: [
                //               _buildLoverMinAgeInput(context),
                //             ],
                //           ),
                //         ),

                //         // から
                //         Padding(
                //           padding: EdgeInsets.only(
                //             left: 10.h,
                //             right: 10.h,
                //             top: 30.v,
                //             bottom: 5,
                //           ),
                //           child: Text("から", style: theme.textTheme.titleLarge),
                //         ),

                //         // Max
                //         Container(
                //           height: 40,
                //           width: 60,
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.red, width: 2),
                //           ),
                //           child: Stack(
                //             children: [_buildLoverMaxAgeInput(context)],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 15.v),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildLoverResetCountryInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildLoverResetCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildLoverResetGenderInput(context)),
                SizedBox(height: 15.v),

                // Constellation
                CustomInputBar(titleName: "星座:", backendPart: _buildLoverResetConstellationInput(context)),
                SizedBox(height: 15.v),

                // Blood
                CustomInputBar(titleName: "血液型:", backendPart: _buildLoverResetBloodInput(context)),
                SizedBox(height: 15.v),

                // Sexual
                CustomInputBar(titleName: "性的指向:", backendPart: _buildLoverResetSexualInput(context)),
                SizedBox(height: 15.v),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildLoverResetHeightInput(context)),
                SizedBox(height: 15.v),

                // Wegiht
                CustomInputBar(titleName: "体重:", backendPart: _buildLoverResetWeightInput(context)),
                SizedBox(height: 15.v),

                // Speak Language
                CustomInputBar(titleName: "言語:", backendPart: _buildLoverSpeakLanguageInput(context)),
                SizedBox(height: 15.v),

                // Job
                CustomInputBar(titleName: "職種:", backendPart: _buildLoverResetJobInput(context)),
                SizedBox(height: 15.v),

                // Annual Salary
                CustomInputBar(titleName: "年収:", backendPart: _buildLoverResetAnnualSalaryInput(context)),
                SizedBox(height: 15.v),

                // Socialbility
                CustomInputBar(titleName: "社交力:", backendPart: _buildLoverResetSociabilityInput(context)),
                SizedBox(height: 15.v),

                // Religious
                CustomInputBar(titleName: "宗教:", backendPart: _buildLoverResetReligiousInput(context)),
                SizedBox(height: 20.v),

                // 本人
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadius.circular(10.h)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("本人認証を確認しました", style: theme.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.v),

                // button
                _buildCertificationForCheck(context),
                SizedBox(height: 30.v)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context, String title) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: title, margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  // /// Min Age
  // Widget _buildLoverMinAgeInput(BuildContext context) {
  //   return CustomTextFormField(
  //     maxLength: 3,
  //     width: 60.h,
  //     controller: resetLoverMinAgeController,
  //     hintText: "30",
  //     alignment: Alignment.bottomCenter,
  //   );
  // }

  // /// Max Age
  // Widget _buildLoverMaxAgeInput(BuildContext context) {
  //   return CustomTextFormField(
  //     maxLength: 3,
  //     width: 60,
  //     controller: resetLoverMaxAgeController,
  //     hintText: "30",
  //     alignment: Alignment.bottomCenter,
  //   );
  // }

  /// Country
  Widget _buildLoverResetCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverCountryController,
      hintText: "日本",
    );
  }

  /// City
  Widget _buildLoverResetCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildLoverResetGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverGenderController,
      hintText: "男",
    );
  }

  /// Constellation
  Widget _buildLoverResetConstellationInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverConstellationController,
      hintText: "いて座",
    );
  }

  /// Constellation
  Widget _buildLoverResetBloodInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverBloodController,
      hintText: "A",
    );
  }

  /// Sexual
  Widget _buildLoverResetSexualInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverSexualController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildLoverResetHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverHeightController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildLoverResetWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverWeightController,
      hintText: "170cm",
    );
  }

  /// Speak Language
  Widget _buildLoverSpeakLanguageInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverSpeakLanguageController,
      hintText: "日本語",
    );
  }

  /// Job
  Widget _buildLoverResetJobInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverJobController,
      hintText: "ホスト",
    );
  }

  /// Annual Salary
  Widget _buildLoverResetAnnualSalaryInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverAnnualSalaryController,
      hintText: "4000",
    );
  }

  /// Sociability
  Widget _buildLoverResetSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverSociabilityController,
      hintText: "人たら神",
    );
  }

  /// Religious
  Widget _buildLoverResetReligiousInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverReligiousController,
      hintText: "多神教",
      textInputAction: TextInputAction.done,
    );
  }

  /// Certification For Check
  Widget _buildCertificationForCheck(BuildContext context) {
    return CustomOutlinedButton(
      width: 110,
      height: 40,
      text: "条件確認",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        updateLoverGrpcRequset(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
