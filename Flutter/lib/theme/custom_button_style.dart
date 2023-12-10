import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButtonStyles {
// Filled button style
  // Dark Red BG and Shadow (onTap Color)
  static ButtonStyle get fillDarkRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.pink800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  // Gray BG , black word
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  // Pink BG and Shadow (not onTap Color)
  static ButtonStyle get fillPink => ElevatedButton.styleFrom(
        backgroundColor: appTheme.pinkA100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  // Red BG and Shadow (not onTap Color)
  static ButtonStyle get fillRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.redA700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  // Dark Blue
  static ButtonStyle get outlineDarkBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
        shadowColor: appTheme.black900.withOpacity(0.3),
      );

  // light Blue GB and Shadow
  static ButtonStyle get outlineBlueBlueBG => OutlinedButton.styleFrom(
        backgroundColor: appTheme.blueA400,
        side: BorderSide(color: appTheme.blue800, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  // while BG , gray border , Shadow
  static ButtonStyle get outlineGrayWhiteBG => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        side: BorderSide(color: appTheme.gray500, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  // Dark gray BG , gray border , Shadow
  static ButtonStyle get outlineBlackDGBG => OutlinedButton.styleFrom(
        backgroundColor: appTheme.gray800,
        side: BorderSide(color: theme.colorScheme.onErrorContainer, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  // Button
  static ButtonStyle get outlinePinkGrayBG => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: appTheme.pinkA100, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r30),
      );

  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
