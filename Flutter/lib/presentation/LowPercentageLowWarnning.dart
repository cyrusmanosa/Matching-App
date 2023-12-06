import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LowPercentageLowWarnning extends StatelessWidget {
  const LowPercentageLowWarnning({Key? key}) : super(key: key);

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
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                width: 110,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: 150, alignment: Alignment.center),

              SizedBox(height: 75.v),

              // Msg
              SizedBox(
                width: 350.h,
                child: Text(
                  "条件で合わせるパーセントは最高30％しかありませんので\nまだ続けませんか？",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineMediumBlack900,
                ),
              ),
              SizedBox(height: 30.v),

              // Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 1
                    CustomOutlinedButton(width: 100, height: 40, text: "続ける", buttonTextStyle: theme.textTheme.titleLarge),

                    // 2
                    CustomOutlinedButton(
                      margin: EdgeInsets.only(left: 15.h),
                      width: 100,
                      height: 40,
                      text: "編集",
                      buttonTextStyle: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
