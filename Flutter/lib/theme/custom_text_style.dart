import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(color: appTheme.black900, fontSize: 18);
  static get bodyLargePinkA100 => theme.textTheme.bodyLarge!.copyWith(color: appTheme.pinkA100, fontSize: 18);
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(color: appTheme.black900, fontSize: 13.fSize);
  static get bodyMediumgray500 => theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray500);
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onPrimary);
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary);
  // Headline text style
  static get headlineMediumBlack900 => theme.textTheme.headlineMedium!.copyWith(color: appTheme.black900);
  static get headlineMediumMontserratPinkA100 =>
      theme.textTheme.headlineMedium!.montserrat.copyWith(color: appTheme.pinkA100, fontWeight: FontWeight.w600);
  static get headlineSmallRoundedMplus1c => theme.textTheme.headlineSmall!.roundedMplus1c.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 20.fSize,
      );
  static get headlineSmallRoundedMplus1cGray500 => theme.textTheme.headlineSmall!.roundedMplus1c.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w400,
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

  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(color: appTheme.black900);
}

extension on TextStyle {
  TextStyle get roundedMplus1c {
    return copyWith(fontFamily: 'Rounded Mplus 1c');
  }

  TextStyle get montserrat {
    return copyWith(fontFamily: 'Montserrat');
  }
}
