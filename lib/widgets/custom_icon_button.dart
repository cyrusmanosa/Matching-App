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
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadiusStyle.r5,
                  boxShadow: [
                    BoxShadow(color: appTheme.black900.withOpacity(0.3), spreadRadius: 2.h, blurRadius: 2.h, offset: Offset(0, 1)),
                  ],
                ),
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineDarkBlueTL5 => BoxDecoration(
        color: appTheme.gray500,
        borderRadius: BorderRadiusStyle.r5,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.3),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 1),
          ),
        ],
      );
}
