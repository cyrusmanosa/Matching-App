import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static get msgWordOfMsgBox => theme.textTheme.bodyMedium!.copyWith(color: appTheme.black, fontSize: 16);
  static get wordOnlySmallButton => theme.textTheme.bodyMedium!.copyWith(color: appTheme.black, fontSize: 12);
  static get titleOfUnderLogo => theme.textTheme.headlineMedium!.copyWith(color: appTheme.black, fontSize: 12);

  // Body text style
  static get bodyMediumblack => theme.textTheme.bodyMedium!.copyWith(color: appTheme.black, fontSize: 18);
  static get bodyMediumPinkA100 => theme.textTheme.bodyMedium!.copyWith(color: appTheme.pinkA100, fontSize: 18);

  // Color Only
  static get bodyMediumgray500 => theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray500);
  static get bodyMediumgray800 => theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray800);
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onPrimary);
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary);

  // Headline text style
  static get headlineMediumblack => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black,
      );

  static get headlineMediumMontserratPinkA100 => theme.textTheme.headlineMedium!.montserrat.copyWith(
        color: appTheme.pinkA100,
        fontWeight: FontWeight.w600,
      );

  static get headlineMediumRoundedMplus1cGray500 => theme.textTheme.headlineMedium!.roundedMplus1c.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w400,
      );

  static get headlineMediumRoundedMplus1c => theme.textTheme.headlineMedium!.roundedMplus1c.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 20.fSize,
      );

  // Rounded text style
  static get roundedMplus1cCyan600 => TextStyle(
        color: appTheme.cyan600,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).roundedMplus1c;

  static get roundedMplus1cPrimary => TextStyle(
        color: theme.colorScheme.primary,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).roundedMplus1c;
}

extension on TextStyle {
  TextStyle get roundedMplus1c {
    return copyWith(fontFamily: 'Rounded Mplus 1c');
  }

  TextStyle get montserrat {
    return copyWith(fontFamily: 'Montserrat');
  }
}
