import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSideBar extends StatelessWidget {
  CustomSideBar({Key? key, this.item, this.backendPart}) : super(key: key);

  final String? item;
  final Widget? backendPart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: AppDecoration.fillOnPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Container(
              height: 25.adaptSize,
              width: 25.adaptSize,
              decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(item!, style: CustomTextStyles.headlineSmallRoundedMplus1cGray500),
          ),
        ],
      ),
    );
  }
}
