import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class NewPasswordDone extends StatelessWidget {
  NewPasswordDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 75),
        child: Column(
          children: [
            // Logo and Slogan
            SizedBox(height: mediaH / 30),
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 3.5),
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
            SizedBox(height: mediaH / 30),

            // Title 1
            Text("新しいパスワード設定しました", style: TextStyle(fontSize: 25, color: appTheme.black)),
          ],
        ),
      ),
    );
  }
}
