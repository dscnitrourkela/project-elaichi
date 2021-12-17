import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:elaichi/feed/presentation/widgets/time_table_item.dart';
import 'package:flutter/material.dart';

/// TimeTable List customised for all users
class TimeTableList extends StatelessWidget {
  ///Default Constructor
  const TimeTableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal! * 2,
        vertical: SizeConfig.safeBlockVertical! * 2,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal!,
              vertical: SizeConfig.safeBlockVertical! * 0.8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  Today',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.4,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      'View Calendar',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: const Color(0XFF2F80ED)),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Color(0XFF2F80ED),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return TimeTableItem(
                  title: 'This is a looooooooooooooooooooooong title $index',
                  organiser: 'Developers Students Club NITR',
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
