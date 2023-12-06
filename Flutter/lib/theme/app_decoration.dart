import 'package:flutter/material.dart';
import 'package:dating_your_date/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGrayE => BoxDecoration(color: appTheme.gray500);
  static BoxDecoration get fillGray => BoxDecoration(color: appTheme.gray500);
  static BoxDecoration get fillPink => BoxDecoration(color: appTheme.pinkA100);
  static BoxDecoration get fillPrimary => BoxDecoration(color: theme.colorScheme.primary);
  static BoxDecoration get fillPurpleA => BoxDecoration(color: appTheme.pinkA400);

  // Outline decorations
  static BoxDecoration get outlineDarkBlue => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [BoxShadow(color: appTheme.black900.withOpacity(0.3), spreadRadius: 2.h, blurRadius: 2.h, offset: Offset(0, 1))],
      );

  static BoxDecoration get outlineDarkBlue900 => BoxDecoration(
        color: appTheme.gray500,
        boxShadow: [BoxShadow(color: appTheme.black900.withOpacity(0.3), spreadRadius: 2.h, blurRadius: 2.h, offset: Offset(0, 1))],
      );
  static BoxDecoration get outlineDarkBlue9001 => BoxDecoration(
        color: appTheme.pinkA100,
        boxShadow: [BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: 2.h, blurRadius: 2.h, offset: Offset(15, 0))],
      );
  static BoxDecoration get outlinePinkA => BoxDecoration(border: Border.all(color: appTheme.pinkA100, width: 1.h));
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get r30 => BorderRadius.circular(30);
  static BorderRadius get r15 => BorderRadius.circular(15);
  static BorderRadius get r10 => BorderRadius.circular(10);
  static BorderRadius get r5 => BorderRadius.circular(5);
}

double get strokeAlignInside => BorderSide.strokeAlignInside;
double get strokeAlignCenter => BorderSide.strokeAlignCenter;
double get strokeAlignOutside => BorderSide.strokeAlignOutside;
