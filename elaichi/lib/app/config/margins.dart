import 'package:elaichi/app/config/display.dart';

/// Defines the margins used in the app.
class Margins {
  /// Constructors for [Margins].
  Margins(this.display);
  
  /// Holds an instance of [Display].
  final Display display;

  /// Getter for small margins.
  double get small {
    switch (display.size) {
      case DisplaySize.xsmall:
        return 8.0;
      case DisplaySize.small:
        return 8.0;
      default:
        return 0.0;
    }
  }
}
