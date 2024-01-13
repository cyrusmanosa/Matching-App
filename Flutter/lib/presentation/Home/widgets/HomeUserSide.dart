import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainframeItemWidget extends StatelessWidget {
  MainframeItemWidget({Key? key, this.mediaH, this.mediaW}) : super(key: key);

  final double? mediaH;
  final double? mediaW;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaW! / 1.2,
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
            height: 600,
            width: mediaW! / 1.2,
            decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadiusStyle.r30),
          ),
        ],
      ),
    );
  }
}
