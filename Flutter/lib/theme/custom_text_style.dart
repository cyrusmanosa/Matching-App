import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // title
  static get showDataTitle => theme.textTheme.titleSmall!.copyWith(fontSize: 18);
  static get inputTitlePink => theme.textTheme.titleMedium!.copyWith(fontSize: 16);

  // head
  static get smallTitle20 => theme.textTheme.headlineSmall!.copyWith(fontSize: 20);
  static get msgWordOfMsgBox => theme.textTheme.headlineSmall!.copyWith(fontSize: 16);
  static get titleOfUnderLogo => theme.textTheme.headlineSmall!.copyWith(fontSize: 13);
  static get wordOnlySmallButton => theme.textTheme.headlineSmall!.copyWith(fontSize: 11);

  // body
  static get pwRuleGray500 => theme.textTheme.bodySmall!.copyWith(fontSize: 12);

  // Special
  static get outlineWhiteWordButton => TextStyle(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.w400);
  static get confirmGreen => TextStyle(color: appTheme.green, fontSize: 12, fontWeight: FontWeight.w800);
  static get mainButtonC => TextStyle(color: appTheme.cyan600, fontSize: 12, fontWeight: FontWeight.w800);
  static get mainButtonW => TextStyle(color: appTheme.white, fontSize: 12, fontWeight: FontWeight.w800);
}
