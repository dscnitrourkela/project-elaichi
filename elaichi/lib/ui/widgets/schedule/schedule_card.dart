import 'package:elaichi/app/colors.dart';
import 'package:elaichi/generated/locale_keys.g.dart';
import 'package:elaichi/ui/views/feed/feed_viewmodel.dart';
import 'package:elaichi/ui/widgets/schedule/schedule_component.dart';
import 'package:flutter/material.dart';
import 'package:elaichi/app/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stacked/stacked.dart';

/// Schedule Card for FeedView.
class ScheduleCard extends ViewModelWidget<FeedViewModel> {
  /// Constructor for [ScheduleCard].
  const ScheduleCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return AspectRatio(
      aspectRatio: 410 / 240,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 29.0),
                    child: Text(
                      LocaleKeys.timeTable.tr(),
                      textAlign: TextAlign.left,
                      style: context.textTheme.bodyText1
                          .copyWith(color: AppColors.cardHeader),
                    ),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  label: Text(LocaleKeys.openCalendar.tr(),
                      style: context.textTheme.bodyText1
                          .copyWith(color: Colors.blue)),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: viewModel.scheduleEvents.fold(
              (failure) => Text(failure.toString()),
              (scheduleEvents) => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: scheduleEvents.length,
                itemBuilder: (context, index) => ScheduleComponent(
                  contact: scheduleEvents[index].contact,
                  time: scheduleEvents[index].time,
                  title: scheduleEvents[index].title,
                  identifier: scheduleEvents[index].identifier,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
