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
          padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
          child: Column(
            children: [
              // logo
              CustomImageView(imagePath: ImageConstant.imgLogo, width: 130),
              SizedBox(height: 1.v),
              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
              SizedBox(height: 25.v),

              // Tilte
              Text("探すターゲットの種類", style: theme.textTheme.headlineSmall),
              SizedBox(height: 25.v),

              // button 1
              CustomElevatedButton(
                text: "趣味",
                buttonStyle: CustomButtonStyles.fillLightGray,
                onPressed: () {
                  onTapNextButtonirstHobbyCondition(context);
                },
              ),
              SizedBox(height: mediaQueryData.size.height / 25),

              // button 2
              CustomElevatedButton(
                text: "恋人",
                buttonStyle: CustomButtonStyles.fillDarkRed,
                onPressed: () {
                  onTapNextButtonirstLoverCondition(context);
                },
              ),
              SizedBox(height: mediaQueryData.size.height / 25),

              // button 3
              CustomElevatedButton(
                text: "お相伴",
                buttonStyle: CustomButtonStyles.fillRed,
                onPressed: () {
                  onTapNextButtonirstAccompanyCondition(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapNextButtonirstHobbyCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.hobbyCondition);
  }

  onTapNextButtonirstLoverCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loverCondition);
  }

  onTapNextButtonirstAccompanyCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.accompanyCondition);
  }
}
