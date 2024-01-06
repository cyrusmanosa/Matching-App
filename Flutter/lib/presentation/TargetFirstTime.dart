import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class TargetFirstTime extends StatelessWidget {
  TargetFirstTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
        child: Column(
          children: [
            // Logo and Slogan
            SizedBox(height: mediaH / 30),
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 3.5),
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
            SizedBox(height: mediaH / 50),

            // Tilte
            Text("探すターゲットの種類", style: CustomTextStyles.smallTitle20),
            SizedBox(height: mediaH / 30),

            // button 1
            CustomElevatedButton(
              height: mediaH / 9,
              width: mediaW / 1.4,
              text: "趣味",
              buttonTextStyle: TextStyle(fontSize: mediaW / 20),
              buttonStyle: CustomButtonStyles.fillLightGray,
              onPressed: () {
                onTapNextPageirstHobbyCondition(context);
              },
            ),
            SizedBox(height: mediaH / 25),

            // button 2
            CustomElevatedButton(
              height: mediaH / 9,
              width: mediaW / 1.4,
              text: "恋人",
              buttonTextStyle: TextStyle(fontSize: mediaW / 20),
              buttonStyle: CustomButtonStyles.fillDarkRed,
              onPressed: () {
                onTapNextPageirstLoverCondition(context);
              },
            ),
            SizedBox(height: mediaH / 25),

            // button 3
            CustomElevatedButton(
              height: mediaH / 9,
              width: mediaW / 1.4,
              text: "お相伴",
              buttonTextStyle: TextStyle(fontSize: mediaW / 20),
              buttonStyle: CustomButtonStyles.fillRed,
              onPressed: () {
                onTapNextPageirstAccompanyCondition(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  onTapNextPageirstHobbyCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.hobbyCondition);
  }

  onTapNextPageirstLoverCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loverCondition);
  }

  onTapNextPageirstAccompanyCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.accompanyCondition);
  }
}
