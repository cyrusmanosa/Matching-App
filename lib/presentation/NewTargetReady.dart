import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class newTargetReady extends StatelessWidget {
  const newTargetReady({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 65.v),
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
              SizedBox(height: 74.v),
              SizedBox(
                width: 267.h,
                child: Text(
                  "新しいターゲットを\n準備します",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
