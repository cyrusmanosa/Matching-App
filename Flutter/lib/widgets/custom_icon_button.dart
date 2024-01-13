import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.decoration,
    this.height,
    this.onTap,
    this.padding,
    this.width,
  }) : super(key: key);

  final Alignment? alignment;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null ? Align(alignment: alignment ?? Alignment.center, child: iconButtonWidget) : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height,
        width: width,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height,
            width: width,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.white,
                  borderRadius: BorderRadiusStyle.r5,
                  boxShadow: [BoxShadow(color: appTheme.black.withOpacity(0.3), spreadRadius: 2, blurRadius: 2, offset: Offset(0, 1))],
                ),
          ),
          onPressed: onTap,
        ),
      );
}
