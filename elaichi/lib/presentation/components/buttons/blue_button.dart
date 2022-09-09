import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/measurements.dart';
import 'package:flutter/material.dart';

/// Simple button for this project.
class BlueButton extends StatelessWidget {
  /// Constructor
  const BlueButton({
    this.textStyle,
    this.color,
    required this.text,
    required this.onTapped,
    this.leadingIcon,
    this.trailingIcon,
    Key? key,
  }) : super(key: key);

  /// Icon at the starting of button
  final Widget? leadingIcon, trailingIcon;

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
        backgroundColor: AppColors.lightBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: Measurements.inputRadius,
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onTapped as void Function(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) leadingIcon!,
          if (leadingIcon != null)
            const Padding(
              padding: EdgeInsets.only(left: 6),
            ),
          Text(
            text,
            style: Theme.of(context).textTheme.button!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  color: Colors.white,
                ),
          ),
          if (trailingIcon != null)
            const Padding(
              padding: EdgeInsets.only(left: 6),
            ),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
