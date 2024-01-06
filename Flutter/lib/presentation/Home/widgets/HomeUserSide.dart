import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainframeItemWidget extends StatelessWidget {
  const MainframeItemWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return SizedBox(
      width: mediaW / 1.2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("観賞回数：", style: CustomTextStyles.smallTitle20),
              Text("０", style: CustomTextStyles.smallTitle20),
            ],
          ),
          Container(
            height: mediaH / 1.7,
            width: mediaW / 1.2,
            decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadiusStyle.r30),
          ),
        ],
      ),
    );
  }
}
