import 'dart:ui';

import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:flutter/material.dart';

class DurationDates extends StatelessWidget {
  const DurationDates({
    Key? key,
    required this.text,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.fontSize,
    this.style,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  final MainAxisAlignment mainAxisAlignment;
  final double? fontSize;
  final Color? color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          Icons.calendar_month,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: style ??
              interTextTheme.caption!.copyWith(
                color: color,
                fontSize: fontSize,
              ),
        ),
      ],
    );
  }
}
