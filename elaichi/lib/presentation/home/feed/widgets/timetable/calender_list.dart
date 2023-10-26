import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/feed/widgets/timetable/calender_item.dart';
import 'package:flutter/material.dart';

/// TimeTable List customised for all users
class CalenderList extends StatelessWidget {
  ///Default Constructor
  const CalenderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 2,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical! * 1.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.kToday,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Strings.kViewCalendar,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.lightBlue),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: AppColors.lightBlue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.215,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CalenderItem(
                  title: 'This is a long title $index',
                  organiser: 'Developers NITR',
                  location: 'LA117',
                  startTime: DateTime.now(),
                  endTime: DateTime.utc(
                    2021,
                    12,
                    30,
                    20,
                    30,
                  ),
                  onTapped: () {},
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
