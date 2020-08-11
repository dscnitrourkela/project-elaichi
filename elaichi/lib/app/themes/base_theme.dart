// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

/// The base theme for the app. All other themes extend from [BaseTheme]
abstract class BaseTheme {
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightOnPrimaryColor = Colors.black;

  /// Base light theme of the app.
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: _lightPrimaryColor,
        iconTheme: IconThemeData(color: _lightOnPrimaryColor)),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryColor,
      secondary: _lightOnPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );

  /// Base dark theme of the app.
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    appBarTheme: const AppBarTheme(
      color: Colors.black87,
      iconTheme: IconThemeData(color: _lightPrimaryColor),
    ),
    colorScheme: const ColorScheme.dark(
        primary: _lightOnPrimaryColor,
        primaryVariant: _lightOnPrimaryColor,
        secondary: _lightPrimaryColor,
        onPrimary: _lightPrimaryColor),
    // iconTheme: IconThemeData(color: _iconColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  );
}
