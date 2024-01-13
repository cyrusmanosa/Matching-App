import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

class LowPercentageHeightWarnning extends StatelessWidget {
  const LowPercentageHeightWarnning({Key? key}) : super(key: key);

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
            // logo
            CustomImageView(
              imagePath: ImageConstant.imgLogo,
              width: mediaW / 4,
              alignment: Alignment.center,
            ),
            SizedBox(height: 1),

            // Slogan
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: 150, alignment: Alignment.center),

            SizedBox(height: 75),

            SizedBox(
              width: 350,
              child: Text(
                "新しい条件で合わせるパーセントは最高30％しかありませんので\nまだ続けませんか？",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: mediaH / 25),

            // button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomOutlinedButton(
                    width: 100,
                    height: 40,
                    text: "続ける",
                    buttonTextStyle: theme.textTheme.titleMedium,
                  ),
                  CustomOutlinedButton(
                    margin: EdgeInsets.only(left: 15),
                    width: 100,
                    height: 40,
                    text: "編集",
                    buttonTextStyle: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
