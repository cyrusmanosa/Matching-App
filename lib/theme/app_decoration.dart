import 'package:flutter/material.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGrayE => BoxDecoration(
        color: appTheme.gray500,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray500,
      );
  static BoxDecoration get fillPinkA => BoxDecoration(
        color: appTheme.pinkA100,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPurpleA => BoxDecoration(
        color: appTheme.pinkA400,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.3),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 1),
          ),
        ],
      );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.gray500,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.3),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 1),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: appTheme.pinkA100,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(15, 0),
          ),
        ],
      );
  static BoxDecoration get outlinePinkA => BoxDecoration(
        border: Border.all(
          color: appTheme.pinkA100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePinkA100 => BoxDecoration(
        border: Border.all(
          color: appTheme.pinkA100,
          width: 2.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder30 => BorderRadius.circular(30.h);
  static BorderRadius get roundedBorder15 => BorderRadius.circular(15.h);
  static BorderRadius get roundedBorder5 => BorderRadius.circular(5.h);
}

double get strokeAlignInside => BorderSide.strokeAlignInside;
double get strokeAlignCenter => BorderSide.strokeAlignCenter;
double get strokeAlignOutside => BorderSide.strokeAlignOutside;
