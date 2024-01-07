import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class NewPasswordDone extends StatelessWidget {
  NewPasswordDone({Key? key}) : super(key: key);

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
          Navigator.pushNamed(context, AppRoutes.login);
        }
      },
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
        child: Column(
          children: [
            // Logo and Slogan
            SizedBox(height: mediaH / 15),
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 3.5),
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
            SizedBox(height: mediaH / 15),

            // Title 1
            Text("新しいパスワード設定しました", style: TextStyle(fontSize: 32, color: appTheme.black), textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
