import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Base text theme for the app.
final TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w900,
  ),
  displayMedium: GoogleFonts.inter(
    fontSize: 58,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.inter(
    fontSize: 47,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: GoogleFonts.inter(
    fontSize: 33,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.inter(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),
  titleLarge: GoogleFonts.inter(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  ),
  bodyLarge: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  bodySmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  labelSmall: GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

/// Base theme for the app. Custom themes can be made by using copyWith()
/// on [AppTheme.light]
abstract class AppTheme {
  /// Base light theme of the app.
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xffe0e0e0);
          }
          return const Color(0xff333333);
        }),
      ),
    ),
    textTheme: textTheme,
    primaryColor: const Color(0xff333333),
    primaryColorLight: const Color(0xff333333),
    canvasColor: AppColors.lightScaffoldBackground,
    shadowColor: const Color(0xffe0e0e0),
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    cardColor: const Color(0xfff2f2f2),
    focusColor: const Color(0xff333333),
    splashColor: const Color(0xffbdbdbd),
    unselectedWidgetColor: const Color(0xffe0e0e0),
    disabledColor: AppColors.disabledBorderColor,
    hintColor: AppColors.grey3, checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xff333333); }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xff333333); }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xff333333); }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xff333333); }
 return null;
 }),
 ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(error: AppColors.errorBorderColor),
  );
}

TextTheme interTextTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    height: 1.21,
    color: Colors.white,
  ),
  displayMedium: GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.21,
    letterSpacing: -0.41,
    color: Colors.white,
  ),
  titleMedium: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: Colors.white,
  ),
  titleSmall: GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.21,
    color: Colors.white,
  ),
  bodyLarge: GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.41,
    height: 1.3,
    color: Colors.white,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.28,
  ),
  bodySmall: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
    color: Colors.white,
  ),
  labelSmall: GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.24,
    color: Colors.white,
  ),
);
