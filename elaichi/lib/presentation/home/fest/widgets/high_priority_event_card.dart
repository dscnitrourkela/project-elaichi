import 'dart:convert';

import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/fest/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HighPriorityEventCard extends StatelessWidget {
  const HighPriorityEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM');
    return SizedBox(
      width: 264,
      height: 466,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: event.poster == ''
                      ? const NetworkImage(
                          'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667755113/Rectangle_32_j9v13n.png')
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
                    '${event.startDate.day.toString().padLeft(2, '0')} ${format.format(event.startDate)} | ${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')}',
                    style: interTextTheme.bodyText1!.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 95,
                    child: Text(
                      jsonDecode(event.description)[0]['desc'].toString(),
                      style: interTextTheme.bodyText1!.copyWith(
                        height: 1.18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
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
                    width: 240,
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (jsonDecode(event.name)['prizeAmount'] != null &&
                            jsonDecode(event.name)['prizeAmount'] != '')
                          SizedBox(
                            width: 116,
                            height: 22,
                            child: ScrollingText(
                              text:
                                  'Prize: ${jsonDecode(event.name)['prizeAmount'].toString()}',
                              style: interTextTheme.bodyText1!.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              condition: 23,
                            ),
                          ),
                        const SizedBox(width: 2),
                        YellowFlatButton(
                          onTapped: () {},
                          text: 'Register',
                          width: 105,
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
