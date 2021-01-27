import 'package:elaichi/app/colors.dart';
import 'package:flutter/widgets.dart';

/// Text styles used in the app.
class TextStyles {
  /// Used in appbar title and event name in club page.
  static TextStyle get title => const TextStyle(
      fontSize: 18.0,
      height: 1.21,
      fontWeight: FontWeight.w700,
      color: AppColors.titleText,
      letterSpacing: -0.02);

  /// Used in Section headers, Club name in club page,
  /// prominent button(s)(Add Event Poster).
  static TextStyle get heading1 => const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, height: 1.225);

  /// Used in Smaller section headers, TabBar, subject/event title in schedule.
  static TextStyle get heading2 => const TextStyle(
      fontSize: 14.0,
      height: 1.4,
      fontWeight: FontWeight.w600,
      color: AppColors.bodyText);

  /// Used for Bold/grey/colored text paired with body1, course code/club,
  /// time name in schedule, desgination of club members
  static TextStyle get subtitle => const TextStyle(
      fontSize: 12.0,
      color: AppColors.bodyText,
      height: 1.4,
      fontWeight: FontWeight.w600);

  /// Used for Body text w400 - long body text, student poll option,
  /// event description, prof/event contact in schedule.
  static TextStyle get body1 => const TextStyle(
      fontSize: 12.0,
      height: 1.4,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText);

  /// Variant of [body1].
  static TextStyle get body2 => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: AppColors.bodyText);

  /// Smallest font size. Used in dividers and separators.
  static TextStyle get overline => const TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: AppColors.overlineText,
      letterSpacing: -0.02);
}
