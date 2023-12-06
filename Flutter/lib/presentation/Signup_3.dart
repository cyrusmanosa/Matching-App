import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable,camel_case_types
class SignUp_3 extends StatelessWidget {
  SignUp_3({Key? key}) : super(key: key);

  TextEditingController basicAnnualSalaryController = TextEditingController();
  TextEditingController basicSociabilityController = TextEditingController();
  TextEditingController basicReligiousController = TextEditingController();
  TextEditingController basicIntroduceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildHeader(context),
        body: Padding(
          padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
          child: Column(
            children: [
              // Annual Salary
              CustomInputBar(titleName: "年収:", backendPart: _buildBasicAnnualSalaryInput(context)),
              SizedBox(height: 15.v),

              // Sociability
              CustomInputBar(titleName: "社交力:", backendPart: _buildBasicSociabilityInput(context)),
              SizedBox(height: 15.v),

              // Religious
              CustomInputBar(titleName: "宗教:", backendPart: _buildBasicReligiousInput(context)),
              SizedBox(height: 15.v),

              // Introduce
              CustomInputBar(titleName: "自己紹介:", backendPart: _buildBasicIntroduceInput(context)),

              SizedBox(height: 40),
              _buildNextButton(context),
            ],
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
      title: AppbarTitle(text: "基本個人情報 - C", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  // turn back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Annual Salary
  Widget _buildBasicAnnualSalaryInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicAnnualSalaryController,
      hintText: "4000",
    );
  }

  /// Sociability
  Widget _buildBasicSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicSociabilityController,
      hintText: "人たら神",
    );
  }

  /// Religious
  Widget _buildBasicReligiousInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicReligiousController,
      hintText: "多神教",
    );
  }

  /// Introduce
  Widget _buildBasicIntroduceInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicIntroduceController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
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
        onTapNextButton(context);
      },
    );
  }

  /// Navigates to the k26Screen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchTitle);
  }
}
