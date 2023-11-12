import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignUp_2 extends StatelessWidget {
  SignUp_2({Key? key}) : super(key: key);

  TextEditingController nickNameInputController = TextEditingController();
  TextEditingController cityInputController = TextEditingController();
  TextEditingController sexualInputController = TextEditingController();
  TextEditingController heightInputController = TextEditingController();
  TextEditingController weightInputController = TextEditingController();
  TextEditingController educationInputController = TextEditingController();
  TextEditingController jobInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // Header
              _buildHeader(context),
              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("ニックネーム:", style: theme.textTheme.titleLarge), _buildNickNameInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("居住地:", style: theme.textTheme.titleLarge), _buildCityInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("性的指向:", style: theme.textTheme.titleLarge), _buildSexualInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("身長:", style: theme.textTheme.titleLarge), _buildHeightInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("体重:", style: theme.textTheme.titleLarge), _buildWeightInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("学歴:", style: theme.textTheme.titleLarge), _buildEducationInput(context)],
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("職種:", style: theme.textTheme.titleLarge), _buildJobInput(context)],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

// Backend ----------------------------------------------------------------

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
      title: AppbarTitle(text: "基本個人情報 - B", margin: EdgeInsets.only(top: 60, bottom: 10)),
      styleType: Style.bgFill,
    );
  }

  // turn back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Nickname
  Widget _buildNickNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: nickNameInputController,
      hintText: "仆街",
    );
  }

  /// City
  Widget _buildCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: cityInputController,
      hintText: "大阪",
    );
  }

  /// Sexual
  Widget _buildSexualInput(BuildContext context) {
    return CustomTextFormField(
      controller: sexualInputController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: heightInputController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: weightInputController,
      hintText: "60kg",
    );
  }

  /// Education
  Widget _buildEducationInput(BuildContext context) {
    return CustomTextFormField(
      controller: educationInputController,
      hintText: "高校生",
    );
  }

  /// Job
  Widget _buildJobInput(BuildContext context) {
    return CustomTextFormField(
      controller: jobInputController,
      hintText: "ホスト",
      textInputAction: TextInputAction.done,
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
      },
    );
  }

  /// Navigates to the signupPhoneoremailPartthreeScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp_3);
  }
}
