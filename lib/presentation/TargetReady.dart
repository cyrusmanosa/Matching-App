import 'package:cyrus_man_s_application1/core/app_export.dart';
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
          padding: EdgeInsets.only(
            left: 50.h,
            top: 65.v,
            right: 50.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 81.v,
                width: 95.h,
              ),
              SizedBox(height: 1.v),
              CustomImageView(
                imagePath: ImageConstant.imgSlogan,
                height: 17.v,
                width: 100.h,
              ),
              SizedBox(height: 75.v),
              Text(
                "ターゲットを準備します",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
