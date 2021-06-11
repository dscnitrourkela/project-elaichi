import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/datamodels.dart';
import 'package:flutter/material.dart';

/// Individual item shown in story archive grid in club view.
class ClubStoryGridItem extends StatelessWidget {
  // ignore: public_member_api_docs
  const ClubStoryGridItem({required this.story, Key? key}) : super(key: key);

  /// Story to generate the item for.
  final CurrentStory story;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: Stack(
        children: [
          Image.asset(story.asset),
          Positioned(
            left: -4,
            top: 4,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  DateFormat.MMMd().format(story.createdAt!),
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
