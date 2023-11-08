import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

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
      elevation: 0,
      toolbarHeight: height ?? 110.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 110.v,
      );

  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 81,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray500,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill,
}
