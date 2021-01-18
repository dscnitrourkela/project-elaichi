import 'package:flutter/material.dart';
import 'package:elaichi/app/extensions.dart';

/// Schedule event widget.
class ScheduleComponent extends StatelessWidget {
  /// Constructor for [ScheduleComponent].
  const ScheduleComponent(
      {Key key,
      @required this.time,
      @required this.identifier,
      @required this.title,
      @required this.contact})
      : super(key: key);

  /// Time of the event.
  final String time;

  /// Identifier for the event: Subject code for classes, Club Name for club
  /// events.
  final String identifier;

  /// Title of the event. Course title for classes, Event name for club events.
  final String title;

  /// Contact for the event. Professor for classes, Contact number for club
  /// events.
  final String contact;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
            top: 4.0, left: 12.0, right: 6.0, bottom: 20.0),
        child: AspectRatio(
          aspectRatio: 162 / 154,
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Text(
                    time,
                    style: context.textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w600, height: 1.4, fontSize: 12),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    identifier,
                    style: context.textTheme.caption.copyWith(
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Text(
                    title,
                    style: context.textTheme.headline6.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      letterSpacing: -0.02,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Text(
                    contact,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: context.textTheme.bodyText1.copyWith(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
