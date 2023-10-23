import 'package:elaichi/presentation/core/utils/measurements.dart';
import 'package:flutter/material.dart';

/// Simple button for this project.
class CustomButton extends StatelessWidget {
  /// Constructor
  const CustomButton({
    this.textStyle,
    this.color,
    required this.text,
    required this.onTapped,
    this.icon,
    super.key,
  });

  /// Icon at the starting of button
  final Widget? icon;

  /// Text on the button
  final String text;

  final Color? color;

  final TextStyle? textStyle;

  /// Callback function when button is tapped
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: Measurements.inputRadius,
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onTapped as void Function(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            const Padding(
              padding: EdgeInsets.only(left: 6),
            ),
          Text(
            text,
            style: textStyle ??
                Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
          ),
        ],
      ),
    );
  }
}
