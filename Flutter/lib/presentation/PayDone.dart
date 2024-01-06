import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class PayDone extends StatelessWidget {
  PayDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    bool isPageNavigated = false;

    Future.delayed(
      Duration(seconds: 3),
      () {
        if (!isPageNavigated) {
          isPageNavigated = true;
          Navigator.pushNamed(context, AppRoutes.containerScreen);
        }
      },
    );

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
            SizedBox(height: mediaH / 30),

            // Title
            Text("お支払いOK", style: TextStyle(fontSize: 40, color: appTheme.black)),
          ],
        ),
      ),
    );
  }
}
