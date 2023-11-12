import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable,camel_case_types
class SignUp_3 extends StatelessWidget {
  SignUp_3({Key? key}) : super(key: key);

  TextEditingController zipcodeController = TextEditingController();
  TextEditingController group36Controller = TextEditingController();
  TextEditingController group37Controller = TextEditingController();
  TextEditingController ddController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              // Header
              _buildHeader(context),
              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("年収:", style: theme.textTheme.titleLarge), _buildAnnualSalaryInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("社交力:", style: theme.textTheme.titleLarge), _buildSociabilityInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("宗教:", style: theme.textTheme.titleLarge), _buildReligiousInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("自己紹介:", style: theme.textTheme.titleLarge), _buildIntroduceInput(context)],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 60, bottom: 15),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "基本個人情報 - C", margin: EdgeInsets.only(top: 60, bottom: 10)),
      styleType: Style.bgFill,
    );
  }

  // turn back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Annual Salary
  Widget _buildAnnualSalaryInput(BuildContext context) {
    return CustomTextFormField(
      controller: zipcodeController,
      hintText: "4000",
    );
  }

  /// Section Widget
  Widget _buildSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: group36Controller,
      hintText: "人たら神",
    );
  }

  /// Section Widget
  Widget _buildReligiousInput(BuildContext context) {
    return CustomTextFormField(
      controller: group37Controller,
      hintText: "多神教",
    );
  }

  /// Section Widget
  Widget _buildIntroduceInput(BuildContext context) {
    return CustomTextFormField(
      controller: ddController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 8,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
    );
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
        width: 150.h,
        text: "次へ",
        margin: EdgeInsets.only(left: 140.h, right: 140.h, bottom: 30.v),
        buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates to the k26Screen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchTitle);
  }
}
