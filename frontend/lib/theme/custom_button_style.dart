import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButtonStyles {
// --------------------- Filled ---------------------
  static ButtonStyle get fillDarkRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.maroon,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  static ButtonStyle get fillLightgrey => ElevatedButton.styleFrom(
        backgroundColor: appTheme.grey500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  static ButtonStyle get fillDarkgrey => ElevatedButton.styleFrom(
        backgroundColor: appTheme.grey800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
  static ButtonStyle get fillPink => ElevatedButton.styleFrom(
        backgroundColor: appTheme.pinkA100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  static ButtonStyle get fillRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

  static ButtonStyle get fillScallopSeashell => ElevatedButton.styleFrom(
        backgroundColor: appTheme.scallopSeashell,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );

// --------------------- outline ---------------------

  // Google Button
  static ButtonStyle get outlineGoogleButton => OutlinedButton.styleFrom(
        backgroundColor: appTheme.white,
        side: BorderSide(color: appTheme.grey500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
      );
}
