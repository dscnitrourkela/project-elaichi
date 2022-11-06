import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Base text theme for the app.
final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w900,
  ),
  headline2: GoogleFonts.inter(
    fontSize: 58,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.inter(
    fontSize: 47,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.inter(
    fontSize: 33,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.inter(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.inter(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  ),
  bodyText1: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.inter(
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
    primarySwatch: Colors.blueGrey,
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
    hintColor: AppColors.grey3,
    errorColor: AppColors.errorBorderColor,
    toggleableActiveColor: const Color(0xff333333),
  );
}

TextTheme interTextTheme = TextTheme(
  headline1: GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    height: 1.21,
    color: Colors.white,
  ),
  headline2: GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.21,
    letterSpacing: -0.41,
    color: Colors.white,
  ),
  subtitle1: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: Colors.white,
  ),
  subtitle2: GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.21,
    color: Colors.white,
  ),
  bodyText1: GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.41,
    height: 1.3,
    color: Colors.white,
  ),
  caption: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
    color: Colors.white,
  ),
  overline: GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.24,
    color: Colors.white,
  ),
);
