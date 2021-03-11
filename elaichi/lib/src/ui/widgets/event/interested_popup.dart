import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/src/ui/widgets/event/tooltip_shape.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

class InterestedPopup extends StatelessWidget {
  /// Constructor for [InterestedPopup]
  const InterestedPopup(this._dateTime);

  final DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Card(
          shape: TooltipShapeBorder(arrowArc: 0.2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Interested? Tap here', style: TextStyles.heading2),
                    Text(
                      '''${DateFormat.MMMd().format(_dateTime)}, ${DateFormat.j().format(_dateTime)}''',
                      style: TextStyles.overline,
                    )
                  ],
                ),
                Text(
                  '''And we’ll set a reminder for this event''',
                  style: TextStyles.body1,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
