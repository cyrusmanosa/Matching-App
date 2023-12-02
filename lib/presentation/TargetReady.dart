import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class TargetReady extends StatelessWidget {
  const TargetReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
          child: Column(
            children: [
              // logo
              CustomImageView(imagePath: ImageConstant.imgLogo, width: 110, alignment: Alignment.center),
              SizedBox(height: 1.v),

              CustomImageView(imagePath: ImageConstant.imgSlogan, width: 150, alignment: Alignment.center),
              SizedBox(height: 75.v),

              Text("ターゲットを準備します", style: theme.textTheme.headlineLarge),
              SizedBox(height: 15.v),
            ],
          ),
        ),
      ),
    );
  }
}
