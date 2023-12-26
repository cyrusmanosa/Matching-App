import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButtonStyles {
// --------------------- Filled ---------------------
  static ButtonStyle get fillDarkRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.pink800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  static ButtonStyle get fillLightGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  static ButtonStyle get fillDarkGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  static ButtonStyle get fillPink => ElevatedButton.styleFrom(
        backgroundColor: appTheme.pinkA100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  static ButtonStyle get fillRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.redA700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueA400,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

// --------------------- outline ---------------------

  // while BG , gray border , Shadow
  static ButtonStyle get outlineGrayWhiteBG => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        side: BorderSide(color: appTheme.gray500, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  // Button
  static ButtonStyle get outlinePinkGrayBG => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: appTheme.pinkA100, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r30),
      );
}
