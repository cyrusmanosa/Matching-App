import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class TargetFirstTime extends StatelessWidget {
  TargetFirstTime({Key? key}) : super(key: key);

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
              // Logo and Slogan
              SizedBox(height: mediaQueryData.size.height / 30),
              CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 3.5),
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3),
              SizedBox(height: mediaQueryData.size.height / 30),

              // Tilte
              Text("探すターゲットの種類", style: theme.textTheme.headlineSmall),
              SizedBox(height: mediaQueryData.size.height / 30),

              // button 1
              CustomElevatedButton(
                height: mediaQueryData.size.height / 10,
                text: "趣味",
                buttonTextStyle: TextStyle(fontSize: mediaQueryData.size.width / 20),
                buttonStyle: CustomButtonStyles.fillLightGray,
                onPressed: () {
                  onTapNextButtonirstHobbyCondition(context);
                },
              ),
              SizedBox(height: mediaQueryData.size.height / 25),

              // button 2
              CustomElevatedButton(
                height: mediaQueryData.size.height / 10,
                text: "恋人",
                buttonTextStyle: TextStyle(fontSize: mediaQueryData.size.width / 20),
                buttonStyle: CustomButtonStyles.fillDarkRed,
                onPressed: () {
                  onTapNextButtonirstLoverCondition(context);
                },
              ),
              SizedBox(height: mediaQueryData.size.height / 25),

              // button 3
              CustomElevatedButton(
                height: mediaQueryData.size.height / 10,
                text: "お相伴",
                buttonTextStyle: TextStyle(fontSize: mediaQueryData.size.width / 20),
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
