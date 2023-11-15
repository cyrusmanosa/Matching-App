import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class PayDone extends StatelessWidget {
  const PayDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // auto move
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.containerScreen);
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
          child: Column(
            children: [
              // Logn
              CustomImageView(imagePath: ImageConstant.imgLogo, width: 130),
              SizedBox(height: 2.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: 170),
              SizedBox(height: 75.v),

              // Title
              Text("お支払いOK", style: TextStyle(fontSize: 40, color: appTheme.black900)),
            ],
          ),
        ),
      ),
    );
  }
}
