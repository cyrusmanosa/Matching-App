import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class LowPercentageHeightWarnning extends StatelessWidget {
  const LowPercentageHeightWarnning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 20.h,
            top: 65.v,
            right: 20.h,
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
              SizedBox(height: 74.v),
              SizedBox(
                width: 390.h,
                child: Text(
                  "新しい条件で合わせるパーセントは最高30％しかありませんので\nまだ続けませんか？",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineMediumBlack900_1,
                ),
              ),
              SizedBox(height: 53.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 37.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomOutlinedButton(
                      width: 150.h,
                      text: "続ける",
                      buttonStyle: CustomButtonStyles.outlinePinkATL30,
                    ),
                    CustomOutlinedButton(
                      width: 150.h,
                      text: "編集",
                      margin: EdgeInsets.only(left: 16.h),
                      buttonStyle: CustomButtonStyles.outlinePinkATL30,
                    ),
                  ],
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
