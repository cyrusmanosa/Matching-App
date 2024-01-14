import 'dart:io';

import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/widgets/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key, this.canData, this.fixData, this.img});

  final Fix? fixData;
  final File? img;
  final CanChange? canData;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "", true),
      backgroundColor: appTheme.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: appTheme.gray800.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))],
            ),
            child: CircleAvatar(radius: 80, backgroundImage: FileImage(widget.img!)),
          ),
          SizedBox(height: mediaH / 50),

          // name
          Text(
            widget.canData!.nickName + ',' + widget.fixData!.firstName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          // ago
          Text(widget.fixData!.age.toString() + ' age', style: TextStyle(fontSize: 18, color: appTheme.black)),
          SizedBox(height: mediaH / 50),

          // info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 30, vertical: mediaH / 100),
              decoration: BoxDecoration(color: appTheme.gray100, borderRadius: BorderRadiusStyle.r10),
              child: Text(
                widget.canData!.introduce,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
          ),
          SizedBox(height: mediaH / 30),

          // btn
          _buildNextButton(context),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "喋りましょう",
      onPressed: () {},
    );
  }
}
