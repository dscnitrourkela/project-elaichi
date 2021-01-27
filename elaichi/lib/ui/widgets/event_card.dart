import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/app/styles.dart';
import 'package:elaichi/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Widget for upcoming events UI.
class EventCard extends StatelessWidget {
  /// Constructor for EventCard.
  const EventCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AspectRatio(
        aspectRatio: 410 / 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 29.0, top: 25),
                child: Text('Upcoming Events', style: TextStyles.heading1),
              ),
            ),
            Flexible(
              flex: 6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => AspectRatio(
                  aspectRatio: 155 / 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'https://i.ibb.co/R9NBqPr/sanitizer.jpg',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            child: Align(
                              alignment: const Alignment(0.0, 0.7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const StoryComponent(
                                    width: 39,
                                    height: 39,
                                    unviewedBorderColor: Colors.white,
                                  ),
                                  const SizedBox(height: 7.5),
                                  Text(
                                    'DSC NITR',
                                    style: TextStyles.subtitle
                                        .copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(1),
                                  Colors.black.withOpacity(0)
                                ],
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.topCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
