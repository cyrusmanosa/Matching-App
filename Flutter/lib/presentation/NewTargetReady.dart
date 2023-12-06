import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewTargetReady extends StatelessWidget {
  const NewTargetReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 75.v),
          child: Column(
            children: [
              // Logn
              CustomImageView(imagePath: ImageConstant.imgLogo, width: 130),
              SizedBox(height: 2.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: 170),
              SizedBox(height: 75.v),

              // Title
              Text("新しいターゲットを準備します", style: TextStyle(fontSize: 25, color: appTheme.black900)),
            ],
          ),
        ),
      ),
    );
  }
}
