import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ScrollingText extends StatelessWidget {
  const ScrollingText({
    super.key,
    required this.text,
    required this.style,
    required this.condition,
  });

  final String text;
  final TextStyle style;
  final int condition;

  @override
  Widget build(BuildContext context) {
    if (text.length > condition) {
      return SizedBox(
          height: style.height,
          child: Marquee(
            text: text,
            style: style,
            pauseAfterRound: const Duration(seconds: 1),
            blankSpace: 90,
          ),);
    } else {
      return Text(text, style: style);
    }
  }
}
