import 'package:flutter/material.dart';

class DurationDates extends StatelessWidget {
  const DurationDates({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.calendar_month,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          'Jan 03 - Jan 07 2023',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
