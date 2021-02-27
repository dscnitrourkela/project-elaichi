import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/src/generated/locale_keys.g.dart';
import 'package:elaichi/theme.dart';
import 'package:elaichi/viewmodels.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Schedule Card for FeedView.
class ScheduleCard extends ViewModelWidget<FeedViewModel> {
  /// Constructor for [ScheduleCard].
  const ScheduleCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return Container(
      color: context.theme.colorScheme.surface,
      child: AspectRatio(
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
                      child: Text(LocaleKeys.timeTable.tr(),
                          textAlign: TextAlign.left,
                          style: TextStyles.heading1),
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {},
                    label: Text(LocaleKeys.openCalendar.tr(),
                        style:
                            TextStyles.heading2.copyWith(color: Colors.blue)),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
