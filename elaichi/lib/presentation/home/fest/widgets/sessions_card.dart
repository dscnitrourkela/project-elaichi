import 'dart:convert';

import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';

class SessionsCard extends StatelessWidget {
  const SessionsCard({
    Key? key,
    required this.name,
    required this.startDate,
    this.imageUrl,
  }) : super(key: key);

  final String name;
  final String? imageUrl;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      constraints: const BoxConstraints(minHeight: 190),
      width: 296,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey6.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            json.decode(name)['heading'] as String,
            style: interTextTheme.bodyText1!
                .copyWith(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(height: 16),
          if (imageUrl != null)
            SpeakerInfo(
              imageUrl: imageUrl!,
              name: 'Name of Speaker',
            ),
          const SizedBox(height: 16),
          const DurationDates(
            text: 'Jan 03 | 12:00 Noon',
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          YellowTextButton(
            mainAxisAlignment: MainAxisAlignment.start,
            onPressed: () {},
            text: 'Mark In Calender',
          )
        ],
      ),
    );
  }
}
