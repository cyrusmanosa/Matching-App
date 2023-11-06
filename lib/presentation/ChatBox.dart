import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/presentation/k1_page/k1_page.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:cyrus_man_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_bottom_bar.dart';
import 'package:cyrus_man_s_application1/widgets/custom_elevated_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_icon_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class ChatBox extends StatelessWidget {
  ChatBox({Key? key}) : super(key: key);

  TextEditingController secretController = TextEditingController();

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
                child: Column(children: [
                  SizedBox(height: 10.v),
                  _buildTwo(context),
                  SizedBox(height: 7.v),
                  _buildNinetySeven(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 59.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 60.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(
            text: "ターゲット名前", margin: EdgeInsets.only(top: 59.v, bottom: 11.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.fromLTRB(35.h, 67.v, 35.h, 18.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup2), fit: BoxFit.cover)),
        child: CustomImageView(
            imagePath: ImageConstant.imgUserMessage,
            height: 449.v,
            width: 398.h));
  }

  /// Section Widget
  Widget _buildNinetySeven(BuildContext context) {
    return SizedBox(
        height: 289.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.v),
                  decoration: AppDecoration.fillBlueGrayE,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: EdgeInsets.only(right: 3.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 37.h,
                                  padding: EdgeInsets.all(6.h),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("Q".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 36.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("W".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 37.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("E".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 36.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("R".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 37.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("T".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 36.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("Y".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 36.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("U".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 37.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("I".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 36.h,
                                  padding: EdgeInsets.all(6.h),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("O".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 37.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("P".toUpperCase(),
                                      style: theme.textTheme.headlineSmall))
                            ])),
                    SizedBox(height: 11.v),
                    Padding(
                        padding: EdgeInsets.only(left: 18.h, right: 14.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 38.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("A".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 38.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("S".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 38.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("D".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 39.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("F".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 37.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("G".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 39.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("H".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 38.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("J".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 38.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("K".toUpperCase(),
                                      style: theme.textTheme.headlineSmall)),
                              Container(
                                  width: 38.h,
                                  margin: EdgeInsets.only(left: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 6.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("L".toUpperCase(),
                                      style: theme.textTheme.headlineSmall))
                            ])),
                    SizedBox(height: 11.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomIconButton(
                          height: 43.v,
                          width: 42.h,
                          padding: EdgeInsets.all(5.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgShiftOn)),
                      Container(
                          width: 40.h,
                          margin: EdgeInsets.only(left: 13.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 6.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("Z".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: 40.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.h, vertical: 6.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("X".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: 40.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.h, vertical: 6.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("C".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: 39.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.h, vertical: 6.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("V".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: 40.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 6.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("B".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: 40.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.h, vertical: 6.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("N".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: 40.h,
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.all(6.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("M".toUpperCase(),
                              style: theme.textTheme.headlineSmall)),
                      Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: CustomIconButton(
                              height: 42.adaptSize,
                              width: 42.adaptSize,
                              padding: EdgeInsets.all(5.h),
                              decoration: IconButtonStyleHelper.outlineBlackTL5,
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIcon)))
                    ]),
                    SizedBox(height: 13.v),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 40.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 11.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Text("123",
                                  style: CustomTextStyles
                                      .bodyLargeSFProTextBlack900)),
                          Container(
                              height: 43.v,
                              width: 40.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.h, vertical: 5.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgEmojis,
                                  height: 32.adaptSize,
                                  width: 32.adaptSize,
                                  alignment: Alignment.center)),
                          SizedBox(
                              height: 42.v,
                              width: 32.h,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        height: 42.v,
                                        width: 31.h,
                                        decoration: BoxDecoration(
                                            color: appTheme.blueGray200,
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: appTheme.black900
                                                      .withOpacity(0.3),
                                                  spreadRadius: 2.h,
                                                  blurRadius: 2.h,
                                                  offset: Offset(0, 1))
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgMic,
                                    height: 32.adaptSize,
                                    width: 32.adaptSize,
                                    alignment: Alignment.center)
                              ])),
                          Container(
                              width: 198.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.h, vertical: 8.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("space",
                                  style: CustomTextStyles
                                      .bodyLargeSFProTextBlack900)),
                          CustomElevatedButton(
                              height: 43.v,
                              width: 87.h,
                              text: "return",
                              buttonStyle: CustomButtonStyles.outlineBlack,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargeSFProTextPrimary)
                        ]),
                    SizedBox(height: 17.v)
                  ]))),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 239.v),
                  padding: EdgeInsets.symmetric(vertical: 7.v),
                  decoration: AppDecoration.fillPinkA,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgCrossButton,
                            height: 33.adaptSize,
                            width: 33.adaptSize,
                            margin: EdgeInsets.only(top: 1.v, bottom: 2.v)),
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: CustomTextFormField(
                              width: 300.h,
                              controller: secretController,
                              hintText: "Secret",
                              textInputAction: TextInputAction.done,
                              borderDecoration:
                                  TextFormFieldStyleHelper.fillGray,
                              filled: true,
                              fillColor: appTheme.gray70002,
                              decoration: InputDecoration(),
                              children: [],
                            )),
                        CustomImageView(
                            imagePath: ImageConstant.imgSend,
                            height: 33.adaptSize,
                            width: 33.adaptSize,
                            margin: EdgeInsets.only(top: 1.v, bottom: 2.v))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
