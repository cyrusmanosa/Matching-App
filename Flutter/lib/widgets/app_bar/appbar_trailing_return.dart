import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class AppbarTrailingReturn extends StatelessWidget {
  AppbarTrailingReturn({Key? key, this.imagePath, this.margin, this.onTap}) : super(key: key);

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
