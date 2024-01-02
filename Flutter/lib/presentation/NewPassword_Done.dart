import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class NewPasswordDone extends StatelessWidget {
  NewPasswordDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 75.v),
          child: Column(
            children: [
              // Logo and Slogan
              SizedBox(height: mediaQueryData.size.height / 30),
              CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 3.5),
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3),
              SizedBox(height: mediaQueryData.size.height / 30),

              // Title 1
              Text("新しいパスワード設定しました", style: TextStyle(fontSize: 25, color: appTheme.black)),
            ],
          ),
        ),
      ),
    );
  }
}
