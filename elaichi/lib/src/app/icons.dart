import 'package:flutter/widgets.dart';

/// Contains all custom icons used in the app.
class AppIcons {
  AppIcons._();

  static const _kAvenueFont = 'Avenue';

  /// Monday Morning icon.
  static const IconData mmIcon = IconData(0xe500, fontFamily: _kAvenueFont);

  /// Feed icon for BottomNavigationBar.
  static const IconData feed = IconData(0xe902, fontFamily: _kAvenueFont);

  /// Explore icon for BottomNavigationBar.
  static const IconData explore = IconData(0xe901, fontFamily: _kAvenueFont);

  /// Campus icon for BottomNavigationBar.
  static const IconData campus = IconData(0xe900, fontFamily: _kAvenueFont);
}
