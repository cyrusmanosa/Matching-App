import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  final bool? centerTitle;
  final double? height;
  final double? leadingWidth;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Container(height: mediaQueryData.size.height / 50, width: double.maxFinite),
      leading: leading,
      leadingWidth: 60,
      title: title,
      toolbarHeight: height ?? 110.v,
    );
  }

  @override
  Size get preferredSize => Size(mediaQueryData.size.width, height ?? 100.v);
}
