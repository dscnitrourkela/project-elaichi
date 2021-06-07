import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/theme.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';

/// Event description card shown in individual event screen
class EventDescription extends StatelessWidget {
  /// Constructor for EventDescription
  const EventDescription(this._event, {Key? key}) : super(key: key);

  final Event? _event;
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: 'Description',
      child: Column(
        children: [
          Text(
            _event!.otherDescription,
            style: TextStyles.body1,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(
              thickness: 0.2,
              color: AppColors.divider,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dataholder(
                'Date',
                DateFormat.MMMd().format(_event!.startDateTime!),
              ),
              _dataholder(
                'Venue',
                _event!.location,
              ),
              _dataholder(
                'Time',
                DateFormat.j().format(_event!.startDateTime!),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _dataholder(String title, String data) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.subtitle,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          data,
          style: TextStyles.body1,
        ),
      ],
    );
  }
}
