import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Base text theme for the app.
final TextTheme textTheme = TextTheme(
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
