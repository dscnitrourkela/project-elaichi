import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/measurements.dart';
import 'package:flutter/material.dart';

/// Simple button for this project.
class TransparentButton extends StatelessWidget {
  /// Constructor
  const TransparentButton({
    this.textStyle,
    this.color,
    required this.text,
    required this.onTapped,
    this.icon,
    Key? key,
  }) : super(key: key);

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
          side: BorderSide(
            color: AppColors.buttonBorderColor,
          ),
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
              padding: EdgeInsets.only(left: 10),
            ),
          Text(
            text,
            style: textStyle ??
                Theme.of(context).textTheme.button!.copyWith(
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
          ),
        ],
      ),
    );
  }
}
