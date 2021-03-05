import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Individual card shown in the events list in club page. Takes in an [Event]
/// object as a required parameter.
class ClubEventItemCard extends StatelessWidget {
  // ignore: public_member_api_docs
  const ClubEventItemCard(
    this._event,
  );

  final Event _event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 368 / 177,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Image.asset(_event.picture),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _event.organizer.clubName.toUpperCase(),
                            style: TextStyles.overline
                                .copyWith(letterSpacing: 0.6),
                          ),
                          Text(
                            _event.eventName,
                            style: TextStyles.title.copyWith(
                                color: AppColors.cardHeader,
                                letterSpacing: 0.2),
                          ),
                          Text(
                            '''${DateFormat.MMMd().format(_event.startDateTime)} • ${_event.location}''',
                            style: TextStyles.body2.copyWith(
                              color: AppColors.cardHeader60,
                            ),
                          ),
                          Text(
                            _event.otherDescription,
                            style: TextStyles.body1
                                .copyWith(color: AppColors.cardHeader60),
                          ),
                          Text(
                            '🙌 ${_event.registrationCount} people are '
                            'attending this',
                            style: TextStyles.overline.copyWith(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
