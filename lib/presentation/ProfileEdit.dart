import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);

  TextEditingController introduceInputController = TextEditingController();
  TextEditingController nickNameInputController = TextEditingController();
  TextEditingController heightInputController = TextEditingController();
  TextEditingController weightInputController = TextEditingController();
  TextEditingController cityInputController = TextEditingController();
  TextEditingController hobbyTypeInputController = TextEditingController();
  TextEditingController jobInputController = TextEditingController();
  TextEditingController sexualInputController = TextEditingController();
  TextEditingController sociabilityInputController = TextEditingController();
  TextEditingController findTargetInputController = TextEditingController();
  TextEditingController purposeInputController = TextEditingController();
  TextEditingController religiousInputController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 15.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.h),
                    child: Column(
                      children: [
                        // photos
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorgray500,
                              height: 150.adaptSize,
                              width: 150.adaptSize,
                              margin: EdgeInsets.only(top: 10.v, bottom: 9.v),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgPhotoSet,
                              height: 169.v,
                              width: 50.h,
                              margin: EdgeInsets.only(left: 22.h),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("自己紹介:", style: theme.textTheme.titleLarge),
                            _buildIntroduceInput(context),
                          ],
                        ),
                        SizedBox(height: 17.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ニックネーム:", style: theme.textTheme.titleLarge),
                            _buildNickNameInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("身長:", style: theme.textTheme.titleLarge),
                            _buildHeightInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("体重:", style: theme.textTheme.titleLarge),
                            _buildWeightInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("居住地:", style: theme.textTheme.titleLarge),
                            _buildCityInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("学歴:", style: theme.textTheme.titleLarge),
                            _buildEducationInput(context),
                          ],
                        ),
                        SizedBox(height: 4.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("趣味のタイプ:", style: theme.textTheme.titleLarge),
                            _buildHobbyTypeInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("職種:", style: theme.textTheme.titleLarge),
                            SizedBox(height: 2.v),
                            _buildJobInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("性的指向:", style: theme.textTheme.titleLarge),
                            SizedBox(height: 2.v),
                            _buildSexualInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("社交力:", style: theme.textTheme.titleLarge),
                            SizedBox(height: 2.v),
                            _buildSociabilityInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("探す対象:", style: theme.textTheme.titleLarge),
                            SizedBox(height: 2.v),
                            _buildFindTargetInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("目的:", style: theme.textTheme.titleLarge),
                            SizedBox(height: 2.v),
                            _buildPurposeInput(context),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("宗教:", style: theme.textTheme.titleLarge),
                            SizedBox(height: 2.v),
                            _buildReligiousInput(context),
                          ],
                        ),
                        SizedBox(height: 15.v),
                        _buildSubmitButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "プロフィール編集",
        margin: EdgeInsets.only(left: 67.v, right: 18.v),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Introduce
  Widget _buildIntroduceInput(BuildContext context) {
    return CustomTextFormField(
      controller: introduceInputController,
      hintText: "亜dさdさだだ",
      maxLines: 8,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 19.v),
    );
  }

  /// NickName
  Widget _buildNickNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: nickNameInputController,
      hintText: "仆街",
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

  /// City
  Widget _buildCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: cityInputController,
      hintText: "大阪",
    );
  }

  Widget _buildEducationInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyTypeInputController,
      hintText: "サッカー",
    );
  }

  /// HobbyType
  Widget _buildHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyTypeInputController,
      hintText: "サッカー",
    );
  }

  /// Job
  Widget _buildJobInput(BuildContext context) {
    return CustomTextFormField(
      controller: jobInputController,
      hintText: "ホスト",
    );
  }

  /// Sexual
  Widget _buildSexualInput(BuildContext context) {
    return CustomTextFormField(
      controller: sexualInputController,
      hintText: "異性愛",
    );
  }

  /// Sociability
  Widget _buildSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: sociabilityInputController,
      hintText: "人たら神",
    );
  }

  /// Find Target
  Widget _buildFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: findTargetInputController,
      hintText: "サッカーのチームメンバー",
    );
  }

  /// Purpose
  Widget _buildPurposeInput(BuildContext context) {
    return CustomTextFormField(
      controller: purposeInputController,
      hintText: "サッカーチームを組む",
    );
  }

  /// Religious
  Widget _buildReligiousInput(BuildContext context) {
    return CustomTextFormField(
      controller: religiousInputController,
      hintText: "多神教",
      textInputAction: TextInputAction.done,
    );
  }

  /// button
  Widget _buildSubmitButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "確認",
      buttonStyle: CustomButtonStyles.outlinePinkGrayBG,
    );
  }
}
