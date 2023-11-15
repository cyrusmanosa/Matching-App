import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_trailing_return.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
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
        appBar: _buildHeader(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 15.v),
              _buildTwo(context),
              SizedBox(height: 7.v),
              _buildNinetySeven(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 60, bottom: 15),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(text: "ターゲット名前", margin: EdgeInsets.only(top: 60, bottom: 20)),
      actions: [AppbarTrailingReturn(imagePath: ImageConstant.imgMenu, margin: EdgeInsets.fromLTRB(35, 65, 35, 20))],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(image: DecorationImage(image: fs.Svg(ImageConstant.imgGroup2), fit: BoxFit.cover)),
      child: CustomImageView(imagePath: ImageConstant.imgUserMessage, height: 449.v, width: 398.h),
    );
  }

  /// Section Widget
  Widget _buildNinetySeven(BuildContext context) {
    return SizedBox(
      height: 289.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // input bar
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 239.v),
              padding: EdgeInsets.symmetric(vertical: 7.v),
              decoration: AppDecoration.fillPink,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCrossButton,
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(top: 1.v, bottom: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: CustomTextFormField(
                      width: 300.h,
                      controller: secretController,
                      hintText: "Secret",
                      textInputAction: TextInputAction.done,
                      borderDecoration: TextFormFieldStyleHelper.fillGray,
                      filled: true,
                      fillColor: appTheme.gray800,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgSend,
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(top: 1.v, bottom: 2.v),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
