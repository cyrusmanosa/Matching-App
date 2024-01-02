import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class PayDone extends StatelessWidget {
  PayDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

              // Title
              Text("お支払いOK", style: TextStyle(fontSize: 40, color: appTheme.black)),
            ],
          ),
        ),
      ),
    );
  }
}
