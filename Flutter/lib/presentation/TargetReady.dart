import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class TargetReady extends StatelessWidget {
  const TargetReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
        child: Column(
          children: [
            // logo
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 4, alignment: Alignment.center),
            SizedBox(height: 1),

            CustomImageView(imagePath: ImageConstant.imgSlogan, width: 150, alignment: Alignment.center),
            SizedBox(height: 75),

            Text("ターゲットを準備します", style: theme.textTheme.headlineMedium),
            SizedBox(height: mediaQueryData.size.height / 50),
          ],
        ),
      ),
    );
  }
}
