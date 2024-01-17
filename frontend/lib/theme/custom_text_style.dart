import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomTextStyles {
  // title
  static get showDataTitle => theme.textTheme.titleSmall!.copyWith(fontSize: 18);
  static get dataTitleWord => theme.textTheme.titleSmall!.copyWith(fontSize: 16);
  static get inputTitlePink => theme.textTheme.titleMedium!.copyWith(fontSize: 18);

  // head
  static get smallTitle20 => theme.textTheme.headlineSmall!.copyWith(fontSize: 20);
  static get dataWord => theme.textTheme.headlineSmall!.copyWith(fontSize: 18);
  static get msgWordOfMsgBox => theme.textTheme.headlineSmall!.copyWith(fontSize: 16);
  static get titleOfUnderLogo => theme.textTheme.headlineSmall!.copyWith(fontSize: 13);
  static get wordOnlySmallButton => theme.textTheme.headlineSmall!.copyWith(fontSize: 11);
  static get profileData => theme.textTheme.headlineMedium!.copyWith(fontSize: 18);
  static get chatBoxUserName => theme.textTheme.headlineMedium!.copyWith(fontSize: 16);

  // body
  static get pwRulegrey500 => theme.textTheme.bodySmall!.copyWith(fontSize: 12);

  static get infoTitle => theme.textTheme.headlineLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static get sideBarTitle => TextStyle(color: appTheme.black, fontSize: 16, fontWeight: FontWeight.w900);
  static get sideBarButtongrey => TextStyle(color: appTheme.grey500, fontSize: 20, fontWeight: FontWeight.w400);
  static get sideBarButtonGreen => TextStyle(color: appTheme.green, fontSize: 20, fontWeight: FontWeight.w400);
  static get confirmgrey => TextStyle(color: appTheme.grey500, fontSize: 12, fontWeight: FontWeight.w800);
  static get confirmGreen => TextStyle(color: appTheme.green, fontSize: 12, fontWeight: FontWeight.w800);
  static get mainButtonC => TextStyle(color: appTheme.black, fontSize: 12, fontWeight: FontWeight.w800);
  static get mainButtonW => TextStyle(color: appTheme.white, fontSize: 12, fontWeight: FontWeight.w800);
  static get outlineWhiteWordButton => TextStyle(color: appTheme.white, fontWeight: FontWeight.w400);
}
