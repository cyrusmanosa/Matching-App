import 'package:flutter/material.dart';
import 'package:dating_your_date/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillgrey => BoxDecoration(color: appTheme.grey500);
  static BoxDecoration get fillPink => BoxDecoration(color: appTheme.pinkA100);
  static BoxDecoration get fillPrimary => BoxDecoration(color: appTheme.white);
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get r30 => BorderRadius.circular(30);
  static BorderRadius get r15 => BorderRadius.circular(15);
}
