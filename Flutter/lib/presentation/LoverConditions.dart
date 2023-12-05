import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class LoverConditions extends StatelessWidget {
  LoverConditions({Key? key}) : super(key: key);

  TextEditingController loverMinAgeInputController = TextEditingController();
  TextEditingController loverMaxAgeInputController = TextEditingController();
  TextEditingController loverCountryController = TextEditingController();
  TextEditingController loverCityController = TextEditingController();
  TextEditingController loverGenderController = TextEditingController();
  TextEditingController loverBloodController = TextEditingController();
  TextEditingController loverConstellationController = TextEditingController();
  TextEditingController loverSexualController = TextEditingController();
  TextEditingController loverHeightController = TextEditingController();
  TextEditingController loverWeightController = TextEditingController();
  TextEditingController loverEducationController = TextEditingController();
  TextEditingController loverJobController = TextEditingController();
  TextEditingController loverAnnualSalaryController = TextEditingController();
  TextEditingController loverSociabilityController = TextEditingController();
  TextEditingController loverReligiousController = TextEditingController();

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
            padding: EdgeInsets.only(left: 30.h, top: 30, right: 30.h),
            child: Column(
              children: [
                // _buildLoverAgeInput(context),
                SizedBox(height: 15.v),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildLoverCountryInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildLoverCityInput(context)),
                SizedBox(height: 15.v),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildLoverGenderInput(context)),
                SizedBox(height: 15.v),

                // Constellation
                CustomInputBar(titleName: "星座:", backendPart: _buildLoverConstellationInput(context)),
                SizedBox(height: 15.v),

                // Blood
                CustomInputBar(titleName: "血液型:", backendPart: _buildLoverBloodInput(context)),
                SizedBox(height: 15.v),

                // Sexual
                CustomInputBar(titleName: "性的指向:", backendPart: _buildLoverSexualInput(context)),
                SizedBox(height: 15.v),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildLoverHeightInput(context)),
                SizedBox(height: 15.v),

                // Wegiht
                CustomInputBar(titleName: "体重:", backendPart: _buildLoverWeightInput(context)),
                SizedBox(height: 15.v),

                // Education
                CustomInputBar(titleName: "学歴:", backendPart: _buildLoverEducationInput(context)),
                SizedBox(height: 15.v),

                // Job
                CustomInputBar(titleName: "職種:", backendPart: _buildLoverJobInput(context)),
                SizedBox(height: 15.v),

                // Annual Salary
                CustomInputBar(titleName: "年収:", backendPart: _buildLoverAnnualSalaryInput(context)),
                SizedBox(height: 15.v),

                // Socialbility
                CustomInputBar(titleName: "社交力:", backendPart: _buildLoverSociabilityInput(context)),
                SizedBox(height: 15.v),

                // Religious
                CustomInputBar(titleName: "宗教:", backendPart: _buildLoverReligiousInput(context)),
                SizedBox(height: 20.v),

                // 本人
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
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
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "恋人の条件設定", margin: EdgeInsets.only(top: 60, bottom: 20)),
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
  //     controller: loverMinAgeInputController,
  //     hintText: "30",
  //     alignment: Alignment.bottomCenter,
  //   );
  // }

  // /// Max Age
  // Widget _buildLoverMaxAgeInput(BuildContext context) {
  //   return CustomTextFormField(
  //     maxLength: 3,
  //     maxLines: 1,
  //     width: 60,
  //     height: 20,
  //     controller: loverMaxAgeInputController,
  //     hintText: "30",
  //   );
  // }

  // Widget _buildLoverAgeInput(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("年齢", style: theme.textTheme.titleLarge),
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

  /// Country
  Widget _buildLoverCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverCountryController,
      hintText: "日本",
    );
  }

  /// City
  Widget _buildLoverCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverCityController,
      hintText: "大阪",
    );
  }

  /// Gender
  Widget _buildLoverGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverGenderController,
      hintText: "男",
    );
  }

  /// Constellation
  Widget _buildLoverConstellationInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverConstellationController,
      hintText: "いて座",
    );
  }

  /// Constellation
  Widget _buildLoverBloodInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverBloodController,
      hintText: "A",
    );
  }

  /// Sexual
  Widget _buildLoverSexualInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverSexualController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildLoverHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverHeightController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildLoverWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverWeightController,
      hintText: "170cm",
    );
  }

  /// Education
  Widget _buildLoverEducationInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverEducationController,
      hintText: "高校生",
    );
  }

  /// Job
  Widget _buildLoverJobInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverJobController,
      hintText: "ホスト",
    );
  }

  /// Annual Salary
  Widget _buildLoverAnnualSalaryInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverAnnualSalaryController,
      hintText: "4000",
    );
  }

  /// Sociability
  Widget _buildLoverSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverSociabilityController,
      hintText: "人たら神",
    );
  }

  /// Religious
  Widget _buildLoverReligiousInput(BuildContext context) {
    return CustomTextFormField(
      controller: loverReligiousController,
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
        onTaptf(context);
      },
    );
  }

  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
