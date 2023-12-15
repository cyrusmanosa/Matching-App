import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable,camel_case_types
class CanChangeInformation_1 extends StatelessWidget {
  CanChangeInformation_1({Key? key}) : super(key: key);

  TextEditingController canChangeNickNameController = TextEditingController();
  TextEditingController canChangeCityController = TextEditingController();
  TextEditingController canChangeSexualController = TextEditingController();
  TextEditingController canChangeHeightController = TextEditingController();
  TextEditingController canChangeWeightController = TextEditingController();
  TextEditingController canChangeSpeakLanguageController = TextEditingController();
  TextEditingController canChangeEducationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        // Header
        appBar: _buildHeader(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
            child: Column(
              children: [
                // Nick Name
                CustomInputBar(titleName: "ニックネーム:", backendPart: _buildcanChangeNickNameInput(context)),
                SizedBox(height: 15.v),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildcanChangeCityInput(context)),
                SizedBox(height: 15.v),

                // Sexual
                CustomInputBar(titleName: "性的指向:", backendPart: _buildcanChangeSexualInput(context)),
                SizedBox(height: 15.v),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildcanChangeHeightInput(context)),
                SizedBox(height: 15.v),

                // Weight
                CustomInputBar(titleName: "体重:", backendPart: _buildcanChangeWeightInput(context)),
                SizedBox(height: 15.v),

                // Speak Language
                CustomInputBar(titleName: "言語:", backendPart: _buildcanChangeSpeakLanguageInput(context)),
                SizedBox(height: 15.v),

                // Job
                CustomInputBar(titleName: "学歴:", backendPart: _buildcanChangeEducationInput(context)),
                SizedBox(height: 40.v),

                // Button
                _buildNextButton(context),
                SizedBox(height: 30.v),
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
      title: AppbarTitle(text: "基本個人情報 - B", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  // turn back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Nickname
  Widget _buildcanChangeNickNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeNickNameController,
      hintText: "仆街",
    );
  }

  /// City
  Widget _buildcanChangeCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeCityController,
      hintText: "大阪",
    );
  }

  /// Sexual
  Widget _buildcanChangeSexualInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeSexualController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildcanChangeHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeHeightController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildcanChangeWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeWeightController,
      hintText: "60kg",
    );
  }

  /// Education
  Widget _buildcanChangeEducationInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeEducationController,
      hintText: "高校生",
    );
  }

  /// Speak Language
  Widget _buildcanChangeSpeakLanguageInput(BuildContext context) {
    return CustomTextFormField(
      controller: canChangeSpeakLanguageController,
      hintText: "EN,HK,CN,JP",
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 90,
      height: 40,
      text: "次へ",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        nickname = canChangeNickNameController.text;
        city = canChangeCityController.text;
        sexual = canChangeSexualController.text;
        height = int.parse(canChangeHeightController.text);
        weight = int.parse(canChangeWeightController.text);
        speaklanguage = canChangeSpeakLanguageController.text;
        education = canChangeEducationController.text;
        onTapNextButton(context);
      },
    );
  }

  /// Navigates to the signupPhoneoremailPartthreeScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_2);
  }
}
