import 'package:flutter/material.dart';

/// Extensions on [BuildContext] for the app.
extension ContextTheme on BuildContext {
  /// Returns [Theme.of(context)], use it by calling context.theme.
  ThemeData get theme => Theme.of(this);

  /// Returns same as [Theme.of(context).textTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;
}
