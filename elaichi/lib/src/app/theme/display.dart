import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Defines display sizes supported by the app.
enum DisplaySize {
  /// 0 - 599
  xsmall,

  /// 600 - 1023
  small,
}

/// Extensions for getting correct paremeters based on `DisplaySize`.
extension SizeDisplaySize on Size {
  /// Returns correct `DisplaySize` based on width.
  DisplaySize toDisplaySize() {
    if (width < 599) {
      return DisplaySize.xsmall;
    } else {
      return DisplaySize.small;
    }
  }
}

/// Class to hold display size data.
class Display {
  /// Constructor for `Display`.
  Display({this.size});
  
  /// Holds the value of the display size.
  final DisplaySize size;


}

/// Extension method to get `Display` instance from `MediaQueryData`.
extension MediaQueryDataDisplay on MediaQueryData {
  /// Returns an instance of `Display` when called on `MediaQueryData`.
  Display get display => Display(
        size: size.toDisplaySize(),
      );
}

/// Extension method to get `Display` instance by using `MediaQueryDataDisplay`
/// on `BuildContext`.
extension BuildContextDisplay on BuildContext {
  /// Returns an instance of `Display` when called on `BuildContext`.
  Display get display => MediaQuery.of(this).display;
}
