import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Individual card shown in the events list in club page. Takes in an [Event]
/// object as a required parameter.
class ClubEventItemCard extends StatelessWidget {
  /// Constructor for ClubEventItemCard
  const ClubEventItemCard({required this.event, required this.onTap, Key? key})
      : super(key: key);

  /// Stores [Event] object of which details are to be shown
  final Event event;

  /// Callback for when the card is tapped
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 368 / 177,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: onTap,
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
                        child: Image.asset(event.picture),
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
                              event.organizer.clubName.toUpperCase(),
                              style: TextStyles.overline
                                  .copyWith(letterSpacing: 0.6),
                            ),
                            Text(
                              event.eventName,
                              style: TextStyles.title.copyWith(
                                  color: AppColors.cardHeader,
                                  letterSpacing: 0.2),
                            ),
                            Text(
                              '''${DateFormat.MMMd().format(event.startDateTime!)} • ${event.location}''',
                              style: TextStyles.body2.copyWith(
                                color: AppColors.cardHeader60,
                              ),
                            ),
                            Text(
                              event.otherDescription,
                              style: TextStyles.body1
                                  .copyWith(color: AppColors.cardHeader60),
                            ),
                            Text(
                              '🙌 ${event.registrationCount} people are '
                              'attending this',
                              style:
                                  TextStyles.overline.copyWith(fontSize: 12.0),
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
      ),
    );
  }
}
