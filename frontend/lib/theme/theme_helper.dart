import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

class ThemeHelper {
  Map<String, PrimaryColors> _supportedCustomColor = {'primary': PrimaryColors()};

  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: appTheme.pinkA100, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          visualDensity: VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r30),
          visualDensity: VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(thickness: 1, space: 1, color: appTheme.black),
    );
  }

  PrimaryColors themeColor() => _getThemeColors();
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        /// S: w400, M: w600, L: w800

        // Dark grey
        displaySmall: TextStyle(color: appTheme.grey800, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w400),
        displayMedium: TextStyle(color: appTheme.grey800, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w600),
        displayLarge: TextStyle(color: appTheme.grey800, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w800),
        // grey
        bodySmall: TextStyle(color: appTheme.grey500, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w400),
        // Black
        headlineSmall: TextStyle(color: appTheme.black, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(color: appTheme.black, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(color: appTheme.black, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w800),
        // Pink
        titleSmall: TextStyle(color: appTheme.pinkA100, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w400),
        titleMedium: TextStyle(color: appTheme.pinkA100, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: appTheme.pinkA100, fontFamily: 'Rounded Mplus 1c', fontWeight: FontWeight.w800),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Colors.white,
    primaryContainer: Color(0XFF909090),
    errorContainer: Color(0XFF9C3D3D),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get black => Colors.black;
  Color get white => Colors.white;

  Color get blue => Color(0XFF1877F2);
  Color get blue200 => Color.fromRGBO(144, 202, 249, 1);

  Color get green => Color.fromARGB(255, 21, 179, 0);

  Color get red => Colors.red;

  Color get test => Color.fromARGB(255, 223, 198, 87);

  // grey
  Color get profileBtngrey => Color.fromARGB(255, 238, 238, 238);
  Color get grey100 => Color.fromARGB(255, 233, 233, 233);
  Color get grey300 => Color.fromARGB(255, 184, 184, 184);
  Color get grey500 => Color(0XFFA49393);
  Color get grey800 => Color(0XFF454545);

  // Pink
  Color get maroon => Color(0XFF9C3D3D);
  Color get pinkA100 => Color(0XFFFF83A8);
  Color get pinkA400 => Color(0XFFFF00B7);

  Color get scallopSeashell => Color(0XFFDB8E6C);

  Color get bgColor => Colors.white;
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
