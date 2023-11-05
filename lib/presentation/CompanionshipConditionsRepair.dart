import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/presentation/k1_page/k1_page.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_bottom_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class companionshipConditionsRepair extends StatelessWidget {
  companionshipConditionsRepair({Key? key})
      : super(
          key: key,
        );

  TextEditingController ageController = TextEditingController();

  TextEditingController nationalityController = TextEditingController();

  TextEditingController residenceController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  TextEditingController group52Controller = TextEditingController();

  TextEditingController socialAbilityController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              _buildEraInput(context),
              SizedBox(height: 18.v),
              _buildCounityInput(context),
              SizedBox(height: 18.v),
              _buildCityInput(context),
              SizedBox(height: 18.v),
              _buildGenderInput(context),
              SizedBox(height: 18.v),
              _buildAccompanyTypeInput(context),
              SizedBox(height: 18.v),
              _buildFindTargetInput(context),
              SizedBox(height: 18.v),
              _buildSociabilityInput(context),
              SizedBox(height: 23.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(bottom: 1.v),
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(
                          10.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "本人認証を確認しました",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.v),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 110.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 18.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.outlinePinkA100.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.v),
                    Text(
                      "条件確認",
                      style: CustomTextStyles.headlineMediumMontserratPinkA100,
                    ),
                  ],
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
        text: "お相伴の条件更改",
        margin: EdgeInsets.only(
          top: 59.v,
          bottom: 11.v,
        ),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildAge(BuildContext context) {
    return CustomTextFormField(
      controller: ageController,
      hintText: "３０代",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildEraInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "年代:",
          style: theme.textTheme.titleLarge,
        ),
        _buildAge(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildNationality(BuildContext context) {
    return CustomTextFormField(
      controller: nationalityController,
      hintText: "日本",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCounityInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "国籍:",
          style: theme.textTheme.titleLarge,
        ),
        _buildNationality(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildResidence(BuildContext context) {
    return CustomTextFormField(
      controller: residenceController,
      hintText: "大阪",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildCityInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "居住地:",
          style: theme.textTheme.titleLarge,
        ),
        _buildResidence(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return CustomTextFormField(
      controller: genderController,
      hintText: "男",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildGenderInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "性別:",
          style: theme.textTheme.titleLarge,
        ),
        _buildGender(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildType(BuildContext context) {
    return CustomTextFormField(
      controller: typeController,
      hintText: "おしゃべり",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildAccompanyTypeInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "お相伴のタイプ:",
          style: theme.textTheme.titleLarge,
        ),
        _buildType(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildGroup52(BuildContext context) {
    return CustomTextFormField(
      controller: group52Controller,
      hintText: "聞き役",
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildFindTargetInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "探す対象:",
          style: theme.textTheme.titleLarge,
        ),
        _buildGroup52(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildSocialAbility(BuildContext context) {
    return CustomTextFormField(
      controller: socialAbilityController,
      hintText: "人たら神",
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(),
      children: [],
    );
  }

  /// Section Widget
  Widget _buildSociabilityInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "社交力:",
          style: theme.textTheme.titleLarge,
        ),
        _buildSocialAbility(context),
      ],
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
        return AppRoutes.k1Page;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.k1Page:
        return K1Page();
      default:
        return DefaultWidget();
    }
  }
}
