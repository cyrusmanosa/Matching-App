import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomSideBar extends StatefulWidget {
  CustomSideBar({Key? key, this.item}) : super(key: key);
  final String? item;

  @override
  State<StatefulWidget> createState() => _CustomSideBarState();
}

class _CustomSideBarState extends State<CustomSideBar> {
  bool btn = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return InkWell(
      onTap: () {
        setState(() {
          btn = !btn;
        });
      },
      child: Container(
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
                decoration: BoxDecoration(color: btn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: mediaW / 50),
              child: Text(widget.item!, style: btn ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtonGray),
            ),
          ],
        ),
      ),
    );
  }
}
