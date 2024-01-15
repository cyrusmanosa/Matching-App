import 'dart:io';

import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/presentation/Home/widgets/HomeUserSide.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/core/app_export.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key? key, this.allTargetImage, this.allTargetId, this.allTargetFix, this.allTargetCanChange}) : super(key: key);

  List<int>? allTargetId;
  List<File>? allTargetImage;
  List<Fix>? allTargetFix;
  List<CanChange>? allTargetCanChange;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "ホーム", false),
      backgroundColor: appTheme.bgColor,
      body: SizedBox(
        height: mediaH / 1.35,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: mediaW / 20),
          itemCount: 3,
          itemBuilder: (context, index) {
            return MainframeItemWidget(
              mediaH: mediaH,
              mediaW: mediaW,
              img: widget.allTargetImage,
              fix: widget.allTargetFix![index],
              canChange: widget.allTargetCanChange![index],
            );
          },
        ),
      ),
    );
  }

  void onTapCanChange(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
  }
}
