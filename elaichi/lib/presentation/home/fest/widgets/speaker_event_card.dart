import 'dart:convert';

import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpeakerEventCard extends StatelessWidget {
  const SpeakerEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    final format1 = DateFormat('MMM');
    final duration =
        '${format1.format(event.startDate)} ${event.startDate.day.toString().padLeft(2, '0')} - ${format1.format(event.endDate)} ${event.endDate.day.toString().padLeft(2, '0')} ${event.endDate.year}';
    return SizedBox(
      width: 220,
      height: 394,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 160,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: event.poster == ''
                      ? const NetworkImage(
                          Strings.placeholderImage,
                        )
                      : NetworkImage(event.poster),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 29,
                    child: ScrollingText(
                      text: jsonDecode(event.name)['heading'].toString(),
                      style: interTextTheme.subtitle2!.copyWith(
                        color: Colors.black,
                      ),
                      condition: 28,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Designation of Person',
                    style: interTextTheme.bodyText1!.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: AppColors.grey12.withOpacity(0.2),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 19,
                    child: ScrollingText(
                      text: '"Name of the Session"',
                      style: interTextTheme.bodyText1!.copyWith(
                        height: 1.18,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      condition: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  DurationDates(text: duration),
                  SizedBox(
                    width: 240,
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 2),
                        YellowFlatButton(
                          onTapped: () {},
                          text: 'Mark In Calender',
                          width: 163,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
