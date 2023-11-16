import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTrailingSideBar extends StatelessWidget {
  AppbarTrailingSideBar({Key? key, this.imagePath, this.margin, this.onTap}) : super(key: key);

  EdgeInsetsGeometry? margin;
  Function? onTap;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(imagePath: imagePath, height: 25.v, width: 35.h, fit: BoxFit.contain),
      ),
    );
  }
}
