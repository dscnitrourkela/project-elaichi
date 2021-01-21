import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels/api_models.dart';
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
        aspectRatio: 368 / 200,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Card(
                color: Color(
                  int.parse('0xff${_event.theme.backgroundColor}'),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              DateFormat.MMMd().format(_event.startDateTime),
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              _event.eventName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              _event.otherDescription,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.white60),
                            ),
                            Text(
                              '🙌 ${_event.registrationCount} people are '
                              'attending this',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.white60),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 13.0, bottom: 13.0),
                child: AspectRatio(
                  aspectRatio: 127 / 179,
                  child: Image.asset(_event.picture),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
