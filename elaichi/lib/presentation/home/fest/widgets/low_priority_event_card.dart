import 'dart:convert';

import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/home/fest/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LowPriorityEventItem extends StatelessWidget {
  const LowPriorityEventItem({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM');

    return SizedBox(
      height: 94,
      width: 290,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: event.poster == ''
                        ? const NetworkImage(
                            'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667755113/Rectangle_32_j9v13n.png',
                          )
                        : NetworkImage(event.poster),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    child: ScrollingText(
                      text: jsonDecode(
                        event.name,
                      )['heading']
                          .toString(),
                      style: interTextTheme.subtitle2!.copyWith(
                        color: Colors.white,
                      ),
                      condition: 28,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${event.startDate.day.toString().padLeft(2, '0')} ${format.format(event.startDate)} | ${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')}',
                    style: interTextTheme.bodyText1!.copyWith(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (jsonDecode(event.name)['prizeAmount'] != null &&
                      jsonDecode(event.name)['prizeAmount'] != '')
                    SizedBox(
                      width: 127,
                      height: 23,
                      child: ScrollingText(
                        text:
                            'Prize: ${jsonDecode(event.name)['prizeAmount'].toString()}',
                        style: interTextTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        condition: 23,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
