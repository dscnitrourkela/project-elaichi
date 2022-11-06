import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:flutter/material.dart';

class DurationDates extends StatelessWidget {
  const DurationDates({
    Key? key,
    required this.text,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final MainAxisAlignment mainAxisAlignment;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.calendar_month,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: interTextTheme.caption!
              .copyWith(color: Colors.white, fontSize: fontSize),
        ),
      ],
    );
  }
}
