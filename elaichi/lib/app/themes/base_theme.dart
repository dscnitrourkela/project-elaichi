// ignore_for_file: avoid_classes_with_only_static_members

import 'package:elaichi/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Base theme for the app. Custom themes can be made by using copyWith()
/// on [AppTheme.light] or [AppTheme.dark].
abstract class AppTheme {
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightOnPrimaryColor = Colors.black;

  /// Base text theme of the app
  static final TextTheme baseTextTheme = TextTheme(
    headline1: GoogleFonts.inter(
        fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.inter(
        fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.inter(
        fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.inter(
        fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.inter(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  /// Base light theme of the app.
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    textTheme: baseTextTheme,
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
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    textTheme: baseTextTheme,
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
