import 'dart:async';

import 'package:elaichi/app/logger.dart';
import 'package:elaichi/app/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Manages switching between dark and light modes.
///Example:
///```dart
/// final ThemeManager _themeManager = locator<ThemeManager>();
/// ...
/// // Toggles between light and dark themes.
/// _themeManager.changeTheme();
/// ...
///```
@singleton
class ThemeManager {
  /// [Logger] for [ThemeManager]
  final Logger log = getLogger("ThemeManager");
  StreamController<ThemeData> _themeController = StreamController<ThemeData>();

  /// Returns a stream of type [ThemeData] to be used as the value for app's
  /// theme.
  Stream<ThemeData> get theme => _themeController.stream;

  bool _isCurrentThemeDark = true;

  /// Returns bool value to control global app theme.
  bool get isCurrentThemeDark => _isCurrentThemeDark;

  /// Switches between light and dark themes.
  Future changeTheme() async {
    log.i("Changed to dark theme - ${!_isCurrentThemeDark}");
    _themeController
        .add(_isCurrentThemeDark ? BaseTheme.light : BaseTheme.dark);
    _isCurrentThemeDark = !_isCurrentThemeDark;
  }
}
