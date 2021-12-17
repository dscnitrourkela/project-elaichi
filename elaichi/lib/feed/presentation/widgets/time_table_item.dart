import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///The function returning the widget for each item in the calendar feed page.
class TimeTableItem extends StatelessWidget {
  /// DEfault Constructor
  const TimeTableItem({
    Key? key,
    this.title,
    this.organiser,
    this.location,
    this.startTime,
    this.endTime,
    this.onTapped,
  }) : super(key: key);

  ///Title of the event card
  final String? title;

  ///Organiser of the event
  final String? organiser;

  /// Location of the event - online or offline
  final String? location;

  /// Date of the event - Start Time
  final DateTime? startTime;

  /// Date of the event - End Time
  final DateTime? endTime;

  /// Function called on taping the card
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 2),
        padding: const EdgeInsets.only(
          top: 4,
          left: 12,
          right: 6,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).splashColor),
          borderRadius: BorderRadius.circular(8),
        ),
        width: SizeConfig.screenWidth! * 0.55,
        child: Stack(
          children: [
            Positioned(
              top: SizeConfig.safeBlockVertical,
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/add_event_icon.png'),
                    Text(
                      '${startTime!.hour.toString().padLeft(2, '0')}:${startTime!.minute.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockVertical! * 4,
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 30,
                child: Text(
                  organiser.toString(),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                      ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockVertical! * 8,
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 40,
                child: Text(
                  title.toString(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: SizeConfig.safeBlockHorizontal! * 4.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Positioned(
                top: SizeConfig.safeBlockVertical! * 16,
                child: SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 30,
                  child: Text(
                    location.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                        ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
