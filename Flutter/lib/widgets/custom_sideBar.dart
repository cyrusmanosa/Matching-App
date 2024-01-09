import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSideBar extends StatelessWidget {
  CustomSideBar({Key? key, this.item, this.btn}) : super(key: key);

  final String? item;
  final bool? btn;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Container(
      width: mediaW / 2.5,
      height: mediaH / 20,
      decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: mediaW / 20),
            child: Container(
              height: mediaH / 45,
              width: mediaW / 20,
              decoration: BoxDecoration(color: btn! ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: mediaW / 50),
            child: Text(item!, style: btn! ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtonGray),
          ),
        ],
      ),
    );
  }
}
