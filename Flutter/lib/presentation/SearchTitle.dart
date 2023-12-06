import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
          child: Column(
            children: [
              // logo
              CustomImageView(imagePath: ImageConstant.imgLogo, width: 130),
              SizedBox(height: 1.v),
              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
              SizedBox(height: 25.v),

              // Tilte
              Text("探すターゲットの種類", style: CustomTextStyles.headlineMediumBlack900),
              SizedBox(height: 25.v),

              // button 1
              CustomElevatedButton(
                text: "趣味",
                buttonStyle: CustomButtonStyles.fillGray,
                onPressed: () {
                  onTaptFirstHobbyCondition(context);
                },
              ),
              SizedBox(height: 30.v),

              // button 2
              CustomElevatedButton(
                text: "恋人",
                buttonStyle: CustomButtonStyles.fillDarkRed,
                onPressed: () {
                  onTaptFirstLoverCondition(context);
                },
              ),
              SizedBox(height: 30.v),

              // button 3
              CustomElevatedButton(
                text: "お相伴",
                buttonStyle: CustomButtonStyles.fillRed,
                onPressed: () {
                  onTaptFirstAccompanyCondition(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTaptFirstHobbyCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.hobbyCondition);
  }

  onTaptFirstLoverCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loverConditions);
  }

  onTaptFirstAccompanyCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.accompanyConditions);
  }
}
