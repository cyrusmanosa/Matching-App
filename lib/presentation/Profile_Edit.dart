import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/presentation/Header/Header.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_bottom_bar.dart';
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
              SizedBox(height: 16.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorgray500,
                              height: 150.adaptSize,
                              width: 150.adaptSize,
                              margin: EdgeInsets.only(
                                top: 10.v,
                                bottom: 9.v,
                              ),
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
                            Text(
                              "自己紹介:",
                              style: theme.textTheme.titleLarge,
                            ),
                            _buildIntroduceInput(context),
                          ],
                        ),
                        SizedBox(height: 17.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ニックネーム:",
                              style: theme.textTheme.titleLarge,
                            ),
                            _buildNickNameInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "身長:",
                              style: theme.textTheme.titleLarge,
                            ),
                            _buildHeightInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "体重:",
                              style: theme.textTheme.titleLarge,
                            ),
                            _buildWeightInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "居住地:",
                              style: theme.textTheme.titleLarge,
                            ),
                            _buildCityInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "学歴:",
                              style: theme.textTheme.titleLarge,
                            ),
                            Container(
                              width: 330.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 19.h,
                                vertical: 6.v,
                              ),
                              decoration: AppDecoration.outlinePinkA.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5,
                              ),
                              child: Text(
                                "高校生",
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "趣味のタイプ:",
                              style: theme.textTheme.titleLarge,
                            ),
                            _buildHobbyTypeInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "職種:",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 2.v),
                            _buildJobInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "性的指向:",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 2.v),
                            _buildSexualInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "社交力:",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 2.v),
                            _buildSociabilityInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "探す対象:",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 2.v),
                            _buildFindTargetInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "目的:",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 2.v),
                            _buildPurposeInput(context),
                          ],
                        ),
                        SizedBox(height: 8.v),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "宗教:",
                              style: theme.textTheme.titleLarge,
                            ),
                            SizedBox(height: 2.v),
                            _buildReligiousInput(context),
                          ],
                        ),
                        SizedBox(height: 13.v),
                        _buildNameButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "プロフィール編集",
        margin: EdgeInsets.only(
          top: 59.v,
          bottom: 11.v,
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildIntroduceInput(BuildContext context) {
    return CustomTextFormField(
      controller: introduceInputController,
      hintText: "亜dさdさだだ",
      maxLines: 8,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.v,
      ),
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildNickNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: nickNameInputController,
      hintText: "仆街",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildHeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: heightInputController,
      hintText: "170cm",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildWeightInput(BuildContext context) {
    return CustomTextFormField(
      controller: weightInputController,
      hintText: "60kg",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCityInput(BuildContext context) {
    return CustomTextFormField(
      controller: cityInputController,
      hintText: "大阪",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildHobbyTypeInput(BuildContext context) {
    return CustomTextFormField(
      controller: hobbyTypeInputController,
      hintText: "サッカー",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildJobInput(BuildContext context) {
    return CustomTextFormField(
      controller: jobInputController,
      hintText: "ホスト",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSexualInput(BuildContext context) {
    return CustomTextFormField(
      controller: sexualInputController,
      hintText: "異性愛",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSociabilityInput(BuildContext context) {
    return CustomTextFormField(
      controller: sociabilityInputController,
      hintText: "人たら神",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildFindTargetInput(BuildContext context) {
    return CustomTextFormField(
      controller: findTargetInputController,
      hintText: "サッカーのチームメンバー",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildPurposeInput(BuildContext context) {
    return CustomTextFormField(
      controller: purposeInputController,
      hintText: "サッカーチームを組む",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildReligiousInput(BuildContext context) {
    return CustomTextFormField(
      controller: religiousInputController,
      hintText: "多神教",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildNameButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 150.h,
      text: "確認",
      buttonStyle: CustomButtonStyles.outlinePinkATL30,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.tf:
        return AppRoutes.header;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.header:
        return Header();
      default:
        return DefaultWidget();
    }
  }
}
