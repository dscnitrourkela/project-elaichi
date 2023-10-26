// ignore_for_file: avoid_dynamic_calls


import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';

class CalenderTabView extends StatelessWidget {
  const CalenderTabView({
    super.key,
    required TabController tabController,
    required this.calender,
  })  : _tabController = tabController;

  final TabController _tabController;
  final Map<String, List<Event>> calender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelStyle: interTextTheme.bodyLarge!.copyWith(
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
                style: interTextTheme.bodyLarge!.copyWith(
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
                return Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return CalenderItem(event: event);
                    },
                  ),
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
    super.key,
    required this.event,
  });

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
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.type!,
                  style: interTextTheme.bodyLarge!.copyWith(
                    color: event.poster != ''
                        ? AppColors.teal
                        : AppColors.yellowButton,
                    fontSize: 11,
                    letterSpacing: 0.07,
                    height: 1.18,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: ScrollingText(
                    text: event.name,
                    style: interTextTheme.bodyLarge!.copyWith(
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
                if (event.subHeading != '')
                  Row(
                    children: [
                      const Icon(
                        Icons.group_work_outlined,
                        size: 8,
                        color: AppColors.white1,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event.subHeading,
                        style: interTextTheme.labelSmall!
                            .copyWith(fontSize: 12, color: AppColors.white1),
                      ),
                    ],
                  ),
              ],
            ),
            Text(
              '${event.startDate.hour}:${event.startDate.minute.toString().padLeft(2, '0')} - ${event.endDate.hour}:${event.endDate.minute.toString().padLeft(2, '0')}',
              style: interTextTheme.labelSmall!.copyWith(
                color: AppColors.grey10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
