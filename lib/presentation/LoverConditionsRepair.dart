import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_Input_Bar.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class LoverConditionsRepair extends StatelessWidget {
  LoverConditionsRepair({Key? key}) : super(key: key);

  TextEditingController resetLoverMinAgeInputController = TextEditingController();
  TextEditingController resetLoverMaxAgeInputController = TextEditingController();
  TextEditingController resetLoverCountryController = TextEditingController();
  TextEditingController resetLoverCityController = TextEditingController();
  TextEditingController resetLoverGenderController = TextEditingController();
  TextEditingController resetLoverBloodController = TextEditingController();
  TextEditingController resetLoverConstellationController = TextEditingController();
  TextEditingController resetLoverSexualController = TextEditingController();
  TextEditingController resetLoverHeightController = TextEditingController();
  TextEditingController resetLoverWeightController = TextEditingController();
  TextEditingController resetLoverEducationController = TextEditingController();
  TextEditingController resetLoverJobController = TextEditingController();
  TextEditingController resetLoverAnnualSalaryController = TextEditingController();
  TextEditingController resetLoverSociabilityController = TextEditingController();
  TextEditingController resetLoverReligiousController = TextEditingController();

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
            child: Column(
              children: [
                SizedBox(height: 120.v),

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

                // Education
                CustomInputBar(titleName: "学歴:", backendPart: _buildLoverResetEducationInput(context)),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.h),
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
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "恋人の条件更改", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Min Age
  Widget _buildLoverMinAgeInput(BuildContext context) {
    return CustomTextFormField(
      maxLength: 3,
      width: 60.h,
      controller: resetLoverMinAgeInputController,
      hintText: "30",
      alignment: Alignment.bottomCenter,
    );
  }

  /// Max Age
  Widget _buildLoverMaxAgeInput(BuildContext context) {
    return CustomTextFormField(
      maxLength: 3,
      width: 60,
      controller: resetLoverMaxAgeInputController,
      hintText: "30",
      alignment: Alignment.bottomCenter,
    );
  }

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

  /// Education
  Widget _buildLoverResetEducationInput(BuildContext context) {
    return CustomTextFormField(
      controller: resetLoverEducationController,
      hintText: "高校生",
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
      width: 150.h,
      text: "条件確認",
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
      onPressed: () {
        onTaptf(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
