import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainframeItemWidget extends StatelessWidget {
  const MainframeItemWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          // 観賞回数
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("観賞回数：", style: CustomTextStyles.bodyLargeBlack900),
              Text("０", style: CustomTextStyles.bodyLargeBlack900),
            ],
          ),
          Container(
            height: 570,
            width: 350,
            decoration: BoxDecoration(
              color: appTheme.gray500,
              borderRadius: BorderRadiusStyle.r30,
            ),
          ),
        ],
      ),
    );
  }
}
