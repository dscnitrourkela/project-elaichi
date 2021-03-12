import 'package:elaichi/app/config/measurements.dart';
import 'package:flutter/material.dart';
import 'package:elaichi/app/extensions.dart';

/// Simple button for this project.
class Button extends StatelessWidget {
  /// Constructor
  Button(
      {@required this.text, @required this.onTapped, this.icon, this.isBusy});

  /// Icon in the starting of button
  final Widget icon;

  /// Text on the button
  final String text;

  /// Callback function when button is tapped
  final Function onTapped;

  /// To render different UI when busy
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (icon != null) {
      return FlatButton(
        shape: const RoundedRectangleBorder(
          borderRadius: Measurements.inputRadius,
          side: Measurements.enabledBorderSide,
        ),
        padding: const EdgeInsets.all(16.0),
        onPressed: isBusy ? () {} : onTapped,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const Padding(
              padding: EdgeInsets.only(left: 6.0),
            ),
            Text(
              text,
              style: context.textTheme.button,
            ),
          ],
        ),
      );
    } else {
      return FlatButton(
        shape: const RoundedRectangleBorder(
          borderRadius: Measurements.inputRadius,
          side: Measurements.enabledBorderSide,
        ),
        padding: const EdgeInsets.all(16.0),
        onPressed: isBusy ? () {} : onTapped,
        child: Text(
          text,
          style: context.textTheme.button,
        ),
      );
    }
  }
}
