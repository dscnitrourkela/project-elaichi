import 'package:elaichi/core.dart';
import 'package:flutter/material.dart';

/// Simple button for this project.
class Button extends StatelessWidget {
  /// Constructor
  const Button(
      {required this.text,
      required this.onTapped,
      this.icon,
      this.isBusy,
      Key? key})
      : super(key: key);

  /// Icon in the starting of button
  final Widget? icon;

  /// Text on the button
  final String text;

  /// Callback function when button is tapped
  final Function onTapped;

  /// To render different UI when busy
  final bool? isBusy;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: Measurements.inputRadius,
            side: Measurements.enabledBorderSide,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        onPressed: isBusy! ? () {} : onTapped as void Function()?,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
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
      return TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: Measurements.inputRadius,
            side: Measurements.enabledBorderSide,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        onPressed: isBusy! ? () {} : onTapped as void Function()?,
        child: Text(
          text,
          style: context.textTheme.button,
        ),
      );
    }
  }
}
