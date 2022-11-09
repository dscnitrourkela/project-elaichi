import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ScrollingText extends StatelessWidget {
  const ScrollingText({
    Key? key,
    required this.text,
    required this.style,
    required this.condition,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final int condition;

  @override
  Widget build(BuildContext context) {
    if (text.length > condition) {
      return Marquee(text: text, style: style);
    } else {
      return Text(text, style: style);
    }
  }
}
