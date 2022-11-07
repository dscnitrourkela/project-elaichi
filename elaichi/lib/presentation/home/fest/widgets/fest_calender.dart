// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/widgets/scrolling_text.dart';
import 'package:elaichi/presentation/home/fest/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';

class CalenderTabView extends StatelessWidget {
  const CalenderTabView({
    Key? key,
    required TabController tabController,
    required this.calender,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final Map<String, List<Event>> calender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelStyle: interTextTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.grey11,
          ),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          padding: const EdgeInsets.only(bottom: 8),
          isScrollable: calender.length > 3 ? true : false,
          tabs: List.generate(
            calender.keys.toList().length,
            (index) => Tab(
              child: Text(
                calender.keys.toList()[index],
                style: interTextTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 500,
          child: TabBarView(
            controller: _tabController,
            children: List.generate(
              calender.length,
              (index) {
                final events = calender.values.toList()[index];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return CalenderItem(event: event);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CalenderItem extends StatelessWidget {
  const CalenderItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.eventDetails,
        arguments: {'event': event},
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        constraints: const BoxConstraints(minHeight: 67, maxHeight: 109),
        width: 326,
        color: AppColors.grey13,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.type!,
                  style: interTextTheme.bodyText1!.copyWith(
                    color: event.poster != ''
                        ? AppColors.teal
                        : AppColors.yellowButton,
                    fontSize: 12,
                    letterSpacing: 0.07,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 200,
                  child: ScrollingText(
                    text: json.decode(event.name)['heading'].toString(),
                    style: interTextTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    condition: 50,
                  ),
                ),
                // if (event.poster != '') const SizedBox(height: 4),
                // if (event.poster != '' && speakerName != null)
                // SpeakerInfo(
                //   imageUrl:
                //       'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                //   name: speakerName!,
                //   fontSize: 12,
                //   height: 24,
                //   width: 24,
                // ),
                const SizedBox(height: 4),
                if (json.decode(event.name)['subHeading'].toString() != null &&
                    json.decode(event.name)['subHeading'].toString() != '')
                  Row(
                    children: [
                      const Icon(
                        Icons.group_work_outlined,
                        size: 8,
                        color: AppColors.white1,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        json.decode(event.name)['subHeading'].toString(),
                        style: interTextTheme.overline!
                            .copyWith(fontSize: 12, color: AppColors.white1),
                      )
                    ],
                  )
              ],
            ),
            Text(
              '${event.startDate.hour}:${event.startDate.minute.toString().padLeft(2, '0')} - ${event.endDate.hour}:${event.endDate.minute.toString().padLeft(2, '0')}',
              style: interTextTheme.overline!.copyWith(
                color: AppColors.grey10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
