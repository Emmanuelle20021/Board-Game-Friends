import 'package:flutter/material.dart';

class Constants {
  static const String kAppName = 'Board Game Friends';
  static const String kAppVersion = '1.0.0';
  static const Color _primary = Color.fromARGB(255, 247, 128, 0);
  static const Color _primaryLight = Color.fromARGB(255, 255, 176, 66);
  static const Color _secondary = Color.fromARGB(255, 255, 246, 242);
  static const Color _onSecondary = Color.fromARGB(255, 0, 7, 34);
  static const Color _error = Color.fromARGB(255, 189, 79, 0);
  static const Color _bodyTextColor = Color.fromARGB(255, 53, 89, 117);
  static const Color _accent = Color.fromARGB(255, 0, 47, 73);
  static const String kLogoBGFHorizontal = 'svg/logo_bgf_horizontal.svg';

  static final kThemeData = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _primary,
      onPrimary: _secondary,
      secondary: _secondary,
      onSecondary: _onSecondary,
      error: _error,
      onError: _secondary,
      surface: _secondary,
      onSurface: _primary,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        color: _bodyTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: _bodyTextColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: _bodyTextColor,
      ),
      displayLarge: TextStyle(
        fontSize: 40,
        color: _bodyTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        color: _bodyTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        color: _bodyTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        color: _accent,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: _accent,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: _accent,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        color: _bodyTextColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        color: _bodyTextColor,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: _bodyTextColor,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: _accent,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: _accent,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: _accent,
      ),
    ),
    disabledColor: _bodyTextColor.withOpacity(.6),
    focusColor: _primary.withOpacity(.8),
    hintColor: _bodyTextColor.withOpacity(.6),
    indicatorColor: _primary,
    primaryColor: _primary,
    primaryColorLight: _primaryLight,
    scaffoldBackgroundColor: _secondary,
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
      buttonColor: _primary,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: _primary,
        onPrimary: _secondary,
        secondary: _secondary,
        onSecondary: _onSecondary,
        error: _error,
        onError: _secondary,
        surface: _secondary,
        onSurface: _primary,
      ),
      disabledColor: _bodyTextColor.withOpacity(.6),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: _onSecondary,
      backgroundColor: Colors.transparent,
    ),
  );
}
