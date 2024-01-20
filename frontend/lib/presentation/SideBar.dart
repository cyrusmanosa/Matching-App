import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_sideBar.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  SideBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        decoration: BoxDecoration(color: appTheme.pinkA100, borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // add date
            Text("2023-11-01から", style: TextStyle(color: appTheme.grey800)),
            SizedBox(height: mediaH / 300),

            _buildCheckPointRow(context, mediaH, mediaW),

            // 写真解放
            CustomSideBar(item: "写真解放"),
            SizedBox(height: mediaH / 25),

            // 連絡解放
            CustomSideBar(item: "連絡解放"),
            SizedBox(height: mediaH / 25),

            // 位置共有
            CustomSideBar(item: "位置共有"),
            SizedBox(height: mediaH / 25),

            // デート解放
            CustomSideBar(item: "デート解放"),
            SizedBox(height: mediaH / 25),

            // SNS共有
            CustomSideBar(item: "SNS共有"),
            SizedBox(height: mediaH / 25),
          ],
        ),
      ),
    );
  }

  /// item Title
  Widget _buildCheckPointRow(BuildContext context, double mediaH, double mediaW) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaH / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Link 1
          Padding(
            padding: EdgeInsets.only(top: mediaH / 65, bottom: mediaH / 65, right: mediaW / 30),
            child: SizedBox(width: mediaW / 10, child: Divider()),
          ),
          // title
          Text("チェックポイント", style: CustomTextStyles.msgWordOfMsgBox),
          // Link 2
          Padding(
            padding: EdgeInsets.only(top: mediaH / 65, bottom: mediaH / 65, left: mediaW / 30),
            child: SizedBox(width: mediaW / 10, child: Divider()),
          ),
        ],
      ),
    );
  }
}
