import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:flutter/material.dart';

///The Browse Page
class BrowsePage extends StatelessWidget {
  /// Default constructor
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(title: 'Browse'),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const EventCard(
              imageUrl: Strings.eventExample,
              date: 'August 6',
              organiser: 'DesignTab',
              description:
                  'A visual design workshop series on photoshop, illustrator and AR/VR',
              location: 'LA-117',
              title: 'Orientation 2020',
            ),
            const EventCard(
              imageUrl: Strings.eventExample,
              date: 'August 6',
              organiser: 'DSC NIT Rourkela',
              description:
                  'A visual design workshop series on photoshop, illustrator and AR/VR',
              location: 'LA-117',
              title: 'Orientation 2020',
            )
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.organiser,
    required this.date,
    required this.location,
    required this.description,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String organiser;
  final String date;
  final String location;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 360,
      height: 180,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageUrl,
            height: 160,
            width: 110,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organiser.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.grey3,
                        fontSize: 10,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$date • $location',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: AppColors.grey2,
                        letterSpacing: 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 150,
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: AppColors.grey2,
                          letterSpacing: 0.05,
                          fontSize: 12,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
