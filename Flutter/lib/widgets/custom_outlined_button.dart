import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/theme/theme_helper.dart';
import 'package:dating_your_date/widgets/base_button.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends BaseButton {
  CustomOutlinedButton({
    Key? key,
    Alignment? alignment,
    ButtonStyle? buttonStyle,
    bool? isDisabled,
    double? height,
    double? width,
    EdgeInsets? margin,
    TextStyle? buttonTextStyle,
    VoidCallback? onPressed,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle ?? theme.textTheme.titleMedium,
          height: height,
          alignment: alignment,
          width: width,
          margin: margin,
        );

  final BoxDecoration? decoration;
  final Widget? label;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: buildOutlinedButtonWidget(mediaH, mediaW))
        : buildOutlinedButtonWidget(mediaH, mediaW);
  }

  Widget buildOutlinedButtonWidget(double mediaH, double mediaW) {
    return Container(
      height: height ?? mediaH / 25,
      width: width ?? mediaW / 4,
      margin: margin,
      decoration: decoration,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox.shrink(),
            Text(text, style: buttonTextStyle ?? theme.textTheme.titleMedium),
            rightIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
