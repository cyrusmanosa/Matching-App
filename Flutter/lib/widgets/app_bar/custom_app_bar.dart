import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
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
  final Style? styleType;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: _getStyle(),
      leading: leading,
      leadingWidth: 60,
      title: title,
      toolbarHeight: height ?? 110.v,
    );
  }

  @override
  Size get preferredSize => Size(mediaQueryData.size.width, height ?? 100.v);

  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(height: 100, width: double.maxFinite, decoration: BoxDecoration(color: appTheme.gray500));
      default:
        return null;
    }
  }
}

enum Style { bgFill }
