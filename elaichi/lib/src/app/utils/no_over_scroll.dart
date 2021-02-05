import 'package:flutter/widgets.dart';

/// Use this as the [ScrollBehavior] to remove the over scroll indicator shown
/// at the edges of scrolling widgets.
class NoOverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
