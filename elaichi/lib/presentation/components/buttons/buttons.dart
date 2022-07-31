import 'package:elaichi/presentation/core/utils/measurements.dart';
import 'package:flutter/material.dart';

/// Simple button for this project.
class Button extends StatelessWidget {
  /// Constructor
  const Button({
    required this.text,
    required this.onTapped,
    this.icon,
    Key? key,
  }) : super(key: key);

  /// Icon in the starting of button
  final Widget? icon;

  /// Text on the button
  final String text;

  /// Callback function when button is tapped
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: Measurements.inputRadius,
            side: Measurements.enabledBorderSide,
          ),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: onTapped as void Function(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const Padding(
              padding: EdgeInsets.only(left: 6),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.button,
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
          padding: const EdgeInsets.all(16),
        ),
        onPressed: onTapped as void Function(),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      );
    }
  }
}
